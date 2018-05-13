package com.jhta.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.dao.MpetInfoDao;
import com.jhta.project.vo.MpetInfoVo;

@Service
public class MpetInfoService {
	@Autowired MpetInfoDao dao;
	
	public List<MpetInfoVo> mypetList(String m_email){
		return dao.mypetList(m_email);
	}
	
	public int insertMypet(MpetInfoVo vo) {
		return dao.insertMypet(vo);
	}
	
	public MpetInfoVo selectPetUpdate(int pi_num) {
		return dao.selectPetUpdate(pi_num);
	}
	
	public int updateMypet(MpetInfoVo vo) {
		return dao.updateMypet(vo);
	}
	
	public List<MpetInfoVo> psbltPet(String m_email){
		return dao.psbltPet(m_email);
	}
}
