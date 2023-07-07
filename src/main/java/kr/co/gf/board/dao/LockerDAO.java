package kr.co.gf.board.dao;

import java.util.ArrayList;

import kr.co.gf.board.dto.LockerDTO;

public interface LockerDAO {

	ArrayList<LockerDTO> loclist(String b_idx);

	int loc_status(String b_idx, String loc_no, String status);

	String loc_status_chk(String mem_no);

	int chk_loc_no(String mem_no);

	void excng_loc_no(String b_idx, int chk_loc_no);

	int update_loc_no(String loc_no, String mem_no);

	int update_loc_status(String b_idx, String loc_no);

}
