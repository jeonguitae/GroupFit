package kr.co.gf.mail.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	
	// 보낸 쪽지
	@GetMapping(value="/postSendList.go")
	public ModelAndView sendList(HttpSession session) {
		String send_empno = (String)session.getAttribute("loginId");

		return service.post_sendList(send_empno);
	}

	// 받은 쪽지
	@GetMapping(value="/postGetList.go")
	public ModelAndView getList(HttpSession session) {
		String get_empno = (String) session.getAttribute("loginId");
		return service.post_getList(get_empno);
	}
	
	@GetMapping(value="/postSendWrite.go")
	public ModelAndView postSendWrite(HttpSession session) {
		
		ModelAndView mav = new ModelAndView("postSendWrite");
		// 직원정보를 담고 있는 loginEmp (loginController)
		mav.addObject("emp",session.getAttribute("loginEmp"));
		return mav;
	}
	
	@PostMapping(value="/postSendWrite.do")
	public ModelAndView postWrite(@RequestParam HashMap<String, String> params, RedirectAttributes rAttr) {
		logger.info("params: "+params);
		
		return service.post_sendWrite(params, rAttr);
	}
	
	@GetMapping(value="/postSendDetail.do")
	public ModelAndView postSendDetail(@RequestParam String emailid) {
		logger.info("emailid :"+emailid);
		
		MailDTO dto = service.post_sendDetail(emailid,"detail");
		String page = "redirect:/postSendList.go";
		
		if(dto != null) {
			page = "postSendDetail";
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(page);
		mav.addObject("post",dto);
		
		return mav;
	}
	
	@GetMapping(value="/postGetWrite.go")
	public ModelAndView postGetWrite(HttpSession session, String emailid) {
		
		ModelAndView mav = new ModelAndView("postGetWrite");
		session.setAttribute("post", service.post_get(emailid));
		// 직원정보를 담고 있는 loginEmp (loginController)
		mav.addObject("emp",session.getAttribute("loginEmp"));
		return mav;
	}
	
}