package com.jhta.project.vo;

public class PayVo2 {
	private int pay_num;
	private int pay_price;
	private String pay_date;
	private int patsitter_price;
	private int comn;
	private String m_email;
	private int bk_num;
	
	public PayVo2() {}

	public PayVo2(int pay_num, int pay_price, String pay_date, int patsitter_price, int comn, String m_email,
			int bk_num) {
		super();
		this.pay_num = pay_num;
		this.pay_price = pay_price;
		this.pay_date = pay_date;
		this.patsitter_price = patsitter_price;
		this.comn = comn;
		this.m_email = m_email;
		this.bk_num = bk_num;
	}

	public int getPay_num() {
		return pay_num;
	}

	public void setPay_num(int pay_num) {
		this.pay_num = pay_num;
	}

	public int getPay_price() {
		return pay_price;
	}

	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}

	public String getPay_date() {
		return pay_date;
	}

	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}

	public int getPatsitter_price() {
		return patsitter_price;
	}

	public void setPatsitter_price(int patsitter_price) {
		this.patsitter_price = patsitter_price;
	}

	public int getComn() {
		return comn;
	}

	public void setComn(int comn) {
		this.comn = comn;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public int getBk_num() {
		return bk_num;
	}

	public void setBk_num(int bk_num) {
		this.bk_num = bk_num;
	}
	
}
