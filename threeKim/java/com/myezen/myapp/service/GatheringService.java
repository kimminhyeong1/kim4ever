package com.myezen.myapp.service;








import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.myezen.myapp.domain.BikeJoinVo;
import com.myezen.myapp.domain.ErrorVo;
import com.myezen.myapp.domain.GatheringJoinVo;
import com.myezen.myapp.domain.MemberVo;
import com.myezen.myapp.util.QRCodeUtil;

public interface GatheringService {

	//모임 생성하기
	public int gatheringCreate(GatheringJoinVo gjv,MultipartFile GTImg,List<MultipartFile> GImg)throws IOException, Exception;
	
	
	
	
}
