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
import com.myezen.myapp.domain.GatheringVo;
import com.myezen.myapp.domain.Gathering_BoardVO;
import com.myezen.myapp.domain.Gathering_CommentVO;
import com.myezen.myapp.domain.Gathering_DeclarationVO;
import com.myezen.myapp.domain.Gathering_PhotoAlbumVO;
import com.myezen.myapp.domain.Gathering_ScheduleVO;
import com.myezen.myapp.domain.MemberVo;
import com.myezen.myapp.domain.SearchCriteria;
import com.myezen.myapp.util.QRCodeUtil;

public interface GatheringService {

	//모임 생성하기
	public int gatheringCreate(GatheringJoinVo gjv,MultipartFile GTImg, ArrayList<MultipartFile> GImg)throws IOException, Exception;
	//모임 리스트 가져오기
	public ArrayList<GatheringJoinVo> gatheringListSelect();
	//모임 나의리스트 가져오기
	public ArrayList<GatheringJoinVo> gatheringMyListSelect(int midx);
	//모임 소개페이지 리스트 가져오기
	public ArrayList<GatheringJoinVo> gatheringOneSimpleListSelect(int giidx);
	
	/*모임상세보기*/
	//사용자가 모임상세페이지를 들어갈수있는지 확인
	public int gatheringMemberCheck(int giidx, int midx);
	//모임상세리스트 가져오기
	public ArrayList<GatheringJoinVo> gatheringOneListSelect(int giidx);
	//모임멤버 리스트 가져오기
	public ArrayList<GatheringJoinVo> gatheringMemberListSelect(int giidx);
	//공지사항 데이터 가져오기
	public ArrayList<Gathering_BoardVO> gatheringNoticeListSelect(int giidx);
	
	
	//모임 가입하기
	public int gatheringJoin(int giidx, int midx);
	/*찜*/
	//1.찜하기
	public int gatheringWish(int giidx, int midx);
	//2.찜삭제
	public int gatheringWishDel(int giidx, int midx);
	//모임 나의찜리스트 가져오기
	public ArrayList<GatheringJoinVo> gatheringMyWishListSelect(int midx);	
	//모임검색
	public ArrayList<GatheringJoinVo> searchGatherings(SearchCriteria scri);

	//모임일정만들기
	public int gatheringScheduleMake(Gathering_ScheduleVO gsv);
	//모임일정 리스트 가져오기
	public ArrayList<Gathering_ScheduleVO> gatheringScheduleListSelect(int giidx);
	//모임일정 상세보기 가져오기
	public Gathering_ScheduleVO gatheringScheduleView(int gsidx,int giidx);
	
	/*모임 게시판*/
	
	//모임 게시글 쓰기
	public int gatheringBoardWrite(Gathering_BoardVO gbv);
	//1. 총게시글 가져오기
	public int gatheringBoardTotal(int giidx,SearchCriteria scri);
	//2. 게시글 리스트 가져오기
	public ArrayList<GatheringJoinVo> gatheringBoardListSelect(int giidx,SearchCriteria scri);
	
	/*모임 게시판 수정*/
	
	//모임 게시글 수정하는 게시물 가져오기
	public Gathering_BoardVO gatheringBoardModify(int gbidx, int midx);
	//모임 수정게시글 업데이트
	public int gatheringBoardModifyUpdate(Gathering_BoardVO gbv);
	
	//모임 게시글 삭제
	public int gatheringBoardDelete(int gbidx, int midx);
	
	//모임신고하기
	public void insertDeclaration(GatheringJoinVo gjv);
	//모임나가기
	public boolean exitGathering(int midx, int giidx);
	
	//모임 게시글 보기
	//1.게시물하나가져오기
	public GatheringJoinVo gatheringBoardOneSelect(int giidx,int gbidx);
	//2.1 게시물에 댓글쓰기 
	public int gatheringBoardCommentAdd(Gathering_CommentVO gcv);
	//2.2 게시물에 댓글삭제
	public int gatheringBoardCommentDelete(Gathering_CommentVO gcv);
	//2.3.1 게시물에 댓글수정검증하기
	public int gatheringBoardCommentMemberCheck(Gathering_CommentVO gcv);
	//2.3.2 게시물에 댓글수정댓글가져오기
	public String gatheringBoardCommentModify(Gathering_CommentVO gcv);
	//2.3.3 게시물에 댓글수정하기
	public int gatheringBoardCommentUpdate(Gathering_CommentVO gcv);
	//3. 총댓글 가져오기
	public int gatheringBoardCommentTotal(int gbidx,SearchCriteria scri);
	//4. 댓글 리스트 가져오기
	public ArrayList<GatheringJoinVo> gatheringBoardCommentListSelect(int gbidx,SearchCriteria scri);
	


	
	
	/*모임 더보기 */
	//모임 더보기 현재 사용자 멤버타입 가져오기 
	public GatheringVo gatheringMemberType(int giidx,int midx);
	//모임 더보기 멤버 리스트
	public ArrayList<GatheringJoinVo> gatheringSeeMoreMemberList(int giidx);
	//모임 더보기 멤버 추방
	public int updateMemberDELYN(int midx,int giidx);

	
	

	public int gatheringPhotoAlbumWrite(GatheringJoinVo gjv);
	
	
}
