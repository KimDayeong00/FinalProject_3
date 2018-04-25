package com.jhta.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.project.vo.ShopClassVo;
import com.jhta.project.vo.ShopFieldVo;
import com.jhta.project.vo.ShopFilterContentVo;
import com.jhta.project.vo.ShopFilterTypeVo;
import com.jhta.project.vo.ShopItemVo;

@Repository
public class ShopDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.mybatis.ShopMapper";
	public List<ShopClassVo> classlist() {
	
		return sqlSession.selectList(NAMESPACE+".classlist");
	}
	
	public List<ShopFieldVo> fieldlist(int classnum){
		return sqlSession.selectList(NAMESPACE+".fieldlist",classnum);
	}
	
	public List<ShopItemVo> itemlist(int classnum){
		return sqlSession.selectList(NAMESPACE+".itemlist",classnum);
	}
	
	public List<ShopFilterTypeVo> filtertype(int fieldnum){
		return sqlSession.selectList(NAMESPACE+".filtertype",fieldnum);
	}
	public List<ShopFilterContentVo> filtercontent(int ft_num){
		return sqlSession.selectList(NAMESPACE+".filtercontent",ft_num);
	}
	
}
