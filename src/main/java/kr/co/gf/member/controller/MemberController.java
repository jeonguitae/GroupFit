package kr.co.gf.member.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gf.emp.dto.EmpDTO;
import kr.co.gf.login.service.LoginService;
import kr.co.gf.member.dto.MemberDTO;
import kr.co.gf.member.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired MemberService service;
	@Autowired LoginService service2;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Value("${spring.servlet.multipart.location}") private String root;
	
	@GetMapping(value="/memlist.go")
	public String memlistGo() {
	
		return "memList";
	}
	
	@GetMapping(value="memlist.ajax")
	@ResponseBody
	public HashMap<String, Object> memlist(HttpSession session){
		
		String loginId = (String) session.getAttribute("loginId");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<MemberDTO> list = service.memlist(loginId);
		
		map.put("list", list);
		
		return map;
	}

	@RequestMapping(value="/memdel.ajax")
	@ResponseBody
	public HashMap<String, Object> delete(
			@RequestParam(value="delList[]") ArrayList<String> memdelList, HttpSession session){
		
		EmpDTO dto = (EmpDTO) session.getAttribute("loginEmp");
		String b_idx = dto.getB_idx();
		
		logger.info("delList : "+memdelList);
		return service.memdelete(memdelList, b_idx);
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
		
		ArrayList<MemberDTO> list3 = service.locker(b_idx);
		model.addAttribute("locker", list3);
		
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
			@RequestParam HashMap<String, String> params, HttpSession session){
		
		EmpDTO dto = (EmpDTO) session.getAttribute("loginEmp");
		String b_idx = dto.getB_idx();
		
		params.put("b_idx", b_idx);
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
	
	/*
	 * @RequestMapping(value="memdetail.go") public String memdetail(String mem_no,
	 * Model model) {
	 * 
	 * logger.info("mem_no" + mem_no);
	 * 
	 * MemberDTO dto = service.memdetail(mem_no); String new_photo_name =
	 * service.photomem(mem_no);
	 * 
	 * logger.info("new_photo_name : " + new_photo_name);
	 * 
	 * dto.setNew_photo_name(new_photo_name);
	 * 
	 * String emp_name = service.mem_emp_name(dto.getEmp_no()); String b_name =
	 * service.mem_b_name(dto.getB_idx());
	 * 
	 * dto.setEmp_name(emp_name); dto.setB_name(b_name);
	 * 
	 * logger.info("emp_name : " + emp_name); logger.info("b_name : " + b_name);
	 * 
	 * model.addAttribute("dto", dto); return "memdetail"; }
	 */
	
	@RequestMapping(value="memprofile.do")
	public String memprofile(String mem_no, MultipartFile photo) {
	
		int row = service.memprofile(mem_no, photo);
		
		return "redirect:/memdetail.go?mem_no="+mem_no;
	}
	
	@GetMapping(value="ptmemlist.go")
	public String ptmemlist(Model model) {
		
		return "ptmemlist";
	}
	
	@RequestMapping(value="ptmemlist.ajax")
	@ResponseBody
	public HashMap<String, Object> ptmemlista(HttpSession session){
		
		String loginId = (String) session.getAttribute("loginId");
		
		return service.ptmemlist(loginId);
	}
	
	@RequestMapping(value="memsearch.ajax")
	@ResponseBody
	public HashMap<String, Object> memsearch(String sortting, String txt){
	
		logger.info("sortting / txt : " + sortting + " / " + txt);
		
		return service.memsearch(sortting, txt);
	}
	
	@RequestMapping(value="entermem.go")
	public String entermemform() {
		
		return "entermem";
	}
	
	@RequestMapping(value="entermem.ajax")
	@ResponseBody
	public HashMap<String, Object> entermem(String entermem_no){
	
		return service.entermem(entermem_no);
	}
	
	@RequestMapping(value="entry_mem.ajax")
	@ResponseBody
	public HashMap<String, Object> entry_mem(String mem_no, int b_idx){
	
		return service.entry_mem(mem_no, b_idx);
	}
	
	@RequestMapping(value="dup_entermem.ajax")
	@ResponseBody
	public HashMap<String, Object> dup_entry_mem(String entermem_no, String name){
	
		return service.dup_entermem(entermem_no, name);
	}
	
	@GetMapping(value="entermemlist.go")
	public String entermemListgo(Model model) {
	
		return "entermemlist";
	}
	
	@RequestMapping(value="entermemlist.ajax")
	@ResponseBody
	public HashMap<String, Object> entermemlist(HttpSession session){
		
		String loginId = (String) session.getAttribute("loginId");
		
		return service.entermemlist(loginId);
	}
	
	/*
	 * @GetMapping(value="ptmemdetail.go") public String ptmemdetailgo(String
	 * mem_no, Model model) {
	 * 
	 * MemberDTO dto = service.ptmemdetail(mem_no); String new_photo_name =
	 * service.photomem(mem_no);
	 * 
	 * logger.info("new_photo_name : " + new_photo_name);
	 * 
	 * dto.setNew_photo_name(new_photo_name);
	 * 
	 * model.addAttribute("dto", dto);
	 * 
	 * return "ptmemdetail"; }
	 */
	
	@RequestMapping(value="mem_info.ajax")
	@ResponseBody
	public HashMap<String, Object> mem_info(String mem_no){
	
		return service.mem_info(mem_no);
	}
	
	@RequestMapping(value="ptmem_info.ajax")
	@ResponseBody
	public HashMap<String, Object> ptmem_info(String mem_no){
	
		return service.ptmem_info(mem_no);
	}
}
