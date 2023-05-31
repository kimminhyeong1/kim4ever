package com.myezen.myapp.service;








import java.util.ArrayList;



import javax.servlet.http.HttpServletRequest;


import com.myezen.myapp.domain.BikeJoinVo;

public interface BikeRentService {
	
	//!차후삭제!!
	int abc();
	
	//자전거상세보기
	public BikeJoinVo RentDetail(int bkidx);
	
	
	//업데이트문 bikeState Y(사용가능) ->N(사용중)
	public void updateBikeState(int bkidx);
	
	//셀렉문 bike1234와 rentalshop1234 조인해서 rsdix값 꺼내오기
	public int bikeGetRsidx(int bkidx); 
	
	//인설트문 bike1234테이블(자전거관련정보)에서 대여를 해야하니까 rent1234(대여)로 insert 
	public int insertRentInfo(BikeJoinVo bjv, int rsidx);
	
	//대여 내역
	public BikeJoinVo RentUseList(int bkidx);
	
	public String getBikeLocationByBkidx(int bkidx);
	
	
	
	
	/*----------------------------------------------*/
    //고장/신고 작성 메소드
    public int bikeRentErrorInsert(String errorContent,int ridx);

	//대여소 QR을 찍고 반납하기 체크 메소드
    public BikeJoinVo bikeRentReturnCheck(int ridx, int rsidx);
	//반납하기 체크하고 최종반납하기 메소드
    public int bikeRentReturn(int ridx, int rsidx);

	//대여이력보기
    public ArrayList<BikeJoinVo> bikeRentHistoryList(int midx);


	
	
	
	
	
	
}
