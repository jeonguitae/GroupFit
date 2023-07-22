package kr.co.gf.approval.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.tomcat.jni.Mmap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.gf.approval.dto.ApprovalDTO;
import kr.co.gf.approval.service.ApprovalService;

@Controller
public class ApprovalController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	Calendar calendar = Calendar.getInstance();
	
	@Autowired ApprovalService service;
	
	
	// 휴가신청
	@RequestMapping(value="/approvalVacationRequest.go")
	public String vacation(HttpSession session, Model model) {
		
		// 로그인한 아이디
		String loginId = (String)session.getAttribute("loginId");
		if (session.getAttribute("loginId") != null && !session.getAttribute("loginId").equals("")) {
			logger.info(loginId);
			String loginIdName = service.loginIdName(loginId);
			logger.info(loginIdName);
			model.addAttribute("loginIdName",loginIdName);
			
			// 지점장 
			String manager = service.manager();
			logger.info(manager);
			model.addAttribute("manager",manager);
			
			// 대표
			String top_manager = service.top_manager();
			logger.info(top_manager);
			model.addAttribute("top_manager",top_manager);
			
			// 직급
			String position = service.position(loginId);
			logger.info(position);
			model.addAttribute("position",position);
			
			// 현재 날짜 정보를 변수에 할당
		    int year = calendar.get(Calendar.YEAR);
		    int month = calendar.get(Calendar.MONTH) + 1;
		    int day = calendar.get(Calendar.DAY_OF_MONTH);
		    String write_date =  year + "." + month + "." + day;
		    logger.info(write_date);
		    model.addAttribute("write_date", write_date);
			
			return "approvalVacationRequest" ;
		}
		return "redirect:/";
	}
	
	// 휴가신청하기
		@RequestMapping(value="approvalVacationRequest.do")
		public String vacationRequest(@RequestParam HashMap<String,String> params, MultipartFile[] files, HttpSession session) {
			
			logger.info("emp_no 값 : " + params.get("emp_no"));
			logger.info("approval 값  : " + params.get("approval"));
			logger.info("subject 값  : " + params.get("subject"));
			logger.info("state 값  : " + params.get("state"));
			logger.info("manager 값 : " + params.get("manager"));
			logger.info("top_manager 값 : " + params.get("top_manager"));
			logger.info("start_day 값 : " + params.get("start_day"));
			logger.info("finish_day 값 : " + params.get("finish_day"));
			logger.info("reason 값 : " + params.get("reason"));
			logger.info("etc 값 : " + params.get("etc"));
			
			// 사실 이건 안함
			service.vacationRequestWrite(params,files);
			
			return "redirect:/approvalAllList.do";
		}
	
	
	// 이벤트신청 이게 진짜임
	@RequestMapping(value="/approvalEventRequest.go")
	public String event(HttpSession session, Model model) {

		// 로그인한 아이디
		String loginId = (String)session.getAttribute("loginId");
		if (loginId != null && !session.getAttribute("loginId").equals("")) {
			logger.info(loginId);
			String loginIdName = service.loginIdName(loginId);
			logger.info(loginIdName);
			model.addAttribute("loginIdName",loginIdName);
			
			// 지점장
			String manager = service.manager();
			logger.info(manager);
			model.addAttribute("manager",manager);
			
			// 대표
			String top_manager = service.top_manager();
			logger.info(top_manager);
			model.addAttribute("top_manager",top_manager);
			
			// 직급
			String position = service.position(loginId);
			logger.info(position);
			model.addAttribute("position",position);
					
			return "approvalEventRequest";
		}
		
		return"redirect:/" ;
	}
	
	
	
	// 개인 문서함 리스트
	@RequestMapping(value="/approvalAllList.do")
	public ModelAndView approvalAllList(HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		if (loginId != null && !session.getAttribute("loginId").equals("")) {
			logger.info("페이지 이동 : "+loginId );
			return service.approvalAllList(loginId);                                 
		}
		
		return new ModelAndView("redirect:/" );
	}
	
	// 결재 대기 문서함
	@RequestMapping(value="/approvalStayList.do")
	public ModelAndView approvalStayList(HttpSession session) {
		String loginId = (String)session.getAttribute("loginId");
		String position = service.position(loginId);
		if (loginId != null && !loginId.equals("") && position.equals("지점장") || position.equals("대표")) {
			return service.approvalStayList(loginId);
		}
		return new ModelAndView("redirect:/" );
	}
	
	// 결재 예정 문서함
		@RequestMapping(value="/approvalExpectedList.do")
		public ModelAndView approvalExpectedList(HttpSession session) {
			String loginId = (String)session.getAttribute("loginId");
			String position = service.position(loginId);
			if (loginId != null && !loginId.equals("") && position.equals("지점장") || position.equals("대표")) {
				return service.approvalExpectedList(loginId);
			}
			return new ModelAndView("redirect:/" );
		}
		
		@RequestMapping(value="/approvalExpectedList.ajax")
		@ResponseBody
		public HashMap<String, Object> approvalExpectedListAjax(HttpSession session) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			String loginId = (String)session.getAttribute("loginId");
			String position = service.position(loginId);
			if (loginId != null && !loginId.equals("") && position.equals("지점장") || position.equals("대표")) {
				logger.info("ajax 결재 리스트 불러오기");
				map.put("alist", service.approvalExpectedListAjax(loginId));
			}
			return map;
		}
	
	// 임시저장 문서함
	@RequestMapping(value="/approvalSaveList.do")
	public ModelAndView approvalSaveList(HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		if (loginId != null && !session.getAttribute("loginId").equals("")) {
			logger.info("임시저장 문서함" + loginId);
			return service.approvalSaveList(loginId);
		}
		
		return new ModelAndView("redirect:/" );
	}
	
	// 지출결의서
	@RequestMapping(value="/approvalExpenseReport.go")
	public String expenseReport(HttpSession session, Model model) {

		// 로그인한 아이디
		String loginId = (String)session.getAttribute("loginId");
		if (loginId != null && !session.getAttribute("loginId").equals("")) {
			logger.info(loginId);
			String loginIdName = service.loginIdName(loginId);
			logger.info(loginIdName);
			model.addAttribute("loginIdName",loginIdName);
			
			// 지점장
			String manager = service.manager();
			logger.info(manager);
			model.addAttribute("manager",manager);
			
			// 대표
			String top_manager = service.top_manager();
			logger.info(top_manager);
			model.addAttribute("top_manager",top_manager);
			
			// 직급
			String position = service.position(loginId);
			logger.info(position);
			model.addAttribute("position",position);
			
			return "approvalExpenseReport";
		}
		return"redirect:/" ;
	}
	
	// 이벤트신청하기
	@RequestMapping(value="approvalEventRequest.do")
	public String eventRequestW(@RequestParam HashMap<String,String> params, MultipartFile[] files, HttpSession session) {
		
		logger.info("emp_no 값 : " + params.get("emp_no"));
		logger.info("approval 값  : " + params.get("approval"));
		logger.info("subject 값  : " + params.get("subject"));
		logger.info("state 값  : " + params.get("state"));
		logger.info("manager 값 : " + params.get("manager"));
		logger.info("top_manager 값 : " + params.get("top_manager"));
		logger.info("start_day 값 : " + params.get("start_day"));
		logger.info("finish_day 값 : " + params.get("finish_day"));
		logger.info("reason 값 : " + params.get("reason"));
		logger.info("etc 값 : " + params.get("etc"));
		
		service.eventRequestWrite(params,files);
		
		return "redirect:/approvalAllList.do";
	}
	// 지출결의서 신청
	@RequestMapping(value="approvalExpenseReport.do")
	public String ExpenseReportW(@RequestParam HashMap<String, String> params, MultipartFile[] files, HttpSession session
			,@RequestParam(value="briefs[]") ArrayList<String> briefs
			,@RequestParam(value="price[]") ArrayList<String> price
			,@RequestParam(value="note[]") ArrayList<String> note) {
		
		logger.info("emp_no 값 : " + params.get("emp_no"));
		logger.info("approval 값  : " + params.get("approval"));
		logger.info("subject 값  : " + params.get("subject"));
		logger.info("state 값  : " + params.get("state"));
		logger.info("manager 값 : " + params.get("manager"));
		logger.info("top_manager 값 : " + params.get("top_manager"));
		logger.info("briefs 값 : "+briefs);
		logger.info("price 값 : " + price);
		logger.info("note 값 : " + note);
		
		return service.ExpenseReportW(params,files,briefs,price,note);
	}
	
	// 이벤트 상세
	@RequestMapping(value="eventDetail.do")
	public ModelAndView eventDetail(String a_idx, String approval, HttpSession session, Model model) {
		
	logger.info("이벤트 상세보기 : "+a_idx);
	logger.info("결재 종류 : "+approval);
	
	String loginId = (String)session.getAttribute("loginId");
	String position = service.position(loginId);
	model.addAttribute("loginId",loginId);
	model.addAttribute("position",position);
	
	ModelAndView mav = null;
	ApprovalDTO dto = null;

	if (loginId != null && !loginId.equals("")) {
		
		if(approval.equals("지출결의서")) {
			logger.info("지출결의서 상세");
			 mav = new ModelAndView("approvalExpenseReportDetail");
			 dto = service.expenseDetail(a_idx,approval);  // payment
			if(dto != null) {
				ArrayList<ApprovalDTO> JGB = service.expenseR(a_idx); // expense_report
				ArrayList<ApprovalDTO> list = service.detailFiles(a_idx); // 첨부파일
				mav.addObject("dto",dto);
				mav.addObject("jgb",JGB);
				mav.addObject("list",list);
			}
			return mav;
		}

		
			if(approval.equals("이벤트신청")) {
				logger.info("이벤트신청 상세");
				 mav = new ModelAndView("approvalEventRequestDetail");
				 dto = service.eventDetail(a_idx,approval);// payment, payment2
				if(dto != null) {
					ArrayList<ApprovalDTO> list = service.detailFiles(a_idx); // 첨부파일
						mav.addObject("list",list);
						mav.addObject("dto",dto);
					}
				}
				return mav;
			}
	
	
	return new ModelAndView("redirect:/");
	}
	
	// 결재 승인
	@RequestMapping(value="/approvalAccept.do")
	public String stayAccept(String a_idx, String approval, HttpSession session) {
		logger.info("승인 할 글번호 : "+a_idx); 	
		logger.info("승인 할 결재구분 : "+approval);
		String loginId = (String)session.getAttribute("loginId");
		String position = service.position(loginId);
		logger.info(position);
		if(position.equals("대표")) {
			
			int row = service.expectedAccept(a_idx,approval);
			
			if(row == 1  && approval.equals("이벤트신청")) {
				// service.addTicket(); 이용권으로 바로 추가하고 싶었으나 좀 힘듦 
			}
			return "redirect:/approvalExpectedList.do";
		}
		if(position.equals("지점장")) {			
			service.stayAccept(a_idx, approval);
		}
		return "redirect:/approvalStayList.do";
	}

	@RequestMapping(value="/saveRequest.do")
	public String saveRequest(@RequestParam HashMap<String, String> params, MultipartFile[] files, Model model, RedirectAttributes attr) {
		
		logger.info("emp_no 값 : " + params.get("emp_no"));
		logger.info("approval 값  : " + params.get("approval"));
		logger.info("subject 값  : " + params.get("subject"));
		logger.info("state 값  : " + params.get("state"));
		logger.info("manager 값 : " + params.get("manager"));
		logger.info("top_manager 값 : " + params.get("top_manager"));
		logger.info("start_day 값 : " + params.get("start_day"));
		logger.info("finish_day 값 : " + params.get("finish_day"));
		logger.info("reason 값 : " + params.get("reason"));
		logger.info("etc 값 : " + params.get("etc"));

		return service.saveRequest(params, files);
	}
	
	@RequestMapping(value="approvalUpdate.go")
	public ModelAndView appUpdate(String a_idx, HttpSession session, Model model, String approval) {
		
		logger.info("이벤트 상세보기 : "+a_idx);
		logger.info("결재 종류 : "+approval);
		
		ModelAndView mav = null;
		ApprovalDTO dto = null;
		
		String loginId = (String)session.getAttribute("loginId");
		String position = service.position(loginId);
		model.addAttribute("loginId",loginId);
		logger.info(position);
		model.addAttribute("position",position);

		if (loginId != null && !loginId.equals("")) {

			if(approval.equals("지출결의서")) {
				logger.info("지출결의서 상세");
				 mav = new ModelAndView("approvalExpenseReportDetail");
				 dto = service.expenseDetail(a_idx,approval);  // payment
				if(dto != null) {
					ArrayList<ApprovalDTO> JGB = service.expenseR(a_idx); // expense_report
					ArrayList<ApprovalDTO> list = service.detailFiles(a_idx); // 첨부파일
					mav.addObject("dto",dto);
					mav.addObject("jgb",JGB);
					mav.addObject("list",list);
				}
				return mav;
			}
			
			if(approval.equals("이벤트신청")) {
				 mav = new ModelAndView("approvalEventRequestUpdate");
				 dto = service.eventDetail(a_idx,approval);// payment, payment2
				if(dto != null) {
					ArrayList<ApprovalDTO> list = service.detailFiles(a_idx); // 첨부파일
					logger.info("----------------------------------------------------- : "+list);
						mav.addObject("list",list);
						mav.addObject("dto",dto);
					}
				}
			return mav;
		}
		
		
		
		return new ModelAndView("redirect:/");
	}

	@RequestMapping(value="approvalUpdate.do")
	public String eventUpdate(@RequestParam HashMap<String, String> params, MultipartFile files) {
		logger.info("수정할려고 하는 값 : "+params);
		return service.eventUpdate(params);
	}
}	

