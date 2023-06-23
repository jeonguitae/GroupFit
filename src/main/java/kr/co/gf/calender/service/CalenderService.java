package kr.co.gf.calender.service;

import java.time.LocalDateTime;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Service;

@Service
@MapperScan("kr.co.gf.calender.dao.CalenderDAO")
public class CalenderService {

	public void addEvent(String eventName, LocalDateTime startDateTime, LocalDateTime endDateTime) {
		// TODO Auto-generated method stub
		
	}

}
