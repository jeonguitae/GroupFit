
package kr.co.gf.commute.controller;

import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.gf.commute.dto.CommuteDTO;
import kr.co.gf.commute.service.CommuteService;
import kr.co.gf.emp.dto.EmpDTO;

@Controller
public class CommuteController {

	@Autowired
	CommuteService cservice;
	Logger logger = LoggerFactory.getLogger(getClass());
	/*
	 * @RequestMapping(value ="/mymain.do") public String mymain(HttpSession
	 * session, Model model) { EmpDTO eDto = (EmpDTO)
	 * session.getAttribute("loginEmp"); String emp_no = eDto.getEmp_no();
	 * 
	 * model.addAttribute("emp_no",emp_no); String page="redirect:/list.do"; return
	 * page;
	 * 
	 * ModelAndView mav= new ModelAndView("/list.do");
	 * mav.addObject("emp_no",emp_no); return mav;
	 * 
	 * }
	 */
	@RequestMapping(value="/come.do")
	public String comedo(HttpSession session, Model model) {
		//세션에 저장된 사내번호 불러오기
		EmpDTO eDto = (EmpDTO)session.getAttribute("loginEmp"); 
		String emp_no = eDto.getEmp_no();
		String b_idx=eDto.getB_idx();
		logger.info("1번 로거 : comedo icin 사내번호는 "+emp_no);
		
		/*
		 * //1.전날 결근 안 찍고 간 애들 처리 icin 전날 출력 LocalDate now = LocalDate.now(); LocalDate
		 * previousDay = now.minusDays(1); logger.info("2번 로거 : 전날 출력"+previousDay);
		 * 
		 * //3.전날 결근 안찍고 갔는지 가져오기 CommuteDTO
		 * cdto=cservice.selectAll(emp_no,previousDay); Time come_time =
		 * cdto.getCome_time(); Time out_time=cdto.getOut_time(); //time이 string이 아니라서
		 * 확인용으로 logger.info("3번 로거 : come_time은"+come_time);
		 * 
		 * //같으면 결근처리로 업데이트
		 */
		
		//출근 중복 방지 icin 
		LocalDate now = LocalDate.now();
		int row=cservice.count(emp_no,now);
		logger.info("2번 로거 : 어제 출근 안 했으면 row는 "+row);
		
		//0이면 출근 insert/1이면 msg만 출력
		if (row==0) {
			int row2=cservice.comedo(emp_no, b_idx);
			logger.info("12331 : " + emp_no + b_idx);
			logger.info("3번 로거 출근처리했으면 row2는"+row2);
		}else {
			model.addAttribute("msg","이미 출근처리 되었습니다.");
		}
		String page = "main";
		return page;
	}
	
	@RequestMapping(value="/out.do")
	public String outdo(HttpSession session, Model model, RedirectAttributes rattr) {
		//세션에 저장된 사내번호 불러오기
		EmpDTO eDto = (EmpDTO)session.getAttribute("loginEmp"); 
		String emp_no = eDto.getEmp_no();
		
		//1. 출근 안 누르고 퇴근 누를 경우 대비
		LocalDate now = LocalDate.now();
		int row=cservice.count(emp_no, now);//당일 출/퇴 시간
		String page="main";
		
		if (row==0) {
			model.addAttribute("msg","출근이 먼저 이뤄져야 합니다.");			
		}else {
			//2.출근버튼은 누른 경우() 또 눌렀거나 정상 퇴근
			CommuteDTO dto=cservice.selectAll(emp_no,now);
			Time come_time=dto.getCome_time();
			Time out_time=dto.getOut_time();
			
			logger.info("outdo icin come_time은"+come_time);
			logger.info("outdo icin out_time은"+out_time);
			//퇴근 중복 대비
			if (!come_time.equals(out_time)) {
				model.addAttribute("msg","이미 퇴근 처리 되었습니다.");
				logger.info("outdo 로거 1: 퇴근 중복됨");
			}//정상 퇴근 위한 퇴근 시간 update
			else {
				LocalDate day = LocalDate.now();
				LocalTime now2=LocalTime.now();
				int row2=cservice.outdo(emp_no,now2,day);
				logger.info("로거2 : 정상 퇴근됐으면 row2는"+row2);
				
				//계산 넘기기 위해서 차이 및 시간들 보내기
				CommuteDTO dto2=cservice.wtime(emp_no,day);
				String wtime=dto2.getW_time();
				Time come_time2=dto2.getCome_time();
				Time out_time2=dto2.getOut_time();
				
				rattr.addFlashAttribute("wtime",wtime);
				rattr.addFlashAttribute("come_time2",come_time2);
				rattr.addFlashAttribute("out_time2",out_time2);
				rattr.addFlashAttribute("emp_no",emp_no);
				rattr.addFlashAttribute("work_date",now);
				logger.info("계산 가기 직전 w_time은"+wtime);
				
				page = "redirect:/calculate.do";
				
			}
		}
		return page;	
	}
	
