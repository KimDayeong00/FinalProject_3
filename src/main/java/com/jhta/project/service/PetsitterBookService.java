package com.jhta.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.dao.PetsitterBookDao;
import com.jhta.project.vo.MpetInfoVo;
import com.jhta.project.vo.PetsitterBookVo;

@Service
public class PetsitterBookService {
	@Autowired PetsitterBookDao dao;
	
	public List<PetsitterBookVo> selectMbook(String m_email){
		return dao.selectMbook(m_email);
	}
	
	public List<MpetInfoVo> getBpet(int bk_num){
		return dao.getBpet(bk_num);
	}
	
	public int getBpetCnt(int bk_num) {
		return dao.getBpetCnt(bk_num);
	}
}
