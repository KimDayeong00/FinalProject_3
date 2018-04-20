package com.jhta.project.service;

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
	
}
