package com.jhta.project.vo;

public class FilterTypeListVo {
	private String fl_name;
	private String f_type;
	public FilterTypeListVo() {}
	public FilterTypeListVo(String fl_name, String f_type) {
		super();
		this.fl_name = fl_name;
		this.f_type = f_type;
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
