package com.jhta.project.vo;

import java.util.Date;

public class QnaVo {
	private int qnum;
	private String title;
	private String content;
	private Date regdate;
	private int hit;
	private int refer;
	private int lev;
	private int step;
	private int p_num;
	private String comments;

	public QnaVo() {}

	public QnaVo(int qnum, String title, String content, Date regdate, int hit, int refer, int lev, int step, int p_num, String comments) {
		super();
		this.qnum = qnum;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.hit = hit;
		this.refer = refer;
		this.lev = lev;
		this.step = step;
		this.p_num = p_num;
		this.comments = comments;
	}

	public int getQnum() {
		return qnum;
	}

	public void setQnum(int qnum) {
		this.qnum = qnum;
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

	public int getRefer() {
		return refer;
	}

	public void setRefer(int refer) {
		this.refer = refer;
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

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	
	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}
}
