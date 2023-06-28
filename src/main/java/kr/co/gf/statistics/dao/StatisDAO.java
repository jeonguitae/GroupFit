package kr.co.gf.statistics.dao;

import java.util.ArrayList;

import kr.co.gf.statistics.dto.StatisDTO;

public interface StatisDAO {

	ArrayList<StatisDTO> totalSales();

	ArrayList<StatisDTO> totalYearSales(String year);

	ArrayList<StatisDTO> branchList();

}
