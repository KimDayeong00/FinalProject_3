package com.jhta.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.dao.PpetInfoDao;
import com.jhta.project.vo.PetsitterPetVo;

@Service
public class PpetInfoService {
	@Autowired private PpetInfoDao dao;
	
	public List<PetsitterPetVo> select(String ps_email) {
		return dao.select(ps_email);
	}
	
	public int insertPpetInfo(PetsitterPetVo vo) {
		return dao.insertPpetInfo(vo);
	}
	
	public PetsitterPetVo selectPetUpdate(int pi_num) {
		return dao.selectPetUpdate(pi_num);
	}
	
	public int petUpdate(PetsitterPetVo vo) {
		return dao.petUpdate(vo);
	}
}
