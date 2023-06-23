package com.myezen.myapp.domain;

public class ImageVO {//이미지업로드
	
	private int imidx;//이미지 번호
	private String imageName;//이미지 이름
	private String imageWriter;//이미지 작성자
	private String imageUpload;//이미지 업로드
	private int midx;//회원 번호
	private int giidx;//모임 정보 번호
	private int gbidx;//모임 게시판 번호
	private int gpaidx;//모임 사진첩 번호
	private String ImgType;//이미지 구분
	private int imageNum;
	
	/*
	이미지 구분
	노말 이미지 : N

	모임

	모임 멤버 대표 이미지: GMT
	모임 대표 이미지: GT
	모임 이미지 : G
	모임 사진첩 대표 이미지:GAT
	모임 사진첩 이미지:GA
	모임 게시글 이미지:GB
	*/
	public int getImageNum() {
		return imageNum;
	}
	public void setImageNum(int imageNum) {
		this.imageNum = imageNum;
	}
	public int getImidx() {
		return imidx;
	}
	public void setImidx(int imidx) {
		this.imidx = imidx;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public String getImageWriter() {
		return imageWriter;
	}
	public void setImageWriter(String imageWriter) {
		this.imageWriter = imageWriter;
	}
	public String getImageUpload() {
		return imageUpload;
	}
	public void setImageUpload(String imageUpload) {
		this.imageUpload = imageUpload;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public int getGiidx() {
		return giidx;
	}
	public void setGiidx(int giidx) {
		this.giidx = giidx;
	}
	public int getGbidx() {
		return gbidx;
	}
	public void setGbidx(int gbidx) {
		this.gbidx = gbidx;
	}
	public int getGpaidx() {
		return gpaidx;
	}
	public void setGpaidx(int gpaidx) {
		this.gpaidx = gpaidx;
	}
	public String getImgType() {
		return ImgType;
	}
	public void setImgType(String imgType) {
		ImgType = imgType;
	}
	
	
	
	
	
	
	
	
	
	
	
}
