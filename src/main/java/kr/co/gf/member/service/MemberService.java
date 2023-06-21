package kr.co.gf.member.service;


import java.util.ArrayList;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gf.member.dao.MemberDAO;
import kr.co.gf.member.dto.MemberDTO;


@Service
@MapperScan(value= {"kr.co.gf.member.dao"})
public class MemberService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MemberDAO dao;

	public ArrayList<MemberDTO> memlist() {
		
		return dao.memlist();
	}
	
	

	

}