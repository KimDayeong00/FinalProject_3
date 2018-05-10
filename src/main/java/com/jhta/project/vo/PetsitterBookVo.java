package com.jhta.project.vo;

public class PetsitterBookVo {
	private  int bk_num;
	private String bk_startdate;
	private String bk_enddate;
	private String bk_situation;
	private String m_email;
	private String ps_email;
	private String ps_name;
	
	public PetsitterBookVo() {}

	public PetsitterBookVo(int bk_num, String bk_startdate, String bk_enddate, String bk_situation, String m_email,
			String ps_email,String ps_name) {
		super();
		this.bk_num = bk_num;
		this.bk_startdate = bk_startdate;
		this.bk_enddate = bk_enddate;
		this.bk_situation = bk_situation;
		this.m_email = m_email;
		this.ps_email = ps_email;
		this.ps_name = ps_name;
	}

	public int getBk_num() {
		return bk_num;
	}

	public void setBk_num(int bk_num) {
		this.bk_num = bk_num;
	}

	public String getBk_startdate() {
		return bk_startdate;
	}

	public void setBk_startdate(String bk_startdate) {
		this.bk_startdate = bk_startdate;
	}

	public String getBk_enddate() {
		return bk_enddate;
	}

	public void setBk_enddate(String bk_enddate) {
		this.bk_enddate = bk_enddate;
	}

	public String getBk_situation() {
		return bk_situation;
	}

	public void setBk_situation(String bk_situation) {
		this.bk_situation = bk_situation;
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

	public String getPs_name() {
		return ps_name;
	}

	public void setPs_name(String ps_name) {
		this.ps_name = ps_name;
	}

	
	
}
