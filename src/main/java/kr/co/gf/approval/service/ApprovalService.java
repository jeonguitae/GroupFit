package kr.co.gf.approval.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gf.approval.dao.ApprovalDAO;
import kr.co.gf.approval.dto.ApprovalDTO;
import kr.co.gf.statistics.dto.StatisDTO;

@Service
@MapperScan("kr.co.gf.approval.dao")
public class ApprovalService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ApprovalDAO dao;
	
	@Value("${spring.servlet.multipart.location}") private String root;

	public String loginIdName(String loginId) {
		logger.info(loginId);
		return dao.loginIdName(loginId);
	}

	public String manager() {
		return dao.manager();
	}

	public String top_manager() {
		return dao.top_manager();
	}

	public String position(String loginId) {
		return dao.position(loginId);
	}

	public ModelAndView approvalAllList(String loginId) {
		logger.info("결재 리스트 이동 : " + loginId);
		ModelAndView mav = new ModelAndView("approvalAllList");
		ArrayList<ApprovalDTO> list = dao.approvalAllList(loginId);
		mav.addObject("list", list);
		return mav;
	}
	
	public void vacationRequestWrite(HashMap<String, String> params, MultipartFile[] uploadFiles) {
		String page = "redirect:/approvalAllList.do";
		
		logger.info("params"+params);

		ApprovalDTO dto = new ApprovalDTO();
		
		dto.setEmp_no(params.get("emp_no"));
		dto.setApproval(params.get("approval"));
		dto.setSubject(params.get("subject"));
		dto.setState(params.get("state"));		
		dto.setManager(params.get("manager"));
		dto.setTop_manager(params.get("top_manager"));
		
		int success = dao.vacationRequestWrite(dto);
		
		if(success == 1) {
			dto.setStart_day(params.get("start_day"));
			dto.setFinish_day(params.get("finish_day"));
			dto.setReason(params.get("reason"));
			dto.setEtc(params.get("etc"));
			String a_idx = dto.getBoard_num();
			dto.setA_idx(a_idx);
			logger.info(""+a_idx);
			dao.vacationRequestWriteDown(dto);
		}

	}

	
	
