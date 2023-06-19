package com.myezen.myapp.service;





import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
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
import com.myezen.myapp.domain.GatheringVo;
import com.myezen.myapp.domain.Gathering_BoardVO;
import com.myezen.myapp.domain.Gathering_CommentVO;
import com.myezen.myapp.domain.Gathering_DeclarationVO;
import com.myezen.myapp.domain.Gathering_InfoVo;
import com.myezen.myapp.domain.Gathering_PhotoAlbumVO;
import com.myezen.myapp.domain.Gathering_ScheduleVO;
import com.myezen.myapp.domain.MemberVo;
import com.myezen.myapp.domain.SearchCriteria;
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
	//모임 리스트 더보기 
	public ArrayList<GatheringJoinVo> getMoreGjvList(int offset) {
		ArrayList<GatheringJoinVo> moreGjvList = gsm.getMoreGatheringList(offset);
		return moreGjvList;
	}



	@Override
	//나의 모임 리스트 가져오기
	public ArrayList<GatheringJoinVo> gatheringMyListSelect(int midx) {
		ArrayList<GatheringJoinVo> gjvmylist = gsm.gatheringMyListSelect(midx);
		return gjvmylist;
	}



	@Override
	//모임소개페이지 가져오기
	public ArrayList<GatheringJoinVo> gatheringOneSimpleListSelect(int giidx) {
		ArrayList<GatheringJoinVo> gjvlist = gsm.gatheringOneSimpleListSelect(giidx);
		return gjvlist;
	}



	@Override
	//사용자가 모임상세페이지를 들어갈수있는지 확인
	public int gatheringMemberCheck(int giidx, int midx) {
		int value = gsm.gatheringMemberCheck(giidx,midx);
		return value;
	}



	@Override
	//모임상세리스트 가져오기
	public ArrayList<GatheringJoinVo> gatheringOneListSelect(int giidx) {
		ArrayList<GatheringJoinVo> gjvlist = gsm.gatheringOneListSelect(giidx);
		return gjvlist;
	}



	@Override
	@Transactional
	//모임 가입하기
	public int gatheringJoin(int giidx, int midx) {
		
		int value = 0;
		
		//모임 가입타입 확인하기
		Gathering_InfoVo giv = gsm.gatheringJoinTypeCheck(giidx);
		String joinType = giv.getgInfoJoinType();
		if (joinType.equals("자유가입")) {
			value=gsm.gatheringJoinTypeAInsert(giidx,midx);
			
		}
		if (joinType.equals("승인가입")) {
			value=gsm.gatheringJoinTypeBInsert(giidx,midx);
			
		}
			value=gsm.gatheringParticipatingUpdate(giidx);
		return value;
	}



	@Override
	//찜하기
	public int gatheringWish(int giidx, int midx) {
		int value = gsm.gatheringWish(giidx,midx);
		return value;
	}
	//모임 검색하기
	@Override
	public ArrayList<GatheringJoinVo> searchGatherings(SearchCriteria scri) {
		if (scri.getKeyword() == null) {
	        scri.setKeyword(""); // null인 경우 빈 문자열로 설정
	    }
		ArrayList<GatheringJoinVo> gjvmylist = gsm.searchGatherings(scri);
		
		return gjvmylist;
	}



	@Override
	//찜삭제
	public int gatheringWishDel(int giidx, int midx) {
		int value = gsm.gatheringWishDel(giidx,midx);
		return value;
	}



	@Override
	//모임 나의 찜 리스트 가져오기
	public ArrayList<GatheringJoinVo> gatheringMyWishListSelect(int midx) {
		ArrayList<GatheringJoinVo> gjvmywishlist = gsm.gatheringMyWishListSelect(midx);
		return gjvmywishlist;
	}




	@Override
	//모임 일정 만들기
	public int gatheringScheduleMake(Gathering_ScheduleVO gsv) {
		int value = gsm.gatheringScheduleMake(gsv);
		return value;
	}



	@Override
	//모임 일정 리스트 가져오기
	public ArrayList<Gathering_ScheduleVO> gatheringScheduleListSelect(int giidx) {
		ArrayList<Gathering_ScheduleVO> gsvlist = gsm.gatheringScheduleListSelect(giidx);
		return gsvlist;
	}



	@Override
	//모임 일정 상세 보기
	public Gathering_ScheduleVO gatheringScheduleView(int gsidx, int giidx) {
		Gathering_ScheduleVO gsv = gsm.gatheringScheduleView(gsidx,giidx);
		return gsv;
	}



	@Override
	//모임멤버 리스트 가져오기
	public ArrayList<GatheringJoinVo> gatheringMemberListSelect(int giidx) {
		ArrayList<GatheringJoinVo> gjvmlist = gsm.gatheringMemberListSelect(giidx);
		return gjvmlist;
	}
	


	@Override
	//모임 게시글 쓰기
	public int gatheringBoardWrite(Gathering_BoardVO gbv) {
		int value = gsm.gatheringBoardWrite(gbv);
		return value;
	}
	@Override
	//모임 게시글 수정하는 게시물 가져오기
	public Gathering_BoardVO gatheringBoardModify(int gbidx, int midx) {
		Gathering_BoardVO gbv = gsm.gatheringBoardModify(gbidx,midx);
		return gbv;
	}
	
	
	
	@Override
	//모임 수정게시글 업데이트
	public int gatheringBoardModifyUpdate(Gathering_BoardVO gbv) {
		int value = gsm.gatheringBoardModifyUpdate(gbv);
		return value;
	}
	
	
	
	@Override
	//모임 게시글 삭제
	public int gatheringBoardDelete(int gbidx, int midx) {
		int value = gsm.gatheringBoardDelete(gbidx,midx);
		return value;
	}



	@Override
	//모임 게시글 리스트 가져오기
	public ArrayList<GatheringJoinVo> gatheringBoardListSelect(int giidx,SearchCriteria scri) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("giidx", giidx);
		hm.put("scri", scri);
		ArrayList<GatheringJoinVo> gjvblist = gsm.gatheringBoardListSelect(hm);
		return gjvblist;
	}



	@Override
	//모임 공지사항 리스트 가져오기
	public ArrayList<Gathering_BoardVO> gatheringNoticeListSelect(int giidx) {
		ArrayList<Gathering_BoardVO> gbvlist = gsm.gatheringNoticeListSelect(giidx);
		return gbvlist;
	}
	
	@Override
	////모임 더보기 현재 사용자 멤버타입 가져오기 
	public GatheringVo gatheringMemberType(int giidx, int midx) {
		GatheringVo gmt = gsm.gatheringMemberType(giidx,midx);
		return gmt;
	}
	@Override
	//모임 더 보기 멤버 리스트
	public ArrayList<GatheringJoinVo> gatheringSeeMoreMemberList(int giidx) {
		ArrayList<GatheringJoinVo> gjvsmlist = gsm.gatheringSeeMoreMemberList(giidx);
		return gjvsmlist;
	}

	@Override
	//모임 더 보기 멤버 추방
	public int updateMemberDELYN(int midx, int giidx) {		
		int value= gsm.updateMemberDELYN(midx,giidx);
		
		return value; 
	}

	@Override
	//모임 더 보기 모임원 > 부모임장으로 변경
	public int updateTLD(int midx, int giidx) {
		System.out.println("서비스 권한주기");
		int value= gsm.updateTLD(midx, giidx);
		
		return value;
	}
	
	@Override
	//모임 더 보기 부모임장 > 모임원으로 변경
	public int updateTM(int midx, int giidx) {
		System.out.println("부모임장 > 모임원 테스트");
		int value = gsm.updateTM(midx, giidx);
		
		return value;
	}
	
	//모임 더 보기 모임장 > 부모임장으로 강등
	@Override
	public int updateDownTLD(int midx, int giidx) {
		System.out.println("모임장 > 부모임장 테스트");
		int value= gsm.updateDownTLD(midx, giidx);
		return value;
	}

	//모임 더 보기 부모임장 > 모임장으로 위임
	@Override
	public int updateTL(int midx, int giidx) {
		System.out.println("부모임장 > 모임장 테스트");
		int value= gsm.updateTL(midx, giidx);
		return value;
	}

	
	
	@Override
	//모임 총게시글 가져오기
	public int gatheringBoardTotal(int giidx, SearchCriteria scri) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("giidx", giidx);
		hm.put("scri", scri);
		int totalCount = gsm.gatheringBoardTotal(hm); //총 게시물 갯수 꺼내오기
		return totalCount;
	}



	@Override
	//1.1게시물하나가져오기
	public GatheringJoinVo gatheringBoardOneSelect(int giidx, int gbidx) {
		GatheringJoinVo gjv = gsm.gatheringBoardOneSelect(giidx,gbidx);
		return gjv;
	}
	@Override
	//1.2 중복된 사용자인지 확인
	public boolean isDuplicated( Cookie[] cookies,String cookieName, int midx) {
		if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(cookieName)) {
                    String[] viewedPosts = cookie.getValue().split(",");
                    for (String viewedPost : viewedPosts) {
                        if (viewedPost.equals(String.valueOf(midx))) {
                            return true; // 중복된 사용자
                        }
                    }
                    break;
                }
            }
        }
        return false; // 중복된 사용자가 아님

	}
	@Override
	//1.3 조회수 증가
	public void increaseViewCount(int gbidx) {
		gsm.increaseViewCount(gbidx);
	}
	@Override
	//2.1게시물에 댓글쓰기
	public int gatheringBoardCommentAdd(Gathering_CommentVO gcv) {
		int value = gsm.gatheringBoardCommentAdd(gcv);
		return value;
	}
	@Override
	//2.2게시물에 댓글삭제
	public int gatheringBoardCommentDelete(Gathering_CommentVO gcv) {
		int value = gsm.gatheringBoardCommentDelete(gcv);
		return value;
	}
	@Override
	//2.3.1 게시물에 댓글수정검증하기
	public int gatheringBoardCommentMemberCheck(Gathering_CommentVO gcv) {
		 int value = gsm.gatheringBoardCommentMemberCheck(gcv);
		return value;
	}
	@Override
	//2.3.2 게시물에 댓글수정댓글가져오기
	public String gatheringBoardCommentModify(Gathering_CommentVO gcv) {
		String gCommentContents = gsm.gatheringBoardCommentModify(gcv);
		return gCommentContents;
	}
	@Override
	//2.3.3 게시물에 댓글수정하기
	public int gatheringBoardCommentUpdate(Gathering_CommentVO gcv) {
		int value = gsm.gatheringBoardCommentUpdate(gcv);
		return value;
	}
	@Override
	//2.3.4 게시물에 답글달기
	public int gatheringBoardReplyComment(Gathering_CommentVO gcv) {
		int value = gsm.gatheringBoardReplyComment(gcv);
		return value;
	}
	@Override
	//3. 총댓글 가져오기
	public int gatheringBoardCommentTotal(int gbidx, SearchCriteria scri) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("gbidx", gbidx);
		hm.put("scri", scri);
		int totalCount = gsm.gatheringBoardCommentTotal(hm); //총 게시물 갯수 꺼내오기
		return totalCount;
	}
	@Override
	//4. 댓글 리스트 가져오기
	public ArrayList<GatheringJoinVo> gatheringBoardCommentListSelect(int gbidx, SearchCriteria scri) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("gbidx", gbidx);
		hm.put("scri", scri);
		ArrayList<GatheringJoinVo> gjvblist = gsm.gatheringBoardCommentListSelect(hm);
		return gjvblist;
	}


	//신고하기 수정중..
	@Override
	public void insertDeclaration(GatheringJoinVo gjv) {


	        gsm.insertDeclaration(gjv);
	    }


	//모임나가기
	@Override
	@Transactional
	public boolean exitGathering(int midx, int giidx) {
			//GatheringMemberType 문자열비교
			System.out.println("서비스단에서 midx는?"+midx);
			System.out.println("서비스단에서 giidx는?"+giidx);
			GatheringVo gmt = gsm.gatheringMemberType(giidx, midx);
			System.out.println("멤버타입은?"+gmt.getGatheringMemberType());
			
			 if (gmt.getGatheringMemberType().equals("TL")) {
			        System.out.println("모임장은 나가실 수 없습니다. 권한을 넘겨주세요.");
			        return false; // 실패 시 false 반환
			    } else {
			        gsm.exitGathering(midx, giidx);
			        gsm.gatheringParticipatingUpdate1(giidx);
			        System.out.println("모임에서 나가셨습니다.");
			        return true; // 성공 시 true 반환
			    }
	}
	
	//모임사진첩 조회
	@Override
	public ArrayList<GatheringJoinVo> gatheringPhotoAlbumListSelect() {
		
		ArrayList<GatheringJoinVo> gPhotoList = gsm.gatheringPhotoAlbumListSelect();
		
		return gPhotoList;
	}

	
	//모임사진첩작성
	@Override
	@Transactional
	public int gatheringPhotoAlbumWrite(GatheringJoinVo gjv, MultipartFile GTImg, ArrayList<MultipartFile> GImg) throws IOException, Exception {
		
		int value = 0;
		
		String savedGTImgPath = "D://threekim//threeKim//src//main//webapp//resources/GATImages";//사진첩 대표이미지
		String savedGImgPath = "D://threekim//threeKim//src//main//webapp//resources/GAImages";//사진첩 이미지
		
		//모임 대표 이미지 
		String uploadedGTImgName  = UploadFileUtiles.uploadFile(savedGTImgPath, GTImg.getOriginalFilename(), GTImg.getBytes());
		gjv.setImageName(uploadedGTImgName);
				
		//1.사진첩 생성		
		value = gsm.gatheringPhotoAlbumWrite(gjv);
		//2.모임 대표이미지 넣기
        value = gsm.gatheringPhotoGTInsert(gjv);
        //3. 모임 이미지들 넣기
        for (MultipartFile file : GImg) {
        	String uploadedGImgName = UploadFileUtiles.uploadFile(savedGImgPath, file.getOriginalFilename(), file.getBytes());
        	gjv.setImageName(uploadedGImgName);
        	value = gsm.gatheringPhotoGInsert(gjv);
        }

		return value;
	}



	@Override
	public ArrayList<GatheringJoinVo> gatheringPhotoAlbumListSelectOne() {
		
		ArrayList<GatheringJoinVo> gPhotoList = gsm.gatheringPhotoAlbumListSelectOne();
		
		return gPhotoList;
	}










	














	
	
	
	
}

	




	
	

