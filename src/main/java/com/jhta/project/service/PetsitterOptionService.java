package com.jhta.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.dao.PetsitterOptionDao;
import com.jhta.project.vo.PetsitterOptionVo;

@Service
public class PetsitterOptionService {
	@Autowired private PetsitterOptionDao dao;
	
	public PetsitterOptionVo getOption(String ps_email) {
		return dao.getOption(ps_email);
	}
	
//	public List<String> getImg(String ps_email) {
//		return dao.getImg(ps_email);
//	}
	
	public int updatePsInfoSet(PetsitterOptionVo vo) {
		return dao.updatePsInfoSet(vo);
	}
	
}
