package com.jhta.project.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.dao.QnaDao;
import com.jhta.project.vo.AdminqnaVo;
import com.jhta.project.vo.PayboardVo;
import com.jhta.project.vo.QnaVo;
import com.jhta.project.vo.ShopItemVo;

@Service
public class QnaService {
	@Autowired private QnaDao dao;
	
	public List<QnaVo> qnaList(){
		return dao.qnaList();
	}
	
	
	
	public int getCount(HashMap<String,Object> map) {
		return dao.getCount(map);
	}
	public List<QnaVo> list(HashMap<String,Object> map){
		return dao.list(map);
	}
	public List<QnaVo> adminlist(HashMap<String,Object> map){
		return dao.adminlist(map);
	}
	public QnaVo next(int num) {
		return dao.next(num);
	}
	public QnaVo prev(int num) {
		return dao.prev(num);
	}
	public int addHit(int num) {
		return dao.addHit(num);
	}
	
	
	public List<ShopItemVo> orderiteminfo(String m_email) {
		return dao.orderiteminfo(m_email);
	}
	public int insert(QnaVo vo) {
		return dao.insert(vo);
	}
	public QnaVo qnagetinfo(int p_num) {
		return dao.qungetinfo(p_num);
	}
	public List<QnaVo> qnagetlist(String m_email){
		return dao.qnagetlist(m_email);
	}
	public int qnadelete(int qnum) {
		return dao.qnadelete(qnum);
	}
	public int admindelete(int qnum) {
		return dao.admindelete(qnum);
	}
	
	public int maxnum() {
		return dao.maxnum();
	}
	
	public int adminupdate(int qnum) {
		return dao.adminupdate(qnum);
	}
	
	public int adminqnainsert(AdminqnaVo vo) {
		return dao.adminqnainsert(vo);
	}
	
	public QnaVo detailone(int qnum) {
		return dao.detailone(qnum);
	}
}
