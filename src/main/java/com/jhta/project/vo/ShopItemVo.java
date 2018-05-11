package com.jhta.project.vo;

import java.sql.Date;

public class ShopItemVo {
private int p_num;
private String item_name;
private int price;
private Date regdate;
private int stock;
private int fieldnum;
private String content;
private String image_name;

public ShopItemVo() {}


public ShopItemVo(int p_num, String item_name, int price, Date regdate, int stock, int fieldnum, String content,
		String image_name) {
	super();
	this.p_num = p_num;
	this.item_name = item_name;
	this.price = price;
	this.regdate = regdate;
	this.stock = stock;
	this.fieldnum = fieldnum;
	this.content = content;
	this.image_name = image_name;
}




@Override
public String toString() {
	return "ShopItemVo [p_num=" + p_num + ", item_name=" + item_name + ", price=" + price + ", regdate=" + regdate
			+ ", stock=" + stock + ", fieldnum=" + fieldnum + ", content=" + content + ", image_name=" + image_name
			+ "]";
}


public int getP_num() {
	return p_num;
}


public void setP_num(int p_num) {
	this.p_num = p_num;
}


public String getItem_name() {
	return item_name;
}


public void setItem_name(String item_name) {
	this.item_name = item_name;
}


public int getPrice() {
	return price;
}


public void setPrice(int price) {
	this.price = price;
}


public Date getRegdate() {
	return regdate;
}


public void setRegdate(Date regdate) {
	this.regdate = regdate;
}


public int getStock() {
	return stock;
}


public void setStock(int stock) {
	this.stock = stock;
}


public int getFieldnum() {
	return fieldnum;
}


public void setFieldnum(int fieldnum) {
	this.fieldnum = fieldnum;
}


public String getContent() {
	return content;
}


public void setContent(String content) {
	this.content = content;
}


public String getImage_name() {
	return image_name;
}


public void setImage_name(String image_name) {
	this.image_name = image_name;
}



}
