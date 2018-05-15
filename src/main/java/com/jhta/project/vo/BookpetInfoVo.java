package com.jhta.project.vo;

public class BookpetInfoVo {
	private int bpi_num;
	private int bk_num;
	private int pi_num;
	
	public BookpetInfoVo() {}

	public BookpetInfoVo(int bpi_num, int bk_num, int pi_num) {
		super();
		this.bpi_num = bpi_num;
		this.bk_num = bk_num;
		this.pi_num = pi_num;
	}

	public int getBpi_num() {
		return bpi_num;
	}

	public void setBpi_num(int bpi_num) {
		this.bpi_num = bpi_num;
	}

	public int getBk_num() {
		return bk_num;
	}

	public void setBk_num(int bk_num) {
		this.bk_num = bk_num;
	}

	public int getPi_num() {
		return pi_num;
	}

	public void setPi_num(int pi_num) {
		this.pi_num = pi_num;
	}
	
}
