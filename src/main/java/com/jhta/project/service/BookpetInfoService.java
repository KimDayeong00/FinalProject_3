package com.jhta.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.dao.BookpetInfoDao;
import com.jhta.project.vo.BookpetInfoVo;

@Service
public class BookpetInfoService {
	@Autowired BookpetInfoDao dao;
	
	public int insertBpet(BookpetInfoVo vo) {
		return dao.insertBpet(vo);
	}
}
