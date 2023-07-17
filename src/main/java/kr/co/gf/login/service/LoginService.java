package kr.co.gf.login.service;

import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.gf.emp.dto.EmpDTO;
import kr.co.gf.login.dao.LoginDAO;

@Service
@MapperScan(value = {"kr.co.gf.login.dao"})
public class LoginService {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired LoginDAO dao;
	
	@Autowired PasswordEncoder encoder;

	public boolean login(String id, String pw) {
		boolean success = false;

		// 1. id 를 통해서 해당 암호화된 pw 를 가져온다.
		String enc_pw = dao.login(id);
		// 2. 가져온 평문 pw 와 matches 를 통해 일치 여부를 확인한다.
		if (enc_pw != null && !enc_pw.equals("")) {
			success = encoder.matches(pw, enc_pw);
		}
		
		return success;
	}

	public EmpDTO getEmp(String id) {
		// TODO Auto-generated method stub
		return dao.getEmp(id);
	}


}
