package com.jhta.project.service;

import java.util.HashMap;
import java.util.List;

import com.jhta.project.vo.ShopClassJoinShopFieldVo;
import com.jhta.project.vo.ShopItemVo;

public interface ShopAdminService {
	List<ShopClassJoinShopFieldVo> list();
	List<ShopItemVo> itemlist(HashMap<Object, Object>map);
	int delete(String p_num);
/*@Service
public class ShopAdminService {
@Autowired ShopAdminDao dao;

public List<ShopClassVo> classlist() {
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

public int multifile(HashMap<String, Object> map) {
	return dao.multifile(map);
}



public int itemimage(HashMap<String, Object> map) {
	return dao.itemimage(map);
}*/
}
