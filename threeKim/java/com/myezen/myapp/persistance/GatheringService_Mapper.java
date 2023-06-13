package com.myezen.myapp.persistance;






import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.myezen.myapp.domain.BikeJoinVo;
import com.myezen.myapp.domain.ErrorVo;
import com.myezen.myapp.domain.GatheringJoinVo;
import com.myezen.myapp.domain.Gathering_InfoVo;
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
	//모임 소개페이지 리스트 가져오기
	public ArrayList<GatheringJoinVo> gatheringOneSimpleListSelect(int giidx);
	//사용자가 모임상세페이지를 들어갈수있는지 확인
	public int gatheringMemberCheck(int giidx, int midx);
	//모임상세리스트 가져오기
	public ArrayList<GatheringJoinVo> gatheringOneListSelect(int giidx);
	
	/*모임 가입*/
	//1.모임 가입타입 확인하기
	public Gathering_InfoVo gatheringJoinTypeCheck(int giidx);
	//2.모임 가입타입 확인후 데이터넣기 A OR B
	public int gatheringJoinTypeAInsert(int giidx, int midx);
	public int gatheringJoinTypeBInsert(int giidx, int midx);
	//3.모임 가입시 모임 참여멤버 수 1증가
	public int gatheringParticipatingUpdate(int giidx);
	
	/*찜*/
	//1.찜하기
	public int gatheringWish(int giidx, int midx);
	//2.찜삭제
	public int gatheringWishDel(int giidx, int midx);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
