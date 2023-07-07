package kr.co.gf.mail.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gf.mail.dto.MailDTO;

@Mapper
public interface MailDAO {
	
	//보낸 쪽지
	ArrayList<MailDTO> post_sendList(String send_empno);
	
	//받은 쪽지
	ArrayList<MailDTO> post_getList(String get_empno);

	int post_sendWrite(MailDTO dto);

	MailDTO post_sendDetail(String emailid);

	MailDTO post_get(String emailid);

	void post_upHit(String emailid);


	

}
