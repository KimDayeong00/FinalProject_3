package com.jhta.project.vo;

public class MpetInfoVo {
	private int pi_num;
	private String pi_name;
	private String pi_age;
	private String pi_type;
	private int pi_weight;
	private String m_email;
	private String pi_orgfilename;
	private String pi_savefilename;
	private String pi_sex;
	private String pi_content;
	private int pi_gubun;
	private String pi_img;
	public MpetInfoVo() {}
	public MpetInfoVo(int pi_num, String pi_name, String pi_age, String pi_type, int pi_weight, String m_email,
			String pi_orgfilename, String pi_savefilename, String pi_sex, String pi_content, int pi_gubun,
			String pi_img) {
		super();
		this.pi_num = pi_num;
		this.pi_name = pi_name;
		this.pi_age = pi_age;
		this.pi_type = pi_type;
		this.pi_weight = pi_weight;
		this.m_email = m_email;
		this.pi_orgfilename = pi_orgfilename;
		this.pi_savefilename = pi_savefilename;
		this.pi_sex = pi_sex;
		this.pi_content = pi_content;
		this.pi_gubun = pi_gubun;
		this.pi_img = pi_img;
	}
	public int getPi_num() {
		return pi_num;
	}
	public void setPi_num(int pi_num) {
		this.pi_num = pi_num;
	}
	public String getPi_name() {
		return pi_name;
	}
	public void setPi_name(String pi_name) {
		this.pi_name = pi_name;
	}
	public String getPi_age() {
		return pi_age;
	}
	public void setPi_age(String pi_age) {
		this.pi_age = pi_age;
	}
	public String getPi_type() {
		return pi_type;
	}
	public void setPi_type(String pi_type) {
		this.pi_type = pi_type;
	}
	public int getPi_weight() {
		return pi_weight;
	}
	public void setPi_weight(int pi_weight) {
		this.pi_weight = pi_weight;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getPi_orgfilename() {
		return pi_orgfilename;
	}
	public void setPi_orgfilename(String pi_orgfilename) {
		this.pi_orgfilename = pi_orgfilename;
	}
	public String getPi_savefilename() {
		return pi_savefilename;
	}
	public void setPi_savefilename(String pi_savefilename) {
		this.pi_savefilename = pi_savefilename;
	}
	public String getPi_sex() {
		return pi_sex;
	}
	public void setPi_sex(String pi_sex) {
		this.pi_sex = pi_sex;
	}
	public String getPi_content() {
		return pi_content;
	}
	public void setPi_content(String pi_content) {
		this.pi_content = pi_content;
	}
	public int getPi_gubun() {
		return pi_gubun;
	}
	public void setPi_gubun(int pi_gubun) {
		this.pi_gubun = pi_gubun;
	}
	public String getPi_img() {
		return pi_img;
	}
	public void setPi_img(String pi_img) {
		this.pi_img = pi_img;
	}
	
}
