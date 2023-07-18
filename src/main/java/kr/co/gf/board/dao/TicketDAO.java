package kr.co.gf.board.dao;

import java.util.ArrayList;

import kr.co.gf.board.dto.TicketDTO;

public interface TicketDAO {

	int ticketRegist(TicketDTO dto);

	ArrayList<TicketDTO> ticketList(int cnt, int offset);

	int ticketModify(TicketDTO dto);

	int ticketDelete(String id);

	int ticketTotalCount();

}
