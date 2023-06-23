package kr.co.gf.emp.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("emp")
public class EmpDTO {
	
	private String emp_no;
	private String pw;
	private String name;
	private String gender;
	private Date birth;
	private String phone;
	private String email;
	private String position;
<<<<<<< HEAD
	private Date conterm;
	private String status;
	private Date join_year;
	private int b_idx;
=======
	private String branch;
	private String salary;
	private String incentive;
	private String conterm;
	private String quit;
	private String join_year;
	private String b_idx;
	private String b_name;
>>>>>>> origin/master
	
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
	public String getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
<<<<<<< HEAD
	public Date getConterm() {
=======
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public String getIncentive() {
		return incentive;
	}
	public void setIncentive(String incentive) {
		this.incentive = incentive;
	}
	public String getConterm() {
>>>>>>> origin/master
		return conterm;
	}
	public void setConterm(Date conterm) {
		this.conterm = conterm;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getJoin_year() {
		return join_year;
	}
	public void setJoin_year(Date join_year) {
		this.join_year = join_year;
	}
	public int getB_idx() {
		return b_idx;
	}
	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}
	

}
