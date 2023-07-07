package kr.co.gf.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.gf.board.dto.ReferenceDTO;

public interface ReferenceDAO {

	ArrayList<ReferenceDTO> list();

	ReferenceDTO detail(String idx);

	int delete(String r_idx);

	int update(HashMap<String, String> params);

	int write(String subject, String emp_no, String content);

	void fileWrite(int c_idx, String ori_photo_name, String new_photo_name, int board_num);

	int write(ReferenceDTO dto);

	String selectName(String loginId);

	String selectFile(String path);

	ArrayList<ReferenceDTO> detailFile(String idx);


	

}
