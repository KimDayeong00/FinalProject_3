package com.jhta.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.dao.ItemFilterDao;

@Service
public class ItemFilterServiceImpl implements ItemFilterService{
	@Autowired private ItemFilterDao dao;

	@Override
	public int insert(String filterchk) {
		return dao.insert(filterchk);
	}
	
}
