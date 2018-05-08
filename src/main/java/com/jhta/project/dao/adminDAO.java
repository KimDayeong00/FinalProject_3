package com.jhta.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.project.vo.payVO;

@Repository
public class adminDAO {

@Autowired private SqlSession session;
	
	private final String NAMESPACE = "com.jhta.mybatis.petAdminMapper";
	
	public List<payVO> earn(String start,String end){
		Map<String, String> map = new  HashMap<>();
		map.put("start", start);
		map.put("end", end);
		List<payVO> pList = session.selectList(NAMESPACE+".earn", map);
		return pList;
	}
	
	
}
