package com.jhta.project.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.project.vo.PetSitterVo;

@Repository
public class PetSitterDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE="com.jhta.mybatis.PetSitterMapper";
	public List<PetSitterVo> list(HashMap<String, String> map){
		return session.selectList(NAMESPACE+".list",map);
	}
	public List<PetSitterVo> alllist(){
		return session.selectList(NAMESPACE+".alllist");
	}
}
