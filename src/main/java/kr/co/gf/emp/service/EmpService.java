package kr.co.gf.emp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	 
	// 직원리스트검색
	public ModelAndView emp_listDo(
			HashMap<String, String> params) {
		
		ModelAndView mav = new ModelAndView("empList");
		
		ArrayList<EmpDTO> list 
			= dao.emp_listDo(params);
		
		mav.addObject("list", list);
		return mav;
	}
	
//	public ModelAndView empRep_listDo(ArrayList<String> params) {
//		ModelAndView mav = new ModelAndView("main");
//		ArrayList<EmpDTO> list = dao.empRep_listDo(params);
//		mav.addObject("list", list);
//		return mav;
//	}
	
	// 대표리스트검색
	public ModelAndView empRep_listDo(
			HashMap<String, String> params) {
		
		ModelAndView mav = new ModelAndView("empRepList");
		
		ArrayList<EmpDTO> list 
		= dao.empRep_listDo(params);
		
		mav.addObject("list", list);
		return mav;
	}
	
	public ModelAndView empRep_retireListDo(HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView("retireList");
		
		ArrayList<EmpDTO>list
		= dao.empRep_retireListDo(params);
		
		mav.addObject("list",list);
		return mav;
		
	}
	
	// 직원리스트
	public ArrayList<EmpDTO> emp_list() {
		
		return dao.emp_list();
	}
	
	// 퇴사리스트
	public ArrayList<EmpDTO> emp_retirelist() {
		
		return dao.emp_retirelist();
	}
	 
	public ModelAndView emp_join(EmpDTO dto, RedirectAttributes rAttr) {
		
		String encpass = encoder.encode(dto.getPw());
		dto.setPw(encpass);
		
		int success = dao.emp_join(dto);
		logger.info("success: "+success);
		String msg = "직원등록에 실패 했습니다";
		String page = "loginPage";
		
		if(success > 0) {
			msg="직원등록에 성공 했습니다.";
			page="redirect:/empDetail.do";
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName(page);
		mav.addObject("detailid",dto.getEmp_no());
		rAttr.addFlashAttribute("msg", msg);
		return mav;
		
	}

	public EmpDTO emp_detail(String detailid) {
		
		return dao.emp_detail(detailid);
	}

	
	public ModelAndView emp_update(EmpDTO dto) {
		int success = dao.emp_update(dto);
		logger.info("success: "+success);
		String msg = "직원수정에 실패 했습니다";
		String page = "empUpdate";
		EmpDTO emp = null;
		
		if(success > 0) {
			msg="직원수정에 성공 했습니다.";
			page="empDetail";
			emp = dao.emp_detail(dto.getEmp_no());
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName(page);
		mav.addObject("emp",emp);
		mav.addObject("msg",msg);
		
		return mav;
	}
	
	// 상세에서 삭제
	public ModelAndView emp_delete(String detailid) {
		
		int success = dao.emp_delete(detailid);
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

	// 목록에서 삭제
	public ModelAndView emp_hide(List<String> hideList) {
		logger.info("hideservice");
		dao.emp_hide(hideList);
		String page = "redirect:/empList.go";
		ModelAndView mav = new ModelAndView();
		mav.setViewName(page);
		return mav;
	}







}