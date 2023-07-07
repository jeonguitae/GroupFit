package kr.co.gf.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gf.board.dao.LockerDAO;
import kr.co.gf.board.dto.LockerDTO;

@Service
@MapperScan("kr.co.gf.board.dao")
public class LockerService {
	
	@Autowired LockerDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());

	public HashMap<String, Object> loclist(String b_idx) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<LockerDTO> list = dao.loclist(b_idx);
		
		map.put("list", list);
		
		return map;
	}

	public HashMap<String, Object> loc_status(String b_idx, String loc_no, String status) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int row = dao.loc_status(b_idx, loc_no, status);
		
		if(row == 1) {
			
			map.put("alert", "변경 성공!");
		}
		
		else {
			
			map.put("alert", "변경 실패ㅜ");
		}
		
		return map;
	}

	public HashMap<String, Object> loc_no_cng(String b_idx, String loc_no, String mem_no) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String status = dao.loc_status_chk(mem_no);
		
		if(status != null && status.equals("사용중")) {
			
			int chk_loc_no = dao.chk_loc_no(mem_no);
			dao.excng_loc_no(b_idx, chk_loc_no);
		}
		
		int row1 = dao.update_loc_no(loc_no, mem_no);
		int row2 = dao.update_loc_status(b_idx, loc_no);
		
		if(row1 == 1 && row2 ==1) {
			
			map.put("alert", "변경완료!");
		}
		
		else {
			
			map.put("alert", "변경실패ㅜ");
		}
		
		return map;
	}

}
