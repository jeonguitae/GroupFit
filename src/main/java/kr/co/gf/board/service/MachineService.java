package kr.co.gf.board.service;

import java.util.ArrayList;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gf.board.dao.MachineDAO;
import kr.co.gf.board.dto.MachineDTO;

@Service
@MapperScan("kr.co.gf.board.dao")
public class MachineService {
	
	@Autowired MachineDAO dao;

	public ArrayList<MachineDTO> maclist(String b_idx) {
		
		return dao.maclist(b_idx);
	}

}
