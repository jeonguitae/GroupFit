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
	private Date start_conterm;
	private Date end_conterm;
	private String status;
	private Date join_year;
	private String b_idx;
	
	private String b_name;
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	/* 사용 안하기로 함 */
	private int salary;
	private String incentive;
	/* 사용 안하기로 함 */
	
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

	public Date getStart_conterm() {
		return start_conterm;
	}
	public void setStart_conterm(Date start_conterm) {
		this.start_conterm = start_conterm;
	}
	public Date getEnd_conterm() {
		return end_conterm;
	}
	public void setEnd_conterm(Date end_conterm) {
		this.end_conterm = end_conterm;
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
	public String getB_idx() {
		return b_idx;
	}
	public void setB_idx(String b_idx) {
		this.b_idx = b_idx;
	}
	/* 사용 안하기로 함 */
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public String getIncentive() {
		return incentive;
	}
	public void setIncentive(String incentive) {
		this.incentive = incentive;
	}
	/* 사용 안하기로 함 */

	

	
}
