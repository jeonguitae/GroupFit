package kr.co.gf.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class TicketController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	// default context path로 요청 시 main으로 redirect
	@GetMapping(value="/ticket.go")
	public ModelAndView index() {
		return new ModelAndView("ticketList");
	}

}
