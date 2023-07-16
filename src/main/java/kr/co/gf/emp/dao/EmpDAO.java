package kr.co.gf.emp.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gf.emp.dto.EmpDTO;
@Mapper
public interface EmpDAO {
	
	int tempJoin(EmpDTO dto);
	
	String pwhash(String pw);
	
	ArrayList<EmpDTO> emp_listDo(HashMap<String, String> params);
	
	ArrayList<EmpDTO> empRep_listDo(HashMap<String, String> params);
	
	ArrayList<EmpDTO> empRep_retireListDo(HashMap<String, String> params);
	
	ArrayList<EmpDTO> emp_list();
	
	ArrayList<EmpDTO> emp_retirelist();
	
	int emp_join(EmpDTO dto);
	
	String getEmpNo();
	
	void emp_fileWrite(int c_idx, String ori_photo_name, String new_photo_name, String emp_no);

	EmpDTO emp_detail(String detailid);
	
	String emp_photo(String detailid);

	int emp_update(HashMap<String, Object> params);
	
	void emp_removePhoto(String emp_no);

	int emp_delete(String detailid);

	void emp_hide(List<String> hideList);

	int emp_idChk(String emp_no);

	String emp_position(String loginId);

	


}