package com.jhta.project.vo;

public class ShopItemImageVo {
	private int item_num;
	private String item_savefilename;
	private int p_num;
	
	
	public ShopItemImageVo() {}
	
	public ShopItemImageVo(int item_num, String item_savefilename, int p_num) {
		super();
		this.item_num = item_num;
		this.item_savefilename = item_savefilename;
		this.p_num = p_num;
	}
	public int getItem_num() {
		return item_num;
	}
	public void setItem_num(int item_num) {
		this.item_num = item_num;
	}
	public String getItem_savefilename() {
		return item_savefilename;
	}
	public void setItem_savefilename(String item_savefilename) {
		this.item_savefilename = item_savefilename;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	@Override
	public String toString() {
		return "ShopItemImageVo [item_num=" + item_num + ", item_savefilename=" + item_savefilename + ", p_num=" + p_num
				+ "]";
	}
	
	
}
