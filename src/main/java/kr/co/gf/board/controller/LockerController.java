package kr.co.gf.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.gf.board.service.MachineService;

@Controller
public class LockerController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MachineService service;
	
	@GetMapping(value="loclist.go")
	public String loclist() {
		
		return "loclist";
	}
}
