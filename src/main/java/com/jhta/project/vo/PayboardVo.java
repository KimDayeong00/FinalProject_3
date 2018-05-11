package com.jhta.project.vo;

import java.util.Date;

public class PayboardVo {
	private int buy_num;
	private Date buy_date;
	private String name;
	private String addr;
	private String caddr;
	private int accprice;
	private String m_email;
	
	public PayboardVo() {}

	public PayboardVo(int buy_num, Date buy_date, String name, String addr, String caddr, int accprice,
			String m_email) {
		super();
		this.buy_num = buy_num;
		this.buy_date = buy_date;
		this.name = name;
		this.addr = addr;
		this.caddr = caddr;
		this.accprice = accprice;
		this.m_email = m_email;
	}

	public int getBuy_num() {
		return buy_num;
	}

	public void setBuy_num(int buy_num) {
		this.buy_num = buy_num;
	}

	public Date getBuy_date() {
		return buy_date;
	}

	public void setBuy_date(Date buy_date) {
		this.buy_date = buy_date;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getCaddr() {
		return caddr;
	}

	public void setCaddr(String caddr) {
		this.caddr = caddr;
	}

	public int getAccprice() {
		return accprice;
	}

	public void setAccprice(int accprice) {
		this.accprice = accprice;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
}
