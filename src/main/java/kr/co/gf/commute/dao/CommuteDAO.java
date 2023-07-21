package kr.co.gf.commute.dao;

import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.HashMap;

import kr.co.gf.commute.dto.CommuteDTO;

public interface CommuteDAO {

	ArrayList<CommuteDTO> list(String emp_no);

	int count(String emp_no, LocalDate now);

	int comedo(String emp_no, String b_idx);

	CommuteDTO selectAll(String emp_no, LocalDate now);

	int outdo(String emp_no, LocalTime now2, LocalDate day);

	CommuteDTO wtime(String emp_no, LocalDate day);

	String seltype(String emp_no);

	//int selday(String emp_no, Date date);

	String workdate(String emp_no);

	int wtype(String emp_no, LocalDate now, String flag);

	int wtypes(String emp_no, LocalDate now, String flags);

	int cwrite(HashMap<String, String> params);

	ArrayList<CommuteDTO> alllist();

	ArrayList<CommuteDTO> rlist(String b_idx);

	CommuteDTO rdetail(String r_idx, String b_idx);

	int upStatus(String r_idx, String words, String opinion);

	int upWorking(String r_time, String r_date, String emp_no);

	int upOuttime(String r_time, String r_date, String emp_no);

	ArrayList<CommuteDTO> confirmlist();


	ArrayList<CommuteDTO> workingList(HashMap<String, String> params);

	String come_time(HashMap<String, String> params);

	ArrayList<String> w_type(String emp_no, String b_idx);

	ArrayList<String> emp_name_list(String b_idx);

	String s_emp_no(String name, String b_idx);


	//CommuteDTO selectAll(String emp_no, LocalDate previousDay);

}
