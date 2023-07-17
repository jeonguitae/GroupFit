package kr.co.gf.statistics.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gf.statistics.dao.StatisDAO;
import kr.co.gf.statistics.dto.StatisDTO;

@Service
@MapperScan({"kr.co.gf.statistics.dao"})
public class StatisService {
	
	@Autowired StatisDAO dao;

	public ArrayList<StatisDTO> totalSales() {
		return dao.totalSales();
	}

	public ArrayList<StatisDTO> totalYearSales(String year) {
		return dao.totalYearSales(year);
	}

	public ArrayList<StatisDTO> branchList() {
		return dao.branchList();
	}

	public ArrayList<StatisDTO> branchTotalSales(String branchYear, String branch) {
		return dao.branchTotalSales(branchYear,branch);
	}

	public ArrayList<StatisDTO> empList() {
		return dao.empList();
	}

	public ArrayList<StatisDTO> branchEmpList(String branch) {
		return dao.branchEmpList(branch);
	}

	public ArrayList<StatisDTO> individual(String emp_no, String year) {
		return dao.individual(emp_no,year);
	}

	public ArrayList<StatisDTO> branchPersonal(String formattedDate, String b_idx, String position) {
		return dao.branchPersonal(formattedDate,b_idx,position);
	}

	public ArrayList<StatisDTO> memberAdmission(HashMap<String, String> params) {
		return dao.memberAdmission(params);
	}

	public ArrayList<StatisDTO> countMember(HashMap<String, String> params) {
		return dao.countMember(params);
	}

	public String brachName(String b_idx) {
		return dao.branchName(b_idx);
	}

	

}
