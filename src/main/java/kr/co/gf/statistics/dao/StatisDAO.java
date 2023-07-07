package kr.co.gf.statistics.dao;

import java.util.ArrayList;

import kr.co.gf.statistics.dto.StatisDTO;

public interface StatisDAO {

	ArrayList<StatisDTO> totalSales();

	ArrayList<StatisDTO> totalYearSales(String year);

	ArrayList<StatisDTO> branchList();

	ArrayList<StatisDTO> branchTotalSales(String branchYear, String branch);

	ArrayList<StatisDTO> empList();

	ArrayList<StatisDTO> branchEmpList(String branch);

	ArrayList<StatisDTO> individual(String emp_no, String year);

}
