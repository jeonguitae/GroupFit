package kr.co.gf.member.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.gf.member.dao.PtMemberDAO;
import kr.co.gf.member.dto.MemberDTO;
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
		dto.setMember_name(params.get("name"));
		dto.setAf_weight(params.get("af_weight"));
		dto.setAerobic(params.get("aerobic"));
		dto.setDiet(params.get("diet"));
		dto.setStr(params.get("etc"));
		dto.setPt_date(params.get("date"));
		
		int success = dao.submitdailypt(dto);
		dao.updateaf_weight(dto);
		
		if(success == 1) {
			int dailypt_no = dto.getDailypt_no();
			logger.info("웨이트 일지 : "+dailypt_no);
			for (int i = 0; i < pt_name.size(); i++) {
				
				logger.info(pt_name.get(i));
				logger.info(pt_kg.get(i));
				logger.info(pt_set.get(i));
				
				String weightname = pt_name.get(i);
				String Muge = pt_kg.get(i);
				String Set = pt_set.get(i);
				
				// params 에서 mem_no 
				
	            dao.writeWeight(dailypt_no, weightname, Muge, Set);
	            int mem_no = dto.getMem_no();
	           dao.ptcountUpdate(mem_no);
	            
	        }
		}
		
		page = "redirect:/dailyptt";
		return page;
	}

	/*
	 * public ArrayList<PtMemberDTO> dailyptlist() {
	 * 
	 * return dao.dailyptlist(); }
	 */

	public ArrayList<PtMemberDTO> dailyptwritego(String loginId) {
		
		return dao.dailyptwritego(loginId);
	}

	public PtMemberDTO dailyPtDetail(String dailypt_no) {
		
		return dao.dailyPtDetail(dailypt_no);
	}

	public ArrayList<PtMemberDTO> weightList(String dailypt_no) {
		
		return dao.weightDetail(dailypt_no);
	}

	
	public String dailyptUpdate(HashMap<String, String> params, ArrayList<String> pt_name, ArrayList<String> pt_kg,
	        ArrayList<String> pt_set, String emp_no, ArrayList<Integer> weightNoValueList) {

	    String page = "";

	    logger.info("update params" + params);
	    logger.info("운동명: " + pt_name);
	    logger.info("무게: " + pt_kg);
	    logger.info("세트 수: " + pt_set);
	    
	    
	    
	    PtMemberDTO dto = new PtMemberDTO();

	    dto.setDailypt_no(Integer.parseInt(params.get("dailypt_no")));
	    dto.setEmp_no(emp_no);
	    dto.setMem_no(Integer.parseInt(params.get("mem_no")));
	    dto.setAf_weight(params.get("af_weight"));
	    dto.setAerobic(params.get("aerobic"));
	    dto.setDiet(params.get("diet"));
	    dto.setStr(params.get("etc"));
	    dto.setPt_date(params.get("date"));
	    
	    

	    int success = dao.dailyptUpdate(dto);
	    dao.updateupaf_weight(dto);

	    if (success == 1) {
	        int dailypt_no = dto.getDailypt_no();
	        logger.info("업데이트 웨이트 일지: " + dailypt_no);
	        
	        boolean deleteSuccess = dao.deletedaily_pt(dailypt_no);
	        
	        logger.info("{}",pt_name.size());

	        // 운동 정보 업데이트
	        for (int i = 0; i < pt_name.size(); i++) {
	        	logger.info("{}, {}, {}, {}", i, pt_name.get(i), pt_kg.get(i), pt_set.get(i));
	            String weightname = pt_name.get(i);
	            String Muge = pt_kg.get(i);
	            String Set = pt_set.get(i);
	            //int weightNoValue = weightNoValueList.get(i);

	            if (deleteSuccess) {
	                // INSERT 작업 수행
	                dao.insertNewWeight(dailypt_no, weightname, Muge, Set);
	            
	            }
	        }
	        page = "redirect:/dailyPtDetail.do?dailypt_no=" + dailypt_no;
	    }


	    return page;
	}
	
	

	public void dailyptdelete(String dailypt_no) {
		int success = dao.weightptdelete(dailypt_no);
		if(success == 1) {
			dao.dailyptdelete(dailypt_no);
		}
		
	}

	public HashMap<String, Object> ptmemberSearch(String ptmember, String searchInput) {
		
	
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		        searchInput = "%" + searchInput + "%";
		        logger.info("mem_no");
		        logger.info("searchInput : " + searchInput);


				
		ArrayList<PtMemberDTO> list = dao.ptmemSearch(ptmember,searchInput);
		
		map.put("ptlist", list);
		
		
		
		return map;

		
}
	

	public ArrayList<MemberDTO> ptlist(String loginId) {
		
		int b_idx = dao.pt_b_idx(loginId);
		
		return dao.ptlist(b_idx);
		
	}

	public String submitcut(HashMap<String, String> params, String emp_no) {
		
		//params.put("pt_state", "결석");
		String page = "";
		
		logger.info("submitcut params : "+params);
		
		 PtMemberDTO dto = new PtMemberDTO();
		
		
		dto.setEmp_no(emp_no);
		dto.setMem_no(Integer.parseInt(params.get("mem_no")));
		dto.setPt_date(params.get("date"));
		dto.setPt_state("결석");
		
		int submitcut =  dao.submitcut(dto);
		
		if (submitcut == 1) {
			page = "redirect:/dailyptt";
		}
		
		return page;
	}

	
	
	/*
	 * public void submitcut(HashMap<String, String> params, ArrayList<String>
	 * pt_name, ArrayList<String> pt_kg, ArrayList<String> pt_set, String emp_no) {
	 * 
	 * PtMemberDTO dto = new PtMemberDTO();
	 * 
	 * dto.setDailypt_no(Integer.parseInt(params.get("dailypt_no")));
	 * dto.setEmp_no(emp_no); dto.setMem_no(Integer.parseInt(params.get("mem_no")));
	 * dto.setPt_date(params.get("date"));
	 * 
	 * dao.submitdailypt(dto);
	 * 
	 * 
	 * 
	 * }
	 */

}