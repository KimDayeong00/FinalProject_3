package com.jhta.project.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.dao.ShopAdminDao;
import com.jhta.project.vo.ItemFilterVo;
import com.jhta.project.vo.ShopClassJoinShopFieldVo;
import com.jhta.project.vo.ShopClassVo;
import com.jhta.project.vo.ShopFieldVo;
import com.jhta.project.vo.ShopItemImageVo;
import com.jhta.project.vo.ShopItemVo;

@Service
public class ShopAdminServiceImpl{
	@Autowired private ShopAdminDao dao;
	public ShopItemVo itemgetinfo(int p_num){
		return dao.itemgetinfo(p_num);
	}
	
	public List<ItemFilterVo>itemfiltergetinfo(int p_num){
		return dao.itemfiltergetinfo(p_num);
	}
	
	public List<ShopItemImageVo>itemimggetinfo(int p_num){
		return dao.itemimggetinfo(p_num);
	}
	
	public List<ShopClassJoinShopFieldVo> list(){
		return dao.list();
	}
	
	public List<ShopItemVo> itemlist (HashMap<Object, Object>map) {
		return dao.itemlist(map);
	}
	
	public int delete(String p_num) {
		return dao.delete(p_num);
	}
	public int imgdelete(String p_num) {
		return dao.imgdelete(p_num);
	}

	public List<ShopClassVo> classlist() {
		return dao.classlist();
	}
	
	public List<ShopFieldVo> fieldlist(int classnum) {
		// TODO Auto-generated method stub
		return dao.fieldlist(classnum);
	}
	
	public int itemadd(ShopItemVo vo) {
		return dao.itemadd(vo);
	}
	public int update(ShopItemVo vo) {
		return dao.update(vo);
	}
	
	public int maxpnum() {
		return dao.maxpnum();
	}

	public int multifile(HashMap<String, Object> map) {
		return dao.multifile(map);
	}
	
	public int itemimage(HashMap<String, Object> map) {
		return dao.itemimage(map);
	}
}
