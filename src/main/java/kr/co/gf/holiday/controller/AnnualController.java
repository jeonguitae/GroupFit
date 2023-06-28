package kr.co.gf.holiday.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gf.holiday.service.AnnualService;

@RestController
public class AnnualController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AnnualService service;
	
	@GetMapping(value="/annualList.go")
	public ModelAndView ticketList() {
		
		ModelAndView mav = new ModelAndView("annualList");
		mav.addObject("annualList", service.annualList());
		return mav;
	}
	
	@PostMapping(value = "/annual.add")
	public HashMap<String, Object> annualAdd(
			@RequestParam(value="addList[]") ArrayList<String> addList,
			String annualType, String annualTime){
		// array로 받을 경우 @RequestParam에 value를 반드시 명시해야 함
		logger.info("addList: " + addList);
		return service.annualAdd(addList,annualType,annualTime);
	}

}
 