package kr.co.gf.emp.dto;

import org.apache.ibatis.type.Alias;

@Alias("emp")
public class EmpDTO {
	private String emp_no;
	private String pw;
	private String name;
	private String gender;
	private String birth;
	private String phone;
	private String email;
	private String position;
	private String job;
	private String branch;
	private String salary;
	private String incentive;
	private String conterm;
	private String quit;
	private String join_year;
	
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
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
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
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
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
		return conterm;
	}
	public void setConterm(String conterm) {
		this.conterm = conterm;
	}
	public String getQuit() {
		return quit;
	}
	public void setQuit(String quit) {
		this.quit = quit;
	}
	public String getJoin_year() {
		return join_year;
	}
	public void setJoin_year(String join_year) {
		this.join_year = join_year;
	}
	
	
}
