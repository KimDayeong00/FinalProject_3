package com.jhta.project.vo;

import java.util.Date;

public class petsitterVO {
	private String ps_email;
	private String ps_pwd;
	private String ps_phone;
	private String ps_name;
	private String ps_addr1;
	private String ps_addr2;
	private String ps_content;
	private Date ps_regdate;
 
	public petsitterVO() {
		// TODO Auto-generated constructor stub
	}

	public petsitterVO(String ps_email, String ps_pwd, String ps_phone, String ps_name, String ps_addr1,
			String ps_addr2, String ps_content, Date ps_regdate) {
		super();
		this.ps_email = ps_email;
		this.ps_pwd = ps_pwd;
		this.ps_phone = ps_phone;
		this.ps_name = ps_name;
		this.ps_addr1 = ps_addr1;
		this.ps_addr2 = ps_addr2;
		this.ps_content = ps_content;
		this.ps_regdate = ps_regdate;
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

	@Override
	public String toString() {
		return "petsitterVO [ps_email=" + ps_email + ", ps_pwd=" + ps_pwd + ", ps_phone=" + ps_phone + ", ps_name="
				+ ps_name + ", ps_addr1=" + ps_addr1 + ", ps_addr2=" + ps_addr2 + ", ps_content=" + ps_content
				+ ", ps_regdate=" + ps_regdate + "]";
	}
	 
	
	
}
