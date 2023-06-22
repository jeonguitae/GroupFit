package kr.co.gf.member.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

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
	
	@GetMapping(value="memWrite.go")
	public String memWrite() {
		
		return "memWrite";
	}
	
	
	
}
