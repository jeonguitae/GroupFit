package kr.co.gf.mail.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import kr.co.gf.emp.dto.EmpDTO;
import kr.co.gf.mail.dto.MailDTO;
import kr.co.gf.mail.service.MailService;

@RestController
public class MailController {
	@Autowired MailService service;
	@Autowired PasswordEncoder encoder;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	//보낸쪽지 검색
	@RequestMapping(value="/postSendList.do")
	public ModelAndView SendSerch(@RequestParam HashMap<String, String>params, HttpSession session) {
		
	        logger.info("search : " + params);

	    return service.post_sendSerch(params);
	}
	//받은쪽지 검색
	@RequestMapping(value="/postGetList.do")
	public ModelAndView GetSerch(@RequestParam HashMap<String, String>params, HttpSession session) {
		
		logger.info("search : " + params);
		
		return service.post_getSerch(params);
	}
	
	// 보낸 쪽지
	@RequestMapping(value="/postSendList.go")
	public ModelAndView sendList(HttpSession session){
		String send_empno = (String)session.getAttribute("loginId");
		return service.post_sendList(send_empno);
	}
	
	// 받은 쪽지
	@RequestMapping(value="/postGetList.go")
	public ModelAndView getList(HttpSession session){
		String get_empno = (String) session.getAttribute("loginId");
		return service.post_getList(get_empno);
	}
	
	@GetMapping(value="/postSendWrite.go")
	public ModelAndView postSendWrite(HttpSession session){
		ModelAndView mav = new ModelAndView("postSendWrite");
		// 직원정보를 담고 있는 loginEmp (loginController)
		mav.addObject("emp",session.getAttribute("loginEmp"));
		return mav;
	}
	
	// 직원찾기
	@PostMapping(value="/empNameFind.ajax")
	public List<HashMap<String, Object>> empNameFind(@RequestParam String get_empno){
		logger.info("get names : "+get_empno);
		return service.emp_multi(get_empno);
	}
	
	// 직원찾기 리스트
	@PostMapping(value="/'empFindList.ajax'")
	public HashMap<String, Object> listCall(@RequestParam ArrayList<String> params){
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<EmpDTO> list = service.emp_multiList(params);
		map.put("list", list);
		return map;
	} 
	
	@PostMapping(value="/postSendWrite.do")
	public ModelAndView postWrite(@RequestParam HashMap<String, String> params, RedirectAttributes rAttr){
		logger.info("params: "+params);
		return service.post_sendWrite(params, rAttr);
	}
	
	@GetMapping(value="/postSendDetail.do")
	public ModelAndView postSendDetail(@RequestParam String emailid, HttpSession session){
		logger.info("emailid :"+emailid);
		MailDTO dto = service.post_sendDetail(emailid,"detail", session);
		String page = "redirect:/postSendList.go";
		
		if(dto != null) {
			page = "postSendDetail";
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(page);
		mav.addObject("post",dto);
      
		return mav;
	}
	
	@GetMapping(value="/postGetDetail.do")
	public ModelAndView postGetDetail(@RequestParam String emailid, HttpSession session){
		logger.info("emailid :"+emailid);
		MailDTO dto = service.post_GetDetail(emailid,"detail", session);
		String page = "redirect:/postGetList.go";
		
		if(dto != null) {
			page = "postGetDetail";
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(page);
		mav.addObject("post",dto);
		
		return mav;
	}
	
	@GetMapping(value="/postGetWrite.go")
	public ModelAndView postGet(HttpSession session, String emailid){
		ModelAndView mav = new ModelAndView("postGetWrite");
		// 직원정보를 담고 있는 loginEmp (loginController)
		mav.addObject("post", service.post_get(emailid));
		return mav;
	}
	
	@PostMapping(value="/postGetWrite.do")
	public ModelAndView postGetWrite(@RequestParam HashMap<String, String> params, RedirectAttributes rAttr){
		logger.info("params: "+params);
		return service.post_getWrite(params,rAttr);
	}
	
	// 목록에서 삭제
  	@PostMapping(value="/post_sendhide.ajax")
	public ModelAndView hide(@RequestParam(value="hideList[]") List<String> hideList, RedirectAttributes rAttr) {
  		logger.info("hide~");
  		return service.post_hide(hideList, rAttr);
	}
  	
	@RequestMapping(value="/emp_find.ajax")
	@ResponseBody
	public HashMap<String, Object> empFind(@RequestParam String emp_no) {
		return service.emp_find(emp_no);
	}
	
	//보낸 휴지통
	@RequestMapping(value="/postWasteList.go")
	public ModelAndView sendWasteList(HttpSession session){
		String send_empno = (String)session.getAttribute("loginId");
		return service.post_sendWasteList(send_empno);
	}
	//받은 휴지통
	@RequestMapping(value="/postWasteGetList.go")
	public ModelAndView getWasteList(HttpSession session){
		String get_empno = (String) session.getAttribute("loginId");
		return service.post_getWasteList(get_empno);
	}
	
	@GetMapping(value="/unreadMailCount.ajax")
	public HashMap<String, Object> unreadMailCount(@RequestParam String emp_no) {
		return service.unreadMailCount(emp_no);
	}
	
}