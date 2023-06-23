package kr.co.gf.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.gf.board.dto.TicketDTO;
import kr.co.gf.board.service.TicketService;

@RestController
public class TicketController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired TicketService service;
	
	// default context path로 요청 시 main으로 redirect
	@GetMapping(value="/ticket.go")
	public ModelAndView ticketList() {
		ModelAndView mav = new ModelAndView("ticketList");
		mav.addObject("ticketList", service.ticketList());
		return mav;
	}
	
	@PostMapping(value = "/ticket.regist")
	public ModelAndView ticketRegist(TicketDTO dto, RedirectAttributes rAttr) {
		int row = service.ticketRegist(dto);
		String msg = (row == 1) ? "이용권 등록에 성공했습니다." : "이용권 등록에 실패했습니다.";
		rAttr.addFlashAttribute("msg", msg);
		return new ModelAndView("redirect:/ticket.go");
	}

}
