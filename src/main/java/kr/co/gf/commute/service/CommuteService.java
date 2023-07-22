package kr.co.gf.commute.service;

import java.io.File;
import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

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

	
	public void calculate(String wtime, Time come_time2, Time out_time2, String emp_no, String type, String day, LocalDate now){ 
		
		logger.info("calculate 하기 위한 1번 로거 : wtime/come_time2/out_time2/emp_no/type/day/now은"+wtime+come_time2+out_time2+emp_no+type+day+now); 
		//1.평일 오전
		if(!day.equals("Saturday")&&type.equals("오전")) { 
			logger.info("평일 오전");
			//원래 15,13
			LocalTime out_time = out_time2.toLocalTime();
			LocalTime maxtime = LocalTime.of(15, 0);
			
			LocalTime come_time = come_time2.toLocalTime();
			LocalTime mintime = LocalTime.of(7, 0);
			//13,15
			LocalTime lower = LocalTime.of(13, 0);
			LocalTime upper = LocalTime.of(15, 0);
			
			
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
				}else {//2. 지각+조퇴 /결근 가능
					logger.info("2.지각, 조퇴"+wtime);
					float w_time = Float.parseFloat(wtime);
					if (w_time>4) {
						logger.info("3.지각 조퇴 다 한 경우임");
						
						String[] array = {"지각","조퇴"};
						String flags = Arrays.toString(array)
								.replaceAll("\\[|\\]", ""); // 대괄호 제거
						logger.info("flags"+flags); // 출력: 1, 2, 3, 4, 5
						
						int row=cdao.wtypes(emp_no, now, flags);
					}else {
						logger.info("4.결근");
						flag="결근";
						int row=cdao.wtype(emp_no,now,flag);
					}
				}
				
			}//지각한 경우 끝

			
	  }

	  //평일 오후
	    if (!day.equals("Saturday")&&type.equals("오후")) {
			//1.평일 오후
			if(!day.equals("Saturday")&&type.equals("오후")) { 
				logger.info("평일 오후");
				//19,23
				LocalTime out_time = out_time2.toLocalTime();
				LocalTime maxtime = LocalTime.of(23, 0);
				
				LocalTime come_time = come_time2.toLocalTime();
				LocalTime mintime = LocalTime.of(15, 0);
				
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
				//2번 : 지각 한 경우
				else {
					String flag="지각";
					//1. 지각만 한 경우
					if (out_time.isAfter(maxtime)) {
						int row=cdao.wtype(emp_no,now,flag);
						logger.info("1.지각만 한 경우");
					}else {//2. 지각+조퇴 /결근 가능
						logger.info("2.지각, 조퇴"+wtime);
						float w_time = Float.parseFloat(wtime);
						if (w_time>4) {
							logger.info("3.지각 조퇴 다 한 경우임");
							
							String[] array = {"지각","조퇴"};
							String flags = Arrays.toString(array)
									.replaceAll("\\[|\\]", ""); // 대괄호 제거
							logger.info("flags"+flags); // 출력: 1, 2, 3, 4, 5
							
							int row=cdao.wtypes(emp_no, now, flags);
						}else {
							logger.info("4.결근");
							flag="결근";
							int row=cdao.wtype(emp_no,now,flag);
						}
					}
					
				}//지각한 경우 끝
 	
	  } 
	    //주말 오전
	    if (day.equals("Saturday")&&type.equals("오전")) {
			//1.주말 오전
			if(day.equals("Saturday")&&type.equals("오전")) { 
				logger.info("주말 오전");
				
				LocalTime out_time = out_time2.toLocalTime();
				LocalTime maxtime = LocalTime.of(14, 0);
				
				LocalTime come_time = come_time2.toLocalTime();
				LocalTime mintime = LocalTime.of(9, 0);
				//13,15
				LocalTime lower = LocalTime.of(12, 0);
				LocalTime upper = LocalTime.of(14, 0);
				
				
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
					}else {//2. 지각+조퇴 /결근 가능
						logger.info("2.지각, 조퇴"+wtime);
						float w_time = Float.parseFloat(wtime);
						if (w_time>3) {
							logger.info("3.지각 조퇴 다 한 경우임");
							
							String[] array = {"지각","조퇴"};
							String flags = Arrays.toString(array)
									.replaceAll("\\[|\\]", ""); // 대괄호 제거
							logger.info("flags"+flags); // 출력: 1, 2, 3, 4, 5
							
							int row=cdao.wtypes(emp_no, now, flags);
						}else {
							logger.info("4.결근");
							flag="결근";
							int row=cdao.wtype(emp_no,now,flag);
						}
					}
					
				}//지각한 경우 끝
	  } 
		//주말 오후
	    if (day.equals("Saturday")&&type.equals("오후")) {
			//1.주말 오후
			if(!day.equals("Saturday")&&type.equals("오후")) { 
				logger.info("주말 오후");
				
				LocalTime out_time = out_time2.toLocalTime();
				LocalTime maxtime = LocalTime.of(19, 0);
				
				LocalTime come_time = come_time2.toLocalTime();
				LocalTime mintime = LocalTime.of(14, 0);
				//13,15
				LocalTime lower = LocalTime.of(17, 0);
				LocalTime upper = LocalTime.of(19, 0);
				
				
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
					}else {//2. 지각+조퇴 /결근 가능
						logger.info("2.지각, 조퇴"+wtime);
						float w_time = Float.parseFloat(wtime);
						if (w_time>3) {
							logger.info("3.지각 조퇴 다 한 경우임");
							
							String[] array = {"지각","조퇴"};
							String flags = Arrays.toString(array)
									.replaceAll("\\[|\\]", ""); // 대괄호 제거
							logger.info("flags"+flags); // 출력: 1, 2, 3, 4, 5
							
							int row=cdao.wtypes(emp_no, now, flags);
						}else {
							logger.info("4.결근");
							flag="결근";
							int row=cdao.wtype(emp_no,now,flag);
						}
					}
					
				}//지각한 경우 끝
	  }
	  
	  
	  }
	
	
	/*
	 * public CommuteDTO selectAll(String emp_no, LocalDate previousDay) { return
	 * cdao.selectAll(emp_no, previousDay); }
	 */

}
}
}

	public int cwrite(HashMap<String, String> params) {
		return cdao.cwrite(params);
	}

	public ArrayList<CommuteDTO> alllist() {
		return cdao.alllist();
	}

	public ArrayList<CommuteDTO> rlist(String b_idx) {
		return cdao.rlist(b_idx);
	}

	public CommuteDTO rdetail(String r_idx, String b_idx) {
		return cdao.rdetail(r_idx, b_idx);
	}

	public int upStatus(String r_idx, String words, String opinion) {
		return cdao.upStatus(r_idx, words , opinion);
		
	}

	public int upWorking(String r_time, String r_date, String emp_no) {
		return cdao.upWorking(r_time, r_date, emp_no);
	}

	public int upOuttime(String r_time, String r_date, String emp_no) {
		return cdao.upOuttime(r_time, r_date, emp_no);
	}

	public ArrayList<CommuteDTO> confirmlist() {
		return cdao.confirmlist();
		
	}
	public ArrayList<CommuteDTO> workingList(HashMap<String, String> params) {
		return cdao.workingList(params);
	}

	public String come_time(HashMap<String, String> params) {
		
		return cdao.come_time(params);
	}
	public HashMap<String, Object> commutelist(String b_idx) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<String> emp_name = cdao.emp_name_list(b_idx);
		
		int i = 0;
		
		for (String name : emp_name) {
			
			i += 1;
			
			logger.info("emp_name" + name);
			
			String emp_no = cdao.s_emp_no(name, b_idx);
			logger.info("emp_no" + emp_no);
			
			ArrayList<String> w_type = cdao.w_type(emp_no, b_idx);
			
			map.put("name"+i, name);
			map.put("w_type"+i, w_type);
		}	
		
		map.put("i", i);
		
		return map;
	}
}

