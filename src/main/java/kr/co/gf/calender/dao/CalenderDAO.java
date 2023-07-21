package kr.co.gf.calender.dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import kr.co.gf.calender.dto.CalenderDTO;

public interface CalenderDAO {


	void createEvent(CalenderDTO dto);



	List<CalenderDTO> calendarlist();



	void updateEvent(CalenderDTO dto);



	void deletecalendar(CalenderDTO dto);



	List<CalenderDTO> branchCalendarlist(String b_idx);
	
	
	ArrayList<CalenderDTO> branchCalendar(String branchYear, String branch);



	ArrayList<CalenderDTO> CalendarBranchList();



	ArrayList<CalenderDTO> selectedBranch(String b_idx, String branch);



	ArrayList<CalenderDTO> traincalender(LocalDate currentDate);

	


}
