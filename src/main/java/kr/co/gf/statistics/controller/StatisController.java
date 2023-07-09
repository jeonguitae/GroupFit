package kr.co.gf.statistics.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.gf.emp.dto.EmpDTO;
import kr.co.gf.statistics.dto.StatisDTO;
import kr.co.gf.statistics.service.StatisService;

@Controller
public class StatisController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired StatisService service;
	
	
	@RequestMapping(value = "/chart")
	public String chart(Model model) {
		ArrayList<StatisDTO> list = new ArrayList<StatisDTO>();
		list = service.branchList();
		model.addAttribute("list",list);

		return "chart";
	}
	
	@RequestMapping(value="/totalSales.ajax")
	@ResponseBody
	public HashMap<String, Object> totalSales(@RequestParam String year){
		logger.info("출력할 연도"+year);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<StatisDTO> list = new ArrayList<StatisDTO>();
		list=service.totalYearSales(year);
		map.put("list",list);
		return map;
	}
	
	@RequestMapping(value="/branchTotalSales.ajax")
	@ResponseBody
	public HashMap<String, Object> branchTotalSales(@RequestParam String branchYear,@RequestParam String branch){
		logger.info("지점별 출력할 연도"+branchYear);
		logger.info("지점 번호"+branch);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<StatisDTO> list = new ArrayList<StatisDTO>();
		list = service.branchTotalSales(branchYear,branch);
		map.put("list", list);
		return map;
	}
	
	@RequestMapping(value="/branchChart")
	public String branchChart() {
		return "branchChart";
	}
	
	@RequestMapping(value="/branchSales.ajax")
	@ResponseBody
	public HashMap<String, Object> branchSales(@RequestParam String year,@RequestParam String b_idx){
		logger.info("지점별 출력할 연도"+year);
		logger.info("지점 번호"+b_idx);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<StatisDTO> list = new ArrayList<StatisDTO>();
		list=service.branchTotalSales(year,b_idx);
		map.put("list", list);
		return map;
	}
	
	@RequestMapping(value="/individualChart")
	public String individualChart(Model model) {
		ArrayList<StatisDTO> list = new ArrayList<StatisDTO>();
		list = service.empList();
		model.addAttribute("empList",list);
		list = service.branchList();
		model.addAttribute("branchList",list);
		return "individualChart";
	}
	
	@RequestMapping(value="/empList.ajax")
	@ResponseBody
	public HashMap<String, Object> empList(@RequestParam String branch) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<StatisDTO> list = new ArrayList<StatisDTO>();
		if(branch.equals("all")) {
			list=service.empList();
		}else {
			list = service.branchEmpList(branch);
		}
		map.put("empList", list);
		
		
		return map;
	}
	
	@RequestMapping(value="/individual.ajax")
	@ResponseBody
	public HashMap<String,Object> individual(@RequestParam String emp_no,@RequestParam String year){
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<StatisDTO> list = new ArrayList<StatisDTO>();
		logger.info("표시할 연도 + 표시할 사원"+emp_no+year);
		list = service.individual(emp_no,year);
		map.put("individual", list);
		return map;
	}
	
	@RequestMapping(value="/branchIndividualChart")
	public String branchIndividualChart(Model model,HttpSession session) {
		ArrayList<StatisDTO> list = new ArrayList<StatisDTO>();
		EmpDTO empDTO = (EmpDTO) session.getAttribute("loginEmp");
		String b_idx = empDTO.getB_idx();
		logger.info("지점 번호 :"+b_idx);
	    list = service.branchEmpList(b_idx);
	    model.addAttribute("empList",list);
		return "branchIndividualChart";
	}
	
	
	

}
