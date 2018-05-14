package com.jhta.project.vo;

public class MpageVo {
	private String m_num;
	private String content;
	public MpageVo() {}
	public MpageVo(String m_num, String content) {
		super();
		this.m_num = m_num;
		this.content = content;
	}
	public String getM_num() {
		return m_num;
	}
	public void setM_num(String m_num) {
		this.m_num = m_num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
