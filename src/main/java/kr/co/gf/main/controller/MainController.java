package kr.co.gf.main.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class MainController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	// default context path로 요청 시 main으로 redirect
	@GetMapping(value="/")
	public ModelAndView index() {
		return new ModelAndView("main");
	}
	
	@GetMapping(value="/join.go")
	public ModelAndView joinForm() {
		return new ModelAndView("joinForm");
	}
	
	// main 요청 처리
	// 로그인 정보가 세션에 저장되어 있으면 index로 가고, 없으면 로그인 페이지로 보낸다.
	/*
	 * @GetMapping(value="/main") public ModelAndView main(HttpSession session) {
	 * logger.info("loginId: " + session.getAttribute("loginId")); if
	 * (session.getAttribute("loginId") != null &&
	 * !session.getAttribute("loginId").equals("")) { return new
	 * ModelAndView("main"); } return new ModelAndView("loginPage"); }
	 */
	
}
