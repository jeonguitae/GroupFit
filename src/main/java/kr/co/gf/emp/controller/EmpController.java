package kr.co.gf.emp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.gf.emp.dao.EmpDAO;
import kr.co.gf.emp.dto.EmpDTO;
import kr.co.gf.emp.service.EmpService;

@RestController
public class EmpController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired EmpService service;
	
	@Autowired PasswordEncoder encoder;
	
	@PostMapping(value="/tempJoin.do")
	public ModelAndView tempJoin(EmpDTO dto) {
		
		logger.info("dto: " + dto.getEmp_no());
		
		service.tempJoin(dto);
		
		return new ModelAndView("loginPage");
	}
	
	// 직원리스트 검색
	@RequestMapping(value="/empList.do")
	public ModelAndView list(
			@RequestParam HashMap<String, String> params) {
		logger.info("params : "+params);
		return service.emp_listDo(params);
	}
	
	// 대표리스트 검색
	@RequestMapping(value="/empRepList.do")
	public ModelAndView RepList(
			@RequestParam HashMap<String, String> params) {
		logger.info("params : "+params);
		return service.empRep_listDo(params);
	}
	
	// 퇴사리스트 검색
	@RequestMapping(value="/empRetireList.do")
	public ModelAndView RetireList(
			@RequestParam HashMap<String, String> params) {
		logger.info("params : "+params);
		return service.empRep_retireListDo(params);
	}
	
	// 직원리스트
	@GetMapping(value="/empList.go")
	public ModelAndView list() {
		ArrayList<EmpDTO> list = service.emp_list();
		
		String page = "empList";
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(page);
		mav.addObject("list",list);
		
		return mav;
	}
	
	// 퇴사리스트
	@GetMapping(value="/empRetire.go")
	public ModelAndView retirelist() {
		ArrayList<EmpDTO> list = service.emp_retirelist();
		
		String page = "retireList";
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(page);
		mav.addObject("list",list);
		
		return mav;
	}
	
	@GetMapping(value="/empJoin.go")
	public ModelAndView join() {
		return new ModelAndView("empJoin");
	}
	
//	@PostMapping(value="/empJoin.do")
//	public String joinDo(@RequestParam HashMap<String, String>params, MultipartFile[] files, 
//								HttpSession session) {
//		logger.info("params값"+params);
//		service.emp_join(params, files, session);
//		return "redirect:/empDetail.do";
//	
//	}
	
	@RequestMapping(value="/empJoin.do")
	public ModelAndView join(@RequestParam HashMap<String, String>params, MultipartFile file,
							 HttpSession session, EmpDTO dto) {
		logger.info("params:"+params);
		return service.emp_join(params, file, session, dto);
	}
	

	@RequestMapping(value="/empDetail.do")
	public ModelAndView detail(@RequestParam String detailid) {
		
		EmpDTO dto = service.emp_detail(detailid);
		String new_photo_name = service.emp_photo(detailid);
		dto.setNew_photo_name(new_photo_name);
		String page ="redirect:/empList.go";
		
		if(dto!=null) {
			page="empDetail";
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName(page);
		mav.addObject("emp",dto);
		
		return mav;
	}
	
	@GetMapping(value="/empUpdate.go")
	public ModelAndView update(@RequestParam String detailid, HttpSession session) {
		
		EmpDTO dto = service.emp_detail(detailid);
		String page ="redirect:/empList.go";
		
		//로그인한 아이디가 작성자 일 때 수정으로 이동, 아니면 리스트로 이동
		if (session.getAttribute("loginId") != null) {
		String loginId = (String) session.getAttribute("loginId");
		if (loginId.equals(detailid)) {
		if (dto != null) {
		    page = "empUpdate";
		        }
		    }
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName(page);
		mav.addObject("emp",dto);
		
		return mav;
	}
	
//	@PostMapping(value="/empUpdate.do")
//	public ModelAndView updateDo(@RequestParam HashMap<String, String>params, MultipartFile file) {
//		return service.emp_update(params,file);
//	}
	
	 @RequestMapping(value="/empUpdate.do")
	   public String updateDo(MultipartFile file,@RequestParam HashMap<String, String> params, HttpSession session, Model model) {
	       logger.info("마이페이지 수정");
	       String page = "redirect:/empUpdate.go";
	       String loginId = null;
	       String emp_no;
	       logger.info("session loginId : " + session.getAttribute("loginId"));
	       if (session.getAttribute("loginId") != null) {
	          logger.info("params : " + params);
	          
	           logger.info("params-emp_no : " + params.get("emp_no"));
	          loginId = (String) session.getAttribute("loginId");
	           
	           if (loginId.equals(params.get("emp_no"))) {
	              logger.info("file : " + file);
	               service.emp_update(file, params);
	               page = "redirect:/empDetail.do";
	           }
	       }
	       return page;
	   }
	
	// 상세에서 삭제
	@GetMapping(value="/empDelete.do")
	public ModelAndView delete(@RequestParam String detailid) {
		
		return service.emp_delete(detailid);
	}
	
	// 목록에서 삭제
	@RequestMapping(value="/hide.ajax")
	@ResponseBody
	public ModelAndView hide(@RequestParam(value="hideList[]") List<String> hideList) {
		logger.info("hide~");
		return service.emp_hide(hideList);
	}
	


}