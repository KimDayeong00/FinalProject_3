package com.jhta.project.vo;

public class PetSitterFilterVo {
	private String f_type;
	private String fl_name;
	
	public PetSitterFilterVo() {}

	public PetSitterFilterVo(String f_type, String fl_name) {
		super();
		this.f_type = f_type;
		this.fl_name=fl_name;
	}

	public String getF_type() {
		return f_type;
	}

	public void setF_type(String f_type) {
		this.f_type = f_type;
	}

	public String getFl_name() {
		return fl_name;
	}

	public void setFl_name(String fl_name) {
		this.fl_name = fl_name;
	}

}
