package kr.co.gf.member.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.gf.calender.dto.CalenderDTO;

@Controller
public class PtMemberController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	
	@RequestMapping(value = "/dailypt")
	public String calender(Model model) {
		
		return "dailyptForm";
	}
	
	@RequestMapping(value = "/dailyptMain")
	public String dailyptMain(Model model) {
		
		return "dailyptMain";
	}
	
	
	
	
	
}
