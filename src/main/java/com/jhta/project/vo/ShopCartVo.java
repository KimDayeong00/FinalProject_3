package com.jhta.project.vo;

public class ShopCartVo {
private int num;
private String title;
private int price;
private int cnt;
private String url;



public int getNum() {
	return num;
}

public void setNum(int num) {
	this.num = num;
}

public String getTitle() {
	return title;
}

public void setTitle(String title) {
	this.title = title;
}

public int getPrice() {
	return price;
}

public void setPrice(int price) {
	this.price = price;
}

public int getCnt() {
	return cnt;
}

public void setCnt(int cnt) {
	this.cnt = cnt;
}

public String getUrl() {
	return url;
}

public void setUrl(String url) {
	this.url = url;
}

public ShopCartVo() {}

public ShopCartVo(int num, String title, int price, int cnt, String url) {
	super();
	this.num = num;
	this.title = title;
	this.price = price;
	this.cnt = cnt;
	this.url = url;
}

@Override
public String toString() {
	return "ShopCartVo [num=" + num + ", title=" + title + ", price=" + price + ", cnt=" + cnt + ", url=" + url + "]";
}

}
