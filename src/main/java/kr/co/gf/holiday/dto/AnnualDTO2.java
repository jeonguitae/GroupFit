package kr.co.gf.holiday.dto;

import java.sql.Date;
import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("annual2")
public class AnnualDTO2 {

	private int annual_no;
	private String emp_no;
	private int annual_modifier;
	private String annual_type;
	private Timestamp annual_date;
	private int annual_time;
	
	public int getAnnual_no() {
		return annual_no;
	}
	public void setAnnual_no(int annual_no) {
		this.annual_no = annual_no;
	}
	public String getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	public int getAnnual_modifier() {
		return annual_modifier;
	}
	public void setAnnual_modifier(int annual_modifier) {
		this.annual_modifier = annual_modifier;
	}
	public String getAnnual_type() {
		return annual_type;
	}
	public void setAnnual_type(String annual_type) {
		this.annual_type = annual_type;
	}
	public Timestamp getAnnual_date() {
		return annual_date;
	}
	public void setAnnual_date(Timestamp annual_date) {
		this.annual_date = annual_date;
	}
	public int getAnnual_time() {
		return annual_time;
	}
	public void setAnnual_time(int annual_time) {
		this.annual_time = annual_time;
	}
}
