package com.myezen.myapp.service;





import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;


import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.myezen.myapp.domain.BikeJoinVo;
import com.myezen.myapp.persistance.BikeRentService_Mapper;
import com.myezen.myapp.util.QRCodeUtil;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service("BikeRentServiceImpl")
public class BikeRentServiceImpl implements BikeRentService {
	private BikeRentService_Mapper brsm;
	
	@Autowired
	public BikeRentServiceImpl(SqlSession sqlSession) {
		this.brsm = sqlSession.getMapper(BikeRentService_Mapper.class);
	}

	
	//QR로 넘어온 자전거정보 조회
	@Override
	public BikeJoinVo RentDetail(int bkidx) {
		
		 return brsm.RentDetail(bkidx);
	}
	
	//bikeState를 Y(사용가능)에서 N(사용중)으로 변경 쿼리
	@Override
	public void updateBikeState(int bkidx) {
		brsm.updateBikeState(bkidx);
		
	}
	//bike1234와 rentalShop1234조인해서 rsidx(대여소번호) 가져오기
	@Override
	public int bikeGetRsidx(int bkidx) {
		
		return brsm.bikeGetRsidx(bkidx);
	}
		
	//bike1234의 테이블의 자전거정보들을 rent1234테이블로 삽입 쿼리
	@Override
	public int insertRentInfo(BikeJoinVo bjv, int rsidx) {
		
		//bkidx(자전거번호)를 가져와서 그 bkidx에 해당하는 위치를 가져온다
		int bkidx = bjv.getBkidx();
		String bikeLocation = brsm.getBikeLocationByBkidx(bkidx);
		
		//bikeLocation값을 받아와서 rentPlace로 설정
		bjv.setRentPlace(bikeLocation);
		//bikeGetRsidx에서 받아온 rsidx를 받는다
		bjv.setRsidx(rsidx);
		
		    
		return brsm.insertRentInfo(bjv);
	}
	
	//bkidx로 자전거위치 가져오는 쿼리
	@Override
	public String getBikeLocationByBkidx(int bkidx) {
		
		return brsm.getBikeLocationByBkidx(bkidx);
	}

	
	//대여 목록 정보 조회
	@Override
	public BikeJoinVo RentUseList(int bkidx) {
		
		return brsm.RentUseList(bkidx);
	}
	
	//휴대폰인증
	@Override
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
		String api_key = "NCSQ6K8YB71UK1Q5";
	    String api_secret = "RCJYGI0IER077RL27WSVXY75ZDIFKGFT";
	    Message coolsms = new Message(api_key, api_secret);

<<<<<<< HEAD
=======
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", userPhoneNumber);    // 수신전화번호
	    params.put("from", "01056309412");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", "[TEST] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	        JSONObject obj = (JSONObject) coolsms.send(params);
	        System.out.println(obj.toString());
	      } catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
	      }
		
	}




	
	
	
	
>>>>>>> 휴대폰인증
	
	
	/*----------------------------------------------*/
	
    @Override
    //고장/신고하기
    public int bikeRentErrorInsert(String errorContent,int ridx) {
        System.out.println("서비스단에 들어옴");
        int value = brsm.bikeRentErrorInsert(errorContent,ridx);
        return value;
    }


	@Override
	//반납하기
	public BikeJoinVo bikeRentReturnCheck(int ridx, int rsidx) {
		

		System.out.println("반납하기 서비스단들어오기");
		

		BikeJoinVo bjv = brsm.bikeRentReturnCheck(ridx, rsidx);
		System.out.println(bjv.getBikeCode());
		
		
		
		
		return bjv;
	}

	
	@Override
	@Transactional
	//최종반납하기 
	public int bikeRentReturn(int ridx, int rsidx) {
		
		BikeJoinVo bjv = brsm.bikeRentOneSelect(ridx, rsidx);
		System.out.println(""+bjv.getBkidx()+""+bjv.getBikeLocation()+""+bjv.getBikeState()+""+bjv.getRentalshopName()+""+bjv.getRidx());
		int value1 =brsm.bikeRentBikeUpdate(bjv.getBkidx(),bjv.getRentalshopName()); //자전거 업데이트
		int value2 =brsm.bikeRentReturnInsert(bjv.getRentalshopName(),bjv.getRidx());//자전거 반납

			return value2;			
	}

	@Override
	//대여이력보기
	public ArrayList<BikeJoinVo> bikeRentHistoryList(int midx) {
		
		ArrayList<BikeJoinVo> bjvlist = brsm.bikeRentHistoryList(midx);

		return bjvlist;
	}

	
	@Override
	//자전거QR생성
	public ArrayList<String> QRBikeCode() {
		
		// QR 코드 설정
		String url1 = "http://localhost:8080/myapp/bikeRent/bikeRentDetail.do?bkidx=1"; // QR 코드에 포함될 URL
		String url2 = "http://localhost:8080/myapp/bikeRent/bikeRentDetail.do?bkidx=2"; // QR 코드에 포함될 URL
		String url3 = "http://localhost:8080/myapp/bikeRent/bikeRentDetail.do?bkidx=3"; // QR 코드에 포함될 URL
		int width = 300; // 원하는 가로 크기
		int height = 300; // 원하는 세로 크기
		
		// QR 코드 생성
		QRCodeUtil qrCodeUtil1 = new QRCodeUtil();
		String qrCode1 = qrCodeUtil1.generateQRCode(url1, width, height);
		QRCodeUtil qrCodeUtil2 = new QRCodeUtil();
		String qrCode2 = qrCodeUtil2.generateQRCode(url2, width, height);
		QRCodeUtil qrCodeUtil3 = new QRCodeUtil();
		String qrCode3 = qrCodeUtil3.generateQRCode(url3, width, height);
		
		// QR 코드 담기
		ArrayList<String> QRList = new ArrayList<>();
		QRList.add(qrCode1);
		QRList.add(qrCode2);
		QRList.add(qrCode3);
		
		return QRList;
	}


	@Override
	//대여소QR생성
	public ArrayList<String> QRRentalShopCode() {
		
		// QR 코드 설정
		String url1 = "http://localhost:8080/myapp/bikeRent/bikeRentDetail.do?rsidx=1"; // QR 코드에 포함될 URL
		String url2 = "http://localhost:8080/myapp/bikeRent/bikeRentDetail.do?rsidx=2"; // QR 코드에 포함될 URL
		String url3 = "http://localhost:8080/myapp/bikeRent/bikeRentDetail.do?rsidx=3"; // QR 코드에 포함될 URL
		int width = 300; // 원하는 가로 크기
		int height = 300; // 원하는 세로 크기
		
		// QR 코드 생성
		QRCodeUtil qrCodeUtil1 = new QRCodeUtil();
		String qrCode1 = qrCodeUtil1.generateQRCode(url1, width, height);
		QRCodeUtil qrCodeUtil2 = new QRCodeUtil();
		String qrCode2 = qrCodeUtil2.generateQRCode(url2, width, height);
		QRCodeUtil qrCodeUtil3 = new QRCodeUtil();
		String qrCode3 = qrCodeUtil3.generateQRCode(url3, width, height);
		
		// QR 코드 담기
		ArrayList<String> QRList = new ArrayList<>();
		QRList.add(qrCode1);
		QRList.add(qrCode2);
		QRList.add(qrCode3);
		
		return QRList;
	}

	
	
	

	
	
	
	
	
	

}
