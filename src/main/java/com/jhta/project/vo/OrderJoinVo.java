package com.jhta.project.vo;

import java.util.Date;
import java.util.List;

public class OrderJoinVo {

	private String m_email;
	private Date buy_date;
	private int buy_num;
	private List<OrderItemVo> list;


public OrderJoinVo() {}


@Override
public String toString() {
	return "OrderJoinVo [m_email=" + m_email + ", buy_date=" + buy_date + ", buy_num=" + buy_num + ", list=" + list
			+ "]";
}


public String getM_email() {
	return m_email;
}


public void setM_email(String m_email) {
	this.m_email = m_email;
}


public Date getBuy_date() {
	return buy_date;
}


public void setBuy_date(Date buy_date) {
	this.buy_date = buy_date;
}


public int getBuy_num() {
	return buy_num;
}


public void setBuy_num(int buy_num) {
	this.buy_num = buy_num;
}


public List<OrderItemVo> getList() {
	return list;
}


public void setList(List<OrderItemVo> list) {
	this.list = list;
}


public OrderJoinVo(String m_email, Date buy_date, int buy_num, List<OrderItemVo> list) {
	super();
	this.m_email = m_email;
	this.buy_date = buy_date;
	this.buy_num = buy_num;
	this.list = list;
}




}
