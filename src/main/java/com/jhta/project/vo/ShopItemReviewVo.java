package com.jhta.project.vo;

import java.sql.Date;

public class ShopItemReviewVo {
	private int rv_num;
	private String title;
	private String content;
	private Date regdate;
	private int hit;
	private int lev;
	private int step;
	private int star;
	private int p_num;
	
	
	public ShopItemReviewVo() {}
	public int getRv_num() {
		return rv_num;
	}

	public void setRv_num(int rv_num) {
		this.rv_num = rv_num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getLev() {
		return lev;
	}

	public void setLev(int lev) {
		this.lev = lev;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	
	public ShopItemReviewVo(int rv_num, String title, String content, Date regdate, int hit, int lev, int step,
			int star, int p_num) {
		super();
		this.rv_num = rv_num;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.hit = hit;
		this.lev = lev;
		this.step = step;
		this.star = star;
		this.p_num = p_num;
	}
	
	
	
}
