package com.jhta.project.vo;

public class ShopFilterTypeVo {
private int ft_num;
private String ft_name;

public ShopFilterTypeVo() {}
public int getFt_num() {
	return ft_num;
}
public void setFt_num(int ft_num) {
	this.ft_num = ft_num;
}
public String getFt_name() {
	return ft_name;
}
public void setFt_name(String ft_name) {
	this.ft_name = ft_name;
}
@Override
public String toString() {
	return "ShopFilterTypeVo [ft_num=" + ft_num + ", ft_name=" + ft_name + "]";
}
public ShopFilterTypeVo(int ft_num, String ft_name) {
	super();
	this.ft_num = ft_num;
	this.ft_name = ft_name;
}


}
