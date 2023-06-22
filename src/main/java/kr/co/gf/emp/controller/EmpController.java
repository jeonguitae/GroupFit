package kr.co.gf.emp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gf.emp.dto.EmpDTO;
import kr.co.gf.emp.service.EmpService;

@RestController
public class EmpController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired EmpService service;
	
	@Autowired PasswordEncoder encoder;
	
	@PostMapping(value="/tempJoin.do")
	public ModelAndView tempJoin(EmpDTO dto) {
		
		logger.info("dto: " + dto.getEmp_no());
		
		service.tempJoin(dto);
		
		return new ModelAndView("loginPage");
	}

}
