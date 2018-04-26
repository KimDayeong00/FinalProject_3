package com.jhta.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.dao.PetSitterImageDao;
import com.jhta.project.vo.PetSitterImageVo;

@Service
public class PetSitterImageServiceImpl implements PetSitterImageService{
	@Autowired private PetSitterImageDao dao;
	
	@Override
	public int insert(PetSitterImageVo vo) {
		
		return dao.insert(vo);
	}

}
