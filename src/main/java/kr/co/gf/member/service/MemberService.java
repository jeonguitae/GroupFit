package kr.co.gf.member.service;


import java.io.File;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gf.board.dto.MachineDTO;
import kr.co.gf.emp.dto.EmpDTO;
import kr.co.gf.member.dao.MemberDAO;
import kr.co.gf.member.dto.MemberDTO;


@Service
@MapperScan(value= {"kr.co.gf.member.dao"})
public class MemberService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MemberDAO dao;

	public ArrayList<MemberDTO> memlist(String loginId) {
		
		int b_idx = dao.emp_b_idx(loginId);
		
		return dao.memlist(b_idx);
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
		
		String name = params.get("name");
		String phone = params.get("phone");
		String loc_no = params.get("loc_no");
		String loc_num = params.get("loc_num");
		String b_idx = params.get("b_idx");
		
		int row = dao.memjoin(params);
		
		if(row == 1) {
			dao.loc_status(loc_no, b_idx);
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
		
		logger.info("params : " + params);
		
		String mem_no = params.get("mem_no");
		
		String regt_idx = dao.regt_idx(mem_no);
		
		params.put("regt_idx", regt_idx);
		int row = dao.ptmemjoin(params);
		
		map.put("success", row);
		return map;
	}

	public HashMap<String, Object> memdelete(ArrayList<String> memdelList, String b_idx) {

		HashMap<String, Object> map = new HashMap<String, Object>();		
		int delSize = memdelList.size();
		int successCnt = 0;
		for (String mem_no : memdelList) {
			String loc_no = dao.loc_no(mem_no);
			logger.info("loc_num : " + loc_no);
			dao.locker_update(loc_no, b_idx);
			successCnt += dao.memdelete(mem_no);
			
			String new_file_name = dao.del_new_file_name(mem_no);
			
			File f = new File("C:/upload/"+ new_file_name);
			if(f.exists()) {
				f.delete();
			}
			
			dao.memphotodel(mem_no);
		}		
		map.put("msg", delSize+" 요청중 "+successCnt+" 개 삭제 했습니다.");		
		map.put("success", true);
		return map;
	}

	public MemberDTO memdetail(String mem_no) {
		
		return dao.memdetail(mem_no);
	}

	public String mem_emp_name(int emp_no) {
		
		return dao.mem_emp_name(emp_no);
	}

	public String mem_b_name(int b_idx) {
		
		return dao.mem_b_name(b_idx);
	}

	public int memprofile(String mem_no, MultipartFile photo) {
		
		int row = 0;
		String ori_photo_name = photo.getOriginalFilename();
		String ext = ori_photo_name.substring(ori_photo_name.lastIndexOf("."));
		String new_photo_name = System.currentTimeMillis()+ext;
		
		logger.info(ori_photo_name+" => "+new_photo_name);
		
		try {
			byte[] bytes = photo.getBytes();//1-4. 바이트 추출
			Path path = Paths.get("C:/upload/"+new_photo_name);
			Files.write(path, bytes);
			logger.info(new_photo_name + "save OK");
			
			row = dao.memprofile(mem_no, ori_photo_name, new_photo_name);
						
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return row;
	}

	public String photomem(String mem_no) {
		
		return dao.photomem(mem_no);
	}

	public HashMap<String, Object> ptmemlist(String loginId) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<MemberDTO> list = dao.ptmemlist(loginId);
		
		map.put("list", list);
		
		return map;
	}

	public ArrayList<MemberDTO> locker(String b_idx) {
		
		return dao.locker(b_idx);
	}

	public HashMap<String, Object> memsearch(String sortting, String txt) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(sortting.equals("name")) {
			
			txt = "%" + txt + "%";
		}
		
		if(sortting.equals("pt_chk")) {
			
			if(txt.equals("O") || txt.equals("o")) {
				
				txt = "pt";			
			}
			
			else if(txt.equals("X") || txt.equals("x")) {
				
				txt = "일반";
			}
		}
		
		ArrayList<MemberDTO> list = dao.memsearch(sortting, txt);
		
		map.put("list", list);
		
		return map;
	}

	public HashMap<String, Object> entermem(String entermem_no) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		entermem_no = "%" + entermem_no;
		
		int row = dao.entermem(entermem_no);
		
		if(row == 1) {
			
			String enter_mem_no = dao.enter_mem_no(entermem_no);
			int enter_b_idx = dao.enter_b_idx(enter_mem_no);
			
			logger.info("enter_mem_no : " + enter_mem_no);
			logger.info("enter_b_idx : " + enter_b_idx);
			
			map.put("mem_no", enter_mem_no);
			map.put("b_idx", enter_b_idx);
		}
		
		if(row > 1) {
			
			ArrayList<MemberDTO> list = dao.member_cnt(entermem_no);
			logger.info("list : " + list);
			
			map.put("list", list);
		}
		
		map.put("row", row);
		

		return map;
	}

	public HashMap<String, Object> entry_mem(String mem_no, int b_idx) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		String msg = "";
		LocalDate now = LocalDate.now();
		
		int entry_chk = dao.entry_chk(mem_no, now);
		
		logger.info("entry_chk : " + entry_chk);
		
		if(entry_chk == 0) {
			
			int row = dao.entry_mem(mem_no, b_idx);
			msg = "입장이 완료되었습니다";
			
			map.put("row", row);
		}
		
		else {
			
			msg = "금일 이미 입장한 회원입니다";
		}
		
		map.put("msg", msg);
		
		return map;
	}

	public HashMap<String, Object> dup_entry_mem(String mem_no, int b_idx, String name) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		String msg = "";
		LocalDate now = LocalDate.now();
		
		int entry_chk = dao.entry_chk(mem_no, now);
		
		logger.info("entry_chk : " + entry_chk);
		
		if(entry_chk == 0) {
			
			int row = dao.entry_mem(mem_no, b_idx);
			msg = "입장이 완료되었습니다";
			
			map.put("row", row);
		}
		
		else {
			
			msg = "금일 이미 입장한 회원입니다";
		}
		
		map.put("msg", msg);
		
		return map;
	}

	public HashMap<String, Object> dup_entermem(String entermem_no, String name) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		entermem_no = "%" + entermem_no;
		
		String dup_enter_mem_no = dao.dup_entermem(entermem_no,name);
		int dup_enter_b_idx = dao.enter_b_idx(dup_enter_mem_no);
		
		String msg = "";
		LocalDate now = LocalDate.now();
		
		int entry_chk = dao.entry_chk(dup_enter_mem_no, now);
		
		if(entry_chk == 0) {
			
			int row = dao.entry_mem(dup_enter_mem_no, dup_enter_b_idx);
			msg = "입장이 완료되었습니다";
			
			map.put("row", row);
		}
		
		else {
			
			msg = "금일 이미 입장한 회원입니다";
		}
		
		map.put("msg", msg);
		
		return map;
	}

	public HashMap<String, Object> entermemlist(String loginId) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		LocalDate now = LocalDate.now();

		int b_idx = dao.emp_b_idx(loginId);
		ArrayList<MemberDTO> list = dao.entermemlist(b_idx, now);
		
		map.put("list", list);
		
		return map;
	}

	/*
	 * public MemberDTO ptmemdetail(String mem_no) {
	 * 
	 * return dao.ptmemdetail(mem_no); }
	 */

	public HashMap<String, Object> mem_info(String mem_no) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		MemberDTO dto = dao.mem_info(mem_no);
		map.put("dto", dto);
		
		return map;
	}

	public HashMap<String, Object> ptmem_info(String mem_no) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		MemberDTO dto = dao.ptmem_info(mem_no);
		map.put("dto", dto);
		
		return map;
	}

}