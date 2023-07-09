package kr.co.gf.member.dto;

import java.sql.Date;
import java.sql.Time;

import org.apache.ibatis.type.Alias;

@Alias("member")
public class MemberDTO {
	
	// mem
	private int mem_no;
	private String name;
	private String birth;
	private String gender;
	private String phone;
	private String b_name;
	
	// reg
	private int regt_idx;
	private int ticket_no;
	private int b_idx;
	private String ticket_name;
	private String ticket_time;
	private int ticket_price;
	private String ticket_type;
	private Date purch_date;
	private Date start_date;
	private Date end_date;

	// photo
	private String ori_photo_name;
	private String new_photo_name;
	
	// pt_mem
	private float weight;
	private String goal;
	private String str;
	private int count;
	
	// emp
	private String emp_name;
	private int emp_no;
	
	// locker
	private String loc_num;
	private String status;
	private String loc_no;
	/*
	 * private int loc_no;
	 * 
	 * public int getLoc_no() { return loc_no; } public void setLoc_no(int loc_no) {
	 * this.loc_no = loc_no; }
	 */
	// entry_mem
	private Date enter_date;
	private Time enter_time;
	
	public String getTicket_name() {
		return ticket_name;
	}
	public void setTicket_name(String ticket_name) {
		this.ticket_name = ticket_name;
	}
	public String getTicket_time() {
		return ticket_time;
	}
	public void setTicket_time(String ticket_time) {
		this.ticket_time = ticket_time;
	}
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
	public int getRegt_idx() {
		return regt_idx;
	}
	public void setRegt_idx(int regt_idx) {
		this.regt_idx = regt_idx;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public int getTicket_no() {
		return ticket_no;
	}
	public void setTicket_no(int ticket_no) {
		this.ticket_no = ticket_no;
	}
	public int getB_idx() {
		return b_idx;
	}
	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}
	public Date getPurch_date() {
		return purch_date;
	}
	public void setPurch_date(Date purch_date) {
		this.purch_date = purch_date;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public float getWeight() {
		return weight;
	}
	public void setWeight(float weight) {
		this.weight = weight;
	}
	public String getGoal() {
		return goal;
	}
	public void setGoal(String goal) {
		this.goal = goal;
	}
	public String getStr() {
		return str;
	}
	public void setStr(String str) {
		this.str = str;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public int getTicket_price() {
		return ticket_price;
	}
	public void setTicket_price(int ticket_price) {
		this.ticket_price = ticket_price;
	}
	public String getTicket_type() {
		return ticket_type;
	}
	public void setTicket_type(String ticket_type) {
		this.ticket_type = ticket_type;
	}
	public String getOri_photo_name() {
		return ori_photo_name;
	}
	public void setOri_photo_name(String ori_photo_name) {
		this.ori_photo_name = ori_photo_name;
	}
	public String getNew_photo_name() {
		return new_photo_name;
	}
	public void setNew_photo_name(String new_photo_name) {
		this.new_photo_name = new_photo_name;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
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
	public Date getEnter_date() {
		return enter_date;
	}
	public void setEnter_date(Date enter_date) {
		this.enter_date = enter_date;
	}
	public Time getEnter_time() {
		return enter_time;
	}
	public void setEnter_time(Time enter_time) {
		this.enter_time = enter_time;
	}
	
	public String getLoc_no() {
		return loc_no;
	}
	public void setLoc_no(String loc_no) {
		this.loc_no = loc_no;
	}
	

}
