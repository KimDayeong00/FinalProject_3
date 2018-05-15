package com.jhta.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.dao.ReviewDao;
import com.jhta.project.vo.ReviewListVo;
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
	
	public List<ReviewListVo> selectPsRv(String ps_email){
		return dao.selectPsRv(ps_email);
	}
	
	public int rvCnt(String ps_email) {
		return dao.rvCnt(ps_email);
	}
}
