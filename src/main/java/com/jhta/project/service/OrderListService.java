package com.jhta.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.dao.OrderlistDao;
import com.jhta.project.vo.OrderJoinVo;


@Service
public class OrderListService {
@Autowired OrderlistDao dao;
public List<OrderJoinVo> orderlist(String m_email) {
	return dao.orderlist(m_email);
}
}
