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
	    
	    
	    // 웨이트 일지 빼고 나머지 업데이트
	    int success = dao.dailyptUpdate(dto);
	    
	    // 일지에 몸무게 입력하면 pt_mem 몸무게에 업데이트
	    dao.updateupaf_weight(dto);

	    // 일지 업데이트 성공시
	    if (success == 1) {
	        int dailypt_no = dto.getDailypt_no();
	        logger.info("업데이트 웨이트 일지: " + dailypt_no);
	        
	        // 일지 삭제
	        boolean deleteSuccess = dao.deletedaily_pt(dailypt_no);
	        
	        logger.info("{}",pt_name.size());

	        // 운동 정보 업데이트
	        for (int i = 0; i < pt_name.size(); i++) {
	        	logger.info("{}, {}, {}, {}", i, pt_name.get(i), pt_kg.get(i), pt_set.get(i));
	            String weightname = pt_name.get(i);
	            String Muge = pt_kg.get(i);
	            String Set = pt_set.get(i);
	            //int weightNoValue = weightNoValueList.get(i);
	            
	            // 일지 삭제 성공 시 
	            if (deleteSuccess) {
	                // 웨이트 일지 업데이트 작업 수행
	                dao.insertNewWeight(dailypt_no, weightname, Muge, Set);
	            
	            }
	        }
	        page = "redirect:/dailyPtDetail.do?dailypt_no=" + dailypt_no;
	    }


	    return page;
	}
	
	
	// 삭제 할 때 상태가 결석이면 웨이트 일지가 없기 떄문에 결석 일 경우 추가
	public String dailyptdelete(String dailypt_no, String mem_no) {
		 
		//PtMemberDTO dto = new PtMemberDTO();
		
		
		int success = dao.weightptdelete(dailypt_no);
		
		PtMemberDTO dto = dao.getPtStateByDailyPtNo(dailypt_no);
		
		if(success == 1 || "결석".equals(dto.getPt_state())) {
			dao.dailyptdelete(dailypt_no);
			
			dao.plusptcount(mem_no);
		}
		
		return "redirect:/dailyptt";
	}
	
	

	
	public HashMap<String, Object> ptdailydelete(ArrayList<String> ptdailydel) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		int delSize = ptdailydel.size();
		int successCnt = 0;
		for (String daily_pt : ptdailydel) {
			 
			// 늘어나는 일지 번호를 누적해서 삭제
			successCnt += dao.ptdailydelete(daily_pt);
			//successCnt += dao.wightdelete(daily_pt);
			
			//PtMemberDTO[] dtoArray = new PtMemberDTO[]{dao.getPtStateByDailyPtNo(dailypt_no)};
			
			//PtMemberDTO dto = dao.getPtStateByDailyPtNo2(ptdailydel);
			//successCnt += dao.ptdailydelete(daily_pt);
		}
		map.put("msg","일지"+successCnt+" 개 삭제 했습니다.");
		map.put("success", true);
		
		return map;
	}
	
	
	
	
	

	public HashMap<String, Object> ptmemberSearch(String ptmember, String searchInput) {
		
	
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		        searchInput = "%" + searchInput + "%";
		        logger.info("mem_no");
		        logger.info("searchInput : " + searchInput);
		        
		        
		        
		if (ptmember.equals("member_name")) {
			searchInput = "%" + searchInput + "%";
		} else if (ptmember.equals("emp_nmae")) {
			searchInput = "%" + searchInput + "%";
		}

				
		ArrayList<PtMemberDTO> list = dao.ptmemSearch(ptmember,searchInput);
		
		map.put("ptlist", list);
		
		
		
		return map;

		
}
	

	public ArrayList<MemberDTO> ptlist(String loginId) {
		
		//int b_idx = dao.pt_b_idx(loginId);
		
		return dao.ptlist();
		
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
			int mem_no = dto.getMem_no();
			// 결석 할 때 pt_count -1
			dao.submitcutminus(mem_no);
			
			page = "redirect:/dailyptt";
		}
		
		return page;
	}
	

	/*
	 * // 여기요 여기 public String updatesubmitcut(HashMap<String, String> params,
	 * ArrayList<String> pt_name, ArrayList<String> pt_kg, ArrayList<String> pt_set,
	 * String emp_no) {
	 * 
	 * String page = "";
	 * 
	 * PtMemberDTO dto = new PtMemberDTO();
	 * 
	 * dto.setDailypt_no(Integer.parseInt(params.get("dailypt_no")));
	 * dto.setEmp_no(emp_no); dto.setMem_no(Integer.parseInt(params.get("mem_no")));
	 * dto.setAf_weight(params.get("af_weight"));
	 * dto.setAerobic(params.get("aerobic")); dto.setDiet(params.get("diet"));
	 * dto.setStr(params.get("etc")); dto.setPt_date(params.get("date"));
	 * 
	 * 
	 * 
	 * // 수정 상태에서 결석 처리 하려고 했을 때 일지 삭제 int deletedailypt =
	 * dao.deletedailypt(params);
	 * 
	 * int updatecut = dao.updatesubmitcut(params);
	 * 
	 * page = "redirect:/dailyptt";
	 * 
	 * return page; }
	 * 
	 */

	
	
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