package kr.co.gf.member.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("dailypt")
public class PtMemberDTO {
	
	private int dailypt_no;
	private String emp_no;
	private int mem_no;
	private String aerobic;
	private String diet;
	private String str;
	private String pt_state;
	private String pt_date;
	private String af_weight;
	private String name;
	
	private int weight_no;
	private String pt_name;
	private String pt_kg;
	private String pt_set;
	
	
	public int getDailypt_no() {
		return dailypt_no;
	}
	public void setDailypt_no(int dailypt_no) {
		this.dailypt_no = dailypt_no;
	}
	public String getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
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
	public String getPt_date() {
		return pt_date;
	}
	public void setPt_date(String pt_date) {
		this.pt_date = pt_date;
	}
	public String getAf_weight() {
		return af_weight;
	}
	public void setAf_weight(String af_weight) {
		this.af_weight = af_weight;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getWeight_no() {
		return weight_no;
	}
	public void setWeight_no(int weight_no) {
		this.weight_no = weight_no;
	}
	public String getPt_name() {
		return pt_name;
	}
	public void setPt_name(String pt_name) {
		this.pt_name = pt_name;
	}
	public String getPt_kg() {
		return pt_kg;
	}
	public void setPt_kg(String pt_kg) {
		this.pt_kg = pt_kg;
	}
	public String getPt_set() {
		return pt_set;
	}
	public void setPt_set(String pt_set) {
		this.pt_set = pt_set;
	}
	
	
	
	
	
	
	
	
	
	
	

}
