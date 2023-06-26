package kr.co.gf.board.dto;

import org.apache.ibatis.type.Alias;

@Alias("ticket")
public class TicketDTO {
	private int ticket_no;
	private int b_idx;
	private String b_name;
	private String ticket_name;
	private String ticket_type;
	private int ticket_time;
	private int ticket_price;
	
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
	public String getTicket_name() {
		return ticket_name;
	}
	public void setTicket_name(String ticket_name) {
		this.ticket_name = ticket_name;
	}
	public String getTicket_type() {
		return ticket_type;
	}
	public void setTicket_type(String ticket_type) {
		this.ticket_type = ticket_type;
	}
	public int getTicket_time() {
		return ticket_time;
	}
	public void setTicket_time(int ticket_time) {
		this.ticket_time = ticket_time;
	}
	public int getTicket_price() {
		return ticket_price;
	}
	public void setTicket_price(int ticket_price) {
		this.ticket_price = ticket_price;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	
}