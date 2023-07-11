package kr.co.gf.board.dao;

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

}
