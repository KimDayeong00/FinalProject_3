package com.jhta.project.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.dao.ShopDao;
import com.jhta.project.vo.OrderItemListVo;
import com.jhta.project.vo.ShopClassVo;
import com.jhta.project.vo.ShopFieldVo;
import com.jhta.project.vo.ShopFilterContentVo;
import com.jhta.project.vo.ShopFilterTypeVo;
import com.jhta.project.vo.ShopItemImageVo;
import com.jhta.project.vo.ShopItemJoinVo;
import com.jhta.project.vo.ShopItemReviewVo;
import com.jhta.project.vo.ShopItemVo;
import com.jhta.project.vo.ShopPayBoardVo;

@Service
public class ShopService {
	@Autowired private ShopDao dao;
	
	public List<ShopClassVo> classlist() {
		return dao.classlist();
	}
	
	public List<ShopFieldVo> fieldlist(int classnum) {
		return dao.fieldlist(classnum);
	}
	
	public List<ShopItemVo> itemlist(HashMap<Object, Object> map2) {
		return dao.itemlist(map2);
	}
	
	public List<ShopFilterTypeVo> filtertype(int fieldnum) {
		return dao.filtertype(fieldnum);
	}
	
	public List<ShopFilterContentVo> filtercontent(int ft_num) {
		return dao.filtercontent(ft_num);
	}
	
	public List<ShopItemVo> classitemlist(HashMap<String, Object> map) {
		return dao.classitemlist(map);
	}
	
	public List<ShopItemVo> fielditemlist(HashMap<Object,Object> map) {
		return dao.fielditemlist(map);
	}
	
	public List<ShopItemVo> hotitem() {
		return dao.hotitem();
	}
	
	public List<ShopItemVo> newitem() {
		return dao.newitem();
	}
	
	public int classcnt(int classnum) {
		return dao.classcnt(classnum);
	}
	public int fieldcnt(int fieldnum) {
		return dao.fieldcnt(fieldnum);
	}
	public int itemcnt(HashMap<Object, Object> map2) {
		return dao.itemcnt(map2);
	}
	
	public ShopItemVo iteminfo(int p_num) {
		return dao.iteminfo(p_num);
	}
	public List<ShopItemReviewVo> itemreview(int p_num) {
		return dao.itemreview(p_num);
	}
	
	public List<ShopItemImageVo> imglist(int p_num){
		return dao.imglist(p_num);
	}
	public int getbuynum() {
		return dao.getbuynum();
	}
	public int payinsert(ShopPayBoardVo vo) {
		return dao.payinsert(vo);
	}
	public int orderinsert(OrderItemListVo vo) {
		return dao.orderinsert(vo);
	}
}
