package com.jhta.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.dao.PayDao;
import com.jhta.project.vo.PayVo2;

@Service
public class PayService {
	@Autowired PayDao dao;
	
	public int insertPay(PayVo2 vo) {
		return dao.insertPay(vo);
	}
}
