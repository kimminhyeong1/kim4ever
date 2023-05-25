package com.myezen.myapp.persistance;




import java.util.ArrayList;

import com.myezen.myapp.domain.BikeJoinVo;

public interface BikeRentService_Mapper {

	//자전거상세보기
	public BikeJoinVo getBikeRentDetail(int bkidx);
	
	public void updateBikeState(int bkidx, String bikeState);
	
	public ArrayList<BikeJoinVo> getRentalList();
	
	
	
	
	
	
	
	/*----------------------------------------------*/
	
    //고장/신고 작성 메소드
    public int bikeRentErrorInsert(String errorContent,int ridx);
	
	
	
	
	
	
}
