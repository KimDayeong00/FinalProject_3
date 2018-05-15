package com.jhta.project.service;

import java.util.HashMap;
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
	
	public int insertBook(PetsitterBookVo vo) {
		return dao.insertBook(vo);
	}
	
	public List<PetsitterBookVo> selectPrevList(String m_email){
		return dao.selectPrevList(m_email);
	}
	
	public List<PetsitterBookVo> selectPbookList(String ps_email){
		return dao.selectPbookList(ps_email);
	}
	
	public int completeBook(int bk_num) {
		return dao.completeBook(bk_num);
	}
	
	public int getBbookCnt(String m_email) {
		return dao.getBbookCnt(m_email);
	}
	
	public int getPbookCnt(String ps_email) {
		return dao.getPbookCnt(ps_email);
	}
	
	public int getPrevListCnt(String m_email) {
		return dao.getPrevListCnt(m_email);
	}
	
	public List<PetsitterBookVo> getBbookCnt2(HashMap<String, Object> map){
		return dao.getBbookCnt2(map);
	}
	
	public List<PetsitterBookVo> getPbookCnt2(HashMap<String, Object> map){
		return dao.getPbookCnt2(map);
	}
	
	public List<PetsitterBookVo> getPrevListCnt2(HashMap<String, Object> map){
		return dao.getPrevListCnt2(map);
	}
	
	public String selectBk_content(int bk_num) {
		return dao.selectBk_content(bk_num);
	}
}
