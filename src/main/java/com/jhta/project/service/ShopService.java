package com.jhta.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.dao.ShopDao;
import com.jhta.project.vo.ShopClassVo;
import com.jhta.project.vo.ShopFieldVo;
import com.jhta.project.vo.ShopFilterContentVo;
import com.jhta.project.vo.ShopFilterTypeVo;
import com.jhta.project.vo.ShopItemVo;

@Service
public class ShopService {
	@Autowired private ShopDao dao;
	
	public List<ShopClassVo> classlist() {
		return dao.classlist();
	}
	
	public List<ShopFieldVo> fieldlist(int classnum) {
		return dao.fieldlist(classnum);
	}
	
	public List<ShopItemVo> itemlist(int classnum) {
		return dao.itemlist(classnum);
	}
	
	public List<ShopFilterTypeVo> filtertype(int fieldnum) {
		return dao.filtertype(fieldnum);
	}
	
	public List<ShopFilterContentVo> filtercontent(int ft_num) {
		return dao.filtercontent(ft_num);
	}
}
