package kr.co.gf.board.dto;

import java.sql.Date;

public class NoticeDTO {

	private String emp_no;
	private String name;
	private String n_idx;
	private String title;
	private String content;
	private Date reg_date;
	private int hit;
	private String fix;
	
	private int c_idx;
	private String c_Content;
	
	private int p_idx;
	private String new_photo_name;
	private String ori_photo_name;	
	private String board_num;
	
	private Date read_date;
	
	private String position;
	
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFix() {
		return fix;
	}

	public void setFix(String fix) {
		this.fix = fix;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}

	public String getN_idx() {
		return n_idx;
	}

	public void setN_idx(String n_idx) {
		this.n_idx = n_idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getC_idx() {
		return c_idx;
	}

	public int setC_idx(int c_idx) {
		return this.c_idx = c_idx;
	}

	public String getC_Content() {
		return c_Content;
	}

	public String setC_Content(String c_Content) {
		return this.c_Content = c_Content;
	}

	public int getP_idx() {
		return p_idx;
	}

	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}

	public String getNew_photo_name() {
		return new_photo_name;
	}

	public void setNew_photo_name(String new_photo_name) {
		this.new_photo_name = new_photo_name;
	}

	public String getOri_photo_name() {
		return ori_photo_name;
	}

	public void setOri_photo_name(String ori_photo_name) {
		this.ori_photo_name = ori_photo_name;
	}

	public String getBoard_num() {
		return board_num;
	}

	public void setBoard_num(String board_num) {
		this.board_num = board_num;
	}

	public Date getRead_date() {
		return read_date;
	}

	public void setRead_date(Date read_date) {
		this.read_date = read_date;
	}

	
}
