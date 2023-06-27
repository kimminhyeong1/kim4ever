package com.myezen.myapp.service;








import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.myezen.myapp.domain.BikeJoinVo;
import com.myezen.myapp.domain.ErrorVo;
import com.myezen.myapp.domain.MemberVo;
import com.myezen.myapp.domain.SearchCriteria;
import com.myezen.myapp.util.QRCodeUtil;

public interface BikeRentService {
	
	//QR자전거생성
	public ArrayList<String> QRBikeCode() throws Exception;
	//QR대여소생성
	public ArrayList<String> QRRentalShopCode() throws Exception;
	
	//자전거상세보기
	public BikeJoinVo RentDetail(int bkidx);
	
	
	//업데이트문 bikeState Y(사용가능) ->N(사용중)
	public void updateBikeState(int bkidx);
	
	//셀렉문 bike1234와 rentalshop1234 조인해서 rsdix값 꺼내오기
	public int bikeGetRsidx(int bkidx); 
	
	//인설트문 bike1234테이블(자전거관련정보)에서 대여를 해야하니까 rent1234(대여)로 insert 
	public int insertRentInfo(BikeJoinVo bjv, int rsidx);
	
	//대여 내역
	public BikeJoinVo RentUseList(int bkidx);
	
	public String getBikeLocationByBkidx(int bkidx);
	
	//휴대폰 인증
    //public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber);

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
	//자전거소개 자전거등록
	public String processBikeRentWrite(MultipartFile file, BikeJoinVo bjv , HttpServletRequest request);
	//자전거 정보 조회
	public ArrayList<BikeJoinVo> getBikeList();
	//자전거 정보 삭제
	public void deleteBikeByType(String bikeType);
	
	
	/*----------------------------------------------*/
    //고장/신고 작성 메소드
    public int bikeRentErrorInsert(ErrorVo ev,MultipartFile file, HttpServletRequest request);
    
	//대여소 QR을 찍고 반납하기 체크 메소드
    public BikeJoinVo bikeRentReturnCheck(int ridx, int rsidx);
	//반납하기 체크하고 최종반납하기 메소드
    public int bikeRentReturn(int ridx, int rsidx);
    //대여이력 총 리스트 가져오기 
    public int bikeRentHistoryListTotal(int midx,SearchCriteria scri);
	//대여이력보기
    public ArrayList<BikeJoinVo> bikeRentHistoryList(int midx,SearchCriteria scri);
	
    //대여소 자전거 남은 갯수
    public ArrayList<BikeJoinVo>availableStations();
	
	
	
	
	
}
