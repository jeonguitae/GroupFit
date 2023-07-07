package kr.co.gf.member.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("dailypt")
public class PtMemberDTO {
	
	private int dailypt;
	private String emp_no;
	private String mem_no;
	private String weight;
	private String aerobic;
	private String diet;
	private String str;
	private String pt_state;
	private Date pt_date;
	private Float af_weight;
	public int getDailypt() {
		return dailypt;
	}
	public void setDailypt(int dailypt) {
		this.dailypt = dailypt;
	}
	public String getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	public String getMem_no() {
		return mem_no;
	}
	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getAerobic() {
		return aerobic;
	}
	public void setAerobic(String aerobic) {
		this.aerobic = aerobic;
	}
	public String getDiet() {
		return diet;
	}
	public void setDiet(String diet) {
		this.diet = diet;
	}
	public String getStr() {
		return str;
	}
	public void setStr(String str) {
		this.str = str;
	}
	public String getPt_state() {
		return pt_state;
	}
	public void setPt_state(String pt_state) {
		this.pt_state = pt_state;
	}
	public Date getPt_date() {
		return pt_date;
	}
	public void setPt_date(Date pt_date) {
		this.pt_date = pt_date;
	}
	public Float getAf_weight() {
		return af_weight;
	}
	public void setAf_weight(Float af_weight) {
		this.af_weight = af_weight;
	}
	
	
	

}
