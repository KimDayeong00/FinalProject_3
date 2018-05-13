package com.jhta.project.vo;

public class IntroduceVo {
	private String i_num;
	private String content;
	public IntroduceVo() {}
	public IntroduceVo(String i_num, String content) {
		super();
		this.i_num = i_num;
		this.content = content;
	}
	public String getI_num() {
		return i_num;
	}
	public void setI_num(String i_num) {
		this.i_num = i_num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
