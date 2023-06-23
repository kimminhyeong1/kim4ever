package com.myezen.myapp.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.stereotype.Component;

@Component
public class PageMaker {
//페이지 네비게이션을 사용하기 위한 기능이 담긴 클래스
	
	private int displayPageNum = 10; //페이지네비게이션 나타내는 페이징수/ 화면 하단에 보여지는 페이지 개수
	private int startPage; //페이징의 시작점
	private int endPage;   //페이징의 끝점
	private int totalCount;//전체 게시물 수
	
	private boolean prev; //이전버튼을 누를 수 있는 경우 /없는 경우 분류를 위함
	private boolean next; //다음버튼
	
	private SearchCriteria scri; 
	
	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();   //페이징 계산식
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public SearchCriteria getScri() {
		return scri;
	}

	public void setScri(SearchCriteria scri) {
		this.scri = scri;
	}



	


	
	public void calcData() { //전체 필드 변수 값들을 계산하는 메서드
		//시작페이지 번호
		//끝페이지 번호
		//이전 다음 버튼 보여주기
		
		endPage = (int)(Math.ceil(scri.getPage()/(double)displayPageNum) * displayPageNum);
		startPage = (endPage-displayPageNum)+1;
		
		
		//실제페이지
		int tempEndPage = (int)(Math.ceil(totalCount/(double)scri.getPerPageNum()));
						 
		
		if(endPage>tempEndPage) {
			endPage = tempEndPage;
		}
		
		
		prev = (startPage == 1 ? false: true); //false면 나타내지 않음 / 1페이지면 이전 누를 수 없게 false
		next = (endPage * scri.getPerPageNum()>=totalCount ? false:true);
	
	}
	
	
	public String encoding(String keyword) {
	    String encodedString = "";
	    
	    try {
	        encodedString = URLEncoder.encode(keyword, "UTF-8");
	    } catch (UnsupportedEncodingException e) {
	        e.printStackTrace();
	    }
	    
	    return encodedString;
	}
	
	
	
	
}
