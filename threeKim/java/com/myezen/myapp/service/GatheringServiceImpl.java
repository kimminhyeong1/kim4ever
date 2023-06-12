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
	@Transactional
	//모임생성하기
	public int gatheringCreate(GatheringJoinVo gjv, MultipartFile GTImg, ArrayList<MultipartFile> GImg) throws IOException, Exception {
		
		int value=0;
		
		//배포했을때
        //String savedGTImgPath = request.getSession().getServletContext().getRealPath("/resources/GTImages");
		//String savedGImgPath = request.getSession().getServletContext().getRealPath("/resources/GImages");
		String savedGTImgPath = "D://threekim//threeKim//src//main//webapp//resources/GTImages";//모임대표이미지
		String savedGImgPath = "D://threekim//threeKim//src//main//webapp//resources/GImages";//모임이미지
		
		//모임 대표 이미지 
		String uploadedGTImgName  = UploadFileUtiles.uploadFile(savedGTImgPath, GTImg.getOriginalFilename(), GTImg.getBytes());
		gjv.setImageName(uploadedGTImgName);

			/*모임생성*/
			//1.모임정보생성
	        value = gsm.gatheringInfoCreate(gjv);
	        //2.모임생성
	        value = gsm.gatheringCreate(gjv);
	        //3.모임 대표이미지 넣기
	        value = gsm.gatheringGTInsert(gjv);
	        //4. 모임 이미지들 넣기
	        for (MultipartFile file : GImg) {
	        	String uploadedGImgName = UploadFileUtiles.uploadFile(savedGImgPath, file.getOriginalFilename(), file.getBytes());
	        	gjv.setImageName(uploadedGImgName);
	        	value = gsm.gatheringGInsert(gjv);
	        }

		return value;
	}



	@Override
	//모임 리스트 가져오기
	public ArrayList<GatheringJoinVo> gatheringListSelect() {
		
		ArrayList<GatheringJoinVo> gjvlist = gsm.gatheringListSelect();
		return gjvlist;
	}



	@Override
	//나의 모임 리스트 가져오기
	public ArrayList<GatheringJoinVo> gatheringMyListSelect(int midx) {
		ArrayList<GatheringJoinVo> gjvmylist = gsm.gatheringMyListSelect(midx);
		return gjvmylist;
	}



	@Override
	public ArrayList<GatheringJoinVo> gatheringOneSimpleListSelect(int giidx) {
		ArrayList<GatheringJoinVo> gjvlist = gsm.gatheringOneSimpleListSelect(giidx);
		return gjvlist;
	}


	
	
	




	
	
	
	
	
	

}
