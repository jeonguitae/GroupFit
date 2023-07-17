package kr.co.gf.commute.dto;

import java.sql.Date;
import java.sql.Time;

public class CommuteDTO {

	private String emp_no;
	private int b_idx;
	private Time come_time;
	private Time out_time ;
	private Date work_date ;
	private String gtwork ;
	private String w_time;
	private String w_type;
	
	
	
	
	public String getW_type() {
		return w_type;
	}
	public void setW_type(String w_type) {
		this.w_type = w_type;
	}
	public String getGtwork() {
		return gtwork;
	}
	public void setGtwork(String gtwork) {
		this.gtwork = gtwork;
	}
	public String getW_time() {
		return w_time;
	}
	public void setW_time(String w_time) {
		this.w_time = w_time;
	}
	public String getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	public int getB_idx() {
		return b_idx;
	}
	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}
	public Time getCome_time() {
		return come_time;
	}
	public void setCome_time(Time come_time) {
		this.come_time = come_time;
	}
	public Time getOut_time() {
		return out_time;
	}
	public void setOut_time(Time out_time) {
		this.out_time = out_time;
	}
	public Date getWork_date() {
		return work_date;
	}
	public void setWork_date(Date work_date) {
		this.work_date = work_date;
	}

	
	
}
