package kr.co.gf.member.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.gf.member.dto.PtMemberDTO;


public interface PtMemberDAO {

	//String submitdailypt(HashMap<String, String> params, ArrayList<String> weightName, ArrayList<String> muge, ArrayList<String> set);

	int submitdailypt(PtMemberDTO dto);

	void writeWeight(int dailypt_no, String weightname, String Muge, String Set);

	ArrayList<PtMemberDTO> dailyptlist();

	ArrayList<PtMemberDTO> dailyptwritego(String loginId);

	PtMemberDTO dailyPtDetail(String dailypt_no);

	ArrayList<PtMemberDTO> weightList(String dailypt_no);



}
