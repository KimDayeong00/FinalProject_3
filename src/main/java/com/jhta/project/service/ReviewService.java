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
	
	public int updateBk_rv(int bk_num) {
		return dao.updateBk_rv(bk_num);
	}
	
	public ReviewVo selectRv(int bk_num) {
		return dao.selectRv(bk_num);
	}
}
