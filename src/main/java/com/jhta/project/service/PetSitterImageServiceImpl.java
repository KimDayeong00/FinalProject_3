package com.jhta.project.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.dao.PetSitterImageDao;
import com.jhta.project.vo.PetSitterImageVo;

@Service
public class PetSitterImageServiceImpl implements PetSitterImageService{
	@Autowired private PetSitterImageDao dao;
	
	@Override
	public int insert(HashMap<String, Object> map) {
		
		return dao.insert(map);
	}
	
	@Override
	public List<PetSitterImageVo> getImg(String ps_email) {
		return dao.getImg(ps_email);
	}

	@Override
	public int delete(int pimg_num) {
		return dao.delete(pimg_num);
	}
}
