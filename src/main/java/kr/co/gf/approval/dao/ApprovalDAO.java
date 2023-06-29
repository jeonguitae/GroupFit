package kr.co.gf.approval.dao;

import java.util.ArrayList;

import kr.co.gf.approval.dto.ApprovalDTO;

public interface ApprovalDAO {

	String select(String loginId);

	String loginIdName(String loginId);

	String manager();

	String top_Manager();

	String position(String loginId);

	ArrayList<ApprovalDTO> approvalList(String loginId);

	void eventRequestWrite(ApprovalDTO dto);

	void approvalFileWrite(int c_idx, String ori_photo_name, String new_photo_name, int board_num);

	

	

}
