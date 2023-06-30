package com.myezen.myapp.service;





import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
    public int gatheringCreate(GatheringJoinVo gjv, MultipartFile GTImg, ArrayList<MultipartFile> GImg,HttpServletRequest request) throws IOException, Exception {
      
      int value=0;
      
        //배포했을때
        String savedGTImgPath = request.getSession().getServletContext().getRealPath("/resources/GTImages");
        String savedGImgPath = request.getSession().getServletContext().getRealPath("/resources/GImages");
        //String savedGTImgPath = "D://threekim//threeKim//src//main//webapp//resources/GTImages";//모임대표이미지
        //String savedGImgPath = "D://threekim//threeKim//src//main//webapp//resources/GImages";//모임이미지

      /*모임생성*/
      //1.모임정보생성
        value = gsm.gatheringInfoCreate(gjv);
        int giidx = gsm.gatheringInfoCreategiidx(gjv);
        gjv.setGiidx(giidx);
        //2.모임생성
        value = gsm.gatheringCreate(gjv);
        //3.모임 대표이미지 넣기
        if (GTImg.isEmpty()) {
           System.out.println(GTImg);
        } else {
           String uploadedGTImgName  = UploadFileUtiles.uploadFile(savedGTImgPath, GTImg.getOriginalFilename(), GTImg.getBytes());
           gjv.setImageName(uploadedGTImgName);
           value = gsm.gatheringGTInsert(gjv);
        }
        //4. 모임 이미지들 넣기
        for (MultipartFile file : GImg) {
           if (file.isEmpty()) {
               System.out.println(file);
           } else {
                String uploadedGImgName = UploadFileUtiles.uploadFile(savedGImgPath, file.getOriginalFilename(), file.getBytes());
                gjv.setImageName(uploadedGImgName); 
              value = gsm.gatheringGInsert(gjv);
           }
        }

      return value;
   }
   @Override
   @Transactional
   //모임수정하기
    public int gatheringModify(GatheringJoinVo gjv, MultipartFile GTImg, ArrayList<MultipartFile> GImgU,ArrayList<MultipartFile> GImgI,HttpServletRequest request) throws IOException, Exception {
      
      int value=0;
      int imidx=0;
      
      //배포했을때
        String savedGTImgPath = request.getSession().getServletContext().getRealPath("/resources/GTImages");
        String savedGImgPath = request.getSession().getServletContext().getRealPath("/resources/GImages");
        //String savedGTImgPath = "D://threekim//threeKim//src//main//webapp//resources/GTImages";//모임대표이미지
        //String savedGImgPath = "D://threekim//threeKim//src//main//webapp//resources/GImages";//모임이미지

        
      /*모임수정*/
      //1.모임정보업데이트
        value = gsm.gatheringInfoModify(gjv);
        //2.모임 대표이미지 넣기
        if (GTImg.isEmpty()) {
           System.out.println(GTImg);
        } else {
           String uploadedGTImgName  = UploadFileUtiles.uploadFile(savedGTImgPath, GTImg.getOriginalFilename(), GTImg.getBytes());
           gjv.setImageName(uploadedGTImgName);
           value = gsm.gatheringGTUpdate(gjv);   
        }
        //3. 모임 이미지들 넣기 업데이트
        for (MultipartFile GU : GImgU) {
           if (GU.isEmpty()) {
               System.out.println(GU); 
           } else {
                String uploadedGImgName = UploadFileUtiles.uploadFile(savedGImgPath, GU.getOriginalFilename(), GU.getBytes());
                gjv.setImageName(uploadedGImgName); 
                //이미지고유번호 가져오기
               imidx = gsm.gatheringGSelect(gjv); //날짜도 변경
               gjv.setImidx(imidx);
              value = gsm.gatheringGUpdate(gjv);
           }
        }
        //4. 모임 이미지들 넣기 인설트
        for (MultipartFile GI : GImgI) {
           if (GI.isEmpty()) {
               System.out.println(GI);
           } else {
                String uploadedGImgName = UploadFileUtiles.uploadFile(savedGImgPath, GI.getOriginalFilename(), GI.getBytes());
                gjv.setImageName(uploadedGImgName); 
              value = gsm.gatheringGInsert(gjv);
           }
        }

        
        return value;
   }
   
   //모임명 중복체크
   @Override
   public int gInfoNameCheck(String gInfoName) {
      int value = gsm.gInfoNameCheck(gInfoName);
      return value;

   }
   @Override
   //모임수정리스트가져오기
   public ArrayList<GatheringJoinVo> gatheringModifyList(int giidx) {
      ArrayList<GatheringJoinVo> gjv = gsm.gatheringModifyList(giidx);
      return gjv;
   }
   
   
   @Override
   //모임 리스트 가져오기
   public ArrayList<GatheringJoinVo> gatheringListSelect(Integer midx) {
      
      ArrayList<GatheringJoinVo> gjvlist = gsm.gatheringListSelect(midx);
      return gjvlist;
   }


	// 이전 데이터를 제외한 새로운 데이터 가져오기
    public ArrayList<GatheringJoinVo> getNewData(ArrayList<Integer> excludedData,int offset,HttpServletRequest request) {
    	HttpSession session = request.getSession();
		Object omidx = session.getAttribute("midx");
		Integer midx =null;
		if (omidx != null) {
			midx = (Integer)omidx;
		}else {
			midx = (Integer)omidx;			
		}
    	  HashMap<String, Object> hm = new HashMap<>();
    	  hm.put("excludedData", excludedData);
    	  hm.put("offset", offset);
    	  hm.put("midx", midx);
        return gsm.getNewData(hm);
    }

   @Override
   //모임 리스트 더보기 
   public ArrayList<GatheringJoinVo> getMoreGjvList(int offset,HttpServletRequest request,String URI,SearchCriteria scri) {
      
      // String gList = request.getContextPath() + "/gathering/gList.do";
       String gMyPage = request.getContextPath() + "/gathering/gMyPage.do";
       String gMyWish = request.getContextPath() + "/gathering/gMyWish.do";
       String gSearch = request.getContextPath() + "/gathering/gSearch.do";
       HttpSession session = request.getSession();
       //모임 메인 리스트
       //if (URI.equals(gList)) {
      //}
       //모임 나의 리스트
       if (URI.equals(gMyPage)) {
           Object omidx = session.getAttribute("midx");
           int midx = (int)omidx;
          ArrayList<GatheringJoinVo> moreGjvList = gsm.getMoreGatheringMyListSelect(offset,midx);
          return moreGjvList;
      }
       //모임 나의 찜 리스트
       if (URI.equals(gMyWish)) {
          Object omidx = session.getAttribute("midx");
             int midx = (int)omidx;
          ArrayList<GatheringJoinVo> moreGjvList = gsm.getMoreGatheringMyWishListSelect(offset,midx);
          return moreGjvList;
      }
       //모임 검색 리스트
       if (URI.equals(gSearch)) {
    	   Object omidx = session.getAttribute("midx");
	   		Integer midx =null;
	   		if (omidx != null) {
	   			midx = (Integer)omidx;
	   		}else {
	   			midx = (Integer)omidx;			
	   		}
          scri.setSearchType("GINFONAME"); // 검색 유형 설정
          System.out.println(scri.getKeyword());
          HashMap<String, Object> hm = new HashMap<>();
          hm.put("offset", offset);
          hm.put("scri", scri);
          hm.put("midx", midx);
          ArrayList<GatheringJoinVo> moreGjvList = gsm.getMoreSearchGatherings(hm);
          return moreGjvList;
      }
      
       ArrayList<GatheringJoinVo> error= new ArrayList<GatheringJoinVo>();
      return error;
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
   //모임소개페이지 체크
   public String gatheringOneSimpleListCheck(int giidx, int midx) {
      String gatheringApprovalType = gsm.gatheringOneSimpleListCheck(giidx,midx);
      return gatheringApprovalType;
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
   //승인대기중인사람 가져오기 
   public String gatheringMemberWaitCNT(int giidx) {
      String WaitCNT = gsm.gatheringMemberWaitCNT(giidx);
      return WaitCNT;
   }


   
   @Override
   @Transactional
   //모임 가입전 인원수 확인
   public int gatheringJoinCheck(int giidx) {
       int gInfoCapacity = gsm.gatheringInfoCapacityCheck(giidx);//모임 정원수 
       int gInfoParticipating = gsm.gatheringInfoParticipatingCheck(giidx);//모임 참여멤버 수
       if (gInfoParticipating < gInfoCapacity) {
          return 1;
      } 
       System.out.println("모임인원수가 꽉찼습니다."+gInfoCapacity+""+gInfoParticipating);
       return 0;
   }
   
   
   @Override
   @Transactional
   //모임 가입하기
   public int gatheringJoin(int giidx, int midx) {
      
      //모임 가입타입 확인하기
      Gathering_InfoVo giv = gsm.gatheringJoinTypeCheck(giidx);
      String joinType = giv.getgInfoJoinType();
      if (joinType.equals("자유가입")) {
         int type1=gsm.gatheringJoinTypeAInsert(giidx,midx);
         gsm.gatheringParticipatingUpdate(giidx); //참여멤버수 +1
         return type1;
         
      }
      if (joinType.equals("승인가입")) {
         int type2=gsm.gatheringJoinTypeBInsert(giidx,midx);
         if (type2 == 1) {
            return type2;
         }
      }
      return 0;
   }



   @Override
   //찜하기
   public int gatheringWish(int giidx, int midx) {
      int value = gsm.gatheringWish(giidx,midx);
      return value;
   }
   //모임 검색하기
   @Override
   public ArrayList<GatheringJoinVo> searchGatherings(SearchCriteria scri,Integer midx) {
      if (scri.getKeyword() == null) {
           scri.setKeyword(""); // null인 경우 빈 문자열로 설정
       }
      HashMap<String, Object> hm = new HashMap<>();
      hm.put("midx", midx);
      hm.put("scri", scri);
      
      ArrayList<GatheringJoinVo> gjvmylist = gsm.searchGatherings(hm);
      
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
   //모임 일정 수정하기
   public int gatheringScheduleModify(Gathering_ScheduleVO gsv) {
      int value = gsm.gatheringScheduleModify(gsv);
      return value;
   }
   @Override
   @Transactional
   //모임 일정 삭제하기
   public int gatheringScheduleDel(int giidx,int gsidx) {
      int value1 = gsm.gatheringScheduleDel1(gsidx);
      int value2 = gsm.gatheringScheduleDel2(giidx,gsidx);
      return value2;
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
   //모임참여이력이있으면 gsjidx가져오기
   public String gatheringScheduleViewCheck(int gsidx, int midx) {
      String gsjidx = gsm.gatheringScheduleViewCheck(gsidx,midx);
      return gsjidx;
   }
   @Override
   //참여인원 가지고오기
   public String gatheringScheduleViewJoinCNT(int gsidx) {
      String joinCNT = gsm.gatheringScheduleViewJoinCNT(gsidx);
      return joinCNT;
   }
   
   @Override
   @Transactional
   //모임 일정 참여하기
   public int gatheringScheduleJoin(int gsidx, int midx, int giidx) {
      int value = 0;
      //모임 일정 참여하기 검증
      int check = gsm.gatheringScheduleJoinCheck(gsidx,midx);
      
      //인원이 꽉차면 가입 못 하게 막기
      
      //모임 일정 참여수  
      String joinCNT = gsm.gatheringScheduleViewJoinCNT(gsidx);
      //모임 일정 정원수
      Gathering_ScheduleVO gsv = gsm.gatheringScheduleView(gsidx,giidx);
      
      String Capacity = gsv.getgScheduleCapacity();
      if (Integer.parseInt(joinCNT) < Integer.parseInt(Capacity)) {
         if (check == 0) {
            //모임 일정 참여 테이블 넣기
            value = gsm.gatheringScheduleJoin(gsidx,midx);      
            System.out.println("모임일정참여");
         }         
      }
      return value;
   }
   @Override
   @Transactional
   //모임 일정 참여하기
   public int gatheringScheduleJoinExit(int gsidx, int midx) {
      //모임 일정 참여취소하기
      int value = 0;
      int check = gsm.gatheringScheduleJoinCheck(gsidx,midx);
      if (check != 0) {
         //모임 일정 참여 테이블 넣기
         value = gsm.gatheringScheduleJoinExit(gsidx,midx);      
         System.out.println("모임일정참여취소");
      }
      return value;
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
   @Transactional
   //모임 멤버 승낙 하기
   public int gatheringApproveMembers(ArrayList<Integer> selectedMembers,int giidx) {
      int value = 0;
       for (int midx : selectedMembers) {
               // midx를 사용하여 매퍼로 전달하여 처리하는 로직을 구현
          System.out.println(midx);
          value = gsm.gatheringApproveMembers(giidx,midx);
          gsm.gatheringParticipatingUpdate(giidx); //참여멤버수 +1
            
           }
      return value;
   }
   @Override
   //모임 멤버 거절 하기
   public int gatheringRefuseMembers(ArrayList<Integer> selectedMembers,int giidx) {
      int value = 0;
       for (int midx : selectedMembers) {
               // midx를 사용하여 매퍼로 전달하여 처리하는 로직을 구현
          System.out.println(midx);
          value = gsm.gatheringRefuseMembers(giidx,midx); 
            
           }
      return value;
   }
   @Override
   @Transactional
   //모임 더 보기 멤버 추방
   public int updateMemberDELYN(int midx, int giidx) {      
      int value= gsm.updateMemberDELYN(midx,giidx);
      int value2=gsm.gatheringParticipatingUpdate1(giidx);//참여멤버수 -1
      
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
   @Transactional
   //2.1게시물에 댓글쓰기
   public int gatheringBoardCommentAdd(Gathering_CommentVO gcv) {
      int value = gsm.gatheringBoardCommentAdd(gcv);
               gsm.gatheringBoardCommentAddUpdate(gcv);
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
   @Override
   @Transactional
   //모임 게시글 좋아요
   public int gatheringBoardLike(Gathering_BoardVO gbv) {
      
      int value1 = gsm.gatheringBoardLikeCheck(gbv);
      if (value1 == 0) { 
         int value2 = gsm.gatheringBoardLikeInsert(gbv);
         int value3 = gsm.gatheringBoardLike(gbv);   
         
      }
      return value1;
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
         //모임 권한 조회
         GatheringVo gmt = gsm.gatheringMemberType(giidx, midx);
         //남은 모임원 조회
         System.out.println("멤버타입은?"+gmt.getGatheringMemberType());
         
         int participatingCount = gsm.getGatheringParticipatingCount(giidx);
         System.out.println("남은  모임원 수는?"+participatingCount);
         
         if (gmt.getGatheringMemberType().equals("TL")) {
        	    if (participatingCount == 1) {
        	        System.out.println("모임장은 혼자 남아있어 모임을 나가고 모임이 삭제됩니다.");
        	        //모임에서 나가기(혼자 남았을 경우 해당 행을 삭제하더라도 영향 X)
        	        gsm.exitGathering(midx, giidx);
        	        System.out.println("모임에서 나갔습니다");
        	        //모임과 연관된 포토앨범 정보들 삭제
        	        gsm.updateGatheringPhotoAlbum(giidx);
        	        System.out.println("모임과 연관된 사진첩을 삭제하였습니다");
        	        //모임과 연관된 게시판 정보들 삭제
        	        gsm.updateGatheringBoard(giidx);
        	        System.out.println("모임과 연관된 게시판을 삭제하였습니다");
        	        //모임과 연관된 스케쥴 정보들 삭제
        	        gsm.updateGatheringSchedule(giidx);
        	        System.out.println("모임과 연관된 스케쥴을 삭제하였습니다");
        	        //모임과 연관된 신고정보들 삭제
        	        gsm.updateGatheringDeclaration(giidx);
        	        System.out.println("모임과 연관된 신고내역을 삭제하였습니다");
        	        //모임정보 삭제
        	        gsm.updateGathering(giidx);
        	        System.out.println("모임에서 나가셨습니다");
        	        return true; // 성공 시 true 반환
        	    } else {
        	        System.out.println("모임장은  모임을 나갈 수 없습니다.");
        	        return false; // 실패 시 false 반환
        	    }
        	} else {
        	    System.out.println("모임장이 아니므로 모임에서 나갈 수 있습니다.");
        	    gsm.exitGathering(midx, giidx);
        	    //게시판에 쓴 글들 나가면서 delYN=Y로 변경
        	    gsm.updateGatheringBoardOne(midx,giidx);
        	    //신고내역 나가면서 delYN=Y로 변경
        	    gsm.updateGatheringDeclarationOne(midx,giidx);
        	    //모임원수 -1
        	    gsm.gatheringParticipatingUpdate1(giidx);
        	    System.out.println("모임에서 나가셨습니다.");
        	    return true; // 성공 시 true 반환
        	}
   }
   
   //모임사진첩 조회
   @Override
   public ArrayList<HashMap<String, Object>> gatheringPhotoAlbumListSelect(SearchCriteria scri,int giidx) {
	  HashMap<String, Object> hm = new HashMap<>();
      hm.put("giidx", giidx);
      hm.put("scri", scri);
      ArrayList<HashMap<String, Object>> gPhotoList = gsm.gatheringPhotoAlbumListSelect(hm);
      
      return gPhotoList;
   }
   
   //사진첩 리스트  총 게시물 조회
   @Override
   public int gatheringPhotoAlbumListSelectAll(SearchCriteria scri,int giidx) {
	  HashMap<String, Object> hm = new HashMap<>();
      hm.put("giidx", giidx);
      hm.put("scri", scri);
      
      return gsm.gatheringPhotoAlbumListSelectAll(hm);
   }

   
   //모임사진첩작성
   @Override
   @Transactional
   public int gatheringPhotoAlbumWrite(GatheringJoinVo gjv, MultipartFile GATImg, ArrayList<MultipartFile> GAImg,HttpServletRequest request) throws IOException, Exception {
      
      int value = 0;
      
      String savedGATImgPath = request.getSession().getServletContext().getRealPath("/resources/GATImages");
      String savedGAImgPath = request.getSession().getServletContext().getRealPath("/resources/GAImages");
      //String savedGATImgPath = "D://threekim//threeKim//src//main//webapp//resources/GATImages";//사진첩 대표이미지
      //String savedGAImgPath = "D://threekim//threeKim//src//main//webapp//resources/GAImages";//사진첩 이미지
      
   
      //모임 대표 이미지 
      String uploadedGATImgName  = UploadFileUtiles.uploadFile(savedGATImgPath, GATImg.getOriginalFilename(), GATImg.getBytes());
      gjv.setImageName(uploadedGATImgName);
            
      //1.사진첩 생성      
      value = gsm.gatheringPhotoAlbumWrite(gjv);
      System.out.println("value1성공"+value);
      int gpaidx = gsm.gatheringPhotoAlbumGetGpaidx(gjv);
      gjv.setGpaidx(gpaidx);
      System.out.println("gpaidx값은?"+gpaidx);
      
        
      //2.모임 대표이미지 넣기
        value = gsm.gatheringPhotoGATInsert(gjv);
        System.out.println("value2성공"+value);
	  //3.모임 이미지들 넣기
	    for (MultipartFile file : GAImg) {
	       String uploadedGAImgName = UploadFileUtiles.uploadFile(savedGAImgPath, file.getOriginalFilename(), file.getBytes());
	       gjv.setImageName(uploadedGAImgName);
	       value = gsm.gatheringPhotoGAInsert(gjv);
	        System.out.println("value3성공"+value);
	    }

      return value;
   }


   //사진첩 상세보기
   @Override
   public ArrayList<GatheringJoinVo> gatheringPhotoAlbumListSelectOne(int gpaidx) {
      ArrayList<GatheringJoinVo> gjv = gsm.gatheringPhotoAlbumListSelectOne(gpaidx);
       return gjv;
   }
   
   //사진첩 상세보기 좋아요
   @Override
   public int gatheringPhotoAlbumLike(GatheringJoinVo gjv) {
	   int value1 = gsm.gatheringPhotoAlbumLikeCheck(gjv);
	      if (value1 == 0) { 
	         int value2 = gsm.gatheringPhotoAlbumLikeInsert(gjv);
	         int value3 = gsm.gatheringPhotoAlbumLike(gjv);   
	         
	      }
	      return value1;
   }


   //사진첩 수정하기 페이지 조회
   @Override
   public ArrayList<GatheringJoinVo> gatheringPhotoAlbumModify(int gpaidx) {
      
      ArrayList<GatheringJoinVo> gjv = gsm.gatheringPhotoAlbumModify(gpaidx);
 
      return gjv;
   }


   //사진첩 수정하게 업데이트 수행
   @Override
   @Transactional
   public int gatheringPhotoAlbumModifyUpdate(GatheringJoinVo gjv, MultipartFile GATImg, ArrayList<MultipartFile> GAImg,HttpServletRequest request) throws IOException, Exception {

      int value = 0;
      int imidx = 0;
      
      String savedGATImgPath = request.getSession().getServletContext().getRealPath("/resources/GATImages");
      String savedGAImgPath = request.getSession().getServletContext().getRealPath("/resources/GAImages");
      //String savedGATImgPath = "D://threekim//threeKim//src//main//webapp//resources/GATImages";//사진첩 대표이미지
      //String savedGAImgPath = "D://threekim//threeKim//src//main//webapp//resources/GAImages";//사진첩 이미지
      
   
       //모임 대표 이미지 업데이트
       if (GATImg != null && !GATImg.isEmpty()) {
           String uploadedGATImgName = UploadFileUtiles.uploadFile(savedGATImgPath, GATImg.getOriginalFilename(), GATImg.getBytes());
           gjv.setImageName(uploadedGATImgName);
           value = gsm.gatheringPhotoGATUpdate(gjv);
           System.out.println("모임 대표 이미지 업데이트 성공: " + value);
       }

       //모임 이미지들 업데이트
       for (MultipartFile file : GAImg) {
           if (file != null && !file.isEmpty()) {
               String uploadedGAImgName = UploadFileUtiles.uploadFile(savedGAImgPath, file.getOriginalFilename(), file.getBytes());
               gjv.setImageName(uploadedGAImgName);
               
               //이미지고유번호 가져오기 (gpaidx값)
               imidx = gsm.gatheringGASelect(gjv); //날짜도 변경
               gjv.setImidx(imidx);
               //모임이미지(GA) 업데이트 수행
               value = gsm.gatheringPhotoGAUpdate(gjv);
               
               System.out.println("모임 이미지 업데이트 성공: " + value);
           }
       }

       //사진첩 정보 업데이트
       value = gsm.gatheringPhotoAlbumModifyUpdate(gjv);
       System.out.println("사진첩 정보 업데이트 성공: " + value);
       
       return value;
   }


   //사진첩 삭제
   @Override
   public void deletePhotoAlbum(int midx, int gpaidx) {
      gsm.deletePhotoAlbum(midx, gpaidx);
      
   }


 

















   











   
   
}
