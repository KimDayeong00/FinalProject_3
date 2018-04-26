package com.jhta.project.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.dao.PetSitterDao;
import com.jhta.project.vo.PetSitterVo;

@Service
public class PetSitterServiceImpl implements PetSitterService{
	@Autowired private PetSitterDao petsitterDao;
	
	@Override
	public List<PetSitterVo> list(HashMap<String, String> map) {
		return petsitterDao.list(map);
	}
<<<<<<< HEAD
	
	@Override
	public PetSitterVo select(String ps_email) {
		return petsitterDao.select(ps_email);
=======

	@Override
	public List<PetSitterVo> alllist() {
		return petsitterDao.alllist();
>>>>>>> branch 'jg' of https://github.com/KimDayeong00/FinalProject_3.git
	}
}
