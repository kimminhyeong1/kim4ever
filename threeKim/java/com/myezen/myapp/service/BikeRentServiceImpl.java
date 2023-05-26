package com.myezen.myapp.service;





import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public BikeJoinVo RentDetail(int bkidx) {
		
		 return brsm.RentDetail(bkidx);
	}
	
	//대여 목록 정보 조회
	@Override

	public BikeJoinVo RentUseList(int bkidx) {
		//트랜잭션
		//업데이트
		
		//삽입
		//리스트조회
		// 대여 상태 변경
		RentUseListAction(bkidx);
		
		// 대여 내역 조회
		return brsm.RentUseList(bkidx);
	}
	

	@Override
	public void RentUseListAction(int bkidx) {
		 /// 대여 상태 변경
		brsm.RentUseListAction(bkidx);
       
        
		// 정보 이동
		BikeJoinVo bjv =brsm.RentUseList(bkidx);
	   
        
        
        brsm.insertRentInfo(bjv);
		
	}





	
	
	/*----------------------------------------------*/
	
    @Override
    public int bikeRentErrorInsert(String errorContent,int ridx) {
        System.out.println("서비스단에 들어옴");
        int value = brsm.bikeRentErrorInsert(errorContent,ridx);
        return value;
    }

	
	
	
	
	
	
	
	
	
	

}
