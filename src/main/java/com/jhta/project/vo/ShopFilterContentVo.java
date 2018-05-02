package com.jhta.project.vo;

public class ShopFilterContentVo {
	private int fc_num;
	private int ft_num;
	private String fc_name;
	
	public ShopFilterContentVo() {}
	public ShopFilterContentVo(int fc_num, int ft_num, String fc_name) {
		super();
		this.fc_num = fc_num;
		this.ft_num = ft_num;
		this.fc_name = fc_name;
	}
	@Override
	public String toString() {
		return "ShopFilterContentVo [fc_num=" + fc_num + ", ft_num=" + ft_num + ", fc_name=" + fc_name + "]";
	}
	public int getFc_num() {
		return fc_num;
	}
	public void setFc_num(int fc_num) {
		this.fc_num = fc_num;
	}
	public int getFt_num() {
		return ft_num;
	}
	public void setFt_num(int ft_num) {
		this.ft_num = ft_num;
	}
	public String getFc_name() {
		return fc_name;
	}
	public void setFc_name(String fc_name) {
		this.fc_name = fc_name;
	}
	
	
}
