package kr.co.gf.holiday.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("annual")
public class AnnualDTO {

	private String emp_no;
	private String name;
	private String position;
	private String b_idx;
	private String b_name;
	private Date join_year;
	private long work_year;
	private int annualAdd;
	private int annualSub;
	
	public int getAnnualAdd() {
		return annualAdd;
	}
	public void setAnnualAdd(int annualAdd) {
		this.annualAdd = annualAdd;
	}
	public int getAnnualSub() {
		return annualSub;
	}
	public void setAnnualSub(int annualSub) {
		this.annualSub = annualSub;
	}
	public float getWork_year() {
		return work_year;
	}
	public void setWork_year(long work_year) {
		this.work_year = work_year;
	}
	public String getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public Date getJoin_year() {
		return join_year;
	}
	public void setJoin_year(Date join_year) {
		this.join_year = join_year;
	}
	public String getB_idx() {
		return b_idx;
	}
	public void setB_idx(String b_idx) {
		this.b_idx = b_idx;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
}
