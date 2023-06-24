package kr.co.gf.emp.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import kr.co.gf.emp.dto.EmpDTO;

@Mapper
public interface EmpDAO {
	
	int tempJoin(EmpDTO dto);
	
	String pwhash(String pw);

	int join(EmpDTO dto);

	ArrayList<EmpDTO> list();

	EmpDTO detail(String detailid);

	int update(EmpDTO dto);

	int delete(String detailid);

}