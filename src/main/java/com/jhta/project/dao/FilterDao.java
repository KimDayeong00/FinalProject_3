package com.jhta.project.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FilterDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.mybatis.FilterMapper";
	
	public int insertFilter(String[] chFilter,String ps_email) {
		HashMap<String, String> map=new HashMap<>();
		String fl_name="";
		int n = -1;
		
		map.put("ps_email",ps_email);
		for(int i=0;i<chFilter.length;i++) {
			fl_name = chFilter[i];
			System.out.println(fl_name);
			map.put("fl_name", fl_name);
			n = sqlSession.insert(NAMESPACE+".insertFilter",map);
		}
		return n;
	}
	
	public int deleteFilter(String ps_email) {
		return sqlSession.delete(NAMESPACE+".deleteFilter",ps_email);
	}
}
