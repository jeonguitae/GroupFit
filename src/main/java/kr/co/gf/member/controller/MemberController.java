package kr.co.gf.member.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.gf.member.dto.MemberDTO;
import kr.co.gf.member.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired MemberService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@GetMapping(value="/memlist.go")
	public String memlist(Model model) {
		
		ArrayList<MemberDTO> list = service.memlist();
		
		model.addAttribute("list", list);
		return "memList";
	}

	@GetMapping(value="/memWrite.move")
	public String memWrite(Model model) {
		
		ArrayList<MemberDTO> list = service.branch();
		model.addAttribute("branch", list);
				
		ArrayList<MemberDTO> list2 = service.ticket();
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
