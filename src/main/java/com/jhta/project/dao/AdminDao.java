package com.jhta.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.project.vo.ShopClassFieldVo;
import com.jhta.project.vo.ShopClassVo;
import com.jhta.project.vo.ShopFieldVo;

@Repository
public class AdminDao {
	@Autowired private SqlSession sqlsession;
	private final String NAMESPACE = "com.jhta.mybatis.AdminMapper";
	
	public List<ShopClassVo> classList(){
		return sqlsession.selectList(NAMESPACE + ".classList");
	}
	public int classInsert(ShopClassVo vo) {
		return sqlsession.insert(NAMESPACE + ".classInsert", vo);
	}
	public ShopClassVo classGetinfo(String name) {
		return sqlsession.selectOne(NAMESPACE + ".classGetinfo", name);
	}
	public int classDelete(int classnum) {
		return sqlsession.delete(NAMESPACE + ".classDelete", classnum);
	}
	public int classUpdateOk(ShopClassVo vo) {
		return sqlsession.update(NAMESPACE + ".classUpdateOk", vo);
	}
	
	
	public List<ShopClassFieldVo> fieldList(){
		return sqlsession.selectList(NAMESPACE + ".fieldList");
	}
	public List<ShopClassFieldVo> fieldInfo(int classnum) {
		return sqlsession.selectList(NAMESPACE + ".fieldInfo", classnum);
	}
}
