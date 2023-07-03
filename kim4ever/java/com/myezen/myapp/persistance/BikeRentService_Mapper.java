package com.myezen.myapp.persistance;






import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.web.multipart.MultipartFile;

import com.myezen.myapp.domain.BikeJoinVo;
import com.myezen.myapp.domain.BikeVo;
import com.myezen.myapp.domain.ErrorVo;
import com.myezen.myapp.domain.MemberVo;
import com.myezen.myapp.domain.RentalshopVo;
import com.myezen.myapp.domain.SearchCriteria;

public interface BikeRentService_Mapper {

	//자전거상세보기
	public BikeJoinVo RentDetail(int bkidx);
	
	//업데이트문 bikeState Y(사용가능) ->N(사용중)
	public void updateBikeState(int bkidx);
	
	public int bikeGetRsidx(int bkidx);
	
	//인설트문 bike1234테이블(자전거관련정보)에서 대여를 해야하니까 rent1234(대여)로 insert 
	public int insertRentInfo(BikeJoinVo bjv);

	//대여 내역
	public BikeJoinVo RentUseList(int bkidx);
	
	public String getBikeLocationByBkidx(int bkidx);
	
	
	//휴대폰번호,인증번호 데이터베이스에 저장
	public void savePhoneNumberVerification(BikeJoinVo bjv);
	//인증번호를 받아서 일치 여부 확인
	public boolean verifyPhoneNumber(String userPhoneNumber, int randomNumber);
	//휴대폰 번호를 받아서 해당 번호에 대해 저장된 인증번호를 가져오는 역할
	public int getSavedRandomNumber(String userPhoneNumber);
	//휴대폰 인증완료 -> 인증상태 Y로 변경
	public void updateVerificationStatus(String userPhoneNumber);
	//midx로 휴대폰번호 조회하기
	public MemberVo getMemberPhoneByMidx(int midx);
	//자전거소개 추가등록
	public void insertBikeRent(BikeJoinVo bjv);
	//자전거소개 정보조회
	public ArrayList<BikeJoinVo> getBikeList();
	//자전거소개 정보삭제
	public void deleteBikeByType(String bikeType);
	
	
	
	
	
	
	
	
	/*----------------------------------------------*/
	
    //고장/신고 작성 메소드
    public int bikeRentErrorInsert(ErrorVo ev);
    //자전거 상태 E로 변경
    public int bikeRentStateE(int bkidx);
    //자전거 대여 상태 Y로 변경
    public int bikeRentStateY(int ridx);

    //대여소 QR을 찍고 반납하기 메소드
    public BikeJoinVo bikeRentReturnCheck(int ridx, int rsidx);
    
    //반납하기 체크하고 최종반납하기 메소드에서
    //0. 파라미터에 맞는 데이터 DB에서가져오기
    public BikeJoinVo bikeRentOneSelect(int ridx, int rsidx);
    //1. 자전거테이블에 자전거 상태 반납(N)으로 바꾸기
    //   자전거테이블에 자전거 위치 바꾸기
    public int bikeRentBikeUpdate(int bkidx, String bikeLocation);
    //1.2 대여 테이블 대여상태 Y
    public int bikeRentUpdate(int ridx);   
	//2. 반납테이블에 컬럼 생성하기
    public int bikeRentReturnInsert(String RentalshopName,int ridx);

    //대여이력 총 리스트 가져오기 
    public int bikeRentHistoryListTotal(HashMap<String, Object> hm);
	//대여이력보기
    public ArrayList<BikeJoinVo> bikeRentHistoryList(HashMap<String, Object> hm);

    public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber);
    
    //대여소 자전거 남은 갯수
    public ArrayList<BikeJoinVo>availableStations();

	//리뷰 작성
    public int reviewInsert(String reviewContent);
	
	//QR자전거 코드 가져오기
    public ArrayList<BikeVo> bikeRentQRbkidx();
    //QR대여소 코드 가져오기
    public ArrayList<RentalshopVo> bikeRentQRrsidx();
}
