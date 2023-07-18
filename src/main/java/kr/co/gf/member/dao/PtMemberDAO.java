package kr.co.gf.member.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import kr.co.gf.member.dto.MemberDTO;
import kr.co.gf.member.dto.PtMemberDTO;


public interface PtMemberDAO {

	//String submitdailypt(HashMap<String, String> params, ArrayList<String> weightName, ArrayList<String> muge, ArrayList<String> set);

	int submitdailypt(PtMemberDTO dto);

	void writeWeight(int dailypt_no, String weightname, String Muge, String Set);

	ArrayList<PtMemberDTO> dailyptlist();

	ArrayList<PtMemberDTO> dailyptwritego(String loginId);

	PtMemberDTO dailyPtDetail(String dailypt_no);

	ArrayList<PtMemberDTO> weightDetail(String dailypt_no);

	int dailyptUpdate(PtMemberDTO dto);

	//void UpdateWeight(int dailypt_no, String weightname, String muge, String set, int weightNoValue);

	void InsertWeight(int dailypt_no, String weightname, String muge, String set);

	void insertNewWeight(int dailypt_no, String ptName, String ptKg, String ptSet);

	boolean deletedaily_pt(int dailypt_no);

    // 웨이트 일지 먼저 삭제
	int weightptdelete(String dailypt_no);



	//int pt_b_idx(String loginId);

	ArrayList<MemberDTO> ptlist();

	ArrayList<PtMemberDTO> ptmemSearch(String ptmember, String searchInput);

	void updateaf_weight(PtMemberDTO dto);

	void updateupaf_weight(PtMemberDTO dto);


	void ptcountUpdate(int mem_no);

	int submitcut(PtMemberDTO dto);

	/* int updatesubmitcut(HashMap<String, String> params); */

	int deletedailypt(HashMap<String, String> params);
	
	// 회원일지 삭제 웨이트 빼고
	void dailyptdelete(String dailypt_no);
	
	// 삭제 시 일지 count +1 해주기
	void plusptcount(String mem_no);

	//ptstate 출석,결석 select해오기
	PtMemberDTO getPtStateByDailyPtNo(String dailypt_no);

	void submitcutminus(int mem_no);
	
	//리스트에서 일지 삭제할 때 
	int ptdailydelete(String daily_pt);





	



}
