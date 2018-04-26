package com.jhta.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.dao.PpetInfoDao;
import com.jhta.project.vo.PetsitterPetVo;

@Service
public class PpetInfoService {
	@Autowired private PpetInfoDao dao;
	
	public PetsitterPetVo select(String ps_email) {
		return dao.select(ps_email);
	}
}
