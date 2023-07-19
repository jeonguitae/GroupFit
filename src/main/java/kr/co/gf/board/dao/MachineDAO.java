package kr.co.gf.board.dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

import kr.co.gf.board.dto.MachineDTO;

public interface MachineDAO {

	ArrayList<MachineDTO> Smaclist(String b_idx);

	int mac_reg(HashMap<String, String> params);

	String mac_num(String mac_name, String b_idx);

	int mac_photo_reg(String mac_num, String new_photo_name, String ori_photo_name);

	ArrayList<MachineDTO> maclist(String b_idx);

	MachineDTO mac_info(String mac_num);
	
	int mac_photo_del(String mac_num);

	int macdel(String b_idx, String mac_num);

	String mac_new_file_name(String mac_num);

	int mac_status(String mac_num, String mac_status, String b_idx, String emp_no);

	ArrayList<MachineDTO> Fmaclist(String b_idx, LocalDate now);

	int mac_fixed(String emp_no, String mac_num, String fixed_content, String b_idx);

	ArrayList<MachineDTO> fixedmaclist(String b_idx);

	MachineDTO fix_content(String mac_num);

	int mac_status_cng(HashMap<String, String> params);

	void delete_fix_mac(HashMap<String, String> params);

}
