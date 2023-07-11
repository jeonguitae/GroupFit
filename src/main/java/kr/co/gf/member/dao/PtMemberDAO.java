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

	ArrayList<PtMemberDTO> weightDetail(String dailypt_no);

	int dailyptUpdate(PtMemberDTO dto);

	//void UpdateWeight(int dailypt_no, String weightname, String muge, String set, int weightNoValue);

	void InsertWeight(int dailypt_no, String weightname, String muge, String set);

	void insertNewWeight(int dailypt_no, String ptName, String ptKg, String ptSet);

	boolean delete(int dailypt_no);

	void dailyptdelete(String dailypt_no);

	int weightptdelete(String dailypt_no);



}
