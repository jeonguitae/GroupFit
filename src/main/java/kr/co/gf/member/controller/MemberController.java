package kr.co.gf.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gf.emp.dto.EmpDTO;
import kr.co.gf.member.dto.MemberDTO;
import kr.co.gf.member.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired MemberService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@GetMapping(value="/memlist.go")
	public String memlist(Model model) {
		
		ArrayList<MemberDTO> list = service.memlist();
		
		model.addAttribute("list", list);
		return "memList";
	}
	
	@GetMapping(value="/memjoin.do")
	public ModelAndView joinForm() {
		return new ModelAndView("memJoin");
	}
	
	@GetMapping(value="/memWrite.move")
	public String memWrite(Model model, HttpSession session) {
		
		String loginId = (String) session.getAttribute("loginId");
		
		String emp_name = service.emp_name(loginId);
		
		logger.info("emp_name : " + emp_name);
		
		ArrayList<MemberDTO> list = service.branch();
		model.addAttribute("branch", list);
		
		model.addAttribute("emp_name", emp_name);
		
		ArrayList<MemberDTO> list2 = service.ticket();
		model.addAttribute("ticket", list2);
		
		return "memWrite";
	}
	
}
