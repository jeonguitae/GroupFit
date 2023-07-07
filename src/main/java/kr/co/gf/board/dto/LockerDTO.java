package kr.co.gf.board.dto;

import org.apache.ibatis.type.Alias;

@Alias("locker")
public class LockerDTO {

	private int mem_no;
	private String name;
	private String birth;
	private String gender;
	private String phone;
	private String b_name;
	
	private String loc_num;
	private String status;
	private int loc_no;
	
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getLoc_num() {
		return loc_num;
	}
	public void setLoc_num(String loc_num) {
		this.loc_num = loc_num;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getLoc_no() {
		return loc_no;
	}
	public void setLoc_no(int loc_no) {
		this.loc_no = loc_no;
	}
}
