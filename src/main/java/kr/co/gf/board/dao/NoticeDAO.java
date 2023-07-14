package kr.co.gf.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.web.multipart.MultipartFile;

import kr.co.gf.board.dto.NoticeDTO;

public interface NoticeDAO {

	int nwrite(NoticeDTO dto);

	ArrayList<NoticeDTO> nlist();

	HashMap<String, String> ndetail(String n_idx);

	void hit(String n_idx);

	void nupdate(HashMap<String, String> params);

	void getinfo(String emp_no, String n_idx);

	ArrayList<NoticeDTO> rlist(String n_idx);

	int rcount(String emp_no, String n_idx);

	int ndelete(String n_idx);

	int rdelete(String n_idx);

	void pupdate(MultipartFile[] photos);

	int pupdate(String n_idx, int c_idx, String oriName, String newName);

	void photoSave(String oriName, String newName, int c_idx, String n_idx);

	ArrayList<NoticeDTO> pdetail(String n_idx);

	String findfile(String path);

	void pdelete(String new_photo_name);

	void fordb(String n_idx);

	void alldelete(String n_idx);







	

}
