package com.jhta.project.vo;

public class PetsitterPetVo {
	private int pi_num;
	private String pi_name;
	private int pi_age;
	private String pi_type;
	private int pi_weight;
	private String pi_content;
	private String ps_email;
	private String pi_savefilename;
	private String pi_originalfilename;
	
	public PetsitterPetVo() {}

	public PetsitterPetVo(int pi_num, String pi_name, int pi_age, String pi_type, int pi_weight, String pi_content,
			String ps_email, String pi_savefilename, String pi_originalfilename) {
		super();
		this.pi_num = pi_num;
		this.pi_name = pi_name;
		this.pi_age = pi_age;
		this.pi_type = pi_type;
		this.pi_weight = pi_weight;
		this.pi_content = pi_content;
		this.ps_email = ps_email;
		this.pi_savefilename = pi_savefilename;
		this.pi_originalfilename = pi_originalfilename;
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

	public int getPi_age() {
		return pi_age;
	}

	public void setPi_age(int pi_age) {
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

	public String getPi_content() {
		return pi_content;
	}

	public void setPi_content(String pi_content) {
		this.pi_content = pi_content;
	}

	public String getPs_email() {
		return ps_email;
	}

	public void setPs_email(String ps_email) {
		this.ps_email = ps_email;
	}

	public String getPi_savefilename() {
		return pi_savefilename;
	}

	public void setPi_savefilename(String pi_savefilename) {
		this.pi_savefilename = pi_savefilename;
	}

	public String getPi_originalfilename() {
		return pi_originalfilename;
	}

	public void setPi_originalfilename(String pi_originalfilename) {
		this.pi_originalfilename = pi_originalfilename;
	}
	
	
}
