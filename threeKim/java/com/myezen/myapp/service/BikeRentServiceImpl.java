package com.myezen.myapp.service;





import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.web.multipart.MultipartFile;

import com.myezen.myapp.domain.BikeJoinVo;
import com.myezen.myapp.domain.ErrorVo;
import com.myezen.myapp.domain.MemberVo;
import com.myezen.myapp.persistance.BikeRentService_Mapper;
import com.myezen.myapp.util.AESUtil;
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
	
	//휴대폰번호,인증번호 데이터베이스에 저장
	public void savePhoneNumberVerification(BikeJoinVo bjv) {
		brsm.savePhoneNumberVerification(bjv);
		
	}

	//인증번호 받아서 일치 여부 확인
	@Override
	public boolean verifyPhoneNumber(String userPhoneNumber, int randomNumber) {
		 int savedRandomNumber = brsm.getSavedRandomNumber(userPhoneNumber);
	        if (savedRandomNumber == randomNumber) {
	            // 인증번호 일치
	        	brsm.updateVerificationStatus(userPhoneNumber); // 인증번호수정
	            return true;
	        }
	        return false;
	    }

	//휴대폰번호를 받아서 해당 번호에 대해 저장된 인증번호를 가져옴
	@Override
	public int getSavedRandomNumber(String userPhoneNumber) {
		return brsm.getSavedRandomNumber(userPhoneNumber);
	}

	//인증번호가 일치하면 인증상태 ->Y로 변경 , 인증번호를 NULL값으로 변경 
	@Override
	public void updateVerificationStatus(String userPhoneNumber) {
		brsm.updateVerificationStatus(userPhoneNumber);
		
	}

	//midx로 휴대폰번호 조회하기
	@Override public MemberVo getMemberPhoneByMidx(int midx) {
	  
		return brsm.getMemberPhoneByMidx(midx); 
	}
	
	//자전거 소개에서 추가등록할때 이미지 경로
	@Override
	public String processBikeRentWrite(MultipartFile file, BikeJoinVo bjv) {
		
		//배포했을때
        //String savedFilePath = request.getSession().getServletContext().getRealPath("/resources/bikeImages");
		String savedFilePath = "D://threekim//threeKim//src//main//webapp//resources/bikeImages";
		// 파일을 실제 경로에 저장
	    try {
	        String originalFilename = file.getOriginalFilename();
	        String extension = FilenameUtils.getExtension(originalFilename);
	        String newFilename = UUID.randomUUID().toString() + "." + extension;
	        String fullPath = savedFilePath + "\\" + newFilename;
	        File destination = new File(fullPath);
	        file.transferTo(destination);

	        // BikeJoinVo에 업로드된 파일명 설정
	        bjv.setUploadFile(newFilename);

	        // 데이터베이스에 자전거 정보 삽입
	        brsm.insertBikeRent(bjv);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }

	    return savedFilePath;
	}

	//자전거 소개 정보조회
	@Override
	public ArrayList<BikeJoinVo> getBikeList() {
		 ArrayList<BikeJoinVo> bikeList = brsm.getBikeList();
		   
		    
		    return bikeList;
	}
	
	//자전거 정보삭제
	@Override
	public void deleteBikeByType(String bikeType) {
		brsm.deleteBikeByType(bikeType);
		
	}





	




	
	@Autowired
	private HttpServletRequest request;
	
	
	
	/*----------------------------------------------*/
	
    @Override
    @Transactional
    //고장/신고하기 //String errorContent,int ridx,String latitude,String longitude,String address
    public int bikeRentErrorInsert(ErrorVo ev,MultipartFile file) {
        System.out.println("서비스단에 들어옴");
        int value = 0;
        //배포했을때
        //String savedFilePath = request.getSession().getServletContext().getRealPath("/resources/bikeError");
		// 파일을 실제 경로에 저장
        String savedFilePath = "D://threekim//threeKim//src//main//webapp//resources/bikeError";
        System.out.println(savedFilePath);
	    try {
	        String originalFilename = file.getOriginalFilename();
	        String extension = FilenameUtils.getExtension(originalFilename);
	        String newFilename = UUID.randomUUID().toString() + "." + extension;
	        String fullPath = savedFilePath + "\\" + newFilename;
	        File destination = new File(fullPath);
	        file.transferTo(destination);

	        // ErrorVo에 업로드된 파일명 설정
	        ev.setErrorImage(newFilename);

	        //고장테이블에 고장정보 삽입
	        value = brsm.bikeRentErrorInsert(ev);
	        //자전거테이블에 자전거 상태 E로 변환
	        value = brsm.bikeRentStateE(ev.getBkidx()); 
	        
	    } catch (IOException e) {
	        e.printStackTrace();
	    }

	    
	
        
        
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
	public ArrayList<String> QRBikeCode() throws Exception {
		
		/*URL파라미터값 암호화*/
        String ebkidx1 = AESUtil.encrypt("1");
        String ebkidx2 = AESUtil.encrypt("2");
        String ebkidx3 = AESUtil.encrypt("3");
		
		
		// QR 코드 설정
		String url1 = "http://localhost:8080/myapp/bikeRent/bikeRentDetail/"+ebkidx1+"/view.do"; // QR 코드에 포함될 URL
		String url2 = "http://localhost:8080/myapp/bikeRent/bikeRentDetail/"+ebkidx2+"/view.do"; // QR 코드에 포함될 URL
		String url3 = "http://localhost:8080/myapp/bikeRent/bikeRentDetail/"+ebkidx3+"/view.do"; // QR 코드에 포함될 URL
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
	public ArrayList<String> QRRentalShopCode() throws Exception {
		
		/*URL파라미터값 암호화*/
        String ersidx1 = AESUtil.encrypt("1");
        String ersidx2 = AESUtil.encrypt("2");
        String ersidx3 = AESUtil.encrypt("3");
		
		// QR 코드 설정
		String url1 = "http://localhost:8080/myapp/bikeRent/bikeRentDetail/"+ersidx1+"/view.do"; // QR 코드에 포함될 URL
		String url2 = "http://localhost:8080/myapp/bikeRent/bikeRentDetail/"+ersidx2+"/view.do"; // QR 코드에 포함될 URL
		String url3 = "http://localhost:8080/myapp/bikeRent/bikeRentDetail/"+ersidx3+"/view.do"; // QR 코드에 포함될 URL
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
	//대여소 자전거 남은 갯수
	public ArrayList<BikeJoinVo> availableStations() {
		
		ArrayList<BikeJoinVo> bjvlist = brsm.availableStations();
		
		
		return bjvlist;
	}


	




	
	
	
	
	
	

}
