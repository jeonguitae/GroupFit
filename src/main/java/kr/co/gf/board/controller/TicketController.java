package kr.co.gf.board.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.gf.board.dto.TicketDTO;
import kr.co.gf.board.service.TicketService;
import kr.co.gf.emp.dto.EmpDTO;

@RestController
public class TicketController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired TicketService service;
	
	// default context path로 요청 시 main으로 redirect
	@GetMapping(value="/ticket.go")
	public ModelAndView ticketList() {
		ModelAndView mav = new ModelAndView("ticketList");
		//mav.addObject("ticketList", service.ticketList());
		return mav;
	}
	
	@PostMapping(value = "/ticketList.ajax")
	public HashMap<String, Object> ticketDelete(int page, int cnt, String sort, String branch, HttpSession session){
		// array로 받을 경우 @RequestParam에 value를 반드시 명시해야 함
		EmpDTO dto = (EmpDTO)session.getAttribute("loginEmp");
		
		if(dto.getPosition().equals("대표")) {
			return service.ticketList(page, cnt, sort, branch);
		}
		return service.ticketList(page, cnt, sort, dto.getB_idx());
	}
	
	@PostMapping(value = "/ticketBranchList.ajax")
	public ArrayList<EmpDTO> ticketBranchList(){
		// array로 받을 경우 @RequestParam에 value를 반드시 명시해야 함
		return service.ticketBranchList();
	}
	
	@PostMapping(value = "/ticket.regist")
	public HashMap<String, Object> ticketRegist(int b_idx, String ticket_name, String ticket_type, int ticket_time, int ticket_price) {
		TicketDTO dto = new TicketDTO();
		dto.setB_idx(b_idx);
		dto.setTicket_name(ticket_name);
		dto.setTicket_type(ticket_type);
		dto.setTicket_price(ticket_price);
		dto.setTicket_time(ticket_time);
		int row = service.ticketRegist(dto);
		//String msg = (row == 1) ? "이용권 등록에 성공했습니다." : "이용권 등록에 실패했습니다.";
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(row==1) map.put("success", true);
		return map;
	}
	
	@PostMapping(value = "/ticket.modify")
	public HashMap<String, Object> ticketModify(int ticket_no, int b_idx, String ticket_name, String ticket_type, int ticket_time, int ticket_price) {
		TicketDTO dto = new TicketDTO();
		dto.setTicket_no(ticket_no);
		dto.setB_idx(b_idx);
		dto.setTicket_name(ticket_name);
		dto.setTicket_type(ticket_type);
		dto.setTicket_price(ticket_price);
		dto.setTicket_time(ticket_time);
		int row = service.ticketModify(dto);
		//String msg = (row == 1) ? "이용권 변경에 성공했습니다." : "이용권 변경에 실패했습니다.";
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(row==1) map.put("success", true);
		return map;
	}
	
	@GetMapping(value = "/ticket.delete")
	public HashMap<String, Object> ticketDelete(
			@RequestParam(value="delList[]") ArrayList<String> delList){
		// array로 받을 경우 @RequestParam에 value를 반드시 명시해야 함
		logger.info("delList: " + delList);
		return service.ticketDelete(delList);
	}

}
