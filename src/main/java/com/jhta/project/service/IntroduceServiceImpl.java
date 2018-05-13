package com.jhta.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.dao.IntroduceDao;
import com.jhta.project.vo.IntroduceVo;

@Service
public class IntroduceServiceImpl implements IntroduceService{
	@Autowired private IntroduceDao dao;

	@Override
	public List<IntroduceVo> list() {
		return dao.list();
	}

	@Override
	public int update(IntroduceVo vo) {
		return dao.update(vo);
	}
}
