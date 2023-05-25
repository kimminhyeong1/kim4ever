package com.myezen.myapp.service;



import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myezen.myapp.domain.BikeVo;
import com.myezen.myapp.domain.BikeJoinVo;
import com.myezen.myapp.persistance.BikeRentService_Mapper;

@Service("BikeRentServiceImpl")
public class BikeRentServiceImpl implements BikeRentService {
	private BikeRentService_Mapper brsm;
	
	@Autowired
	public BikeRentServiceImpl(SqlSession sqlSession) {
		this.brsm = sqlSession.getMapper(BikeRentService_Mapper.class);
	}

	@Override //!차후삭제!
	public int abc() { 
		// TODO Auto-generated method stub
		return 0;
	}

	//자전거상세보기
	@Override
	public BikeJoinVo getBikeRentDetail(int bkidx) {
		
		 return brsm.getBikeRentDetail(bkidx);
	}

	 @Override
	    public ArrayList<BikeJoinVo> getRentalList() {
	        return brsm.getRentalList();
	    }
	@Override
	public void updateBikeState(int bkidx, String bikeState) {
		brsm.updateBikeState(bkidx, bikeState);
		
	}

	 

	





	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*----------------------------------------------*/
	
    @Override
    public int bikeRentErrorInsert(String errorContent,int ridx) {
        System.out.println("서비스단에 들어옴");
        int value = brsm.bikeRentErrorInsert(errorContent,ridx);
        return value;
    }
	
	
	
	
	
	
	
	
	
	
	
	

}
