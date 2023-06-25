package kr.co.gf.emp.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gf.emp.dao.EmpDAO;
import kr.co.gf.emp.dto.EmpDTO;
import kr.co.gf.emp.service.EmpService;

@RestController
public class EmpController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired EmpService service;
	
	@Autowired PasswordEncoder encoder;
	
	@PostMapping(value="/tempJoin.do")
	public ModelAndView tempJoin(EmpDTO dto) {
		
		logger.info("dto: " + dto.getEmp_no());
		
		service.tempJoin(dto);
		
		return new ModelAndView("loginPage");
	}
	
	@GetMapping(value="/empJoin.go")
	public ModelAndView join() {
		return new ModelAndView("empJoin");
	}
	
	@PostMapping(value="/empJoin.do")
	public ModelAndView joinDo(EmpDTO dto) {
		
		logger.info("dto: " + dto.getEmp_no());
		
		return service.join(dto);
	}
	
//	@GetMapping(value="/list.do")
//	public String list(Model model) {
//		ArrayList<EmpDTO> list = service.list();
//		model.addAttribute("list",list);
//		return "empList";
//	}
	
	@GetMapping(value="/list.do")
	public ModelAndView list() {
		ArrayList<EmpDTO> list = service.list();
		
		String page = "empList";
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(page);
		mav.addObject("list",list);
		
		return mav;
	}
	
//	@GetMapping(value="/empDetail.do")
//	public String detail(@RequestParam String detailid, Model model) {
//		String page ="redirect:/list.do";
//		EmpDTO dto = service.detail(detailid);
//		if(dto!=null) {
//			page="empDetail";
//			model.addAttribute("emp",dto);
//		}
//		return page;
//	}
	
	@RequestMapping(value="/empDetail.do")
	public ModelAndView detail(@RequestParam String detailid) {
		
		EmpDTO dto = service.detail(detailid);
		String page ="redirect:/list.do";
		
		if(dto!=null) {
			page="empDetail";
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName(page);
		mav.addObject("emp",dto);
		
		return mav;
	}
	
	@GetMapping(value="/empUpdate.go")
	public ModelAndView update(@RequestParam String detailid) {
		
		EmpDTO dto = service.detail(detailid);
		String page ="redirect:/list.do";
		
		if(dto!=null) {
			page="empUpdate";
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName(page);
		mav.addObject("emp",dto);
		
		return mav;
	}
	
	@PostMapping(value="/empUpdate.do")
	public ModelAndView updateDo(EmpDTO dto) {
		logger.info("dto: " + dto.getEmp_no());
		return service.update(dto);
	}
	
	@GetMapping(value="/empDelete.do")
	public ModelAndView delete(@RequestParam String detailid) {
		
		return service.delete(detailid);
	}
	

}