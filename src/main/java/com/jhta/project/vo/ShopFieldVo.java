package com.jhta.project.vo;

public class ShopFieldVo {
	private int fieldnum;
	private int classnum;
	private String name;
	
	
	@Override
	public String toString() {
		return "ShopFieldVo [fieldnum=" + fieldnum + ", classnum=" + classnum + ", name=" + name + "]";
	}

	public ShopFieldVo() {}
	
	public ShopFieldVo(int fieldnum, int classnum, String name) {
		super();
		this.fieldnum = fieldnum;
		this.classnum = classnum;
		this.name = name;
	}
	public int getFieldnum() {
		return fieldnum;
	}
	public void setFieldnum(int fieldnum) {
		this.fieldnum = fieldnum;
	}
	public int getClassnum() {
		return classnum;
	}
	public void setClassnum(int classnum) {
		this.classnum = classnum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	
}
