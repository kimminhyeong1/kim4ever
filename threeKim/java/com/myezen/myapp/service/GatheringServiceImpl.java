package com.myezen.myapp.service;





import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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

import com.fasterxml.jackson.annotation.JsonFormat.Value;
import com.myezen.myapp.domain.BikeJoinVo;
import com.myezen.myapp.domain.ErrorVo;
import com.myezen.myapp.domain.GatheringJoinVo;
import com.myezen.myapp.domain.MemberVo;
import com.myezen.myapp.persistance.BikeRentService_Mapper;
import com.myezen.myapp.persistance.GatheringService_Mapper;
import com.myezen.myapp.util.AESUtil;
import com.myezen.myapp.util.QRCodeUtil;
import com.myezen.myapp.util.UploadFileUtiles;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


@Service("GatheringServiceImpl")
public class GatheringServiceImpl implements GatheringService {
	private GatheringService_Mapper gsm;
	
	@Autowired
	public GatheringServiceImpl(SqlSession sqlSession) {
		this.gsm = sqlSession.getMapper(GatheringService_Mapper.class);
	}
	


	@Override
	//모임생성하기
	public int gatheringCreate(GatheringJoinVo gjv, MultipartFile GTImg, List<MultipartFile> GImg) throws IOException, Exception {
		
		int value=0;
		
		//배포했을때
        //String savedGTImgPath = request.getSession().getServletContext().getRealPath("/resources/GTImages");
		//String savedGImgPath = request.getSession().getServletContext().getRealPath("/resources/GImages");
		String savedGTImgPath = "D://threekim//threeKim//src//main//webapp//resources/GTImages";//모임대표이미지
		String savedGImgPath = "D://threekim//threeKim//src//main//webapp//resources/GImages";//모임이미지
		
		String uploadedGTImgName  = UploadFileUtiles.uploadFile(savedGTImgPath, GTImg.getOriginalFilename(), GTImg.getBytes());
	    for (MultipartFile file : GImg) {
	    	GImg.add(file);
	    	System.out.println(file.getOriginalFilename());
	    }
	        // GatheringJoinVo에 업로드된 파일명 설정
	        //gjv.setImageName(newFilename);

	        // 데이터베이스에 자전거 정보 삽입
	        //value = gsm.gatheringCreate(gjv,GTImg,GImg);
	        


		return value;
	}


	
	
	




	
	
	
	
	
	

}
