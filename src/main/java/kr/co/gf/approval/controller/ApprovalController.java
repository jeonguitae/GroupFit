package kr.co.gf.approval.controller;

import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gf.approval.service.ApprovalService;

@Controller
public class ApprovalController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ApprovalService service;
	
	@RequestMapping(value="/approvalVacationRequest.go")
	public String vacation(HttpSession session, Model model) {
		
		// 로그인한 아이디
		String loginId = (String)session.getAttribute("loginId");
		logger.info(loginId);
		String loginIdName = service.loginIdName(loginId);
		logger.info(loginIdName);
		model.addAttribute("loginIdName",loginIdName);
		
		// 지점장
		String manager = service.manager();
		logger.info(manager);
		model.addAttribute("manager",manager);
		
		// 대표
		String top_Manager = service.top_Manager();
		logger.info(top_Manager);
		model.addAttribute("top_Manager",top_Manager);
		
		// 직급
		String position = service.position(loginId);
		logger.info(position);
		model.addAttribute("position",position);
		
		return "approvalVacationRequest";
	}
	
	@RequestMapping(value="/approvalEventRequest.go")
	public String event(HttpSession session, Model model) {

		// 로그인한 아이디
		String loginId = (String)session.getAttribute("loginId");
		logger.info(loginId);
		String loginIdName = service.loginIdName(loginId);
		logger.info(loginIdName);
		model.addAttribute("loginIdName",loginIdName);
		
		// 지점장
		String manager = service.manager();
		logger.info(manager);
		model.addAttribute("manager",manager);
		
		// 대표
		String top_Manager = service.top_Manager();
		logger.info(top_Manager);
		model.addAttribute("top_Manager",top_Manager);
		
		// 직급
		String position = service.position(loginId);
		logger.info(position);
		model.addAttribute("position",position);
		
		Calendar calendar = Calendar.getInstance();
	    
	    // 현재 날짜 정보를 변수에 할당
	    int year = calendar.get(Calendar.YEAR);
	    int month = calendar.get(Calendar.MONTH) + 1;
	    int day = calendar.get(Calendar.DAY_OF_MONTH);
	    String write_date =  year + "." + month + "." + day;
	    logger.info(write_date);
	    model.addAttribute("write_date", write_date);
				
		return "approvalEventRequest";
	}
	
	@RequestMapping(value="approvalEventRequest.do")
	public String eventRequest(@RequestParam HashMap<String,String> params, MultipartFile[] files, HttpSession session) {
		
		logger.info("emp_no 값 : " + params.get("emp_no"));
		logger.info("approval 값  : " + params.get("approval"));
		logger.info("subject 값  : " + params.get("subject"));
		logger.info("write_date 값 : " + params.get("write_date"));
		logger.info("state 값  : " + params.get("state"));
		logger.info("manager 값 : " + params.get("manager"));
		logger.info("top_manager 값 : " + params.get("top_manager"));
		logger.info("start_day 값 : " + params.get("start_day"));
		logger.info("finish_day 값 : " + params.get("finish_day"));
		logger.info("reason 값 : " + params.get("reason"));
		logger.info("etc 값 : " + params.get("etc"));
		
		service.eventRequestWrite(params,files);
		
		return "redirect:/approvalList.do";
	}
	
	@RequestMapping(value="/approvalList.do")
	public ModelAndView approvalList(HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		logger.info("페이지 이동 : "+loginId );
		return service.approvalList(loginId);
	}
	
	@RequestMapping(value="/approvalExpenseReport.go")
	public String expenseReport(HttpSession session, Model model) {

		// 로그인한 아이디
		String loginId = (String)session.getAttribute("loginId");
		logger.info(loginId);
		String loginIdName = service.loginIdName(loginId);
		logger.info(loginIdName);
		model.addAttribute("loginIdName",loginIdName);
		
		// 지점장
		String manager = service.manager();
		logger.info(manager);
		model.addAttribute("manager",manager);
		
		// 대표
		String top_Manager = service.top_Manager();
		logger.info(top_Manager);
		model.addAttribute("top_Manager",top_Manager);
		
		// 직급
		String position = service.position(loginId);
		logger.info(position);
		model.addAttribute("position",position);
		
		return "approvalExpenseReport";
	}

}
