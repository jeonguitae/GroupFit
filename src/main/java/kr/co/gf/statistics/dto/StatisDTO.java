package kr.co.gf.statistics.dto;

public class StatisDTO {
	
	private String totalSales;
	private String month;
	private String b_idx;
	private String b_name;
	private String name;
	private String emp_no;
	private String personal_totalsales;
	public String getPersonal_totalsales() {
		return personal_totalsales;
	}
	public void setPersonal_totalsales(String personal_totalsales) {
		this.personal_totalsales = personal_totalsales;
	}
	public String getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
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
	public String getTotalSales() {
		return totalSales;
	}
	public void setTotalSales(String totalSales) {
		this.totalSales = totalSales;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	
	
}
