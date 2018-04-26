package com.jhta.project.vo;

public class ShopClassVo {
private int classnum;
private String name;

public ShopClassVo() {}
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
@Override
public String toString() {
	return "ShopClassVo [classnum=" + classnum + ", name=" + name + "]";
}
public ShopClassVo(int classnum, String name) {
	super();
	this.classnum = classnum;
	this.name = name;
}

}
