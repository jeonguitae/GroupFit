package kr.co.gf.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.gf.board.service.MachineService;


@Controller
public class MachineController {
	
	@Autowired MachineService service;
	
	@GetMapping(value="maclist.go")
	public String loclist() {
		
		return "maclist";
	}
}
