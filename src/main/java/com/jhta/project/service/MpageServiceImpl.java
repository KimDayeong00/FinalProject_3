package com.jhta.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.dao.MpageDao;
import com.jhta.project.vo.MpageVo;

@Service
public class MpageServiceImpl implements MpageService{
	@Autowired private MpageDao dao;

	@Override
	public List<MpageVo> list() {
		return dao.list();
	}

	@Override
	public int update(MpageVo vo) {
		return dao.update(vo);
	}
}
