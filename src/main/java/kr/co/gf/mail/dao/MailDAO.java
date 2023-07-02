package kr.co.gf.mail.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gf.mail.dto.MailDTO;

@Mapper
public interface MailDAO {

	ArrayList<MailDTO> post_sendList(String send_empno);

	int post_sendWrite(MailDTO dto);

}
