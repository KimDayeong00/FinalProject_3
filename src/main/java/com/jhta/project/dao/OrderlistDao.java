package com.jhta.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.project.vo.OrderJoinVo;



@Repository
public class OrderlistDao {
	@Autowired SqlSession sqlSession;
	final String NAMESPACE = "com.jhta.mybatis.OrderMapper";
	
	public List<OrderJoinVo> orderlist(String m_email){
		return sqlSession.selectList(NAMESPACE+".orderlist",m_email);
	}
	
}
