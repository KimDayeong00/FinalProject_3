package com.jhta.project.vo;

import java.sql.Date;

public class ReviewListVo {
	private int r_num;
	private String r_content;
	private int r_score;
	private Date r_regdate;
	private String m_email;
	private String ps_email;
	private int bk_num;
	private String m_name;
	
	public ReviewListVo() {}

	public ReviewListVo(int r_num, String r_content, int r_score, Date r_regdate, String m_email, String ps_email,
			int bk_num, String m_name) {
		super();
		this.r_num = r_num;
		this.r_content = r_content;
		this.r_score = r_score;
		this.r_regdate = r_regdate;
		this.m_email = m_email;
		this.ps_email = ps_email;
		this.bk_num = bk_num;
		this.m_name = m_name;
	}

	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public int getR_score() {
		return r_score;
	}

	public void setR_score(int r_score) {
		this.r_score = r_score;
	}

	public Date getR_regdate() {
		return r_regdate;
	}

	public void setR_regdate(Date r_regdate) {
		this.r_regdate = r_regdate;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getPs_email() {
		return ps_email;
	}

	public void setPs_email(String ps_email) {
		this.ps_email = ps_email;
	}

	public int getBk_num() {
		return bk_num;
	}

	public void setBk_num(int bk_num) {
		this.bk_num = bk_num;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	
	
}
