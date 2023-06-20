package kr.co.gf.member.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {
	
	int join(HashMap<String, Object> params);

}
