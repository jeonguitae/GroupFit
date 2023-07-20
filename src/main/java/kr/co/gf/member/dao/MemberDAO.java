package kr.co.gf.member.dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gf.board.dto.MachineDTO;
import kr.co.gf.member.dto.MemberDTO;

@Mapper
public interface MemberDAO {
	
	int memjoin(HashMap<String, String> params);

	ArrayList<MemberDTO> memlist(int b_idx);

	ArrayList<MemberDTO> branch();

	ArrayList<MemberDTO> ticket(String b_idx);

	String emp_name(String loginId);

	int mem_no(String name, String phone);
	
// 기본정보 등록
	
	int ticjoin(HashMap<String, String> params);

	String ticket_no(String ticket_name, String b_idx);

	int cntDate(String start_date);

	String end_date(int cnt_end_date);

	int ticket_time(String ticket_name);

	String b_idx(String branch);
	
// 이용권 등록
	
	int ptmemjoin(HashMap<String, String> params);

	int b_name(String loginId);

	int ticket_time(String ticket_name, String b_idx);

	String ticket_type(String ticket_no);

	String ticket_type(String ticket_no, String b_idx);

// pt 정보 등록	
	
	int memdelete(String mem_no);

	MemberDTO memdetail(String mem_no);

	String mem_emp_name(int emp_no);

	String mem_b_name(int b_idx);

	int memprofile(String mem_no, String ori_photo_name, String new_photo_name);

	String photomem(String mem_no);

	ArrayList<MemberDTO> ptmemlist(String loginId);

	ArrayList<MemberDTO> locker(String b_idx);

	int loc_status(String loc_no, String b_idx);

	ArrayList<MemberDTO> memsearch(String sortting, String txt);

	String regt_idx(String mem_no);

	String loc_no(String mem_no);
	
	void locker_update(String loc_num, String b_idx);

	int entermem(String entermem_no);

	String enter_mem_no(String entermem_no);

	int enter_b_idx(String enter_mem_no);

	int entry_mem(String mem_no, int b_idx);

	int entry_chk(String mem_no, LocalDate now);

	ArrayList<MemberDTO> member_cnt(String entermem_no);

	String dup_entermem(String entermem_no, String name);

	int emp_b_idx(String loginId);

	ArrayList<MemberDTO> entermemlist(int b_idx, LocalDate now);

	/* MemberDTO ptmemdetail(String mem_no); */

	void memphotodel(String mem_no);

	String del_new_file_name(String mem_no);

	MemberDTO mem_info(String mem_no);

	MemberDTO ptmem_info(String mem_no);

	/* int memjoin(HashMap<String, String> params); */

}
