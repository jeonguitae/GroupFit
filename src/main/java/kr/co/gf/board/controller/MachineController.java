package kr.co.gf.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.gf.board.dto.MachineDTO;
import kr.co.gf.board.service.MachineService;
import kr.co.gf.emp.dto.EmpDTO;


@Controller
public class MachineController {
	
	@Autowired MachineService service;
	
	@GetMapping(value="maclist.go")
	public String loclist(HttpSession session, Model model) {
		
		EmpDTO dto = (EmpDTO) session.getAttribute("loginEmp");
		String b_idx = dto.getB_idx();
		
		ArrayList<MachineDTO> list = service.maclist(b_idx);
		
		model.addAttribute("list", list);
		model.addAttribute("dto", dto);
		
		return "maclist";
	}
}
