package com.jhta.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.dao.ShopAdminDao;
import com.jhta.project.vo.ShopClassVo;
import com.jhta.project.vo.ShopFieldVo;

@Service
public class ShopAdminService {
@Autowired ShopAdminDao dao;

public List<ShopClassVo> classlist() {
	return dao.classlist();
}

public List<ShopFieldVo> fieldlist(int classnum) {
	return dao.fieldlist(classnum);
}
}
