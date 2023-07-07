package kr.co.gf.board.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.gf.board.service.LockerService;
import kr.co.gf.emp.dto.EmpDTO;

@Controller
public class LockerController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired LockerService service;
	
	@GetMapping(value="loclist.go")
	public String loclist() {
		
		return "loclist";
	}
	
	@RequestMapping(value="loclist.ajax")
	@ResponseBody
	public HashMap<String, Object> loclista(HttpSession session){
		
		EmpDTO dto = (EmpDTO) session.getAttribute("loginEmp");
		String b_idx = dto.getB_idx();
		
		return service.loclist(b_idx);
	}
	
	@RequestMapping(value="loc_status.ajax")
	@ResponseBody
	public HashMap<String, Object> loc_status(HttpSession session, String loc_no, String status){
		
		EmpDTO dto = (EmpDTO) session.getAttribute("loginEmp");
		String b_idx = dto.getB_idx();
		
		return service.loc_status(b_idx, loc_no, status);
	}
	
	@RequestMapping(value="loc_no_cng.ajax")
	@ResponseBody
	public HashMap<String, Object> loc_no_cng(HttpSession session, String loc_no, String mem_no){
		
		EmpDTO dto = (EmpDTO) session.getAttribute("loginEmp");
		String b_idx = dto.getB_idx();
		
		return service.loc_no_cng(b_idx, loc_no, mem_no);
	}
}
