package com.jhta.project.vo;

public class PetSitterPriceVo {
	private String ps_email;
	private int ps_price;
	private int ps_careprice;
	private int ps_overprice;
	public PetSitterPriceVo() {}
	public PetSitterPriceVo(String ps_email, int ps_price, int ps_careprice, int ps_overprice) {
		super();
		this.ps_email = ps_email;
		this.ps_price = ps_price;
		this.ps_careprice = ps_careprice;
		this.ps_overprice = ps_overprice;
	}
	public String getPs_email() {
		return ps_email;
	}
	public void setPs_email(String ps_email) {
		this.ps_email = ps_email;
	}
	public int getPs_price() {
		return ps_price;
	}
	public void setPs_price(int ps_price) {
		this.ps_price = ps_price;
	}
	public int getPs_careprice() {
		return ps_careprice;
	}
	public void setPs_careprice(int ps_careprice) {
		this.ps_careprice = ps_careprice;
	}
	public int getPs_overprice() {
		return ps_overprice;
	}
	public void setPs_overprice(int ps_overprice) {
		this.ps_overprice = ps_overprice;
	}
}
