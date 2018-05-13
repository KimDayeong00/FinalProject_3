package com.jhta.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.project.vo.IntroduceVo;
import com.jhta.project.vo.MpageVo;

@Repository
public class MpageDao {

@Autowired private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.MpageMapper";
	public List<MpageVo> list(){
		return session.selectList(NAMESPACE+".getinfo");
	}
	public int update(MpageVo vo){
		return session.update(NAMESPACE+".update",vo);
	}
}
