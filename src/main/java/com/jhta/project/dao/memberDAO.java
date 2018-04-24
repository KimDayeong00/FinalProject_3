package com.jhta.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.project.vo.memberVO;

@Repository
public class memberDAO {
	
	@Autowired private SqlSession session;
	
	private final String NAMESPACE = "com.jhta.mybatis.memberMApper";
	
	public int insert(memberVO vo) {
		return session.insert(NAMESPACE+".insert", vo);
	}
}
