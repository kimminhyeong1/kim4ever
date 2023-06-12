package com.myezen.myapp.persistance;






import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.myezen.myapp.domain.BikeJoinVo;
import com.myezen.myapp.domain.ErrorVo;
import com.myezen.myapp.domain.GatheringJoinVo;
import com.myezen.myapp.domain.MemberVo;

public interface GatheringService_Mapper {

	//모임 생성하기
	public int gatheringCreate(GatheringJoinVo gjv,MultipartFile GTImg,List<MultipartFile> GImg);
	
	
}
