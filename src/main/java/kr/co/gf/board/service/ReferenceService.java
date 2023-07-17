package kr.co.gf.board.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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

import kr.co.gf.board.dao.ReferenceDAO;
import kr.co.gf.board.dto.ReferenceDTO;


@Service
@MapperScan("kr.co.gf.board.dao")
public class ReferenceService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ReferenceDAO dao;
	
	@Value("${spring.servlet.multipart.location}") private String root;

	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("referenceList");
		ArrayList<ReferenceDTO> list = dao.list();
		mav.addObject("list", list);
		return mav;
	}

	public ReferenceDTO detail(String idx) {
		return dao.detail(idx);
	}

/*
 	public int write(HashMap<String, String> params) {
		return dao.write(params);
	}
*/
	public int delete(String r_idx) {
		return dao.delete(r_idx);
	}

	public int update(HashMap<String, String> params, MultipartFile[] files) {
		return dao.update(params);
	}
	

	public String write(HashMap<String, String> params, MultipartFile[] uploadFiles) {
		
		String page = "redirect:/referenceList.do";
		
		ReferenceDTO dto = new ReferenceDTO();
		
		dto.setSubject(params.get("subject"));
		dto.setEmp_no(params.get("emp_no"));
		dto.setContent(params.get("content"));
		// dto.setR_idx(Integer.parseInt(params.get("r_idx")));
		
		int row = dao.write(dto);
		
		if(row == 1) {
			
			for (MultipartFile file : uploadFiles) {
				logger.info("photo 있으면 false, 없으면 true :"+file.isEmpty());
				if(!file.isEmpty()) {
					upload(file,dto.getBoard_num());
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
	
public void upload(MultipartFile uploadFile,int board_num) {
		
		// 1. 파일명 추출
		String ori_photo_name = uploadFile.getOriginalFilename();
		logger.info(ori_photo_name);
		int c_idx = 4;
		logger.info("board_num"+board_num);
		
		// 2. 새파일 생성(현재시간 + 확장자)
		String ext = ori_photo_name.substring(ori_photo_name.lastIndexOf("."));
		String new_photo_name = System.currentTimeMillis() + ext;
		logger.info(ori_photo_name+" => "+new_photo_name);
		
		// 3. 파일 저장
		try {
			byte[] bytes = uploadFile.getBytes();
			Path path = Paths.get(root+"/"+new_photo_name);
			Files.write(path, bytes);
			dao.fileWrite(c_idx,ori_photo_name,new_photo_name,board_num);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public String selectName(String loginId) {
		return dao.selectName(loginId);
		
	}

	public String selectFile(String path) {
		return dao.selectFile(path);
		
	}

	public ArrayList<ReferenceDTO> detailFile(String idx) {
		return dao.detailFile(idx);
	}

}



