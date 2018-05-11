package com.jhta.project.vo;

import java.util.List;

public class ShopClassJoinShopFieldVo {
	private int classnum;
	private String name;
	private List<ShopFieldVo> list;
	public ShopClassJoinShopFieldVo() {}
	public ShopClassJoinShopFieldVo(int classnum, String name, List<ShopFieldVo> list) {
		super();
		this.classnum = classnum;
		this.name = name;
		this.list = list;
	}
	public int getClassnum() {
		return classnum;
	}
	public void setClassnum(int classnum) {
		this.classnum = classnum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<ShopFieldVo> getList() {
		return list;
	}
	public void setList(List<ShopFieldVo> list) {
		this.list = list;
	}
}
