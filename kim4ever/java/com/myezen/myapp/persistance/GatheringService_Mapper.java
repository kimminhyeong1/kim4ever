package com.myezen.myapp.persistance;






import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

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

public interface GatheringService_Mapper {
	/*모임 생성*/
	//1.모임 정보 생성하기 
	public int gatheringInfoCreate(GatheringJoinVo gjv);
	//모임 giidx값얻기
	public int gatheringInfoCreategiidx(GatheringJoinVo gjv);
	//2.모임 생성하기
	public int gatheringCreate(GatheringJoinVo gjv);
	//2-1.모임명 중복 체크
	public int gInfoNameCheck(String gInfoName);
	//3.모임대표 이미지 넣기
	public int gatheringGTInsert(GatheringJoinVo gjv);
	//4.모임 이미지 넣기 //4.모임 이미지들 넣기 인설트
	public int gatheringGInsert(GatheringJoinVo gjv);
	/*모임 수정*/
	//1.모임정보업데이트
	public int gatheringInfoModify(GatheringJoinVo gjv);
	//2.모임 대표이미지 넣기
	public int gatheringGTUpdate(GatheringJoinVo gjv);
	//이미지고유번호 가져오기	
	public int gatheringGSelect(GatheringJoinVo gjv);
	//3.모임 이미지들 넣기 업데이트
	public int gatheringGUpdate(GatheringJoinVo gjv);
	
	
	//모임수정리스트가져오기 
	public ArrayList<GatheringJoinVo> gatheringModifyList(int giidx);
	//모임 리스트 가져오기
	public ArrayList<GatheringJoinVo> gatheringListSelect(Integer midx);
	//모임 리스트 더보기 
	// 이전 데이터를 제외한 새로운 데이터 가져오기
	public ArrayList<GatheringJoinVo> getNewData(HashMap<String, Object> hm);

	//모임 나의 리스트 더보기
	public ArrayList<GatheringJoinVo> getMoreGatheringMyListSelect(int offset,int midx);
	//모임 나의 찜 리스트 더보기
	public ArrayList<GatheringJoinVo> getMoreGatheringMyWishListSelect(int offset,int midx);
	//모임 검색 리스트 더보기
	public ArrayList<GatheringJoinVo> getMoreSearchGatherings(HashMap<String, Object> hm);
	//모임 나의리스트 가져오기
	public ArrayList<GatheringJoinVo> gatheringMyListSelect(int midx);
	//모임 소개페이지 리스트 가져오기
	public ArrayList<GatheringJoinVo> gatheringOneSimpleListSelect(int giidx);
	//모임 소개페이지 체크 
	public String gatheringOneSimpleListCheck(int giidx, int midx);
	
	/*모임상세보기*/
	//사용자가 모임상세페이지를 들어갈수있는지 확인
	public int gatheringMemberCheck(int giidx, int midx);
	//모임상세리스트 가져오기
	public ArrayList<GatheringJoinVo> gatheringOneListSelect(int giidx);
	//승인대기중인사람 가져오기 
	public String gatheringMemberWaitCNT(int giidx);
	//모임멤버 리스트 가져오기
	public ArrayList<GatheringJoinVo> gatheringMemberListSelect(int giidx);
	//공지사항 데이터 가져오기
	public ArrayList<Gathering_BoardVO> gatheringNoticeListSelect(int giidx);
	
	/*모임 가입*/
	//모임 정원수 
	public int gatheringInfoCapacityCheck(int giidx);
	//모임 참여멤버 수
	public int gatheringInfoParticipatingCheck(int giidx);
	//1.모임 가입타입 확인하기
	public Gathering_InfoVo gatheringJoinTypeCheck(int giidx);
	//2.모임 가입타입 확인후 데이터넣기 A OR B
	public int gatheringJoinTypeAInsert(int giidx, int midx);
	public int gatheringJoinTypeBInsert(int giidx, int midx);
	//3.모임 가입시 모임 참여멤버 수 1증가
	public int gatheringParticipatingUpdate(int giidx);
	/*찜*/
	//1.찜하기
	public int gatheringWish(int giidx, int midx);
	//2.찜삭제
	public int gatheringWishDel(int giidx, int midx);
	//모임 나의찜리스트 가져오기
	public ArrayList<GatheringJoinVo> gatheringMyWishListSelect(int midx);		
	//모임 검색하기
	public ArrayList<GatheringJoinVo> searchGatherings(HashMap<String, Object> hm);

