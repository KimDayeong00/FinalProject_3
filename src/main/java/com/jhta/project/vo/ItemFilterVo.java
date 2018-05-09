package com.jhta.project.vo;

public class ItemFilterVo {
	private int if_num;
	private int p_num;
	private int fc_num;
	public ItemFilterVo() {}
	public ItemFilterVo(int if_num, int p_num, int fc_num) {
		super();
		this.if_num = if_num;
		this.p_num = p_num;
		this.fc_num = fc_num;
	}
	public int getIf_num() {
		return if_num;
	}
	public void setIf_num(int if_num) {
		this.if_num = if_num;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public int getFc_num() {
		return fc_num;
	}
	public void setFc_num(int fc_num) {
		this.fc_num = fc_num;
	}
}
