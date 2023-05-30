package com.myezen.myapp.persistance;






import java.util.ArrayList;



import com.myezen.myapp.domain.BikeJoinVo;

public interface BikeRentService_Mapper {

	//자전거상세보기
	public BikeJoinVo RentDetail(int bkidx);
	
	//업데이트문 bikeState Y(사용가능) ->N(사용중)
	public void updateBikeState(int bkidx);
	
	//인설트문 bike1234테이블(자전거관련정보)에서 대여를 해야하니까 rent1234(대여)로 insert 
	public void insertRentInfo(BikeJoinVo bjv);

	//대여 내역
	public BikeJoinVo RentUseList(int bkidx,int rkidx, int midx);
		
	public String getBikeLocationByBkidx(int bkidx);
	
	
	
	
	
	/*----------------------------------------------*/
	
    //고장/신고 작성 메소드
    public int bikeRentErrorInsert(String errorContent,int ridx);


    //대여소 QR을 찍고 반납하기 메소드
    public BikeJoinVo bikeRentReturnCheck(int ridx, int rsidx);
    
    //반납하기 체크하고 최종반납하기 메소드에서
    //0. 파라미터에 맞는 데이터 DB에서가져오기
    public BikeJoinVo bikeRentOneSelect(int ridx, int rsidx);
    //1. 자전거테이블에 자전거 상태 반납(N)으로 바꾸기
    //   자전거테이블에 자전거 위치 바꾸기
    public int bikeRentBikeUpdate(int bkidx, String bikeLocation);
	//2. 반납테이블에 컬럼 생성하기
    public int bikeRentReturnInsert(String RentalshopName,int ridx);

    //대여이력보기
    public ArrayList<BikeJoinVo> bikeRentHistoryList(int midx);

	

	
	
	
}
