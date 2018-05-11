package com.jhta.project.vo;


public class payVO {

	private int count;
	private String created_date;
	
	public payVO() {
	}

	public payVO(int count, String created_date) {
		super();
		this.count = count;
		this.created_date = created_date;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getCreated_date() {
		return created_date;
	}

	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}

	@Override
	public String toString() {
		return "payVO [count=" + count + ", created_date=" + created_date + "]";
	}
	
	
	
}
