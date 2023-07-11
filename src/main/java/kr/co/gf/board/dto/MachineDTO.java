package kr.co.gf.board.dto;

import org.apache.ibatis.type.Alias;

@Alias("machine")
public class MachineDTO {
	
	private String mac_num;
	private String emp_no;
	private String mac_name;
	private String purch_date;
	private int b_idx;
	
	private String chk_date;
	private String mac_status;
	
	private String fixed_date;
	private String fixed_content;
	
	private String new_photo_name;
	
	public String getNew_photo_name() {
		return new_photo_name;
	}
	public void setNew_photo_name(String new_photo_name) {
		this.new_photo_name = new_photo_name;
	}
	public String getMac_num() {
		return mac_num;
	}
	public void setMac_num(String mac_num) {
		this.mac_num = mac_num;
	}
	public String getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	public String getMac_name() {
		return mac_name;
	}
	public void setMac_name(String mac_name) {
		this.mac_name = mac_name;
	}
	public String getPurch_date() {
		return purch_date;
	}
	public void setPurch_date(String purch_date) {
		this.purch_date = purch_date;
	}
	public int getB_idx() {
		return b_idx;
	}
	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}
	public String getChk_date() {
		return chk_date;
	}
	public void setChk_date(String chk_date) {
		this.chk_date = chk_date;
	}
	public String getMac_status() {
		return mac_status;
	}
	public void setMac_status(String mac_status) {
		this.mac_status = mac_status;
	}
	public String getFixed_date() {
		return fixed_date;
	}
	public void setFixed_date(String fixed_date) {
		this.fixed_date = fixed_date;
	}
	public String getFixed_content() {
		return fixed_content;
	}
	public void setFixed_content(String fixed_content) {
		this.fixed_content = fixed_content;
	}
	
}
