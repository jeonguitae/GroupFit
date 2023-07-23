package kr.co.gf.holiday.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gf.holiday.dto.AnnualDTO;
import kr.co.gf.holiday.dto.AnnualDTO2;

public interface AnnualDAO {

	ArrayList<AnnualDTO> annualList();
	
	ArrayList<AnnualDTO> annualList2(String filter_work_year, int cnt, int offset, String sort, String string);

	int annualAdd(String emp_no, String annualType, String annualTime);
	
	int annualSub(String emp_no, String annualType, String annualTime);

	HashMap<String, String> annualDetail(String emp_no, String annual_type);

	ArrayList<AnnualDTO2> annualDetailList(String emp_no, String annual_type);

	int annualTotalCount(String filter_work_year, String string);

}
