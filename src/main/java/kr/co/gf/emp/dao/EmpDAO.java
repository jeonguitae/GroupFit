package kr.co.gf.emp.dao;

import org.apache.ibatis.annotations.Mapper;
import kr.co.gf.emp.dto.EmpDTO;

@Mapper
public interface EmpDAO {
	
	//int tempJoin(EmpDTO dto);
	
	String pwhash(String pw);

	int join(EmpDTO dto);
	
	
}
