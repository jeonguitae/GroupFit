package kr.co.gf.statistics.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PopulationController {
	
	@RequestMapping(value = "/chart")
	public String chart() {
		return "chart";
	}
}
