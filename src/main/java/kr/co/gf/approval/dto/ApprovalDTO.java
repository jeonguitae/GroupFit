package kr.co.gf.approval.dto;

import java.sql.Date;

public class ApprovalDTO {

	private int a_idx;
	private String approval;
	private String subject;
	private int emp_no;
	private Date write_date;
	private String state;
	private String manager;
	private String top_manager;
	private int e_idx;
	private String briefs;
	private int price;
	private String note;
	private Date start_day;
	private Date finish_day;
	private String reason;
	private String content;
	private String etc;
	private String vacation_type;
	private int board_num;
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public int getA_idx() {
		return a_idx;
	}
	public void setA_idx(int a_idx) {
		this.a_idx = a_idx;
	}
	public String getApproval() {
		return approval;
	}
	public void setApproval(String approval) {
		this.approval = approval;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public String getTop_manager() {
		return top_manager;
	}
	public void setTop_manager(String top_manager) {
		this.top_manager = top_manager;
	}
	public int getE_idx() {
		return e_idx;
	}
	public void setE_idx(int e_idx) {
		this.e_idx = e_idx;
	}
	public String getBriefs() {
		return briefs;
	}
	public void setBriefs(String briefs) {
		this.briefs = briefs;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public Date getStart_day() {
		return start_day;
	}
	public void setStart_day(Date start_day) {
		this.start_day = start_day;
	}
	public Date getFinish_day() {
		return finish_day;
	}
	public void setFinish_day(Date finish_day) {
		this.finish_day = finish_day;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getVacation_type() {
		return vacation_type;
	}
	public void setVacation_type(String vacation_type) {
		this.vacation_type = vacation_type;
	}
	
	
}
