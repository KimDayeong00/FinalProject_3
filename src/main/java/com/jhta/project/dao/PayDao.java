package com.jhta.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.project.vo.PayVo2;

@Repository
public class PayDao {
	@Autowired SqlSession sqlSession;
	final String NAMESPACE="com.jhta.mybatis.PayMapper";
	
	public int insertPay(PayVo2 vo) {
		return sqlSession.insert(NAMESPACE+".insertPay",vo);
	}
}
