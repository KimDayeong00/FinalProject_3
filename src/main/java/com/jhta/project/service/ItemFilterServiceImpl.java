package com.jhta.project.service;

import java.util.HashMap;

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

	@Override
	public int delete(String p_num) {
		return dao.delete(p_num);
	}

	@Override
	public int uinsert(HashMap<String, String> umap) {
		return dao.uinsert(umap);
	}
	
}
