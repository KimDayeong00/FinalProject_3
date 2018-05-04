package com.jhta.project.vo;

public class DisableDateVo {
	private String disday;
	private String disDate;
	private String ps_email;
	
	public DisableDateVo() {}

	public DisableDateVo(String disday, String disDate, String ps_email) {
		super();
		this.disday = disday;
		this.disDate = disDate;
		this.ps_email = ps_email;
	}

	public String getDisday() {
		return disday;
	}

	public void setDisday(String disday) {
		this.disday = disday;
	}

	public String getDisDate() {
		return disDate;
	}

	public void setDisDate(String disDate) {
		this.disDate = disDate;
	}

	public String getPs_email() {
		return ps_email;
	}

	public void setPs_email(String ps_email) {
		this.ps_email = ps_email;
	}

}
