package kr.co.gf.emp.service;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.gf.emp.dao.EmpDAO;
import kr.co.gf.emp.dto.EmpDTO;

@Service
@MapperScan(value= {"kr.co.gf.emp.dao"})
public class EmpService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired EmpDAO dao;
	
	@Autowired PasswordEncoder encoder;

	public void tempJoin(EmpDTO dto) {
		logger.info("ID:"+dto.getEmp_no());
		logger.info("PW:"+dto.getPw());
		
		String encpass = encoder.encode(dto.getPw());
		
		dto.setPw(encpass);
		
		int row = dao.tempJoin(dto);
	}

}
