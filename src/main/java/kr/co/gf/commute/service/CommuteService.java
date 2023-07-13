package kr.co.gf.commute.service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gf.commute.dao.CommuteDAO;
import kr.co.gf.commute.dto.CommuteDTO;

@Service
@MapperScan(value= {"kr.co.gf.commute.dao"})
public class CommuteService {
	
	@Autowired CommuteDAO cdao;
	Logger logger= LoggerFactory.getLogger(getClass());

	public ArrayList<CommuteDTO> list(String emp_no) {
		return cdao.list(emp_no);
	}

	public int count(String emp_no, LocalDate now) {
		return cdao.count(emp_no,now);
	}

	public int comedo(String emp_no, String b_idx) {
		return cdao.comedo(emp_no,b_idx);
	}

	public CommuteDTO selectAll(String emp_no, LocalDate now) {
		return cdao.selectAll(emp_no,now);
	}

	public int outdo(String emp_no, LocalTime now2, LocalDate day) {
		return cdao.outdo(emp_no,now2, day);
	}

	public CommuteDTO wtime(String emp_no, LocalDate day) {
		return cdao.wtime(emp_no,day);
	}

	/*
	 * public CommuteDTO selectAll(String emp_no, LocalDate previousDay) { return
	 * cdao.selectAll(emp_no, previousDay); }
	 */

}
