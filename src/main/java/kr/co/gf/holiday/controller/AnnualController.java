package kr.co.gf.holiday.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gf.emp.dto.EmpDTO;
import kr.co.gf.holiday.dto.AnnualDTO;
import kr.co.gf.holiday.service.AnnualService;

@RestController
public class AnnualController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AnnualService service;
	
	@GetMapping(value="/annualList.go")
	public ModelAndView ticketList() {
		ModelAndView mav = new ModelAndView("annualList");
//		if (filter_work_year != null) {
//			mav.addObject("annualList", service.annualList(filter_work_year));
//		} else {
//			mav.addObject("annualList", service.annualList());
//		}
		return mav;
	}
	
	@PostMapping(value="/annualList.filter")
	public HashMap<String, Object> ticketList_filter(int page, int cnt, String sort, String branch, HttpSession session, String filter_work_year) {
		EmpDTO dto = (EmpDTO)session.getAttribute("loginEmp");
		
		logger.info("{}", filter_work_year);
		if(dto.getPosition().equals("대표")) {
			return service.annualList(filter_work_year, page, cnt, sort, branch);
		}
		return service.annualList(filter_work_year, page, cnt, sort, dto.getB_idx());
	}
	
	@PostMapping(value = "/annual.add")
	public HashMap<String, Object> annualAdd(
			@RequestParam(value="addList[]") ArrayList<String> addList,
			String annualType, String annualTime){
		// array로 받을 경우 @RequestParam에 value를 반드시 명시해야 함
		logger.info("addList: " + addList);
		return service.annualAdd(addList,annualType,annualTime);
	}
	
	@PostMapping(value = "/annual.sub")
	public HashMap<String, Object> annualSub(
			@RequestParam(value="subList[]") ArrayList<String> subList,
			String annualType, String annualTime){
		// array로 받을 경우 @RequestParam에 value를 반드시 명시해야 함
		logger.info("addList: " + subList);
		return service.annualSub(subList,annualType,annualTime);
	}
	
	@PostMapping(value = "/annual.detail")
	public HashMap<String, Object> annualDetail(String emp_no, String annual_type){
		logger.info("annual.detail: " + emp_no);
		return service.annualDetail(emp_no, annual_type);
	}
	
}
 