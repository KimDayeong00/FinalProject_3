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
}
