package com.jhta.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ItemFilterDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.ItemFilterMapper";
	public int insert(String filterchk) {
		return session.insert(NAMESPACE+".insert",filterchk);
	}
}
