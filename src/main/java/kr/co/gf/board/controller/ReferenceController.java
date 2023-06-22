package kr.co.gf.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReferenceController {

	@RequestMapping(value="/reference")
	public String reference() {
		return "referenceList";
	}
	
}
