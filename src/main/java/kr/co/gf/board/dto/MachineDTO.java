package kr.co.gf.board.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("machine")
public class MachineDTO {
	
	private int mac_num;
	private int empno;
	private String mac_name;
	private Date purch_date;
	private Date chk_date;
	private String mac_status;
	private Date fixed_date;
	private String fixed_content;
	
	public Date getChk_date() {
		return chk_date;
	}
	public void setChk_date(Date chk_date) {
		this.chk_date = chk_date;
	}
	public String getMac_status() {
		return mac_status;
	}
	public void setMac_status(String mac_status) {
		this.mac_status = mac_status;
	}
	public Date getFixed_date() {
		return fixed_date;
	}
	public void setFixed_date(Date fixed_date) {
		this.fixed_date = fixed_date;
	}
	public String getFixed_content() {
		return fixed_content;
	}
	public void setFixed_content(String fixed_content) {
		this.fixed_content = fixed_content;
	}
	public int getMac_num() {
		return mac_num;
	}
	public void setMac_num(int mac_num) {
		this.mac_num = mac_num;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getMac_name() {
		return mac_name;
	}
	public void setMac_name(String mac_name) {
		this.mac_name = mac_name;
	}
	public Date getPurch_date() {
		return purch_date;
	}
	public void setPurch_date(Date purch_date) {
		this.purch_date = purch_date;
	}
}
