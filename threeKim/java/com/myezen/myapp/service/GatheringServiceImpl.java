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
import com.myezen.myapp.persistance.GatheringService_Mapper;
import com.myezen.myapp.util.AESUtil;
import com.myezen.myapp.util.QRCodeUtil;

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
	public int AAAAAAA() {
		// TODO Auto-generated method stub
		return 0;
	}


	
	
	




	
	
	
	
	
	

}
