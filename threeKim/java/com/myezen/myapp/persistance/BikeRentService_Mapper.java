package com.myezen.myapp.persistance;

import java.util.ArrayList;

import com.myezen.myapp.domain.BikeVo;

public interface BikeRentService_Mapper {

	public BikeVo getBikeDetails(int bkidx);
	
	
	
	
	
	
	
	
	
	
	
	/*----------------------------------------------*/
	
    //고장/신고 작성 메소드
    public int bikeRentErrorInsert(String errorContent,int ridx);
	
	
	
	
	
	
}
