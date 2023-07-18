package kr.co.gf.board.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gf.board.dao.MachineDAO;
import kr.co.gf.board.dto.MachineDTO;

@Service
@MapperScan("kr.co.gf.board.dao")
public class MachineService {
	
	@Autowired MachineDAO dao;
	Logger logger = LoggerFactory.getLogger(getClass());

	public ArrayList<MachineDTO> Smaclist(String b_idx) {
		
		return dao.Smaclist(b_idx);
	}

	public HashMap<String, Object> mac_reg(HashMap<String, String> params) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int row = dao.mac_reg(params);
		if(row == 1) {
			
			map.put("alert", "기구 기본정보 등록이 완료되었습니다. 사진등록을 해주세요");
		}
		
		return map;
	}

	public String mac_num(String mac_name, String b_idx) {
		
		return dao.mac_num(mac_name, b_idx);
	}

	public int mac_photo_reg(String mac_num, MultipartFile photo) {
		
		String ori_photo_name = photo.getOriginalFilename();
		String ext = ori_photo_name.substring(ori_photo_name.lastIndexOf("."));
		String new_photo_name = System.currentTimeMillis()+ext;
		
		byte[] bytes;
		try {
			
			bytes = photo.getBytes();
			Path path = Paths.get("C:/upload/"+new_photo_name);
			Files.write(path, bytes);
			logger.info(new_photo_name + "save OK");
			
		} catch (IOException e) {
	
			e.printStackTrace();
		}//1-4. 바이트 추출
		
		return dao.mac_photo_reg(mac_num, new_photo_name, ori_photo_name);
	}

	public HashMap<String, Object> maclist(String b_idx) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<MachineDTO> list = dao.maclist(b_idx);
		map.put("list", list);
		
		return map;
	}

	public HashMap<String, Object> mac_info(String mac_num) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		MachineDTO dto = dao.mac_info(mac_num);
		map.put("dto", dto);
		
		return map;
	}

	public String macdel(String b_idx, String mac_num) {
		
		String msg = "삭제 실패";
		String new_file_name = dao.mac_new_file_name(mac_num);
		
		int photodel = dao.mac_photo_del(mac_num);
		
		if(photodel == 1) {
			
			int macdel = dao.macdel(b_idx, mac_num);
			
			if(macdel == 1) {
				
				msg = "삭제 성공";
				
				File f = new File("C:/upload/"+ new_file_name);
				if(f.exists()) {
					f.delete();
				}
			}
		}
		
		return msg;
	}

	public HashMap<String, Object> mac_chk(ArrayList<String> chk_mac, String mac_status, String b_idx, String emp_no) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int successCnt = 0;
		for (String mac_num : chk_mac) {
			
			successCnt += dao.mac_status(mac_num, mac_status, b_idx, emp_no);
		}
		
		String msg = successCnt + "개 기구 점검 완료!";
		map.put("msg", msg);
		
		return map;
	}

	public ArrayList<MachineDTO> Fmaclist(String b_idx) {
		
		LocalDate now = LocalDate.now();
		
		return dao.Fmaclist(b_idx, now);
	}

	public HashMap<String, Object> mac_fixed(String emp_no, String mac_name, String fixed_content, String b_idx) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String mac_num = dao.mac_num(mac_name, b_idx);
		int row = dao.mac_fixed(emp_no, mac_num, fixed_content, b_idx);
		
		if(row == 1) {
			
			String msg = "신청이 완료되었습니다!";
			map.put("msg", msg);
		}
		
		return map;
	}

	public HashMap<String, Object> fixedmaclist(String b_idx) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<MachineDTO> list = dao.fixedmaclist(b_idx);
		
		map.put("list", list);
		
		return map;
	}

	public HashMap<String, Object> fix_content(String mac_num) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		MachineDTO dto = dao.fix_content(mac_num);
		map.put("dto", dto);
		
		return map;
	}

	public HashMap<String, Object> mac_status_cng(HashMap<String, String> params) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int row = dao.mac_status_cng(params);
		
		if(row != 0) {
			if(params.get("mac_status").equals("break")) {
				
				map.put("msg", "고장처리 완료!");
			}
			
			else{
				
				map.put("msg", "수리 완료!");
			}
			
			dao.delete_fix_mac(params);
		}
		
		return map;
	}

}
