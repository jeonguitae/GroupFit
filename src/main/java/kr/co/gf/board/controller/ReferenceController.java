package kr.co.gf.board.controller;

import java.io.IOException;
import java.net.URLEncoder;
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
	@RequestMapping(value="/reference.do")
	public ModelAndView referenceList() {
		logger.info("리스트 보여줌");
		return service.list();
	}
	
	// 자료실 상세보기
	@RequestMapping(value="/referenceDetail.do")
	public ModelAndView referenceDetail(String idx) {
		logger.info("자료실 상세보기 번호 : "+idx);
		return service.detail(idx);
	}
	
	// 자료실 글작성 페이지 이동
	@RequestMapping(value="/referenceWrite.go")
	public String referenceWriteForm(Model model, HttpSession session) {
		
		logger.info("글쓰기 이동");
		String loginId = (String)session.getAttribute("loginId");
		String loginName = service.selectName(loginId);
		model.addAttribute("loginName",loginName);
		return "referenceWrite";
	}
	
	// 자료실 글작성 기능
	@RequestMapping(value="/referenceWrite.do")
	public String referenceWrite(@RequestParam HashMap<String,String> params, MultipartFile[] files, HttpSession session) {
		logger.info("params 값 : "+params+files);
		service.write(params,files);
		logger.info("success :");
		return "redirect:/reference.do";
	}
	
	@RequestMapping(value="/referenceDelete.do")
	public String referenceDelete(@RequestParam String r_idx) {
		logger.info("delete idx 값 : "+r_idx);
		int success = service.delete(r_idx);
		logger.info("success : "+success);
		return "redirect:/reference.do";
	}
	
	@RequestMapping(value="/referenceUpdate.do")
	public String referenceUpdate(MultipartFile[] files , @RequestParam HashMap<String,String> params) {
		logger.info("update된 params 값 : "+params+files);
		service.update(params,files);
		return "redirect:/reference.do";
	}
	
	@GetMapping(value="/download.do")
	public ResponseEntity<Resource> download(String path) {
		
		Resource body = new FileSystemResource(root+"/"+path);//BODY		
		HttpHeaders header = new HttpHeaders();//Header
		try {						
			String fileName = path+path.substring(path.lastIndexOf("."));
			// 한글 파일명은 깨질수 있으므로 인코딩을 한번 해 준다.
			fileName = URLEncoder.encode(fileName, "UTF-8");
			// text/... 은 문자열, image/... 이미지, application/octet-stream 은 바이너리 데이터
			header.add("Content-type", "application/octet-stream");
			// content-Disposition 은 내려보낼 내용이 문자열(inline)인지 파일(attatchment)인지 알려준다. 
			header.add("content-Disposition", "attatchment;fileName=\""+fileName+"\"");
		} catch (IOException e) {
			e.printStackTrace();
		}
			
		//body, header, status
		return new ResponseEntity<Resource>(body, header, HttpStatus.OK);
	}
}