		@RequestMapping(value="/calculate.do") 
		public String calculate(@ModelAttribute("wtime") String wtime, @ModelAttribute("come_time2") Time come_time2, 
		@ModelAttribute("out_time2") Time out_time2, @ModelAttribute("emp_no")String emp_no,  @ModelAttribute("work_date") LocalDate now) {
		
			logger.info("calculate.do 로거1 : wtime, come_time, out_time"+wtime+come_time2+out_time2+emp_no);
			logger.info("날짜 왔다"+now);
			//1.퇴근 시간 최대 10시로 해야하니까 퇴근 시간 설정해야 함 : out_time
			//2.근무 오전/오후 타입 가져와야
			
			String type=cservice.seltype(emp_no);
			logger.info("2번로거 : 근무타입은"+type);
			//3.요일 불러오기
			String day=cservice.workdate(emp_no);
			logger.info("3번 : 요일은"+day);
			//3.요일 불러오기
			//int day=cservice.selday(emp_no, date);
			
			cservice.calculate(wtime,come_time2,out_time2,emp_no,type,day,now);

			//공통작업 : 퇴근 시간 최대 설정
			//첫번째 경우의 수 : 평일
/*			if (!day.equals("Saturday")) {
				logger.info("4번 : 평일");
				//두번째 경우의 수 : 오전
				if (type.equals("오전")) {
					logger.info("5번 : 오전 근무");
					//1.최대/최소시간 설정 및 최대시간 설정 완료
					//원래는 15
					LocalTime out_time = out_time2.toLocalTime();
					LocalTime maxtime = LocalTime.of(15, 0);
					
					LocalTime come_time = come_time2.toLocalTime();
					LocalTime mintime = LocalTime.of(7, 0);
					//13,15
					LocalTime lower = LocalTime.of(15, 0);
					LocalTime upper = LocalTime.of(16, 0);
					
					if (out_time.isAfter(maxtime)) {
						out_time = maxtime;
						logger.info("6번 : 퇴근 시간 최대로 설정 out_time은"+out_time);
					//2.지각 아닌 경우(빨리옴)
						if (mintime.isAfter(come_time)) {
							//조퇴/결근 여부 확인 : 문제는 
							if (out_time.isAfter(lower) && out_time.isBefore(upper)) {
								String flag="조퇴";
								logger.info("7번 결근은 아님");
								int row=cservice.wtype(emp_no,out_time2,flag);
								logger.info("8번 : 결근 update시 숫자는 "+row);
							}
								
							}else {//결근인 경우
								
							}
						}else {//지각인 경우
							
						}
					}
				}*/
		

			return null;
		}
	
	@RequestMapping(value = "/wlist.do")
	public String list(HttpSession session) {
		EmpDTO eDto = (EmpDTO) session.getAttribute("loginEmp");
		String emp_no = eDto.getEmp_no();
		ArrayList<CommuteDTO> working = cservice.list(emp_no);
		
		String page="my_working";
		//String page="redirect:/calculate.do";
		return page;
/*		ModelAndView mav = new ModelAndView("my_working");
		mav.addObject("working", working);
		return mav;*/
	}

	/*
	 * @RequestMapping(value = "/out.update") public String outupdate(HttpSession
	 * session) { EmpDTO eDto = (EmpDTO) session.getAttribute("loginEmp"); String
	 * emp_no = eDto.getEmp_no();
	 * 
	 * EmpDTO eDto2 = (EmpDTO) session.getAttribute("loginEmp"); String b_idx =
	 * eDto2.getB_idx();
	 * 
	 * logger.info("out.do icin emp_no" + emp_no); logger.info("out do icin b_idx는"
	 * + b_idx);
	 * 
	 * return null; }
	 */

}
