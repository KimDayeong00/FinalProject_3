package com.jhta.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.dao.ReviewDao;
import com.jhta.project.vo.ReviewVo;

@Service
public class ReviewService {
	@Autowired ReviewDao dao;
	
	public int insertReview(ReviewVo vo) {
		return dao.insertReview(vo);
	}
}
