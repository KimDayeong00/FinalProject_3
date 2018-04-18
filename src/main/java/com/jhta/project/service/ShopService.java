package com.jhta.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.dao.ShopDao;
import com.jhta.project.vo.ShopClassVo;

@Service
public class ShopService {
	@Autowired private ShopDao dao;
	
	public List<ShopClassVo> classlist() {
		return dao.classlist();
	}
}
