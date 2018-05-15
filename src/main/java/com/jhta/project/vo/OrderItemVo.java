package com.jhta.project.vo;

public class OrderItemVo {

private String item_name;
private int amount;
private String price;
private int p_num;
private String image_name;

public OrderItemVo() {}

public String getItem_name() {
	return item_name;
}

public void setItem_name(String item_name) {
	this.item_name = item_name;
}

public int getAmount() {
	return amount;
}

public void setAmount(int amount) {
	this.amount = amount;
}

public String getPrice() {
	return price;
}

public void setPrice(String price) {
	this.price = price;
}

public int getP_num() {
	return p_num;
}

public void setP_num(int p_num) {
	this.p_num = p_num;
}

public String getImage_name() {
	return image_name;
}

public void setImage_name(String image_name) {
	this.image_name = image_name;
}

@Override
public String toString() {
	return "OrderItemVo [item_name=" + item_name + ", amount=" + amount + ", price=" + price + ", p_num=" + p_num
			+ ", image_name=" + image_name + "]";
}

public OrderItemVo(String item_name, int amount, String price, int p_num, String image_name) {
	super();
	this.item_name = item_name;
	this.amount = amount;
	this.price = price;
	this.p_num = p_num;
	this.image_name = image_name;
}



}
