package kr.co.gf.emp.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
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

	@Value("${spring.servlet.multipart.location}")
	private String root;

	public void tempJoin(EmpDTO dto) {
		logger.info("ID:" + dto.getEmp_no());
		logger.info("PW:" + dto.getPw());
		String encpass = encoder.encode(dto.getPw());
		dto.setPw(encpass);
		int row = dao.tempJoin(dto);
	}

	// 직원리스트검색
	public ModelAndView emp_listDo(HashMap<String, String> params) {

		ModelAndView mav = new ModelAndView("empList");

		ArrayList<EmpDTO> list = dao.emp_listDo(params);

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
	public ModelAndView empRep_listDo(HashMap<String, String> params) {

		ModelAndView mav = new ModelAndView("empRepList");

		ArrayList<EmpDTO> list = dao.empRep_listDo(params);

		mav.addObject("list", list);
		return mav;
	}

	public ModelAndView empRep_retireListDo(HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView("retireList");

		ArrayList<EmpDTO> list = dao.empRep_retireListDo(params);

		mav.addObject("list", list);
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

//	public ModelAndView emp_join(EmpDTO dto, MultipartFile[] uploadFiles, 
//									RedirectAttributes rAttr, @RequestParam HashMap<String, String> params) {
//		
//		String encpass = encoder.encode(dto.getPw());
//		dto.setPw(encpass);
//		
//		int success = dao.emp_join(dto);
//		
//		for (MultipartFile file : uploadFiles) {
//			logger.info("photo 있으면 false, 없으면 true :"+file.isEmpty());
//			if(file.isEmpty()==false) {
//				upload(file,dto.getBoard_num());
//				
//				try {
//					Thread.sleep(1);
//				} catch (InterruptedException e) {
//					e.printStackTrace();
//				}
//			}
//		} 
//		logger.info("success: "+success);
//		String msg = "직원등록에 실패 했습니다";
//		String page = "loginPage";
//		
//		if(success > 0) {
//			msg="직원등록에 성공 했습니다.";
//			page="redirect:/empDetail.do";
//		}
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName(page);
//		mav.addObject("detailid",dto.getEmp_no());
//		rAttr.addFlashAttribute("msg", msg);
//		return mav;
//		
//	}

	public ModelAndView emp_join(HashMap<String, String> params, MultipartFile file, HttpSession session, 
								 EmpDTO dto, RedirectAttributes rattr) {
		dto.setEmp_no(dao.getEmpNo());
		String encpass = encoder.encode(dto.getPw());
		dto.setPw(encpass);
		
		int success = dao.emp_join(dto);
		logger.info("success: " + success);

		String msg = "직원등록에 실패하였습니다.";
		String page = "loginPage";

		if (success > 0) {
			msg = "직원등록에 성공했습니다.";
			page = "redirect:/empDetail.go";
			if (file != null && !file.isEmpty()) {
				// 입력받은 파일 이름
				String ori_photo_name = file.getOriginalFilename();
				int c_idx = 1;
				String emp_no = dto.getEmp_no();
				// 확장자를 추출하기 위한 과정
				String ext = ori_photo_name.substring(ori_photo_name.lastIndexOf("."));
				// 새로운 파일 이름은?
				String new_photo_name = System.currentTimeMillis() + ext;
				logger.info("파일 업로드 : " + ori_photo_name + "=>" + new_photo_name + "으로 변경될 예정");
				try {
					byte[] bytes = file.getBytes();
					Path path = Paths.get("C:/upload/" + new_photo_name);
					Files.write(path, bytes);
					dao.emp_fileWrite(c_idx, ori_photo_name, new_photo_name, emp_no);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName(page);
		rattr.addAttribute("msg",msg);
		mav.addObject("detailid", dto.getEmp_no());
		return mav;
	}

	public EmpDTO emp_detail(String detailid) {

		return dao.emp_detail(detailid);
	}

	public String emp_photo(String detailid) {

		return dao.emp_photo(detailid);
	}
	
	public ModelAndView emp_update(MultipartFile file, HashMap<String, Object> params) {
		logger.info("pw:"+params.get("pw"));
		String encpass = encoder.encode(String.valueOf(params.get("pw")));
		params.put("newPw", encpass);
		//dto.setPw(encpass);
		
		logger.info("params : " + params);
		int row = dao.emp_update(params);
		logger.info("update row: " + row);
		String emp_no = params.get("emp_no").toString();
		if (row > 0) {
			if (file != null && !file.getOriginalFilename().equals("")) {
				// 기존 프로필 사진을 데이터베이스에서 삭제합니다.
				dao.emp_removePhoto(emp_no);
				attachmentSave(emp_no, file, "직원사진");
			}
		}
		
		ModelAndView mav = new ModelAndView();
		String page = row > 0 ? "redirect:/empDetail.go?detailid="+emp_no : "redirect:/empList.go";
		mav.setViewName(page);
		return mav;
	}
	
	private void attachmentSave(String emp_no, MultipartFile file, String cls) {
	   String ori_photo_name = file.getOriginalFilename();
	   int c_idx = 1;
	   String ext = ori_photo_name.substring(ori_photo_name.lastIndexOf("."));
	   String new_photo_name = System.currentTimeMillis() + ext;
	   logger.info("파일 업로드 : " + ori_photo_name + "=>" + new_photo_name + "으로 변경될 예정");

	   try {
	       byte[] bytes = file.getBytes();
	       Path path = Paths.get("C:/upload/" + new_photo_name);
		   Files.write(path, bytes);
		   logger.info(new_photo_name + " upload 디렉토리에 저장 완료 !");
	   		dao.emp_fileWrite(c_idx, ori_photo_name, new_photo_name, emp_no);
	       } catch (IOException e) {
	           e.printStackTrace();
	       }
	}

	// 상세에서 삭제
	public ModelAndView emp_delete(String detailid) {

		int success = dao.emp_delete(detailid);
		logger.info("success: " + success);
		String msg = "직원삭제에 실패 했습니다";
		String page = "empUpdate";

		if (success > 0) {
			msg = "직원삭제에 성공 했습니다.";
			page = "redirect:/empList.go";
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName(page);
		mav.addObject("msg", msg);

		return mav;
	}

	// 목록에서 삭제
	public void emp_hide(List<String> hideList) {
		logger.info("hideservice");
		dao.emp_hide(hideList);
	}
	
    public HashMap<String, Object> emp_idChk(String emp_no) {
        
        HashMap<String, Object> map = new HashMap<String, Object>();
        logger.info("service emp+no");
        int idChk = dao.emp_idChk(emp_no);
        map.put("idChk", idChk);
        return map;
    }

	public String emp_position(String loginId) {
		
		return dao.emp_position(loginId);
	}

}