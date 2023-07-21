package kr.co.gf.mail.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import kr.co.gf.emp.dto.EmpDTO;
import kr.co.gf.mail.dto.MailDTO;

@Mapper
public interface MailDAO {
   
	//보낸쪽지 검색
	ArrayList<MailDTO> post_sendSerch(HashMap<String, String> params);
	
	//받은쪽지 검색
	ArrayList<MailDTO> post_getSerch(HashMap<String, String> params);
	
	//보낸 쪽지
	ArrayList<MailDTO> post_sendList(String send_empno);
	
	//받은 쪽지
	ArrayList<MailDTO> post_getList(String get_empno);
	
	int post_sendWrite(MailDTO dto);
	
	MailDTO post_sendDetail(String emailid);
	
	MailDTO post_GetDetail(String emailid);
	
	MailDTO post_get(String email_num);
	
	void post_upHit(String get_empno, String emailid);
	
	void post_hide(List<String> hideList);
	
	int post_getWrite(HashMap<String, String> params);
	
	ArrayList<EmpDTO> emp_find(String emp_no);
	
	List<HashMap<String, Object>> emp_multi(String get_empno);
	
	ArrayList<EmpDTO> emp_multiList(ArrayList<String> params);

	ArrayList<MailDTO> post_sendWasteList(String send_empno);

	ArrayList<MailDTO> post_getWasteList(String get_empno);

	int unreadMailCount(String emp_no);
}