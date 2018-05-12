package com.jhta.project.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.project.vo.ItemFilterVo;
import com.jhta.project.vo.ShopClassJoinShopFieldVo;
import com.jhta.project.vo.ShopClassVo;
import com.jhta.project.vo.ShopFieldVo;
import com.jhta.project.vo.ShopFilterContentVo;
import com.jhta.project.vo.ShopFilterTypeVo;
import com.jhta.project.vo.ShopItemImageVo;
import com.jhta.project.vo.ShopItemVo;

@Repository
public class ShopAdminDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.mybatis.ShopAdminMapper";
	public ShopItemVo itemgetinfo(int p_num){
		return sqlSession.selectOne(NAMESPACE+".itemgetinfo", p_num);
	}
	public List<ItemFilterVo>itemfiltergetinfo(int p_num){
		return sqlSession.selectList(NAMESPACE+".itemfiltergetinfo", p_num);
	}
	public List<ShopItemImageVo>itemimggetinfo(int p_num){
		return sqlSession.selectList(NAMESPACE+".itemimggetinfo", p_num);
	}
	public List<ShopClassJoinShopFieldVo> list() {
		return sqlSession.selectList(NAMESPACE+".list");
	}
	public List<ShopItemVo> itemlist(HashMap<Object, Object>map) {
		return sqlSession.selectList(NAMESPACE+".itemlist",map);
	}
	public List<ShopFilterTypeVo> filtertypelist() {
		return sqlSession.selectList(NAMESPACE+".filtertypelist");
	}
	public int delete(String p_num) {
		return sqlSession.delete(NAMESPACE+".remove",p_num);
	}
	public int imgdelete(String p_num) {
		return sqlSession.delete(NAMESPACE+".imgremove",p_num);
	}
	public int update(ShopItemVo vo) {
		return sqlSession.update(NAMESPACE+".itemupdate",vo);
	}
	public List<ShopClassVo> classlist() {
		return sqlSession.selectList(NAMESPACE+".classlist");
	}
	
	public List<ShopFieldVo> fieldlist(int classnum){
		return sqlSession.selectList(NAMESPACE+".fieldlist",classnum);
	}
	
	public int itemadd(ShopItemVo vo) {
		return sqlSession.insert(NAMESPACE+".itemadd",vo);
	}
	public int classinsert(String name) {
		return sqlSession.insert(NAMESPACE+".classInsert",name);
	}
	public int fieldinsert(ShopFieldVo vo) {
		return sqlSession.insert(NAMESPACE+".fieldInsert",vo);
	}
	public int filtertypeinsert(String ft_name) {
		return sqlSession.insert(NAMESPACE+".filtertypeinsert",ft_name);
	}
	public List<ShopFilterContentVo> filtercontentlist() {
		return sqlSession.selectList(NAMESPACE+".filtercontentlist");
	}
	public int filtercontentinsert(ShopFilterContentVo vo) {
		return sqlSession.insert(NAMESPACE+".filtercontentinsert",vo);
	}
	public List<ShopFilterContentVo> filtercontent(int ft_num) {
		return sqlSession.selectList(NAMESPACE+".filtercontent",ft_num);
	}
	
	public int maxpnum() {
		return sqlSession.selectOne(NAMESPACE+".maxpnum");
	}
	
	
	
	public int itemimage(HashMap<String, Object> map) {
		return sqlSession.update(NAMESPACE+".itemimage",map);
	}
	public int multifile(HashMap<String,Object> map) {
		return sqlSession.insert(NAMESPACE+".multifile",map);
	}
}
