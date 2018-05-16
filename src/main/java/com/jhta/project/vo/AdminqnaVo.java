package com.jhta.project.vo;

import java.sql.Date;

public class AdminqnaVo {
	private int aqnum;
	private String aqtitle;
	private String aqcontent;
	private Date aqregdate;
	private int aqhit;
	private int aqrefer;
	private int aqlev;
	private int aqstep;
	private String aqcomments;
	private int qnum;
	
	public AdminqnaVo() {}
	
	public AdminqnaVo(int aqnum, String aqtitle, String aqcontent, Date aqregdate, int aqhit, int aqrefer, int aqlev,
			int aqstep, String aqcomments, int qnum) {
		super();
		this.aqnum = aqnum;
		this.aqtitle = aqtitle;
		this.aqcontent = aqcontent;
		this.aqregdate = aqregdate;
		this.aqhit = aqhit;
		this.aqrefer = aqrefer;
		this.aqlev = aqlev;
		this.aqstep = aqstep;
		this.aqcomments = aqcomments;
		this.qnum = qnum;
	}

	public int getAqnum() {
		return aqnum;
	}

	public void setAqnum(int aqnum) {
		this.aqnum = aqnum;
	}

	public String getAqtitle() {
		return aqtitle;
	}

	public void setAqtitle(String aqtitle) {
		this.aqtitle = aqtitle;
	}

	public String getAqcontent() {
		return aqcontent;
	}

	public void setAqcontent(String aqcontent) {
		this.aqcontent = aqcontent;
	}

	public Date getAqregdate() {
		return aqregdate;
	}

	public void setAqregdate(Date aqregdate) {
		this.aqregdate = aqregdate;
	}

	public int getAqhit() {
		return aqhit;
	}

	public void setAqhit(int aqhit) {
		this.aqhit = aqhit;
	}

	public int getAqrefer() {
		return aqrefer;
	}

	public void setAqrefer(int aqrefer) {
		this.aqrefer = aqrefer;
	}

	public int getAqlev() {
		return aqlev;
	}

	public void setAqlev(int aqlev) {
		this.aqlev = aqlev;
	}

	public int getAqstep() {
		return aqstep;
	}

	public void setAqstep(int aqstep) {
		this.aqstep = aqstep;
	}

	public String getAqcomments() {
		return aqcomments;
	}

	public void setAqcomments(String aqcomments) {
		this.aqcomments = aqcomments;
	}

	public int getQnum() {
		return qnum;
	}

	public void setQnum(int qnum) {
		this.qnum = qnum;
	}

	@Override
	public String toString() {
		return "AdminqnaVo [aqnum=" + aqnum + ", aqtitle=" + aqtitle + ", aqcontent=" + aqcontent + ", aqregdate="
				+ aqregdate + ", aqhit=" + aqhit + ", aqrefer=" + aqrefer + ", aqlev=" + aqlev + ", aqstep=" + aqstep
				+ ", aqcomments=" + aqcomments + ", qnum=" + qnum + "]";
	}
	
	
	
	
}
