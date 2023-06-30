package kr.co.gf.board.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import kr.co.gf.board.dto.NoticeDTO;
import kr.co.gf.board.service.NoticeService;
import kr.co.gf.emp.dto.EmpDTO;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class NoticeController {

	@Autowired NoticeService nservice;
	Logger logger =LoggerFactory.getLogger(getClass());

	@GetMapping(value="/nlist.go")
	public String nlist(Model model, HttpSession session) {
		ArrayList<NoticeDTO> dto = nservice.nlist();
		model.addAttribute("list", dto);
		return "n_list";
	}
	
	@GetMapping(value="/nwrite.go")
	public String nwritego() {
		return "n_write";
	}
	
	@PostMapping(value="/nwrite.do")
	public String nwrite(@RequestParam HashMap<String , String>params,MultipartFile photo, HttpSession session) {
		/* logger.info("photo name"+photo.getOriginalFilename()); */
		logger.info("params : " + params);
		String emp_no=params.get("emp_no");
		logger.info("작성자의 emp_no"+emp_no);
		//session.setAttribute("writer", emp_no);
		return nservice.nwrite(params, photo);		
	}
	
	@RequestMapping(value="/ndetail.do") 
	public String ndetail(@RequestParam String n_idx, Model model, String flag , HttpSession session) {
		logger.info("디테일 icin n_idx"+n_idx);
		
		//dto null 해준 이유 :if 문안에서 선언돼서 밖에서 오류나서 
		HashMap<String, String> dto=null;
		
		if (flag.equals("update")) {
			dto=nservice.ndetail(n_idx,"update");
		}else {
			dto=nservice.ndetail(n_idx,"detail");
		}
		//읽은 직원 리스트 insert icin
		
		EmpDTO eDto= (EmpDTO) session.getAttribute("loginEmp"); 
		String emp_no=eDto.getEmp_no();

		logger.info("얻은 emp_no"+emp_no);
		
		ArrayList<NoticeDTO> reader = nservice.rlist(n_idx);
		logger.info("reader"+reader);
		model.addAttribute("reader", reader);
		logger.info("reader서 가져올 emp_no");
		//읽은 직원 insert
		
		//중복방지용
		int row=nservice.rcount(emp_no, n_idx);
		logger.info("row"+row);
		
		if (dto.get("emp_no")!= emp_no && row==0) {
			logger.info("emp_no + n_idx"+emp_no+n_idx);
			nservice.getinfo(emp_no, n_idx);
			
		}

		
		/* 지금 당장 작성하지 않으면 writer null 뜸
		 * if (session.getAttribute("writer").equals(dto.get("emp_no"))) { String
		 * emp_no= dto.get("emp_no"); logger.info("리더 각임"+emp_no);
		 */
			
		/*주석 1- db서 currenttime이 더 편함
		 * long currtime=System.currentTimeMillis(); SimpleDateFormat dateFormat = new
		 * SimpleDateFormat("yyyy-MM-dd"); String readdate=dateFormat.format(currtime);
		 * logger.info(readdate);
		 */
			 
			/*주석 2-null
			 * long readdate=session.getLastAccessedTime();
			 * logger.info("readdate"+readdate);
			 */
			
		
		
			dto.put("n_idx", n_idx);
			model.addAttribute("dto", dto);	
			logger.info("emp_no 갖고 왔어?"+dto);
		return "n_detail";  
	}
	
	@RequestMapping(value="/nupdate.go")
	public String nupdatego(@RequestParam String n_idx, Model model) {
		//디테일->업뎃으로는 idx로 연결해주는데 update(원래값을 바꾸는) 위해서 원래 값 가져와야 하니까 detail 실행
		HashMap<String, String> dto=nservice.ndetail(n_idx, "update");
		logger.info("업뎃하려고 디텔은 함 dto+"+dto);
		dto.put("n_idx", n_idx);
		model.addAttribute("dto", dto);
		//String page="redirect:/nupdate.do?n_idx="+n_idx;
		return "n_update";
	}
	
	@RequestMapping(value="/nupdate.do") 
	public String nupdatedo(@RequestParam HashMap<String, String> params, Model model) { 
		logger.info("업뎃 icin params+ "+params); 
		nservice.nupdate(params);  
		return "redirect:/ndetail.do?n_idx="+params.get("n_idx")+"&flag=update"; 
	}
	 
	 
	
}
	 

