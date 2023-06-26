package kr.co.gf.emp.service;

import java.util.ArrayList;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gf.emp.dao.EmpDAO;
import kr.co.gf.emp.dto.EmpDTO;

@Service
@MapperScan(value = { "kr.co.gf.emp.dao" })
public class EmpService {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	EmpDAO dao;

	@Autowired
	PasswordEncoder encoder;

	
	 public void tempJoin(EmpDTO dto) { 
	 logger.info("ID:"+dto.getEmp_no());
	 logger.info("PW:"+dto.getPw());
	 
	 String encpass = encoder.encode(dto.getPw());
	 
	 dto.setPw(encpass);
	 
	 int row = dao.tempJoin(dto);
	 
	 }
	 

	public ModelAndView join(EmpDTO dto) {
		
		String encpass = encoder.encode(dto.getPw());
		dto.setPw(encpass);
		
		int success = dao.join(dto);
		logger.info("success: "+success);
		String msg = "직원등록에 실패 했습니다";
		String page = "loginPage";
		
		if(success > 0) {
			msg="직원등록에 성공 했습니다.";
			page="redirect:/empDetail.do";
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName(page);
		mav.addObject("msg",msg);
		mav.addObject("detailid",dto.getEmp_no());
		return mav;
		
	}


	public ArrayList<EmpDTO> list() {
		
		return dao.list();
	}


	public EmpDTO detail(String detailid) {
		
		return dao.detail(detailid);
	}

	
	public ModelAndView update(EmpDTO dto) {
		int success = dao.update(dto);
		logger.info("success: "+success);
		String msg = "직원수정에 실패 했습니다";
		String page = "empUpdate";
		EmpDTO emp = null;
		
		
		if(success > 0) {
			msg="직원수정에 성공 했습니다.";
			page="empDetail";
			emp = dao.detail(dto.getEmp_no());
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName(page);
		mav.addObject("emp",emp);
		mav.addObject("msg",msg);
		
		return mav;
	}


	public ModelAndView delete(String detailid) {
		
		int success = dao.delete(detailid);
		logger.info("success: "+success);
		String msg = "직원삭제에 실패 했습니다";
		String page = "empUpdate";
		
		if(success > 0) {
			msg = "직원삭제에 성공 했습니다.";
			page = "redirect:/empList.go";
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName(page);
		mav.addObject("msg",msg);
		
		return mav;
	}

}
