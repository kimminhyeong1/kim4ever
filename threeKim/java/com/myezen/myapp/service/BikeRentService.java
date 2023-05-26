package com.myezen.myapp.service;







import java.util.ArrayList;

import com.myezen.myapp.domain.BikeJoinVo;

public interface BikeRentService {
	
	//!차후삭제!!
	int abc();
	
	//자전거상세보기
	public BikeJoinVo RentDetail(int bkidx);
	
	

	//대여 내역
	public BikeJoinVo RentUseList(int bkidx);
	
	
	public void RentUseListAction(int bkidx);
	
	
	
	
	
	
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
