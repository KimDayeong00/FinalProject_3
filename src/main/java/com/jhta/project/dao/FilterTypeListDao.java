package com.jhta.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.project.vo.FilterTypeListVo;

@Repository
public class FilterTypeListDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE="com.jhta.mybatis.FilterTypeListMapper";
	public List<FilterTypeListVo>list(){
		return session.selectList(NAMESPACE+".filterlist");
	}
}
