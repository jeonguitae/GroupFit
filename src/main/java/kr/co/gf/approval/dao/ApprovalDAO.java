package kr.co.gf.approval.dao;

public interface ApprovalDAO {

	String select(String loginId);

	String loginIdName(String loginId);

	String manager();

	String top_Manager();

	String position(String loginId);

	

	

}
