package com.jhta.project.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.dao.PetSitterDao;
import com.jhta.project.vo.PetSitterFilterVo;
import com.jhta.project.vo.PetSitterJoinFilterVo;
import com.jhta.project.vo.PetSitterVo;

@Service
public class PetSitterServiceImpl implements PetSitterService{
	@Autowired private PetSitterDao petsitterDao;
	
	@Override
	public List<PetSitterJoinFilterVo> list(HashMap<String, String> map) {
		return petsitterDao.list(map);
	}
	
	@Override
	public PetSitterVo select(String ps_email) {
		return petsitterDao.select(ps_email);
	}
	@Override
	public List<PetSitterJoinFilterVo> alllist() {
		return petsitterDao.alllist();
	}
	
	@Override
	public List<PetSitterFilterVo> getFilter(String ps_email) {
		return petsitterDao.getFilter(ps_email);
	}
}
