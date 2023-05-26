package com.myezen.myapp.persistance;






import com.myezen.myapp.domain.BikeJoinVo;

public interface BikeRentService_Mapper {

	//자전거상세보기
	public BikeJoinVo RentDetail(int bkidx);
	
	public void updateBikeStateInfo(int bkidx);
	
	//대여 내역
	public BikeJoinVo RentUseList(int bkidx);
	
	public void insertRentInfo(BikeJoinVo bjv);
	
	public void RentUseListAction(int bkidx);

	
	
	
	
	
	
	
	
	/*----------------------------------------------*/
	
    //고장/신고 작성 메소드
    public int bikeRentErrorInsert(String errorContent,int ridx);
	
	
	
	
	
	
}
