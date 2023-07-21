package kr.co.gf.approval.dao;

import java.util.ArrayList;

import kr.co.gf.approval.dto.ApprovalDTO;
import kr.co.gf.statistics.dto.StatisDTO;

public interface ApprovalDAO {

	String select(String loginId);

	String loginIdName(String loginId);

	String manager();

	String top_manager();

	String position(String loginId);

	ArrayList<ApprovalDTO> approvalAllList(String loginId);

	int eventRequestWrite(ApprovalDTO dto);

	void approvalFileWrite(int c_idx, String ori_photo_name, String new_photo_name, String a_idx);

	ArrayList<ApprovalDTO> approvalSaveList(String loginId);

	int ExpenseReportW(ApprovalDTO dto);

	int eventRequestWriteDown(ApprovalDTO dto);

	int expenseReportWDown(String a_idx, String briefs, String price, String note);

	ApprovalDTO eventDetail(String a_idx, String approval);

	ArrayList<ApprovalDTO> expenseR(String a_idx);

	ApprovalDTO expenseReportDetail(String a_idx, String approval);

	ArrayList<ApprovalDTO> approvalStayList(String loginId);

	ArrayList<ApprovalDTO> approvalExpectedList(String loginId);

	void stayAccept(String a_idx, String approval);

	int expectedAccept(String a_idx, String approval);

	ApprovalDTO expenseDetail(String a_idx, String approval);

	ArrayList<ApprovalDTO> detailFiles(String a_idx);

	int vacationRequestWrite(ApprovalDTO dto);

	void vacationRequestWriteDown(ApprovalDTO dto);

	int eventUpdateUp(ApprovalDTO dto);

	void eventUpdateDown(ApprovalDTO dto);

	ArrayList<StatisDTO> StayList();

	



	

	

	

}
