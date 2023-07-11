package kr.co.gf.board.dao;

import java.util.ArrayList;

import kr.co.gf.board.dto.MachineDTO;

public interface MachineDAO {

	ArrayList<MachineDTO> maclist(String b_idx);


}
