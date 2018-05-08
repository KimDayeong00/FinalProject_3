package com.jhta.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.dao.FilterDao;

@Service
public class FilterService {
	@Autowired FilterDao dao;
	
	public int insertFilter(String[] chFilter,String ps_email) {
		return dao.insertFilter(chFilter, ps_email);
	}
	
	public int deleteFilter(String ps_email) {
		return dao.deleteFilter(ps_email);
	}
}
