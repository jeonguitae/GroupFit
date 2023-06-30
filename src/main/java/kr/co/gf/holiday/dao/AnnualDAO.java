package kr.co.gf.holiday.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gf.holiday.dto.AnnualDTO;

public interface AnnualDAO {

	ArrayList<AnnualDTO> annualList();

	int annualAdd(String emp_no, String annualType, String annualTime);

}
