package kr.co.gf.approval.dao;

import java.util.ArrayList;

import kr.co.gf.approval.dto.ApprovalDTO;

public interface ApprovalDAO {

	String select(String loginId);

	String loginIdName(String loginId);

	String manager();

	String top_manager();

	String position(String loginId);

	ArrayList<ApprovalDTO> approvalAllList(String loginId);

	int eventRequestWrite(ApprovalDTO dto);

	void approvalFileWrite(int c_idx, String ori_photo_name, String new_photo_name, int board_num);

	ArrayList<ApprovalDTO> approvalSaveList(String loginId);

	int ExpenseReportW(ApprovalDTO dto);

	void eventRequestWriteDown(ApprovalDTO dto);

	void expenseReportWDown(int a_idx, String briefs, String price, String note);

	ApprovalDTO eventDetail(String a_idx, String approval);

	ArrayList<ApprovalDTO> expenseR(String a_idx);

	ApprovalDTO expenseReportDetail(String a_idx, String approval);

	ArrayList<String> approvalStayList(String loginId);

	int vacationRequestWrite(ApprovalDTO dto);

	void vacationRequestWriteDown(ApprovalDTO dto);

	



	

	

	

}
