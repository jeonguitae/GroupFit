package kr.co.gf.commute.dao;

import java.util.ArrayList;

import kr.co.gf.commute.dto.CommuteDTO;

public interface CommuteDAO {

	ArrayList<CommuteDTO> list(String emp_no);

}
