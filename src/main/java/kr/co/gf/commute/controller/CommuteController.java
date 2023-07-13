package kr.co.gf.commute.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gf.commute.dto.CommuteDTO;
import kr.co.gf.commute.service.CommuteService;
import kr.co.gf.emp.dto.EmpDTO;

@Controller
public class CommuteController {

	@Autowired
	CommuteService cservice;
	Logger logger = LoggerFactory.getLogger(getClass());
	/*
	 * @RequestMapping(value ="/mymain.do") public String mymain(HttpSession
	 * session, Model model) { EmpDTO eDto = (EmpDTO)
	 * session.getAttribute("loginEmp"); String emp_no = eDto.getEmp_no();
	 * 
	 * model.addAttribute("emp_no",emp_no); String page="redirect:/list.do"; return
	 * page;
	 * 
	 * ModelAndView mav= new ModelAndView("/list.do");
	 * mav.addObject("emp_no",emp_no); return mav;
	 * 
	 * }
	 */

	@RequestMapping(value = "/wlist.do")
	public ModelAndView list(HttpSession session) {
		EmpDTO eDto = (EmpDTO) session.getAttribute("loginEmp");
		String emp_no = eDto.getEmp_no();
		ArrayList<CommuteDTO> working = cservice.list(emp_no);
		ModelAndView mav = new ModelAndView("my_working");
		mav.addObject("working", working);
		return mav;
	}

	/*
	 * @RequestMapping(value = "/out.update") public String outupdate(HttpSession
	 * session) { EmpDTO eDto = (EmpDTO) session.getAttribute("loginEmp"); String
	 * emp_no = eDto.getEmp_no();
	 * 
	 * EmpDTO eDto2 = (EmpDTO) session.getAttribute("loginEmp"); String b_idx =
	 * eDto2.getB_idx();
	 * 
	 * logger.info("out.do icin emp_no" + emp_no); logger.info("out do icin b_idx는"
	 * + b_idx);
	 * 
	 * return null; }
	 */

}
