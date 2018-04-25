package com.jhta.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.project.vo.ShopClassVo;

@Repository
public class AdminDao {
	@Autowired private SqlSession sqlsession;
	private final String NAMESPACE = "com.jhta.mybatis.AdminMapper";
	
	public List<ShopClassVo> classList(){
		return sqlsession.selectList(NAMESPACE + ".classList");
	}
	
	public int classInsert(ShopClassVo vo) {
		System.out.println(vo.getName());
		return sqlsession.insert(NAMESPACE + ".classInsert", vo);
	}
	public ShopClassVo classGetinfo(String name) {
		return sqlsession.selectOne(NAMESPACE + ".classGetinfo", name);
	}
	public int classDelete(int classnum) {
		return sqlsession.delete(NAMESPACE + ".classDelete", classnum);
	}
}
