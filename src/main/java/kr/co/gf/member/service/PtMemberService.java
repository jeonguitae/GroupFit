package kr.co.gf.member.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gf.member.dao.PtMemberDAO;
import kr.co.gf.member.dto.PtMemberDTO;

@Service
@MapperScan(value={"kr.co.gf.PtMember.dao"})
public class PtMemberService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired PtMemberDAO dao;

	public String submitdailypt(HashMap<String, String> params, ArrayList<String> pt_name, ArrayList<String> pt_kg, ArrayList<String> pt_set, String emp_no) {
		
		String page = "";
		

		logger.info("params"+params);
		logger.info("운동명 : "+pt_name);
		logger.info("무게 : "+pt_kg);
		logger.info("세트 수 : "+pt_set);
		
		
		PtMemberDTO dto = new PtMemberDTO();
		
		dto.setEmp_no(emp_no);
		dto.setMem_no(Integer.parseInt(params.get("mem_no")));
		dto.setName(params.get("name"));
		dto.setAf_weight(params.get("af_weight"));
		dto.setAerobic(params.get("aerobic"));
		dto.setDiet(params.get("diet"));
		dto.setStr(params.get("etc"));
		dto.setPt_date(params.get("date"));
		
		int success = dao.submitdailypt(dto);
		
		if(success == 1) {
			int dailypt_no = dto.getDailypt_no();
			dto.setWeight_no(dailypt_no);
			logger.info("웨이트 일지 : "+dailypt_no);
			for (int i = 0; i < pt_name.size(); i++) {
				
				logger.info(pt_name.get(i));
				logger.info(pt_kg.get(i));
				logger.info(pt_set.get(i));
				
				String weightname = pt_name.get(i);
				String Muge = pt_kg.get(i);
				String Set = pt_set.get(i);
				
	            dao.writeWeight(dailypt_no, weightname, Muge, Set);
	        }
		}
		
		// page = "redirect:/approvalAllList.do";
		return "dailyptForm";
	}

	public ArrayList<PtMemberDTO> dailyptlist() {

		return dao.dailyptlist();
	}
	
}
