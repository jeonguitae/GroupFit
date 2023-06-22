package kr.co.gf.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {
	
	@RequestMapping(value="/")
	public String main() {
		return "n_list";
	}
	@GetMapping(value="nlist.go")
	public String nlist() {
		
		return "n_list";
	}


}
