package kr.co.gf.mail.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.gf.emp.dto.EmpDTO;
import kr.co.gf.mail.dto.MailDTO;
import kr.co.gf.mail.service.MailService;

@RestController
public class MailController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MailService service;
	
	@Autowired PasswordEncoder encoder;
	
//	// 보낸쪽지 검색
//	@RequestMapping(value="/sendList.go")
//	public ModelAndView sendList(
//			@RequestParam HashMap<String, String> params) {
//		logger.info("params : "+params);
//		return service.letter_sendList(params);
//	}
	
	@GetMapping(value="/postSendList.go")
	public ModelAndView sendList() {
		return service.post_sendList();
	}
	
	@GetMapping(value="/postSendWrite.go")
	public ModelAndView postSendWrite(HttpSession session) {
		
		ModelAndView mav = new ModelAndView("postSendWrite");
		// 직원정보를 담고 있는 loginEmp (loginController)
		mav.addObject("emp",session.getAttribute("loginEmp"));
		return mav;
	}
	
	@PostMapping(value="/postSendWrite.do")
	public ModelAndView postWrite(HashMap<String, Object> params, RedirectAttributes rAttr) {
		logger.info("params: "+params);
		
		return service.post_sendWrite(params, rAttr);
	}
	
}
