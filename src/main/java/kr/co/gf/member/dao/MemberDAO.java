package kr.co.gf.member.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gf.member.dto.MemberDTO;

@Mapper
public interface MemberDAO {
	
	int join(HashMap<String, Object> params);

	ArrayList<MemberDTO> memlist();

	ArrayList<MemberDTO> branch();

	ArrayList<MemberDTO> ticket();

	String emp_name(String loginId);

}
