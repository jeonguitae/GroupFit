package kr.co.gf.statistics.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.gf.statistics.dto.StatisDTO;

public interface StatisDAO {

	ArrayList<StatisDTO> totalSales();

	ArrayList<StatisDTO> totalYearSales(String year);

	ArrayList<StatisDTO> branchList();

	ArrayList<StatisDTO> branchTotalSales(String branchYear, String branch);

	ArrayList<StatisDTO> empList();

	ArrayList<StatisDTO> branchEmpList(String branch);

	ArrayList<StatisDTO> individual(String emp_no, String year);

	ArrayList<StatisDTO> branchPersonal(String formattedDate, String b_idx, String position);

	ArrayList<StatisDTO> memberAdmission(HashMap<String, String> params);

	ArrayList<StatisDTO> countMember(HashMap<String, String> params);

	String branchName(String b_idx);

}
