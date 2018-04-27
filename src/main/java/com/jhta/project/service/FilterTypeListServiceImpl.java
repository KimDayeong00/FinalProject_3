package com.jhta.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.dao.FilterTypeListDao;
import com.jhta.project.vo.FilterTypeListVo;
@Service
public class FilterTypeListServiceImpl implements FilterTypeListService {
	@Autowired FilterTypeListDao dao;
	@Override
	public List<FilterTypeListVo> list() {
		return dao.list();
	}

}
