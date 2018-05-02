package com.jhta.project.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.dao.QnaDao;
import com.jhta.project.vo.QnaVo;

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
	public QnaVo next(int num) {
		return dao.next(num);
	}
	public QnaVo prev(int num) {
		return dao.prev(num);
	}
	public int addHit(int num) {
		return dao.addHit(num);
	}
}
