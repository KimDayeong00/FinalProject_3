package com.jhta.project.vo;

import java.util.Date;
import java.util.List;

public class PetSitterJoinFilterVo {
	private String ps_email;
	private String ps_pwd;
	private String ps_phone;
	private String ps_name;
	private String ps_addr1;
	private String ps_addr2;
	private String ps_content;
	private Date ps_regdate;
	private double ps_lat;
	private double ps_lng;
	private String ps_originalimg;
	private String ps_saveimage;
	private int ps_gubun;
	private int ps_active;
	private int ps_price;
	private int ps_careprice;
	private int ps_overprice;
	private List<FilterVo> list;
	public PetSitterJoinFilterVo() {}
	public PetSitterJoinFilterVo(String ps_email, String ps_pwd, String ps_phone, String ps_name, String ps_addr1,
			String ps_addr2, String ps_content, Date ps_regdate, double ps_lat, double ps_lng, String ps_originalimg,
			String ps_saveimage, int ps_gubun, int ps_active, int ps_price, int ps_careprice, int ps_overprice,
			List<FilterVo> list) {
		super();
		this.ps_email = ps_email;
		this.ps_pwd = ps_pwd;
		this.ps_phone = ps_phone;
		this.ps_name = ps_name;
		this.ps_addr1 = ps_addr1;
		this.ps_addr2 = ps_addr2;
		this.ps_content = ps_content;
		this.ps_regdate = ps_regdate;
		this.ps_lat = ps_lat;
		this.ps_lng = ps_lng;
		this.ps_originalimg = ps_originalimg;
		this.ps_saveimage = ps_saveimage;
		this.ps_gubun = ps_gubun;
		this.ps_active = ps_active;
		this.ps_price = ps_price;
		this.ps_careprice = ps_careprice;
		this.ps_overprice = ps_overprice;
		this.list = list;
	}
	public String getPs_email() {
		return ps_email;
	}
	public void setPs_email(String ps_email) {
		this.ps_email = ps_email;
	}
	public String getPs_pwd() {
		return ps_pwd;
	}
	public void setPs_pwd(String ps_pwd) {
		this.ps_pwd = ps_pwd;
	}
	public String getPs_phone() {
		return ps_phone;
	}
	public void setPs_phone(String ps_phone) {
		this.ps_phone = ps_phone;
	}
	public String getPs_name() {
		return ps_name;
	}
	public void setPs_name(String ps_name) {
		this.ps_name = ps_name;
	}
	public String getPs_addr1() {
		return ps_addr1;
	}
	public void setPs_addr1(String ps_addr1) {
		this.ps_addr1 = ps_addr1;
	}
	public String getPs_addr2() {
		return ps_addr2;
	}
	public void setPs_addr2(String ps_addr2) {
		this.ps_addr2 = ps_addr2;
	}
	public String getPs_content() {
		return ps_content;
	}
	public void setPs_content(String ps_content) {
		this.ps_content = ps_content;
	}
	public Date getPs_regdate() {
		return ps_regdate;
	}
	public void setPs_regdate(Date ps_regdate) {
		this.ps_regdate = ps_regdate;
	}
	public double getPs_lat() {
		return ps_lat;
	}
	public void setPs_lat(double ps_lat) {
		this.ps_lat = ps_lat;
	}
	public double getPs_lng() {
		return ps_lng;
	}
	public void setPs_lng(double ps_lng) {
		this.ps_lng = ps_lng;
	}
	public String getPs_originalimg() {
		return ps_originalimg;
	}
	public void setPs_originalimg(String ps_originalimg) {
		this.ps_originalimg = ps_originalimg;
	}
	public String getPs_saveimage() {
		return ps_saveimage;
	}
	public void setPs_saveimage(String ps_saveimage) {
		this.ps_saveimage = ps_saveimage;
	}
	public int getPs_gubun() {
		return ps_gubun;
	}
	public void setPs_gubun(int ps_gubun) {
		this.ps_gubun = ps_gubun;
	}
	public int getPs_active() {
		return ps_active;
	}
	public void setPs_active(int ps_active) {
		this.ps_active = ps_active;
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
	public List<FilterVo> getList() {
		return list;
	}
	public void setList(List<FilterVo> list) {
		this.list = list;
	}
}