	//모임일정만들기
	public int gatheringScheduleMake(Gathering_ScheduleVO gsv);
	//모임일정수정하기
	public int gatheringScheduleModify(Gathering_ScheduleVO gsv);
	//모임일정삭제하기
	public int gatheringScheduleDel1(int gsidx);
	public int gatheringScheduleDel2(int giidx,int gsidx);
	//모임일정 리스트 가져오기
	public ArrayList<Gathering_ScheduleVO> gatheringScheduleListSelect(int giidx);	
	//모임일정 상세보기 가져오기
	public Gathering_ScheduleVO gatheringScheduleView(int gsidx,int giidx);
	//모임참여이력이있으면 gsjidx가져오기 
	public String gatheringScheduleViewCheck(int gsidx,int midx);
	//참여인원 가지고오기
	public String gatheringScheduleViewJoinCNT(int gsidx);
	//모임 일정 참여하기 검증
	public int gatheringScheduleJoinCheck(int gsidx,int midx);
	//모임 일정 참여하기
	public int gatheringScheduleJoin(int gsidx,int midx);
	//모임 일정 참여취소하기
	public int gatheringScheduleJoinExit(int gsidx,int midx);
	
	/*모임 게시판*/
	//모임 게시글 쓰기
	public int gatheringBoardWrite(Gathering_BoardVO gbv);

	//모임 게시글 리스트 가져오기
	public ArrayList<GatheringJoinVo> gatheringBoardListSelect(int giidx);
	
	/*모임 게시판 수정*/
	
	//모임 게시글 수정하는 게시물 가져오기
	public Gathering_BoardVO gatheringBoardModify(int gbidx, int midx);
	//모임 수정게시글 업데이트
	public int gatheringBoardModifyUpdate(Gathering_BoardVO gbv);
	
	//모임 게시글 삭제
	public int gatheringBoardDelete(int gbidx, int midx);
	
	//모임신고하기
	public int insertDeclaration(GatheringJoinVo gjv);
	//모임나가기
	public void exitGathering(int midx, int giidx);
	//모임 가입시 모임 참여멤버 수 1마이너스
	public int gatheringParticipatingUpdate1(int giidx);
	
	//1. 총게시글 가져오기
	public int gatheringBoardTotal(HashMap<String, Object> hm);
	//2. 게시글 리스트 가져오기
	public ArrayList<GatheringJoinVo> gatheringBoardListSelect(HashMap<String, Object> hm);



	//모임 게시글 보기
	//1.1 게시물하나가져오기
	public GatheringJoinVo gatheringBoardOneSelect(int giidx,int gbidx);
	//1.2 조회수 증가
	public void increaseViewCount(int gbidx);
	//2.1게시물에 댓글쓰기
	public int gatheringBoardCommentAdd(Gathering_CommentVO gcv);
	//시퀀스값 받아와서 넣기
	public void gatheringBoardCommentAddUpdate(Gathering_CommentVO gcv);
	//2.2게시물에 댓글삭제
	public int gatheringBoardCommentDelete(Gathering_CommentVO gcv);
	//2.3.1 게시물에 댓글수정검증하기
	public int gatheringBoardCommentMemberCheck(Gathering_CommentVO gcv);
	//2.3.2 게시물에 댓글수정댓글가져오기
	public String gatheringBoardCommentModify(Gathering_CommentVO gcv);
	//2.3.3 게시물에 댓글수정하기
	public int gatheringBoardCommentUpdate(Gathering_CommentVO gcv);
	//2.3.4 게시물에 답글달기
	public int gatheringBoardReplyComment(Gathering_CommentVO gcv);
	//3. 총댓글 가져오기
	public int gatheringBoardCommentTotal(HashMap<String, Object> hm);
	//4. 댓글 리스트 가져오기
	public ArrayList<GatheringJoinVo> gatheringBoardCommentListSelect(HashMap<String, Object> hm);
	//댓글 좋아요
	//좋아요 확인 midx
	public int gatheringBoardLikeCheck(Gathering_BoardVO gbv);
	//좋아요 테이블에 넣기
	public int gatheringBoardLikeInsert(Gathering_BoardVO gbv);
	//좋아요 업데이트
	public int gatheringBoardLike(Gathering_BoardVO gbv);
	
	
	
	
	
	
	
