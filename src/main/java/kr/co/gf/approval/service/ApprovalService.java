package kr.co.gf.approval.service;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gf.approval.dao.ApprovalDAO;

@Service
@MapperScan("kr.co.gf.approval.dao")
public class ApprovalService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ApprovalDAO dao;

	public String loginIdName(String loginId) {
		logger.info(loginId);
		return dao.loginIdName(loginId);
	}

	public String manager() {
		return dao.manager();
	}

	public String top_Manager() {
		return dao.top_Manager();
	}

	public String position(String loginId) {
		return dao.position(loginId);
	}

	
	

}
