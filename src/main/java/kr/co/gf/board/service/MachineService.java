package kr.co.gf.board.service;

import java.util.ArrayList;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gf.board.dao.MachineDAO;
import kr.co.gf.board.dto.MachineDTO;

@Service
@MapperScan("kr.co.gf.board.dao")
public class MachineService {
	
	@Autowired MachineDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());

	public ArrayList<MachineDTO> mlist() {
		
		return dao.mlist();
	}

}
