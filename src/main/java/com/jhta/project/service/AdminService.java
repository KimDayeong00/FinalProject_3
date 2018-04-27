package com.jhta.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.dao.AdminDao;
import com.jhta.project.vo.ShopClassFieldVo;
import com.jhta.project.vo.ShopClassVo;
import com.jhta.project.vo.ShopFieldVo;

@Service
public class AdminService {
	@Autowired private AdminDao dao;
	
	public List<ShopClassVo> classList(){
		return dao.classList();
	}
	public int classInsert(ShopClassVo vo) {
		return dao.classInsert(vo);
	}
	public ShopClassVo classGetinfo(String name) {
		return dao.classGetinfo(name);
	}
	public int classDelete(int classnum) {
		return dao.classDelete(classnum);
	}
	public int classUpdateOk(ShopClassVo vo) {
		return dao.classUpdateOk(vo);
	}
	
	
	
	public List<ShopClassFieldVo> fieldList(){
		return dao.fieldList();
	}
	public List<ShopClassFieldVo> fieldInfo(int classnum) {
		return dao.fieldInfo(classnum);
	}
}
