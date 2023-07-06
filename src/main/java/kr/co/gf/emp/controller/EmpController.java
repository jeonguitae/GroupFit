package kr.co.gf.emp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	// 직원리스트 검색
	@RequestMapping(value="/empList.do")
	public ModelAndView list(
			@RequestParam HashMap<String, String> params) {
		logger.info("params : "+params);
		return service.emp_listDo(params);
	}
	
	// 대표리스트 검색
	@RequestMapping(value="/empRepList.do")
	public ModelAndView RepList(
			@RequestParam HashMap<String, String> params) {
		logger.info("params : "+params);
		return service.empRep_listDo(params);
	}
	
	// 퇴사리스트 검색
	@RequestMapping(value="/empRetireList.do")
	public ModelAndView RetireList(
			@RequestParam HashMap<String, String> params) {
		logger.info("params : "+params);
		return service.empRep_retireListDo(params);
	}
	
	// 직원리스트
	@GetMapping(value="/empList.go")
	public ModelAndView list() {
		ArrayList<EmpDTO> list = service.emp_list();
		
		String page = "empList";
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(page);
		mav.addObject("list",list);
		
		return mav;
	}
	
	// 퇴사리스트
	@GetMapping(value="/empRetire.go")
	public ModelAndView retirelist() {
		ArrayList<EmpDTO> list = service.emp_retirelist();
		
		String page = "retireList";
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(page);
		mav.addObject("list",list);
		
		return mav;
	}
	
	@GetMapping(value="/empJoin.go")
	public ModelAndView join() {
		return new ModelAndView("empJoin");
	}
	
	@PostMapping(value="/empJoin.do")
	public ModelAndView joinDo(@RequestParam EmpDTO dto, MultipartFile[] files, 
								RedirectAttributes rAttr, @RequestParam HashMap<String, String> params) {
		
		logger.info("dto: " + dto.getEmp_no());
		logger.info("params:"+params);
		
		return service.emp_join(dto, files, rAttr, params);
	}
	

	@RequestMapping(value="/empDetail.do")
	public ModelAndView detail(@RequestParam String detailid) {
		
		EmpDTO dto = service.emp_detail(detailid);
		String page ="redirect:/empList.go";
		
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
		
		EmpDTO dto = service.emp_detail(detailid);
		String page ="redirect:/empList.go";
		
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
		return service.emp_update(dto);
	}
	
	// 상세에서 삭제
	@GetMapping(value="/empDelete.do")
	public ModelAndView delete(@RequestParam String detailid) {
		
		return service.emp_delete(detailid);
	}
	
	// 목록에서 삭제
	@RequestMapping(value="/hide.ajax")
	@ResponseBody
	public ModelAndView hide(@RequestParam(value="hideList[]") List<String> hideList) {
		logger.info("hide~");
		return service.emp_hide(hideList);
	}
	


}