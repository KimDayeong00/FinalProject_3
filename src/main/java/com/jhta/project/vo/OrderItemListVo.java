package com.jhta.project.vo;

public class OrderItemListVo {
	private int order_num;
	private int amount;
	private String price;
	private int p_num;
	private int buy_num;
	
	public OrderItemListVo() {}
	
	public int getOrder_num() {
		return order_num;
	}



	public void setOrder_num(int order_num) {
		this.order_num = order_num;
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



	public int getBuy_num() {
		return buy_num;
	}



	public void setBuy_num(int buy_num) {
		this.buy_num = buy_num;
	}



	@Override
	public String toString() {
		return "OrderItemListVo [order_num=" + order_num + ", amount=" + amount + ", price=" + price + ", p_num="
				+ p_num + ", buy_num=" + buy_num + "]";
	}



	public OrderItemListVo(int order_num, int amount, String price, int p_num, int buy_num) {
		super();
		this.order_num = order_num;
		this.amount = amount;
		this.price = price;
		this.p_num = p_num;
		this.buy_num = buy_num;
	}
	
	
}
