package kr.co.gf.login.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gf.emp.dto.EmpDTO;

@Mapper
public interface LoginDAO {

	String login(String id);

	EmpDTO getEmp(String id);

}
