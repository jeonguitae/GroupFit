package kr.co.gf.board.dao;

import java.util.ArrayList;

import kr.co.gf.board.dto.TicketDTO;
import kr.co.gf.emp.dto.EmpDTO;

public interface TicketDAO {

	int ticketRegist(TicketDTO dto);

	ArrayList<TicketDTO> ticketList(int cnt, int offset, String sort, String string);

	int ticketModify(TicketDTO dto);

	int ticketDelete(String id);

	int ticketTotalCount(String string);

	ArrayList<EmpDTO> ticketBranchList();

}
