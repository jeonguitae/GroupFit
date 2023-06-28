package kr.co.gf.holiday.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class AnnualController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@GetMapping(value="/annualList.go")
	public ModelAndView ticketList() {
		ModelAndView mav = new ModelAndView("annualList");
		//mav.addObject("ticketList", service.ticketList());
		return mav;
	}

}
 