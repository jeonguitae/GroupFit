package kr.co.gf.board.controller;

import java.io.IOException;
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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.gf.board.dto.ReferenceDTO;
import kr.co.gf.board.service.ReferenceService;

@Controller
public class ReferenceController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ReferenceService service;
	@Value("${spring.servlet.multipart.location}") private String root;
	
	// 자료실 리스트 보기
	@RequestMapping(value="/referenceList.do")
	public ModelAndView referenceList(HttpSession session) {
		logger.info("리스트 보여줌");
		if (session.getAttribute("loginId") != null && !session.getAttribute("loginId").equals("")) {
			return service.list() ;
		}
		return new ModelAndView("redirect:/") ;
	}
	
	// 자료실 상세보기
	@RequestMapping(value="/referenceDetail.do")
	public ModelAndView referenceDetail(String idx, HttpSession session, Model model) {
		
		ModelAndView mav = new ModelAndView("referenceDetail");
		
		logger.info("자료실 상세보기 번호 : "+idx);
		
		String loginId = (String)session.getAttribute("loginId");
		if (loginId != null && !loginId.equals("")) {
			
			String loginName = service.selectName(loginId);
			model.addAttribute("loginName",loginName);
			ReferenceDTO dto = service.detail(idx); // 게시글
		
			if(dto != null) {
				ArrayList<ReferenceDTO> list = service.detailFile(idx); //파일찾기
				logger.info("-------------------------------------------------------------------------------------------------------------------------------------------- : "+list);
				mav.addObject("dto",dto); // 게시글 내용
				if(list.isEmpty()) {
					mav.addObject("list",null);
				}else {
					mav.addObject("list",list);
				}
			}
			return mav;
		}
			return new ModelAndView("redirect:/");
	}
	
	// 자료실 글작성 페이지 이동
	@RequestMapping(value="/referenceWrite.go")
	public String referenceWriteForm(Model model, HttpSession session) {
		
		logger.info("글쓰기 이동");
		String loginId = (String)session.getAttribute("loginId");
		if (loginId  != null && !session.getAttribute("loginId").equals("")) {
			String loginName = service.selectName(loginId);
			model.addAttribute("loginName",loginName);
			return "referenceWrite";
		}
		return"redirect:/" ;
	}
	
	// 자료실 글작성 기능
	@RequestMapping(value="/referenceWrite.do")
	public String referenceWrite(@RequestParam HashMap<String,String> params, MultipartFile[] files, HttpSession session) {
		logger.info("params 값 : "+params);
		logger.info("file 값 :"+files);
		service.write(params,files);
		return "redirect:/referenceList.do";
	}
	
	@RequestMapping(value="/referenceDelete.do")
	public String referenceDelete(@RequestParam String r_idx) {
		logger.info("delete idx 값 : "+r_idx);
		int success = service.delete(r_idx);
		logger.info("success : "+success);
		return "redirect:/referenceList.do";
	}
	
	@RequestMapping(value="/referenceUpdate.do")
	public String referenceUpdate(MultipartFile[] files , @RequestParam HashMap<String,String> params) {
		logger.info("update된 params 값 : "+params+files);
		service.update(params,files);
		return "redirect:/referenceList.do";
	}
	
	@GetMapping(value="/download.do")
	public ResponseEntity<Resource> download(String path,String idx) {
		
		logger.info("path 값"+path);
		logger.info("idx 값"+idx);
		
		String newFileName = service.selectFile(path); 
		Resource body = new FileSystemResource(root+"/"+path);//BODY		
		HttpHeaders header = new HttpHeaders();//Header
		try {						
			String fileName = newFileName+newFileName.substring(newFileName.lastIndexOf("."));
			logger.info(newFileName+path+fileName);
			// 한글 파일명은 깨질수 있으므로 인코딩을 한번 해 준다.
			newFileName = URLEncoder.encode(newFileName, "UTF-8");
			// text/... 은 문자열, image/... 이미지, application/octet-stream 은 바이너리 데이터
			header.add("Content-type", "application/octet-stream");
			// content-Disposition 은 내려보낼 내용이 문자열(inline)인지 파일(attatchment)인지 알려준다. 
			header.add("content-Disposition", "attachment;fileName=\""+newFileName+"\"");
		} catch (IOException e) {
			e.printStackTrace();
		}
		//body, header, status
		return new ResponseEntity<Resource>(body, header, HttpStatus.OK);
	}
	
	@RequestMapping(value="/checkDeleteAjax.do")
	@ResponseBody
	public HashMap<String, Object> checkDelete(@RequestParam ArrayList<Integer> list){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info("list안 값 : "+list);
		return map;
	}
}
