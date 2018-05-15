package com.jhta.project.vo;

import java.util.Date;

public class memberVO {
	private String m_email;
	private String m_pwd;
	private String m_name;
	private String m_phone;
	private String m_addr;
	private String m_grade;
	private Date m_regdate;
	private int m_gubun;
	private String m_saveimage;
	private String m_originalimg;

	public memberVO() {
	}

	public memberVO(String m_email, String m_pwd, String m_name, String m_phone, String m_addr, String m_grade,
			Date m_regdate, int m_gubun,String m_saveimage, String m_originalimg) {
		super();
		this.m_email = m_email;
		this.m_pwd = m_pwd;
		this.m_name = m_name;
		this.m_phone = m_phone;
		this.m_addr = m_addr;
		this.m_grade = m_grade;
		this.m_regdate = m_regdate;
		this.m_gubun = m_gubun;
		this.m_saveimage = m_saveimage;
		this.m_originalimg = m_originalimg;
	}

	public int getM_gubun() {
		return m_gubun;
	}

	public void setM_gubun(int m_gubun) {
		this.m_gubun = m_gubun;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_pwd() {
		return m_pwd;
	}

	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_addr() {
		return m_addr;
	}

	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}

	public String getM_grade() {
		return m_grade;
	}

	public void setM_grade(String m_grade) {
		this.m_grade = m_grade;
	}

	public Date getM_regdate() {
		return m_regdate;
	}

	public void setM_regdate(Date m_regdate) {
		this.m_regdate = m_regdate;
	}
	
	
	

	public String getM_saveimage() {
		return m_saveimage;
	}

	public void setM_saveimage(String m_saveimage) {
		this.m_saveimage = m_saveimage;
	}

	public String getM_originalimg() {
		return m_originalimg;
	}

	public void setM_originalimg(String m_originalimg) {
		this.m_originalimg = m_originalimg;
	}

	@Override
	public String toString() {
		return "memberVO [m_email=" + m_email + ", m_pwd=" + m_pwd + ", m_name=" + m_name + ", m_phone=" + m_phone
				+ ", m_addr=" + m_addr + ", m_grade=" + m_grade + ", m_regdate=" + m_regdate + ", m_gubun=" + m_gubun
				+ "]";
	}

	
	
}
