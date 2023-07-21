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


import kr.co.gf.board.dao.NoticeDAO;
import kr.co.gf.board.dto.NoticeDTO;

@Service
@MapperScan(value={"kr.co.gf.board.dao"})
public class NoticeService {
	
	@Autowired NoticeDAO ndao;
	@Value("${spring.servlet.multipart.location}")private String root;
	
	Logger logger =LoggerFactory.getLogger(getClass());

	public String nwrite(HashMap<String, String> params, MultipartFile[] photos) {
		
		  NoticeDTO dto = new NoticeDTO();
		  
		  String page= "redirect:/nlist.go";
		  
		  dto.setTitle(params.get("title"));
		  dto.setContent(params.get("content"));
		  dto.setFix(params.get("fix"));
		  String emp_no=params.get("emp_no");
		  dto.setEmp_no(emp_no);

		  int row=ndao.nwrite(dto);
		  
		  String n_idx=dto.getN_idx();
		  

		  for (MultipartFile photo : photos) {
			if (photo.getOriginalFilename()!=null) {
				 //logger.info("photosave가기 전"+photo.getOriginalFilename());
				String flag="write";
				 photoSave(photo,n_idx);				 
				 try {
					Thread.sleep(1000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		  }
		return page;
	}



	
	public String photoSave(MultipartFile photo, String n_idx) {
			
			NoticeDTO dto = new NoticeDTO();
			String c_Content=dto.setC_Content("공지사항");
			int c_idx=dto.setC_idx(3);
			logger.info("가져온 공지사항 번호는 "+c_idx);
		
			String oriName= photo.getOriginalFilename(); 
			String ext= oriName.substring(oriName.lastIndexOf(".")); 
			String newName= System.currentTimeMillis()+ext;
			logger.info("newname"+newName);
				  
			try { 
				byte[] bytes=photo.getBytes(); 
				//파일 객체화
				Path path= Paths.get(root+"/"+newName);
				Files.write(path, bytes);
				
				/*
				 * if (flag.equals("pupdate")) { //c드라이브서 삭제 icin //Files.delete(path); int
				 * row=ndao.pupdate(n_idx, c_idx, oriName, newName); }
				 */
					ndao.photoSave(oriName, newName, c_idx , n_idx);
				} 
			catch (IOException e) { 
				e.printStackTrace(); 
				}	
			String page = "redirect:/ndetail.do?n_idx="+"n_idx";
			return page;
	}
	

	public ArrayList<NoticeDTO> nlist() {
		return ndao.nlist();
	}
	
	public HashMap<String, String> ndetail(String n_idx, String string) {
		if (string.equals("detail")) {
			ndao.hit(n_idx);
		}
		return ndao.ndetail(n_idx);
	}

	public void getinfo(String emp_no, String n_idx) {
		ndao.getinfo(emp_no, n_idx);
		
	}

	public ArrayList<NoticeDTO> rlist(String n_idx) {
		return ndao.rlist(n_idx);
	}
	
	public int rcount(String emp_no, String n_idx) {
		return ndao.rcount(emp_no, n_idx);
	}
	public int ndelete(String n_idx) {
		int row = ndao.rdelete(n_idx);
		logger.info("reader 삭제됐으면 숫자 1 반환+"+row);
		return ndao.ndelete(n_idx);
	}
	
	public void nupdate(HashMap<String, String> params, MultipartFile[] mphotos) {
		ndao.nupdate(params);//글들
		String n_idx=params.get("n_idx");
		logger.info("업뎃하려면 n_idx는"+n_idx);
		NoticeDTO dto = new NoticeDTO();
		



		logger.info("일단 mphotos photosave 가기 전");
		if (mphotos!=null &&mphotos.length>0) {
			for (MultipartFile mphoto : mphotos) {
				if (!mphoto.isEmpty()) {
					logger.info("사진이 있을 경우에만 출력됨 for 다시 photosave icin");
					photoSave(mphoto, n_idx);
				}
				

			}
		}
		
	}		
			

			/*
			 * String oriName=photos.getOriginalFilename(); String ext =
			 * oriName.substring(oriName.lastIndexOf(".")); String newName =
			 * System.currentTimeMillis()+ext;
			 * 
			 * int c_idx=dto.setC_idx(5);
			 * logger.info("update icin oriName"+oriName+"newName은"+newName+"c_idx는"+c_idx+
			 * "n_idx는"+n_idx); int row=ndao.pupdate(n_idx, c_idx, oriName, newName);
			 * logger.info("사진 업뎃 됐으면 숫자는 1임"+row);
			 * 
			 * try { byte[] bytes=photos.getBytes(); //파일 객체화 Path path=
			 * Paths.get(root+"/"+newName); Files.write(path, bytes);
			 * 
			 * //logger.info(oriName+"newname"+newName+"n_idx"+n_idx+c_idx); } catch
			 * (IOException e) { e.printStackTrace(); }
			 */

		/*
		 * String page = "redirect:/ndetail.do?n_idx="+"n_idx"; return page;
		 */		
	

	public ArrayList<NoticeDTO> pdetail(String n_idx) {
		return ndao.pdetail(n_idx);

	}
	public String findfile(String path) {
		return ndao.findfile(path);
	}
	public void pdelete(String new_photo_name) {
		/*
		 * File file= new File(new_photo_name); logger.info("사진 삭제 원해"); if
		 * (file.exists()) { file.delete(); logger.info("일단 파일 존재함 c드라이브 확인 ㄱ"); }
		 */
		ndao.pdelete(new_photo_name);
		
	}

	/*
	 * public Object getinfo(String emp_no, String n_idx) { return
	 * ndao.getinfo(emp_no,n_idx); }
	 */
}	
		

	


