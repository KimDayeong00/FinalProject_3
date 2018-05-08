package com.jhta.project.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.dao.ShopAdminDao;
import com.jhta.project.vo.ShopClassJoinShopFieldVo;
import com.jhta.project.vo.ShopItemVo;

@Service
public class ShopAdminServiceImpl implements ShopAdminService {
	@Autowired
	ShopAdminDao dao;
	public List<ShopClassJoinShopFieldVo> list(){
		return dao.list();
	}
	@Override
	public List<ShopItemVo> itemlist(HashMap<Object, Object>map) {
		return dao.itemlist(map);
	}
	@Override
	public int delete(String p_num) {
		return dao.delete(p_num);
	}
/*	public List<ShopClassVo> classlist() {
		return dao.classlist();
	}

	public List<ShopFieldVo> fieldlist(int classnum) {
		return dao.fieldlist(classnum);
	}

	public int itemadd(ShopItemVo vo) {
		return dao.itemadd(vo);
	}

	public int maxpnum() {
		return dao.maxpnum();
	}

	public int imageadd(ShopItemImageVo vo) {
		return dao.imageadd(vo);
	}

	public int itemimage(HashMap<String, Object> map) {
		return dao.itemimage(map);
	}*/
}
