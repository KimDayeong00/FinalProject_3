package com.jhta.project.vo;

public class FilterVo {
	private int f_num;
	private String ps_email;
	private String fl_name;
	private String f_type;
	public FilterVo() {}
	public FilterVo(int f_num, String ps_email, String fl_name, String f_type) {
		super();
		this.f_num = f_num;
		this.ps_email = ps_email;
		this.fl_name = fl_name;
		this.f_type = f_type;
	}
	public int getF_num() {
		return f_num;
	}
	public void setF_num(int f_num) {
		this.f_num = f_num;
	}
	public String getPs_email() {
		return ps_email;
	}
	public void setPs_email(String ps_email) {
		this.ps_email = ps_email;
	}
	public String getFl_name() {
		return fl_name;
	}
	public void setFl_name(String fl_name) {
		this.fl_name = fl_name;
	}
	public String getF_type() {
		return f_type;
	}
	public void setF_type(String f_type) {
		this.f_type = f_type;
	}
}
