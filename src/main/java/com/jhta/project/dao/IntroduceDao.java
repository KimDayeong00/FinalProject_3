package com.jhta.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.project.vo.IntroduceVo;

@Repository
public class IntroduceDao {

@Autowired private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.IntroduceMapper";
	public List<IntroduceVo> list(){
		return session.selectList(NAMESPACE+".getinfo");
	}
	public int update(IntroduceVo vo){
		return session.update(NAMESPACE+".update",vo);
	}
}
