package kr.co.gf.member.service;


import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gf.member.dao.MemberDAO;
import kr.co.gf.member.dto.MemberDTO;


@Service
@MapperScan(value= {"kr.co.gf.member.dao"})
public class MemberService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MemberDAO dao;

	public ArrayList<MemberDTO> memlist() {
		
		return dao.memlist();
	}

	public ArrayList<MemberDTO> branch() {
		
		return dao.branch();
	}

	public ArrayList<MemberDTO> ticket(String b_idx) {
		
		return dao.ticket(b_idx);
	}

	public String emp_name(String loginId) {
		
		return dao.emp_name(loginId);
	}

	public HashMap<String, Object> memjoin(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<>();
		
		int row = dao.memjoin(params);
		String name = params.get("name");
		String phone = params.get("phone");
		
		if(row == 1) {
				
			int mem_no = dao.mem_no(name, phone);
			map.put("mem_no", mem_no);
		}
		map.put("success", row);
		
		return map;
	}

	public HashMap<String, Object> ticjoin(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<>();
		
		String ticket_name = params.get("ticket_name");
		String start_date = params.get("start_date");
		String branch = params.get("branch");
		String mem_no = params.get("mem_no");
		
		String b_idx = dao.b_idx(branch);
		String ticket_no = dao.ticket_no(ticket_name, b_idx);
		params.put("ticket_no", ticket_no);
		params.put("b_idx", b_idx);
		
		String ticket_type = dao.ticket_type(ticket_no, b_idx);
		
		logger.info("ticket_type : " + ticket_type);
		
		int cnt_start_date = dao.cntDate(start_date);
		
		logger.info("cnt_start_date : " + cnt_start_date);
		
		int ticket_time = dao.ticket_time(ticket_name, b_idx);
		int count = dao.ticket_time(ticket_name, b_idx);
		
		if(ticket_type.equals("pt")) {
			
			ticket_time = ticket_time * 7;
		}
		
		int cnt_end_date = cnt_start_date + ticket_time;
		
		String end_date = dao.end_date(cnt_end_date);
		
		logger.info("end_date : " + end_date);
		
		params.put("end_date", end_date);
		
		int row = dao.ticjoin(params);
		
		map.put("success", row);
		map.put("ticket_no", ticket_no);
		map.put("count", count);
		map.put("ticket_type", ticket_type);
		map.put("mem_no", mem_no);
		
		return map;
	}

	public HashMap<String, Object> ptmemjoin(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<>();
		
		int row = dao.ptmemjoin(params);
		
		map.put("success", row);
		return map;
	}

	public HashMap<String, Object> memdelete(ArrayList<String> memdelList) {

		HashMap<String, Object> map = new HashMap<String, Object>();		
		int delSize = memdelList.size();
		int successCnt = 0;
		for (String mem_no : memdelList) {
			successCnt += dao.memdelete(mem_no);
		}		
		map.put("msg", delSize+" 요청중 "+successCnt+" 개 삭제 했습니다.");		
		map.put("success", true);
		return map;
	}

}