package com.jhta.project.vo;

public class ShopClassFieldVo {
	private int classnum;
	private String name;
	private int fieldnum;
	private int classnum_1;
	private String name_1;
	
	public ShopClassFieldVo(int classnum, String name, int fieldnum, int classnum_1, String name_1) {
		super();
		this.classnum = classnum;
		this.name = name;
		this.fieldnum = fieldnum;
		this.classnum_1 = classnum_1;
		this.name_1 = name_1;
	}
	
	public ShopClassFieldVo() {}
	
	@Override
	public String toString() {
		return "ShopClassFieldVo [classnum=" + classnum + ", name=" + name + ", fieldnum=" + fieldnum + ",classnum_1=" + classnum_1 +", name_1=" + name_1 + "]";
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

	public int getFieldnum() {
		return fieldnum;
	}

	public void setFieldnum(int fieldnum) {
		this.fieldnum = fieldnum;
	}

	public int getClassnum_1() {
		return classnum_1;
	}

	public void setClassnum_1(int classnum_1) {
		this.classnum_1 = classnum_1;
	}

	public String getName_1() {
		return name_1;
	}

	public void setName_1(String name_1) {
		this.name_1 = name_1;
	}
}
