package com.myezen.myapp.persistance;






import com.myezen.myapp.domain.BikeJoinVo;

public interface BikeRentService_Mapper {

	//자전거상세보기
	public BikeJoinVo RentDetail(int bkidx);
	
	//대여 내역
	public BikeJoinVo RentUseList(int bkidx);
	
	
	
	
	
	
	
	
	
	
	/*----------------------------------------------*/
	
    //고장/신고 작성 메소드
    public int bikeRentErrorInsert(String errorContent,int ridx);
	
	
	
	
	
	
}
