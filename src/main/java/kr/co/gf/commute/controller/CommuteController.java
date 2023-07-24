
package kr.co.gf.commute.controller;

import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public String comedo(HttpSession session, Model model, RedirectAttributes rattr) {
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
			rattr.addFlashAttribute("msg","출근처리 되었습니다.");

		}else {
			rattr.addFlashAttribute("msg","이미 출근처리 되었습니다.");
		}
		String page = "redirect:/main";
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
		String page="redirect:/main";
		
		if (row==0) {
			rattr.addFlashAttribute("msg","출근이 먼저 이뤄져야 합니다.");			
		}else {
			//2.출근버튼은 누른 경우() 또 눌렀거나 정상 퇴근
			CommuteDTO dto=cservice.selectAll(emp_no,now);
			Time come_time=dto.getCome_time();
			Time out_time=dto.getOut_time();
			
			logger.info("outdo icin come_time은"+come_time);
			logger.info("outdo icin out_time은"+out_time);
			//퇴근 중복 대비
			if (!come_time.equals(out_time)) {
				rattr.addFlashAttribute("msg","이미 퇴근 처리 되었습니다.");
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
		@ModelAttribute("out_time2") Time out_time2, @ModelAttribute("emp_no")String emp_no,  @ModelAttribute("work_date") LocalDate now, Model model) {
		
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
			model.addAttribute("msg","퇴근 처리 되었습니다.");
			String page = "main";
			return page;
		}
	
	@RequestMapping(value = "/wlist.do")
	public String list(HttpSession session, Model model) {
		EmpDTO eDto = (EmpDTO) session.getAttribute("loginEmp");
		String emp_no = eDto.getEmp_no();
		
		ArrayList<CommuteDTO> working = cservice.list(emp_no);
		logger.info("wlist왜 안 뜸?"+working);
		model.addAttribute("working",working);
		model.addAttribute("emp_no",emp_no);
		
		String page="my_working";
		return page;
		/*ModelAndView mav = new ModelAndView("my_working");
		mav.addObject("working", working);
		return mav;*/ 
	}
	
	@RequestMapping(value="/cwrite.go")
	public String cwritego() {
		String page="c_request";
		return page;
	}
	
	@RequestMapping(value="/cwrite.do")
	public String cwritedo(@RequestParam HashMap<String, String> params, Model model) {
		int row=cservice.cwrite(params);
		logger.info("params : " + params);
		if (row==1) {
			model.addAttribute("msg","변경 요청서가 제출되었습니다.");
		}
		return "my_working";
	}
	@RequestMapping(value="/centerlist.do")
	public String clist(Model model) {
		ArrayList<CommuteDTO> working = cservice.alllist();
		model.addAttribute("working",working);
		return "c_list";
	}
	@RequestMapping(value="/rlist.go")
	public String rlist(Model model, HttpSession session) {
		EmpDTO eDto = (EmpDTO) session.getAttribute("loginEmp");
		String b_idx = eDto.getB_idx();
		
		ArrayList<CommuteDTO> working = cservice.rlist(b_idx);
		model.addAttribute("working",working);
		return "requestList";	
	}
	
	@RequestMapping(value="/rlist.ajax")
	@ResponseBody
	public HashMap<String, Object> rlistAjax(HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		EmpDTO dto = (EmpDTO) session.getAttribute("loginEmp");
		ArrayList<CommuteDTO> working = cservice.rlist(dto.getB_idx());
		map.put("rlist",working);
		return map;	
	}
	
	@RequestMapping(value="/rdetail.do")
	public String rdetail(@RequestParam String r_idx, Model model, HttpSession session) {
		
		EmpDTO eDto = (EmpDTO) session.getAttribute("loginEmp");
		String b_idx = eDto.getB_idx();
		
		CommuteDTO working = cservice.rdetail(r_idx, b_idx);
		/* working=cservice.rdetail(r_idx, b_idx); */
		model.addAttribute("r_idx",r_idx);
		String emp_no=working.getEmp_no();
		model.addAttribute("emp_no는"+emp_no);
		model.addAttribute("working",working);
		return "cf_detail";
	}
	
	@RequestMapping(value = "/center_commute.go")
	public String cenenter_commute() {
	
		return "center_commute";
	}
	

	@RequestMapping(value="commutelist.ajax")
	@ResponseBody
	public HashMap<String, Object> commutelist(
			HttpSession session){
		
		EmpDTO dto = (EmpDTO) session.getAttribute("loginEmp");
		String b_idx = dto.getB_idx();
		
		return cservice.commutelist(b_idx);
	}
	
	@RequestMapping(value="/rconfirm.do")
	public String rconfirm(@RequestParam HashMap<String, String> params, Model model) {
		
		String flag=params.get("status");
		String com_category=params.get("com_category");
		String r_date=params.get("r_date");
		String r_time=params.get("r_time");
		String r_idx=params.get("r_idx");
		String opinion=params.get("opinion");
		String emp_no=params.get("emp_no");

		if (flag.equals("승인")) {
			logger.info("승인 떠야 함");
			String words="승인";
			int row=cservice.upStatus(r_idx, words ,opinion);
			if (com_category.equals("출근")) {
				int row2=cservice.upWorking(r_time, r_date, emp_no);
			}else {//퇴근
				int row3=cservice.upOuttime(r_time, r_date, emp_no);
			}
		}
		else {//반려
			String words="반려";
			int row4=cservice.upStatus(r_idx, words ,opinion);
		}
		String msg="제출이 완료되었습니다.";
		model.addAttribute("msg",msg);
		String page = "redirect:/rlist.go";
		return page;
	}
	
	
	@RequestMapping(value = "/workingList.ajax")
	@ResponseBody
	public HashMap<String, Object> workingList(HttpSession session, Model model,@RequestParam HashMap<String, String> params) {
		logger.info("월 변경시 넘어오는 값: "+params);
		ArrayList<CommuteDTO> list = cservice.workingList(params);
		
		//String come_time = cservice.come_time(params);
		//logger.info("come_time" + come_time);
		logger.info("list",list);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("workList", list);
		return map;
		
	}

	@RequestMapping(value="/confirmlist.do")
	public String confirmlist(Model model) {
		ArrayList<CommuteDTO> working=cservice.confirmlist();
		model.addAttribute("working",working);
		return "confirm_list";
	}
	@RequestMapping(value="/cdetail.do")
	public String cdetail(String r_idx, HttpSession session, Model model) {
		EmpDTO eDto = (EmpDTO) session.getAttribute("loginEmp");
		String b_idx = eDto.getB_idx();
		
		CommuteDTO working = cservice.rdetail(r_idx, b_idx);
		
		model.addAttribute("working", working);
		return "confirm_detail";	
	}
	
	@RequestMapping(value="/myclist.go")
	public String myclistgo(@RequestParam String emp_no, Model model) {
		logger.info("변경 요청 내역 가기 icin emp_no"+emp_no);
		ArrayList<CommuteDTO> working=cservice.confirmlist();
		model.addAttribute("working",working);
		model.addAttribute("emp_no", emp_no);	
		return "my_req_list";		
	}
	

}