	/*모임 더보기 */
	//모임 더보기 현재 사용자 멤버타입 가져오기 
	public GatheringVo gatheringMemberType(int giidx,int midx);
	//모임 더보기 멤버 리스트
	public ArrayList<GatheringJoinVo> gatheringSeeMoreMemberList(int giidx);
	//모임 더보기 승인 대기 승낙
	public int gatheringApproveMembers(int giidx,int midx);
	//모임 더보기 승인 대기 거절
	public int gatheringRefuseMembers(int giidx,int midx);
	//모임 더보기 멤버 추방
	public int updateMemberDELYN(int midx,int giidx);
	//모임 더보기 모임원 > 부모임장으로 위임
	public int updateTLD(int midx,int giidx);
	//모임 더보기 부모임장 > 모임원으로 강등
	public int updateTM(int midx,int giidx);
	//모임 더보기 모임장 > 부모임장으로 강등
	public int updateDownTLD(int midx,int giidx);
	//모임 더보기 부모임장 > 모임장으로 위임
	public int updateTL(int midx,int giidx);
	
	
	//모임사진첩작성
	public int gatheringPhotoAlbumWrite(GatheringJoinVo gjv);
	//모임사진첩대표이미지
	public int gatheringPhotoGATInsert(GatheringJoinVo gjv);
	//모임사진첩이미지
	public int gatheringPhotoGAInsert(GatheringJoinVo gjv);
	//모임사진첩조회
	public ArrayList<HashMap<String, Object>> gatheringPhotoAlbumListSelect(HashMap<String, Object> hm);
	//모임사진첩 총갯수
	public int gatheringPhotoAlbumListSelectAll(HashMap<String, Object> hm);
	//모임사진첩 상세보기
	public ArrayList<GatheringJoinVo> gatheringPhotoAlbumListSelectOne(int gpaidx);
	//모임사진첩 수정하기 조회
	public ArrayList<GatheringJoinVo> gatheringPhotoAlbumModify(int gpaidx);
	//모임사진첩 상세보기 좋아요
	public int gatheringPhotoAlbumLikeCheck(GatheringJoinVo gjv);
	//좋아요 테이블에 넣기
	public int gatheringPhotoAlbumLikeInsert(GatheringJoinVo gjv);
	//좋아요 업데이트
	public int gatheringPhotoAlbumLike(GatheringJoinVo gjv);
	
	//모임사진첩 수정하기
	public int gatheringPhotoAlbumModifyUpdate(GatheringJoinVo gjv);
	//모임사진첩 수정하기(대표이미지 업데이트)
	public int gatheringPhotoGATUpdate(GatheringJoinVo gjv);
	//이미지고유번호 가져오기	
	public int gatheringGASelect(GatheringJoinVo gjv);
	//모임사진첩 수정하기(이미지 업데이트)
	public int gatheringPhotoGAUpdate(GatheringJoinVo gjv);
	//모임사진첩 삭제하기
	public void deletePhotoAlbum(int midx, int gpaidx);
	//모임 gpaidx 꺼내오기
	public int gatheringPhotoAlbumGetGpaidx(GatheringJoinVo gjv);
	
	
}
