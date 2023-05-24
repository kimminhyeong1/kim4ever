package com.myezen.myapp.service;




import com.myezen.myapp.domain.BikeVo;

public interface BikeRentService {
	
	//!차후삭제!!
	int abc();
	
	
	public BikeVo getBikeDetails(int bkidx);
	
	
	
	
	
	
	
	
	
	
	/*----------------------------------------------*/
    //고장/신고 작성 메소드
    public int bikeRentErrorInsert(String errorContent,int ridx);
	
	
	
	
	
	
	
	
}
