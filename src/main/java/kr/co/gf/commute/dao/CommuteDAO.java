package kr.co.gf.commute.dao;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;

import kr.co.gf.commute.dto.CommuteDTO;

public interface CommuteDAO {

	ArrayList<CommuteDTO> list(String emp_no);

	int count(String emp_no, LocalDate now);

	int comedo(String emp_no, String b_idx);

	CommuteDTO selectAll(String emp_no, LocalDate now);

	int outdo(String emp_no, LocalTime now2, LocalDate day);

	CommuteDTO wtime(String emp_no, LocalDate day);

	//CommuteDTO selectAll(String emp_no, LocalDate previousDay);

}
