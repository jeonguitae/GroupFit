package kr.co.gf.calender.controller;


import java.time.LocalDateTime;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gf.calender.service.CalenderService;

@Controller
public class CalenderController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired CalenderService service;
	
	@RequestMapping(value="/calendar")
		public String calender() {
			
			return "calendar";
		}
	
	  @PostMapping("/calendar/add-event")
	  public String addEvent(@RequestParam("eventName") String eventName,
	                         @RequestParam("startDateTime") LocalDateTime startDateTime,
	                         @RequestParam("endDateTime") LocalDateTime endDateTime) {
	    
	    // 일정 등록
	    service.addEvent(eventName, startDateTime, endDateTime);
	    
	    // 캘린더에 등록하는 로직 (예시로 console에 출력)
	    System.out.println("일정이 캘린더에 등록되었습니다.");
	    System.out.println("이름: " + eventName);
	    System.out.println("시작 시간: " + startDateTime);
	    System.out.println("종료 시간: " + endDateTime);
	    
	    return "redirect:/calendar"; // 캘린더 페이지로 리다이렉트
	  }
	
	

}
