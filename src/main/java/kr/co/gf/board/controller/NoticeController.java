package kr.co.gf.board.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@Value("${spring.servlet.multipart.location}") private String root;

	Logger logger = LoggerFactory.getLogger(getClass());

	@GetMapping(value = "/nlist.go")
	public String nlist(Model model, HttpSession session) {
		ArrayList<NoticeDTO> dto = nservice.nlist();
		model.addAttribute("list", dto);
		return "n_list";
	}

	@GetMapping(value = "/nwrite.go")
	public String nwritego() {
		return "n_write";
	}

	@PostMapping(value = "/nwrite.do")
	public String nwrite(@RequestParam HashMap<String, String> params, MultipartFile[] photos) {
		String emp_no = params.get("emp_no");
		logger.info("작성자의 emp_no" + emp_no);
		// session.setAttribute("writer", emp_no);
		return nservice.nwrite(params, photos);
	}

	@RequestMapping(value = "/ndetail.do")
	public String ndetail(@RequestParam String n_idx, Model model, String flag, HttpSession session) {
		logger.info("디테일 icin n_idx" + n_idx);

		// dto null 해준 이유 :if 문안에서 선언돼서 밖에서 오류나서
		HashMap<String, String> dto = null;

		if (flag.equals("update")) {
			dto = nservice.ndetail(n_idx, "update");
		} else {
			dto = nservice.ndetail(n_idx, "detail");
		}
		//사진 list
		ArrayList<NoticeDTO> photos= nservice.pdetail(n_idx);
		model.addAttribute("photos",photos);
		// 읽은 직원 리스트 insert icin

		EmpDTO eDto = (EmpDTO) session.getAttribute("loginEmp");
		String emp_no = eDto.getEmp_no();

		logger.info("얻은 emp_no" + emp_no);

		ArrayList<NoticeDTO> reader = nservice.rlist(n_idx);
		logger.info("reader" + reader);
		model.addAttribute("reader", reader);
		logger.info("reader서 가져올 emp_no");
		// 읽은 직원 insert

		// 중복방지용
		int row = nservice.rcount(emp_no, n_idx);
		logger.info("row" + row);

		logger.info("dto emp_no : " + dto.get("emp_no"));

		if (!dto.get("emp_no").equals(emp_no) && row == 0) {
			logger.info("emp_no + n_idx" + emp_no + n_idx);
			nservice.getinfo(emp_no, n_idx);

		}

		/*
		 * 지금 당장 작성하지 않으면 writer null 뜸 if
		 * (session.getAttribute("writer").equals(dto.get("emp_no"))) { String emp_no=
		 * dto.get("emp_no"); logger.info("리더 각임"+emp_no);
		 */

		/*
		 * 주석 1- db서 currenttime이 더 편함 long currtime=System.currentTimeMillis();
		 * SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); String
		 * readdate=dateFormat.format(currtime); logger.info(readdate);
		 */

		/*
		 * 주석 2-null long readdate=session.getLastAccessedTime();
		 * logger.info("readdate"+readdate);
		 */

		dto.put("n_idx", n_idx);
		model.addAttribute("dto", dto);
		logger.info("emp_no 갖고 왔어?" + dto);
		return "n_detail";
	}

	@RequestMapping(value = "/nupdate.go")
	public String nupdatego(@RequestParam String n_idx, Model model) {
		// 디테일->업뎃으로는 idx로 연결해주는데 update(원래값을 바꾸는) 위해서 원래 값 가져와야 하니까 detail 실행
		HashMap<String, String> dto = nservice.ndetail(n_idx, "update");
		logger.info("업뎃하려고 디텔은 함 dto+" + dto);
		dto.put("n_idx", n_idx);
		model.addAttribute("dto", dto);
		
		ArrayList<NoticeDTO> photos= nservice.pdetail(n_idx);
		if (!photos.isEmpty()) {
			model.addAttribute("photos",photos);
		}
		// String page="redirect:/nupdate.do?n_idx="+n_idx;
		return "n_update";
	}

	@RequestMapping(value = "/nupdate.do")
	public String nupdatedo(@RequestParam HashMap<String, String> params, Model model, MultipartFile[] mphotos) {
		logger.info("업뎃 icin params+ " + params);
		nservice.nupdate(params, mphotos);
		return "redirect:/ndetail.do?n_idx=" + params.get("n_idx") + "&flag=update";
		// 지가 쓴 글만 수정 가능해야함 -대표 지점장 session값 갖고 오고
	}

	@RequestMapping(value = "/ndelete.do")
	public String ndelete(@RequestParam String n_idx, Model model) {
		int row = nservice.ndelete(n_idx);
		logger.info("삭제되었으면 row=" + row);
		model.addAttribute("msg", "글이 삭제되었습니다.");
		String page = "redirect:/nlist.go";
		return page;
	}
	
	@RequestMapping(value="/ndownload.do")
	public ResponseEntity<Resource> download(String path){
		logger.info("download icin path는"+path);
		
		//통상적으로 oriname으로 다운로드함(지가 설정한)+resource객체 생성하고 경로지정
		String newName=nservice.findfile(path);
		Resource body = new FileSystemResource(root+"/"+path);
		HttpHeaders header = new HttpHeaders(); //header
		
		try {
			newName = URLEncoder.encode(newName,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//한글 파일명 깨지지마
		header.add("Content-type", "application/octet-stream");//후자는 바이너리
		header.add("content-Disposition", "attachment;fileName=\""+newName+"\"");//content-Disposition: 내려보낼 내용이 문자열(inline)인지 파일(attatchment)인지 

		
		return new ResponseEntity<Resource>(body, header, HttpStatus.OK);
		
	}
	
	@RequestMapping(value="/pdelete.do")
	public String pdelete(String new_photo_name, String n_idx) {
		nservice.pdelete(new_photo_name);
		String page="redirect:/nupdate.go?n_idx="+n_idx;
		return page;
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
