package kr.co.gf.holiday.service;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.concurrent.TimeUnit;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gf.holiday.dao.AnnualDAO;
import kr.co.gf.holiday.dto.AnnualDTO;
import kr.co.gf.holiday.dto.AnnualDTO2;

@Service
@MapperScan(value = {"kr.co.gf.holiday.dao"})
public class AnnualService {
	
	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired AnnualDAO dao;

	public ArrayList<AnnualDTO> annualList() {
		Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
		Date currentDate = new Date(currentTimestamp.getTime());
		ArrayList<AnnualDTO> list = dao.annualList();
		for(AnnualDTO dto : list) {
			Date date = dto.getJoin_year();
			long differenceInMillis = currentDate.getTime() - date.getTime();
			long differenceInDays = TimeUnit.MILLISECONDS.toDays(differenceInMillis);
			logger.info("{}", differenceInDays);
			dto.setWork_year(differenceInDays/365);
		}
		
		return dao.annualList();
	}
	
	public ArrayList<AnnualDTO> annualList(String filter_work_year) {
		logger.info("{}", filter_work_year);
		Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
		Date currentDate = new Date(currentTimestamp.getTime());
		ArrayList<AnnualDTO> list = new ArrayList<AnnualDTO>();
		if (filter_work_year.equals("1") || filter_work_year.equals("2")) {
			logger.info("조건 검색 수행");
			list = dao.annualList2(filter_work_year);
		}
		else {
			list = dao.annualList();
		}
		return list;
	}

	public HashMap<String, Object> annualAdd(ArrayList<String> addList, String annualType, String annualTime) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row = 0;
		for(String emp_no : addList) {
			row += dao.annualAdd(emp_no,annualType,annualTime);
		}
		map.put("success", true);
		return map;
	}

	public HashMap<String, Object> annualSub(ArrayList<String> subList, String annualType, String annualTime) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row = 0;
		for(String emp_no : subList) {
			row += dao.annualSub(emp_no,annualType,annualTime);
		}
		map.put("success", true);
		return map;
	}

	public HashMap<String, Object> annualDetail(String emp_no, String annual_type) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, String> annualDetail = dao.annualDetail(emp_no, annual_type);
		ArrayList<AnnualDTO2> annualDetailList = dao.annualDetailList(emp_no, annual_type);
		map.put("annualDetailMap", annualDetail);
		map.put("annualDetailList", annualDetailList);
		return map;
	}

}
