package com.myezen.myapp.persistance;






import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.myezen.myapp.domain.BikeJoinVo;
import com.myezen.myapp.domain.ErrorVo;
import com.myezen.myapp.domain.GatheringJoinVo;
import com.myezen.myapp.domain.MemberVo;

public interface GatheringService_Mapper {
	/*모임 생성*/
	//1.모임 정보 생성하기 
	public int gatheringInfoCreate(GatheringJoinVo gjv);
	//2.모임 생성하기
	public int gatheringCreate(GatheringJoinVo gjv);
	//3.모임대표 이미지 넣기
	public int gatheringGTInsert(GatheringJoinVo gjv);
	//4.모임 이미지 넣기
	public int gatheringGInsert(GatheringJoinVo gjv);
	//모임 리스트 가져오기
	public ArrayList<GatheringJoinVo> gatheringListSelect();
	//모임 나의리스트 가져오기
	public ArrayList<GatheringJoinVo> gatheringMyListSelect(int midx);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
