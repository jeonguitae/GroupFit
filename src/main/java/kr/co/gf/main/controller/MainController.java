package kr.co.gf.main.controller;

import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gf.emp.dto.EmpDTO;
import kr.co.gf.statistics.dto.StatisDTO;
import kr.co.gf.statistics.service.StatisService;

@RestController
public class MainController {
	@Autowired StatisService sService;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	// default context path로 요청 시 main으로 redirect
	@GetMapping(value="/")
	public ModelAndView index() {
		return new ModelAndView("redirect:/main");
	}
	
	
//	 main 요청 처리
//	 로그인 정보가 세션에 저장되어 있으면 index로 가고, 없으면 로그인 페이지로 보낸다.
	@GetMapping(value = "/main")
	public ModelAndView main(HttpSession session, Model model, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("loginPage");
		logger.info("loginId: " + session.getAttribute("loginId"));
		if (session.getAttribute("loginId") != null && !session.getAttribute("loginId").equals("")) {
			EmpDTO empDTO = (EmpDTO) session.getAttribute("loginEmp");
			String position = empDTO.getPosition();
			
			if(position.equals("FC")) {
				mav.setViewName("fcMain");
			}else if(position.equals("대표")) {
				ArrayList<StatisDTO> list = sService.branchList();
				mav.addObject("branchList",list);
				mav.setViewName("leaderMain");
			}else if(position.equals("지점장")) {
				mav.setViewName("branchManagerMain");
			}else {
				
				mav.setViewName("main");
			}
		}
		Cookie[] cookieList = request.getCookies();
		if (cookieList != null) {
			for(Cookie cookie : cookieList) {
				if(cookie.getName().equals("idRemember")) {
					logger.info("ID 쿠키 확인됨: {}", cookie.getValue());
					mav.addObject("rememberedId", cookie.getValue());
				}
			}
		}
		return mav;
	}

	
}