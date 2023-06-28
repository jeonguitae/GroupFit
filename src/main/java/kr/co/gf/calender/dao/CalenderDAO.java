package kr.co.gf.calender.dao;

import java.util.List;

import kr.co.gf.calender.dto.CalenderDTO;

public interface CalenderDAO {


	void createEvent(CalenderDTO dto);



	List<CalenderDTO> calendarlist();

	


}
