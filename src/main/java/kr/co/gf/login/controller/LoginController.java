package kr.co.gf.login.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.gf.login.service.LoginService;

@RestController
public class LoginController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired LoginService service;

	@PostMapping(value = "/login.do")
	public ModelAndView login(String id, String pw, HttpSession session, RedirectAttributes rAttr) {
		
		if(service.login(id,pw)) {
			session.setAttribute("loginId", id);
			session.setAttribute("loginEmp", service.getEmp(id));
			logger.info("emp: " + session.getAttribute("loginEmp"));
		}else {
			rAttr.addFlashAttribute("msg", "사번 또는 비밀번호를 확인하세요");
		}
		
		return new ModelAndView("redirect:/main");
	}
	
	@GetMapping(value = "/logout.do")
	public ModelAndView logout(HttpSession session) {
		session.removeAttribute("loginId");
		session.removeAttribute("loginEmp");
		
		return new ModelAndView("redirect:/main");
	}
}