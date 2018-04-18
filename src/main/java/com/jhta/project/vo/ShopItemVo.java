package com.jhta.project.vo;

import java.sql.Date;

public class ShopItemVo {
private int p_num;
private String item_name;
private int price;
private Date regdate;
private int stock;
private int fieldnum;


@Override
public String toString() {
	return "ShopItemVo [p_num=" + p_num + ", item_name=" + item_name + ", price=" + price + ", regdate=" + regdate
			+ ", stock=" + stock + ", fieldnum=" + fieldnum + "]";
}
public ShopItemVo() {}
public ShopItemVo(int p_num, String item_name, int price, Date regdate, int stock, int fieldnum) {
	super();
	this.p_num = p_num;
	this.item_name = item_name;
	this.price = price;
	this.regdate = regdate;
	this.stock = stock;
	this.fieldnum = fieldnum;
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


}
