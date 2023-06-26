package kr.co.gf.member.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gf.emp.dto.EmpDTO;
import kr.co.gf.emp.service.EmpService;
import kr.co.gf.login.service.LoginService;
import kr.co.gf.member.dto.MemberDTO;
import kr.co.gf.member.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired MemberService service;
	@Autowired LoginService service2;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@GetMapping(value="/memlist.go")
	public String memlistGo() {
	
		return "memList";
	}
	
	@GetMapping(value="memlist.ajax")
	@ResponseBody
	public HashMap<String, Object> memlist(){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<MemberDTO> list = service.memlist();
		
		map.put("list", list);
		
		return map;
	}
	
	@RequestMapping(value="/memdel.ajax")
	@ResponseBody
	public HashMap<String, Object> delete(
			@RequestParam(value="delList[]") ArrayList<String> memdelList){
		//array 로 받을 경우 @RequestParam 에 value 를 반드시 명시해야함
		logger.info("delList : "+memdelList);
		return service.memdelete(memdelList);
	}


	@GetMapping(value="/memWrite.go")
	public String memWrite(Model model, HttpSession session) {
		
		String loginId = (String) session.getAttribute("loginId");
		
		EmpDTO dto = service2.getEmp(loginId);
		
		String b_idx = dto.getB_idx();
		
		ArrayList<MemberDTO> list = service.branch();
		model.addAttribute("branch", list);
				
		ArrayList<MemberDTO> list2 = service.ticket(b_idx);
		model.addAttribute("ticket", list2);
		
		return "memWrite";
	}
	
//	@RequestMapping(value="memjoin.do")
//	@Transactional
//	public String memJoin(@RequestParam HashMap<String, String> params, Model model) {
//		
//		int row1 = service.memjoin(params);
//		
//		if(row1 == 1) {
//			
//			model.addAttribute("params", params);
//		}
//		
//		return "memWrite";
//	}
	
	@RequestMapping(value="/memjoin.ajax")
	@ResponseBody
	public HashMap<String, Object> memjoin(
			@RequestParam HashMap<String, String> params){
		logger.info("params : {}",params);
		return service.memjoin(params);
	}
	
	@RequestMapping(value="/ticjoin.ajax")
	@ResponseBody
	public HashMap<String, Object> ticjoin(
			@RequestParam HashMap<String, String> params){
		logger.info("params : {}",params);
		
		return service.ticjoin(params);
	}
	
	@RequestMapping(value="ptmemJoin.go")
	public String ptmem(String mem_no, String ticket_no, String ticket_time, Model model) {
		
		model.addAttribute("mem_no", mem_no);
		model.addAttribute("ticket_no", ticket_no);
		model.addAttribute("ticket_time", ticket_time);
		
		return "ptmemjoin";
	}
	
	@RequestMapping(value="/ptmemjoin.ajax")
	@ResponseBody
	public HashMap<String, Object> ptmemjoin(
			@RequestParam HashMap<String, String> params){
		logger.info("params : {}",params);
		
		return service.ptmemjoin(params);
	}
	
}