public void upload(MultipartFile uploadFile,String a_idx) {
		
		// 1. 파일명 추출
		String ori_photo_name = uploadFile.getOriginalFilename();
		int c_idx = 7;
		logger.info("board_num"+a_idx);
		
		// 2. 새파일 생성(현재시간 + 확장자)
		String ext = ori_photo_name.substring(ori_photo_name.lastIndexOf("."));
		String new_photo_name = System.currentTimeMillis() + ext;
		logger.info(ori_photo_name+" => "+new_photo_name);
		
		// 3. 파일 저장
		try {
			byte[] bytes = uploadFile.getBytes();
			Path path = Paths.get(root+"/"+new_photo_name);
			Files.write(path, bytes);
			dao.approvalFileWrite(c_idx,ori_photo_name,new_photo_name,a_idx);
		} catch (IOException e) {
			e.printStackTrace();
		}
}

	public ModelAndView approvalSaveList(String loginId) {
		ModelAndView mav = new ModelAndView("approvalSaveList");
		ArrayList<ApprovalDTO> list = dao.approvalSaveList(loginId);
		mav.addObject("list",list);
		return mav;
	}
	
	public String eventRequestWrite(HashMap<String, String> params, MultipartFile[] uploadFiles) {
		String page = "redirect:/approvalAllList.do";
		
		logger.info("params"+params);

		ApprovalDTO dto = new ApprovalDTO();
		
		dto.setEmp_no(params.get("emp_no"));
		dto.setApproval(params.get("approval"));
		dto.setSubject(params.get("subject"));
		dto.setState(params.get("state"));		
		dto.setManager(params.get("manager"));
		dto.setTop_manager(params.get("top_manager"));
		
		dao.eventRequestWrite(dto);
		
	    dto.setStart_day(params.get("start_day"));
	    dto.setFinish_day(params.get("finish_day"));
	    dto.setReason(params.get("reason"));
	    dto.setEtc(params.get("etc"));
	    String a_idx = dto.getBoard_num();
	    dto.setA_idx(a_idx);
	    logger.info("" + a_idx);
	    
	    int row = dao.eventRequestWriteDown(dto);

    	if(row == 1) {
    		for (MultipartFile file : uploadFiles) {
	            logger.info("photo 있으면 false, 없으면 true :" + file.isEmpty());
	            if (!file.isEmpty()) {
	                upload(file, a_idx);
	                try {
	                    Thread.sleep(1);
	                } catch (InterruptedException e) {
	                    e.printStackTrace();
	                }
	            }
	        }
    	}
		return page;
	}

	public String ExpenseReportW(HashMap<String, String> params, MultipartFile[] uploadFiles, ArrayList<String> briefs1, ArrayList<String> price1, ArrayList<String> note1) {
		String page = "redirect:/";
		logger.info("params"+params);
		logger.info("적요 : "+briefs1);
		logger.info("금액 : "+price1);
		logger.info("비고 : "+note1);

		ApprovalDTO dto = new ApprovalDTO();
		
		dto.setEmp_no(params.get("emp_no"));
		dto.setApproval(params.get("approval"));
		dto.setSubject(params.get("subject"));
		dto.setState(params.get("state"));		
		dto.setManager(params.get("manager"));
		dto.setTop_manager(params.get("top_manager"));
		
		int row = dao.ExpenseReportW(dto);
		
		String a_idx = dto.getBoard_num();
		dto.setA_idx(a_idx);
		logger.info(""+a_idx);
		
		for (int i = 0; i < briefs1.size(); i++) {
			
			logger.info(briefs1.get(i));
			logger.info(price1.get(i));
			logger.info(note1.get(i));
			
			String briefs = briefs1.get(i);
			String price = price1.get(i);
			String note = note1.get(i);
			
			dao.expenseReportWDown(a_idx, briefs, price, note);
        }
		
		
		
		if(row == 1) {
			for (MultipartFile file : uploadFiles) {
				logger.info("photo 있으면 false, 없으면 true :"+file.isEmpty());
				if(!file.isEmpty()) {
					upload(file,a_idx);
					try {
						Thread.sleep(1);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				}
			} 
			page = "redirect:/approvalAllList.do";
		}
		return page;
	}

	

	public ModelAndView approvalStayList(String loginId) {
		ModelAndView mav = new ModelAndView("approvalStayList");
		ArrayList<ApprovalDTO> list = dao.approvalStayList(loginId);
		mav.addObject("list",list);
		return mav;
		
	}

	public ModelAndView approvalExpectedList(String loginId) {
		ModelAndView mav = new ModelAndView("approvalExpectedList");
		ArrayList<ApprovalDTO> list = dao.approvalExpectedList(loginId);
		mav.addObject("list",list);
		return mav;
	}
	
	public ArrayList<ApprovalDTO> approvalExpectedListAjax(String loginId) {
		return dao.approvalExpectedList(loginId);
	}

	public void stayAccept(String a_idx, String approval) {
		dao.stayAccept(a_idx,approval);
	}

	public int expectedAccept(String a_idx, String approval) {
		return dao.expectedAccept(a_idx,approval);
		
	}

	public ApprovalDTO expenseDetail(String a_idx, String approval) {
		return dao.expenseDetail(a_idx,approval);
	}
	
	public ApprovalDTO eventDetail(String a_idx, String approval) {
		return dao.eventDetail(a_idx, approval);
	}

	public ArrayList<ApprovalDTO> detailFiles(String a_idx) {
		return dao.detailFiles(a_idx);
	}

	public ArrayList<ApprovalDTO> expenseR(String a_idx) {
		return dao.expenseR(a_idx);
	}

	public String saveRequest(HashMap<String, String> params, MultipartFile[] uploadFiles) {
		
		String page = "redirect:/approvalSaveList.do";
		ApprovalDTO dto = new ApprovalDTO();
		
		dto.setEmp_no(params.get("emp_no"));
		dto.setApproval(params.get("approval"));
		dto.setSubject(params.get("subject"));
		String state = "임시저장";
		dto.setState(state);		
		dto.setManager(params.get("manager"));
		dto.setTop_manager(params.get("top_manager"));
		
		dao.eventRequestWrite(dto);
	    
	    dto.setStart_day(params.get("start_day"));
	    dto.setFinish_day(params.get("finish_day"));
	    dto.setReason(params.get("reason"));
	    dto.setEtc(params.get("etc"));
	    String a_idx = dto.getBoard_num();
	    dto.setA_idx(a_idx);
	    logger.info("" + a_idx);
	    
	    int row = dao.eventRequestWriteDown(dto);

    	if(row == 1) {
    		for (MultipartFile file : uploadFiles) {
	            logger.info("photo 있으면 false, 없으면 true :" + file.isEmpty());
	            if (!file.isEmpty()) {
	                upload(file, a_idx);
	                try {
	                    Thread.sleep(1);
	                } catch (InterruptedException e) {
	                    e.printStackTrace();
	                }
	            }
	        }
    	}
		return page;
	}

	public String eventUpdate(HashMap<String, String> params) {
		ApprovalDTO dto = new ApprovalDTO();
		String a_idx = dto.getBoard_num();
		
		String page = "redirect:/approvalAllList.do";
		
		dto.setA_idx(params.get("a_idx"));
		dto.setEmp_no(params.get("emp_no"));
		dto.setApproval(params.get("approval"));
		dto.setSubject(params.get("subject"));
		dto.setWrite_date(params.get("write_date"));
		dto.setManager(params.get("manager"));
		dto.setTop_manager(params.get("top_manager"));
		
		int row = dao.eventUpdateUp(dto); // payment 테이블 업데이트
		
		if(row == 1) {
			dto.setStart_day(params.get("start_day"));
			dto.setFinish_day(params.get("finish_day"));
			dto.setReason(params.get("reason"));
			dto.setEtc(params.get("etc"));
			dto.setA_idx(params.get("a_idx"));
			logger.info("" + a_idx);
			
			dao.eventUpdateDown(dto); //payment2 테이블 업데이트
			
			//page = "redirect:/eventDetail.do?a_idx?=" +a_idx+ "&approval="+params.get("approval");
		}
	    
	    // 파일해야돼...

		return page;
	}

	public ArrayList<StatisDTO> StayList() {
		return dao.StayList();
	}

}
