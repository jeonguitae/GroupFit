package kr.co.gf.member.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gf.member.dto.MemberDTO;

@Mapper
public interface MemberDAO {
	
	int memjoin(HashMap<String, String> params);

	ArrayList<MemberDTO> memlist();

	ArrayList<MemberDTO> branch();

	ArrayList<MemberDTO> ticket(String b_idx);

	String emp_name(String loginId);

	int mem_no(String name, String phone);

	int ticjoin(HashMap<String, String> params);

	String ticket_no(String ticket_name, String b_idx);

	int cntDate(String start_date);

	String end_date(int cnt_end_date);

	int ticket_time(String ticket_name);

	String b_idx(String branch);

	int ptmemjoin(HashMap<String, String> params);

	int b_name(String loginId);

	int ticket_time(String ticket_name, String b_idx);

	String ticket_type(String ticket_no);

	String ticket_type(String ticket_no, String b_idx);

	int memdelete(String mem_no);

	MemberDTO memdetail(String mem_no);

	String mem_emp_name(int emp_no);

	String mem_b_name(int b_idx);

	int memprofile(String mem_no, String ori_photo_name, String new_photo_name);

	String photomem(String mem_no);

	ArrayList<MemberDTO> ptmemlist(String loginId);

	ArrayList<MemberDTO> locker();

	int loc_status(String loc_num);

	/* int memjoin(HashMap<String, String> params); */

}
