package kr.co.gf.mail.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	public ModelAndView post_sendSerch(HashMap<String, String> params) {
		
		ModelAndView mav = new ModelAndView("postList");
		
		ArrayList<MailDTO> list = dao.post_sendSerch(params);
		
		mav.addObject("list",list);
		return mav;
	}

	//보낸 쪽지
	public ModelAndView post_sendList(String send_empno) {
		
		ArrayList<MailDTO> list = dao.post_sendList(send_empno);
		
		ModelAndView mav = new ModelAndView();
		
		String page = "postList";

		mav.addObject("list",list);
		logger.info("list"+list);

		mav.setViewName(page);
		
		return mav;
	}
	
	//받은 쪽지
	public ModelAndView post_getList(String get_empno) {
		
		ArrayList<MailDTO> list = dao.post_getList(get_empno);
		
		ModelAndView mav = new ModelAndView();
		
		String page = "postGetList";
		
		mav.addObject("list",list);
		mav.setViewName(page);
		
		return mav;
	}
	
	public ModelAndView post_sendWrite(@RequestParam HashMap<String, String> params, RedirectAttributes rAttr) {
		
		MailDTO dto = new MailDTO();
		dto.setSend_empno((String) params.get("send_empno"));
		dto.setGet_empno((String) params.get("get_empno"));
		dto.setSubject((String) params.get("subject"));
		dto.setContent((String) params.get("content"));
	
		int success = dao.post_sendWrite(dto);
		
		int idx = dto.getEmail_num();
		logger.info("success:"+success);
		String msg = "쪽지 전송에 실패 했습니다!";
		String page = "postSendWrite";
		
		if(success > 0) {
			msg = "쪽지 전송에 성공 했습니다!";
			page = "redirect:/postSendList.go";
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName(page);
		mav.addObject("msg", msg);
		rAttr.addAttribute("msg",msg);
		return mav;
	}

	public MailDTO post_sendDetail(String emailid, String flag, HttpSession session) {
		
		if(flag.equals("detail")) {
			String get_empno = (String) session.getAttribute("loginId");
			dao.post_upHit(get_empno, emailid);
		}
		
		return dao.post_sendDetail(emailid);
	}
	
	public MailDTO post_GetDetail(String emailid, String flag, HttpSession session) {
		
		if(flag.equals("detail")) {
			String get_empno = (String) session.getAttribute("loginId");
			dao.post_upHit(get_empno, emailid);
		}
		
		return dao.post_GetDetail(emailid);
	}

	public MailDTO post_get(String emailid) {
		
		return dao.post_get(emailid);
	}
	
	public ModelAndView post_getWrite(HashMap<String, String> params, RedirectAttributes rAttr) {
		
		int success = dao.post_getWrite(params);
		String msg = (success ==1) ? "회신에 실패했습니다!"  : "회신을 보냈습니다!";
		String page = "postGetWrite";
		if(success > 0) {
			page = "redirect:/postSendList.go";
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName(page);
		rAttr.addFlashAttribute("msg",msg);
		
		return mav;
	}
	
	// 목록에서 삭제
	public ModelAndView post_hide(List<String> hideList, RedirectAttributes rAttr) {
		logger.info("hideservice");
		
		dao.post_hide(hideList);
		
		String msg = "쪽지를 삭제 했습니다.";

		rAttr.addFlashAttribute("msg",msg);
		return new ModelAndView("redirect:/postSendList.go");
	}

	public HashMap<String, Object> emp_find(String emp_no) {
		
		logger.info("emp_no: "+emp_no);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<EmpDTO> list = dao.emp_find(emp_no);
		
		String page = "redirect:/postSendWrite.go";
		
		map.put("page", page);
		map.put("list", list);
		
		return map;
	}

	public HashMap<String, Object> emp_findList(String emp_no) {
		logger.info("emp_findList:"+emp_no);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<EmpDTO> list = dao.emp_findList(emp_no);
		map.put("list", list);
		return map;
	}




}
