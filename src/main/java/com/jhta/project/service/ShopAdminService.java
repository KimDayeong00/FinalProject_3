package com.jhta.project.service;

import java.util.HashMap;
import java.util.List;

import com.jhta.project.vo.ShopClassJoinShopFieldVo;
import com.jhta.project.vo.ShopItemVo;

public interface ShopAdminService {
	List<ShopClassJoinShopFieldVo> list();
	List<ShopItemVo> itemlist(HashMap<Object, Object>map);
	int delete(String p_num);
}
