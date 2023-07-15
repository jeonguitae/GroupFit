package kr.co.gf.commute.service;

import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gf.commute.dao.CommuteDAO;
import kr.co.gf.commute.dto.CommuteDTO;

@Service
@MapperScan(value= {"kr.co.gf.commute.dao"})
public class CommuteService {
	
	@Autowired CommuteDAO cdao;
	Logger logger= LoggerFactory.getLogger(getClass());

	public ArrayList<CommuteDTO> list(String emp_no) {
		return cdao.list(emp_no);
	}

	public int count(String emp_no, LocalDate now) {
		return cdao.count(emp_no,now);
	}

	public int comedo(String emp_no, String b_idx) {
		return cdao.comedo(emp_no,b_idx);
	}

	public CommuteDTO selectAll(String emp_no, LocalDate now) {
		return cdao.selectAll(emp_no,now);
	}

	public int outdo(String emp_no, LocalTime now2, LocalDate day) {
		return cdao.outdo(emp_no,now2, day);
	}

	public CommuteDTO wtime(String emp_no, LocalDate day) {
		return cdao.wtime(emp_no,day);
	}

	public String seltype(String emp_no) {
		return cdao.seltype(emp_no);
	}

	/*
	 * public int selday(String emp_no, Date date) { return cdao.selday(emp_no,
	 * date); }
	 */

	public String workdate(String emp_no) {
		return cdao.workdate(emp_no);
	}

	
	public void calculate(String wtime, Time come_time2, Time out_time2, String emp_no, String type, String day, LocalDate now) { 
		
		logger.info("calculate 하기 위한 1번 로거 : wtime/come_time2/out_time2/emp_no/type/day/now은"+wtime+come_time2+out_time2+emp_no+type+day+now); 
		//1.평일 오전
		if(!day.equals("Saturday")&&type.equals("오전")) { 
			logger.info("평일 오전");
			//원래 15,13
			LocalTime out_time = out_time2.toLocalTime();
			LocalTime maxtime = LocalTime.of(17, 0);
			
			LocalTime come_time = come_time2.toLocalTime();
			LocalTime mintime = LocalTime.of(15, 0);
			//13,15
			LocalTime lower = LocalTime.of(17, 0);
			LocalTime upper = LocalTime.of(18, 0);
			
			
			//1번 : 지각 안 한 경우 
			if (mintime.isAfter(come_time)) {
				String flag="출근";
				//퇴근 시간 최대로 설정
				if (out_time.isAfter(maxtime)) {
					out_time = maxtime;
					logger.info("1번 정상 출근"+out_time);
					//1.출근
					int row=cdao.wtype(emp_no,now,flag);
				}//조퇴 내지는 결근
				else {//2. 조퇴
					if (out_time.isAfter(lower) && out_time.isBefore(upper)) {
						flag="조퇴";
						logger.info("2번 조퇴");
						int row=cdao.wtype(emp_no,now,flag);
						
					}//3. 결근
					if (out_time.isBefore(lower)) {
						flag="결근";
						int row=cdao.wtype(emp_no,now,flag);
					}			
				}
			}
			//2번 : 지각 한 경우
			else {
				String flag="지각";
				//1. 지각만 한 경우
				if (out_time.isAfter(maxtime)) {
					int row=cdao.wtype(emp_no,now,flag);
					logger.info("1.지각만 한 경우");
				}else {
					logger.info("지각, 조퇴"+wtime);
					
				}
				
			}//지각한 경우 끝

			
	  }

	  //평일 오후
	    if (!day.equals("Saturday")&&type.equals("오후")) {
			logger.info("평일 오후");
			//원래 15,13
			LocalTime out_time = out_time2.toLocalTime();
			LocalTime maxtime = LocalTime.of(23, 0);
			
			LocalTime come_time = come_time2.toLocalTime();
			LocalTime mintime = LocalTime.of(15, 0);
			//13,15
			LocalTime lower = LocalTime.of(19, 0);
			LocalTime upper = LocalTime.of(23, 0);
			
			
			//1번 : 지각 안 한 경우 
			if (mintime.isAfter(come_time)) {
				String flag="출근";
				//퇴근 시간 최대로 설정
				if (out_time.isAfter(maxtime)) {
					out_time = maxtime;
					logger.info("1번 정상 출근"+out_time);
					//1.출근
					int row=cdao.wtype(emp_no,now,flag);
				}//조퇴 내지는 결근
				else {//2. 조퇴
					if (out_time.isAfter(lower) && out_time.isBefore(upper)) {
						flag="조퇴";
						logger.info("2번 조퇴");
						int row=cdao.wtype(emp_no,now,flag);
						
					}//3. 결근
					if (out_time.isBefore(lower)) {
						flag="결근";
						int row=cdao.wtype(emp_no,now,flag);
					}
					
				}
			}
 	
	  }
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    //주말 오전
	    if (day.equals("Saturday")&&type.equals("오전")) {
	  
	  } //주말 오후
	    if (day.equals("Saturday")&&type.equals("오후")) {
	  
	  }
	  
	  
	  }
	
	
	/*
	 * public CommuteDTO selectAll(String emp_no, LocalDate previousDay) { return
	 * cdao.selectAll(emp_no, previousDay); }
	 */

}
