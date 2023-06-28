package kr.co.gf.approval.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
		return "approvalEventRequest";
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
