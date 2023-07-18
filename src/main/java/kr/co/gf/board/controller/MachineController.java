package kr.co.gf.board.controller;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.gf.board.dto.MachineDTO;
import kr.co.gf.board.service.MachineService;
import kr.co.gf.emp.dto.EmpDTO;


@Controller
public class MachineController {
	
	@Autowired MachineService service;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@GetMapping(value="maclist.go")
	public String loclist(HttpSession session, Model model) {
		
		EmpDTO dto = (EmpDTO) session.getAttribute("loginEmp");
		String b_idx = dto.getB_idx();
		
		ArrayList<MachineDTO> list = service.Smaclist(b_idx);
		ArrayList<MachineDTO> list2 = service.Fmaclist(b_idx);
		
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		
		return "maclist";
	}

	
	@RequestMapping(value="mac_reg.ajax")
	@ResponseBody
	public HashMap<String, Object> mac_reg(HttpSession session, @RequestParam HashMap<String, String> params){
		
		EmpDTO dto = (EmpDTO) session.getAttribute("loginEmp");
		String b_idx = dto.getB_idx();
		params.put("b_idx", b_idx);
		
		logger.info("params :" + params);
		
		return service.mac_reg(params);
	}
	
	@RequestMapping(value="mac_fixed.ajax")
	@ResponseBody
	public HashMap<String, Object> mac_fixed(HttpSession session, 
			String emp_no, String mac_name, String fixed_content){
		
		EmpDTO dto = (EmpDTO) session.getAttribute("loginEmp");
		String b_idx = dto.getB_idx();
		
		return service.mac_fixed(emp_no, mac_name, fixed_content, b_idx);
	}
	
	@RequestMapping(value="mac_photo_reg.do")
	public String mac_photo_reg(HttpSession session, String mac_name, MultipartFile photo, Model model, RedirectAttributes rattr) {
		
		EmpDTO dto = (EmpDTO) session.getAttribute("loginEmp");
		String b_idx = dto.getB_idx();
		
		String mac_num = service.mac_num(mac_name, b_idx);
		
		int row = service.mac_photo_reg(mac_num, photo);
		
		if(row == 1) {
			
			rattr.addFlashAttribute("msg", "사진등록이 완료되었습니다");
		}
		
		return "redirect:/maclist.go";
	}
	
	@RequestMapping(value="maclist.ajax")
	@ResponseBody
	public HashMap<String, Object> mac_list(Model model, HttpSession session){
		
		EmpDTO dto = (EmpDTO) session.getAttribute("loginEmp");
		String b_idx = dto.getB_idx();
		
		return service.maclist(b_idx);
	}
	
	@RequestMapping(value="mac_info.ajax")
	@ResponseBody
	public HashMap<String, Object> mac_info(String mac_num){
	
		return service.mac_info(mac_num);
	}
	
	@GetMapping(value="macdel.do")
	public String macdel(HttpSession session, Model model, String mac_num, RedirectAttributes rattr) {
		
		EmpDTO dto = (EmpDTO) session.getAttribute("loginEmp");
		String b_idx = dto.getB_idx();
		
		String msg = service.macdel(b_idx, mac_num);
		
		rattr.addFlashAttribute("msg", msg);
		
		return "redirect:/maclist.go";
	}
	
	@RequestMapping(value="mac_chk.ajax")
	@ResponseBody
	public HashMap<String, Object> mac_chk(HttpSession session, 
			@RequestParam(value="chk_mac[]") ArrayList<String> chk_mac, String mac_status, String emp_no){
		
		EmpDTO dto = (EmpDTO) session.getAttribute("loginEmp");
		String b_idx = dto.getB_idx();
		
		
		return service.mac_chk(chk_mac, mac_status, b_idx, emp_no);
	}
	
	@GetMapping(value="fixedmac.go")
	public String fixedmaclistg() {
		
		return "fixedmac";
	}
	
	@RequestMapping(value="fixedmaclist.ajax")
	@ResponseBody
	public HashMap<String, Object> fixedmaclist(HttpSession session){
		
		EmpDTO dto = (EmpDTO) session.getAttribute("loginEmp");
		String b_idx = dto.getB_idx();
		
		return service.fixedmaclist(b_idx);
	}
	
	@RequestMapping(value="fix_content.ajax")
	@ResponseBody
	public HashMap<String, Object> fix_content(HttpSession session, String mac_num){
		
		return service.fix_content(mac_num);
	}
	
	@RequestMapping(value="mac_status_cng.ajax")
	@ResponseBody
	public HashMap<String, Object> mac_status_cng(HttpSession session, @RequestParam HashMap<String, String> params){
		
		EmpDTO dto = (EmpDTO) session.getAttribute("loginEmp");
		String b_idx = dto.getB_idx();
		params.put("b_idx", b_idx);
		
		return service.mac_status_cng(params);
	}

}
