package com.myezen.myapp.domain;

public class Criteria {
	
	private int page;
	private int perPageNum;   

	public Criteria(){
		this.page = 1;
		this.perPageNum = 20;
	}	
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}

	
	
	
	
}
