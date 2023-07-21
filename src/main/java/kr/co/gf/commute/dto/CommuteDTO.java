package kr.co.gf.commute.dto;

import java.sql.Date;
import java.sql.Time;

import org.apache.ibatis.type.Alias;

@Alias("commute")
public class CommuteDTO {

	private String emp_no;
	private int b_idx;
	private Time come_time;
	private Time out_time ;
	private Date work_date ;
	private String gtwork ;
	private String w_time;
	private String w_type;
	private int r_idx;
	private String comment;
	private String title;
	private Date r_date;
	private Time r_time;
	private Date reg_date;
	private String status;
	private String com_category;
	private String name;
	private String position;
	private String opinion;
	private String time_difference;
	
	
	public String getOpinion() {
		return opinion;
	}
	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}
	
	public String getTime_difference() {
		return time_difference;
	}
	public void setTime_difference(String time_difference) {
		this.time_difference = time_difference;
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
	public int getR_idx() {
		return r_idx;
	}
	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	public Time getR_time() {
		return r_time;
	}
	public void setR_time(Time r_time) {
		this.r_time = r_time;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCom_category() {
		return com_category;
	}
	public void setCom_category(String com_category) {
		this.com_category = com_category;
	}
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
