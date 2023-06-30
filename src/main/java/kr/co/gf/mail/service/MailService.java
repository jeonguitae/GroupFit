package kr.co.gf.mail.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.gf.emp.dto.EmpDTO;
import kr.co.gf.mail.dao.MailDAO;
import kr.co.gf.mail.dto.MailDTO;
@Service
@MapperScan(value = { "kr.co.gf.mail.dao" })
public class MailService {
	
	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	MailDAO dao;

	@Autowired
	PasswordEncoder encoder;

	public ModelAndView post_sendList() {
		
		ArrayList<MailDTO> list = dao.post_sendList();
		
		ModelAndView mav = new ModelAndView();
		
		String page = "postList";
		
		mav.addObject("list",list);
		mav.setViewName(page);
		
		return mav;
	}

	public ModelAndView post_sendWrite(HashMap<String, Object> params, RedirectAttributes rAttr) {
		
		MailDTO dto = new MailDTO();
		//dto.setSend_empno(params.get("send_empno"));
		
		int success = dao.post_sendWrite(dto);
		logger.info("success:"+success);
		String msg = "쪽지 전송에 실패 했습니다!";
		String page = "postSendWrite";
		
		if(success > 0) {
			msg = "쪽지 전송에 성공 했습니다!";
			page = "redirect:/postSendList.go";
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName(page);
		rAttr.addFlashAttribute("msg",msg);
		
		return mav;
	}


}
