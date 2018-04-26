package com.jhta.project.vo;

public class PetSitterImageVo {
	private String pimg_num;
	private String ps_email;
	private String pimg_savefilename;
	private String pimg_orgfilename;
	public PetSitterImageVo() {};
	public PetSitterImageVo(String pimg_num, String ps_email, String pimg_savefilename, String pimg_orgfilename) {
		super();
		this.pimg_num = pimg_num;
		this.ps_email = ps_email;
		this.pimg_savefilename = pimg_savefilename;
		this.pimg_orgfilename = pimg_orgfilename;
	}
	public String getPimg_num() {
		return pimg_num;
	}
	public void setPimg_num(String pimg_num) {
		this.pimg_num = pimg_num;
	}
	public String getPs_email() {
		return ps_email;
	}
	public void setPs_email(String ps_email) {
		this.ps_email = ps_email;
	}
	public String getPimg_savefilename() {
		return pimg_savefilename;
	}
	public void setPimg_savefilename(String pimg_savefilename) {
		this.pimg_savefilename = pimg_savefilename;
	}
	public String getPimg_orgfilename() {
		return pimg_orgfilename;
	}
	public void setPimg_orgfilename(String pimg_orgfilename) {
		this.pimg_orgfilename = pimg_orgfilename;
	}
}
