package kr.co.gf.commute.service;

import java.util.ArrayList;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gf.commute.dao.CommuteDAO;
import kr.co.gf.commute.dto.CommuteDTO;

@Service
@MapperScan(value= {"kr.co.gf.commute.dao"})
public class CommuteService {
	
	@Autowired CommuteDAO cdao;
	Logger logger= LoggerFactory.getLogger(getClass());

	public ArrayList<CommuteDTO> list(String emp_no) {
		return cdao.list(emp_no);
	}

}
