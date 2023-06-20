package com.myezen.myapp.controller;


import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myezen.myapp.domain.BikeJoinVo;
import com.myezen.myapp.domain.MemberVo;
import com.myezen.myapp.service.MemberService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.googleapis.util.Utils;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;




@Controller
@RequestMapping(value="/member")
public class MemberController {

	@Autowired //IoC 컨테이너 안에 존재하는 Bean을 자동으로 주입해준다
	MemberService ms; //업캐스팅 부모만 지정해두면 된다
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	

	

	private final SqlSession sqlSession;

	public MemberController(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	/*/member/login/oauth2/code/google*/
	//!구글로그인
		@RequestMapping(value="/login/oauth2/code/google.do")
		public String google(
				HttpSession session,
				Model model,
				@RequestBody String idTokenString,String g_csrf_token,String credential
				) {
			
			
			// 백엔드에 액세스하는 앱의 CLIENT_ID를 지정합니다.
	        String CLIENT_ID = "225367376527-0b4amsji9p7soai6hnhnt2bkbp4ma82p.apps.googleusercontent.com";
	        
	        HttpTransport transport = Utils.getDefaultTransport();
	        JsonFactory jsonFactory = Utils.getDefaultJsonFactory();
	        
	        GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(transport, jsonFactory)
	                .setAudience(Collections.singletonList(CLIENT_ID))
	                .build();

		        GoogleIdToken idToken = null;
		        try {
		            idToken = verifier.verify(credential);
		        } catch (Exception e) {
		            // 검증 예외 처리
		        	System.out.println("유효하지 않은 ID 토큰입니다.");
		        	e.printStackTrace();
		            
		        }
			

				if (idToken != null) {
				  Payload payload = idToken.getPayload();

				  // 사용자 식별자 출력
				  String userId = payload.getSubject();
				  System.out.println("User ID: " + userId);

				  // Payload에서 프로필 정보 가져오기
				  String email = payload.getEmail();
				  boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
				  String name = (String) payload.get("name");
				  String pictureUrl = (String) payload.get("picture");
				  String locale = (String) payload.get("locale");
				  String familyName = (String) payload.get("family_name");
				  String givenName = (String) payload.get("given_name");
				  
				 
				  
				  System.out.println("구글로그인 들어옴"+email+" ! "+emailVerified+" ! "+name+" ! "+pictureUrl+" ! "+locale+" ! "+familyName+" ! "+givenName+" ! ");
				  
				// 프로필 정보 사용 또는 저장
				// G Suite 도메인 소유권 확인
		            String hostedDomain = payload.getHostedDomain();
		            if (hostedDomain != null && hostedDomain.equals("your_domain.com")) {
		                // G Suite 도메인에 한정된 로직 수행
		            }
		            System.out.println("토큰이 성공적으로 검증되었습니다.");
		            
		            //변수선언
		            String memberId = email;
					String memberPwd = bcryptPasswordEncoder.encode(userId);
					String memberName = name;
		            
		            
					System.out.println("DB에 ID값이 있는지 확인");
		            //DB에 ID값이 있는지 확인
		            int value = ms.socialMemberCheck(memberId);	
		            System.out.println(value);
		            if (value == 0) {
		            	//회원가입 메소드
						int value2 =  ms.googleMemberInsert(memberId,memberPwd,memberName);
						value = ms.socialMemberCheck(memberId);	
					}
		            //DB에 값이 있으면 로그인 부분 실행
		            if (value == 1) {
		            	//로그인 메소드
		            	System.out.println("들어옴");
		            	MemberVo mv = ms.memberLogin(memberId);
		            	
		            	if(mv!=null && bcryptPasswordEncoder.matches(userId, mv.getMemberPwd()) ) {
		            		session.setAttribute("midx", mv.getMidx());
		            		session.setAttribute("memberId", mv.getMemberId());
		            		session.setAttribute("memberName", mv.getMemberName());
		            		session.setAttribute("memberType", mv.getMemberType());
		            	}
		            
		            	
						
					}
		            
		            
		            
		            
		        } else {
		            
		        	System.out.println("유효하지 않은 ID 토큰입니다.");
		        }
			return "redirect:/";
		}
	
//!카카오로그인
	@RequestMapping(value="/login/oauth2/code/kakao.do")
	public String kakao(@RequestParam("code") String code,HttpSession session) throws Throwable {

		// 1번 카카오톡에 사용자 코드 받기(jsp의 a태그 href에 경로 있음)
		// 2번 받은 code를 iKakaoS.getAccessToken로 보냄 ###access_Token###로 찍어서 잘 나오면은 다음단계진행
		// 3번 받은 access_Token를 iKakaoS.getUserInfo로 보냄 userInfo받아옴, userInfo에 nickname, email정보가 담겨있음
				// 1번
				System.out.println("code:" + code);
				
				// 2번
				String access_Token = ms.getAccessToken(code);
				System.out.println("###access_Token#### : " + access_Token);
				// 위의 access_Token 받는 걸 확인한 후에 밑에 진행
				// 3번
				HashMap<String, Object> userInfo = ms.getUserInfo(access_Token);
				System.out.println("###nickname#### : " + userInfo.get("nickname"));
				System.out.println("###email#### : " + userInfo.get("email"));
				
				//변수선언
	            String memberId = (String) userInfo.get("email");
				String memberPwd = bcryptPasswordEncoder.encode(memberId);
				String memberName = (String) userInfo.get("nickname");
				
				//DB에 ID값이 있는지 확인
	            int value = ms.socialMemberCheck(memberId);	
	            System.out.println(value);
	            if (value == 0) {
	            	//회원가입 메소드
					int value2 =  ms.kakaoMemberInsert(memberId,memberPwd,memberName); 
					value = ms.socialMemberCheck(memberId);	
				}
	            //DB에 값이 있으면 로그인 부분 실행
	            if (value == 1) {
	            	//로그인 메소드
	            	System.out.println("들어옴");
	            	MemberVo mv = ms.memberLogin(memberId);
	            	
	            	if(mv!=null && bcryptPasswordEncoder.matches(memberId, mv.getMemberPwd()) ) {
	            		session.setAttribute("midx", mv.getMidx());
	            		session.setAttribute("memberId", mv.getMemberId());
	            		session.setAttribute("memberName", mv.getMemberName());
	            		session.setAttribute("memberType", mv.getMemberType());
	            	}
	            
	            	
					
				}
				
				
		
		return "redirect:/";
	
	}
	
	
	
//!회원가입페이지
	@RequestMapping(value="/memberJoin.do")
	public String memberJoin() {
		
		return "member/memberJoin";
	}
	//!아이디체크
	@ResponseBody
	@RequestMapping(value = "/memberJoinIdCheck.do")
	public HashMap<String, Object> memberJoinIdCheck(@RequestParam("memberId") String memberId) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		System.out.println("아이디체크");
		int value = ms.memberIdCheck(memberId);
		System.out.println(value);
		hm.put("value",value);//0은 거짓 1은 참
		return hm; 
	}
	//!이메일체크
	@ResponseBody
	@RequestMapping(value = "/memberJoinEmailCheck.do")
	public HashMap<String, Object> memberJoinEmailCheck(@RequestParam("memberEmail") String memberEmail) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		System.out.println("이메일체크");
		int value = ms.memberEmailCheck(memberEmail);
		System.out.println(value); 
		hm.put("value",value); //0은 거짓 1은 참
		return hm; 
	}
	//!회원가입페이지에서 기본회원가입 가입하기 버튼 클릭
	@RequestMapping(value="/memberJoinAction.do", method = RequestMethod.POST)
	public String memberJoinAction(
			@RequestParam("memberId") String memberId,
			@RequestParam("memberPwd") String memberPwd,
			@RequestParam("memberName") String memberName,
			@RequestParam("memberAge") String memberAge,
			@RequestParam("memberPhone") String memberPhone,
			@RequestParam("memberEmail") String memberEmail,
			@RequestParam("memberAddr") String memberAddr
			
			) {
		
		String memberPwd2 = bcryptPasswordEncoder.encode(memberPwd);
		
	
		
		int value = ms.memberInsert(memberId, memberPwd2, memberName, memberAge, memberPhone, memberEmail, memberAddr);
						
		return "redirect:/";
	}
//!아이디찾기페이지
	@RequestMapping(value = "/memberIdFind.do")
	public String memberIdFind() {
		
		return "member/memberIdFind"; 
	}
	//!아이디찾기페이지에서 인증번호 보내기
	@ResponseBody
	@RequestMapping(value = "/memberIdMailAuth.do")
	public HashMap<String, Object> memberIdMailAuth(@RequestParam("memberName") String memberName,@RequestParam("memberEmail") String memberEmail) throws Exception {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		int value1 = ms.memberIdFindMatch(memberName,memberEmail);//회원이 맞는지 확인
		if (value1 == 0) {
			hm.put("value",value1); //0은 거짓 1은 참
			return hm; 
		}
		int value2 = ms.memberMailAuth(memberEmail);//인증번호 보내기 
		
		hm.put("value",value2); //0은 거짓 1은 참 
		return hm; 
	}
	//!아이디찾음페이지
	@RequestMapping(value = "/memberIdFound.do")
	public String memberIdFound(
			@RequestParam("memberName") String memberName, 
			@RequestParam("memberEmail") String memberEmail,
			@RequestParam("mailKey") String mailKey,//인증코드
			Model model,
			HttpServletRequest request//이전 페이지로 리다이렉트 시키기
			) {
		
		String memberId = ms.memberIdFind(memberName,memberEmail,mailKey);
		model.addAttribute("memberId", memberId);//값전달
		if (memberId == null) {
		    String referer = request.getHeader("Referer");//이전 페이지로 리다이렉트 시키기
		    return "redirect:"+ referer;
		}
		return "member/memberIdFound"; 
	}
//!비밀번호찾기페이지
	@RequestMapping(value = "/memberPwdFind.do")
	public String memberPwdFind() {
		
		return "member/memberPwdFind"; 
	}
	//!비밀번호찾기페이지에서 인증번호 보내기
	@ResponseBody
	@RequestMapping(value = "/memberPwdMailAuth.do")
	public HashMap<String, Object> memberPwdMailAuth(
			@RequestParam("memberId") String memberId, 
			@RequestParam("memberName") String memberName, 
			@RequestParam("memberEmail") String memberEmail
			) throws Exception {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		int value1 = ms.memberPwdFindAuthMatch(memberId,memberName,memberEmail);//회원이 맞는지 확인
		if (value1 == 0) {
			hm.put("value",value1); //0은 거짓 1은 참
			return hm; 
		}
		
		int value = ms.memberMailAuth(memberEmail);//인증번호 보내기 
		
		hm.put("value",value); //0은 거짓 1은 참
		return hm; 
	}
	//!비밀번호찾음페이지
	@RequestMapping(value = "/memberPwdFound.do") 
	public String memberPwdFound(
			@RequestParam("memberId") String memberId, 
			@RequestParam("memberName") String memberName, 
			@RequestParam("memberEmail") String memberEmail,
			@RequestParam("mailKey") String mailKey,//인증코드
			HttpSession session,
			HttpServletRequest request//이전 페이지로 리다이렉트 시키기
			) {
		//전단계에서 보낸값들을 대조해서 맞는지 틀리는지 판단
		int value = ms.memberPwdFindMatch(memberId,memberName,memberEmail,mailKey);
		if (value == 0) {
		    String referer = request.getHeader("Referer");//이전 페이지로 리다이렉트 시키기
		    return "redirect:"+ referer;
		}
		session.setAttribute("memberId", memberId);
		session.setAttribute("memberName", memberName);
		session.setAttribute("memberEmail", memberEmail);
		session.setAttribute("mailKey", mailKey);
		
		return "member/memberPwdFound"; 
	}
	//!비빌번호찾음페이지에서 비밀번호 재설정버튼 클릭
	@RequestMapping(value = "/memberPwdFoundAction.do")
	public String memberPwdFoundAction(
			@RequestParam("memberPwd") String memberPwd,
			HttpSession session//http세션 가지고오기
			) {
		String memberPwdEncode = bcryptPasswordEncoder.encode(memberPwd);//비밀번호 암호화
		String memberId = (String) session.getAttribute("memberId");
		String memberName = (String) session.getAttribute("memberName");
		String memberEmail = (String) session.getAttribute("memberEmail");
		String mailKey = (String) session.getAttribute("mailKey");
		//세션값 받아오기
		
		//메소드 실행
		int value = ms.memberPwdReset(memberPwdEncode,memberId,memberName,memberEmail,mailKey);
		
		//세션지우기
		session.removeAttribute("memberId");
		session.removeAttribute("memberName");
		session.removeAttribute("memberEmail");
		session.removeAttribute("mailKey");
		return "redirect:/"; 
	}
	
//!로그인페이지	
	@RequestMapping(value="/memberLogin.do")
	public String memberLogin() {
	
		return "member/memberLogin";
		
	}
	//!로그인페이지에서 로그인하기 버튼 클릭
	@RequestMapping(value="/memberLoginAction.do")
	public String memberLoginAction(
			@RequestParam("memberId")String memberId,
			@RequestParam("memberPwd")String memerPwd,
			HttpSession session,
			RedirectAttributes rttr, //담는 용도
			Model model
			) {
		
		MemberVo mv = ms.memberLogin(memberId);
		
		
		if(mv!=null && bcryptPasswordEncoder.matches(memerPwd, mv.getMemberPwd()) ) {
			//rttr은 페이지를 벗어나면 사라짐, session으로 담아줘야 유지 됨
			session.setAttribute("midx", mv.getMidx());
			session.setAttribute("memberId", mv.getMemberId());
			session.setAttribute("memberName", mv.getMemberName());
			session.setAttribute("memberType", mv.getMemberType());
			session.setAttribute("memberIntro", mv.getMemberIntro());
			session.setAttribute("memberProfile", mv.getMemberProfile());
			
			
			if(session.getAttribute("dest") == null) {
				return "redirect:/";	
			}else {
				String dest = (String)session.getAttribute("dest");	
				return "redirect:"+dest;
			}
			
			
			
		}else {
			rttr.addFlashAttribute("msg", "아이디와 비밀번호를 확인 해 주세요.");//일회성 메세지
			return "redirect:/member/memberLogin.do";
			
		}
		
	}
//!로그아웃 클릭
	@RequestMapping(value="/memberLogOut.do")
	public String memberLogout(HttpSession session) {
		String access_Token ="";
		access_Token = (String) session.getAttribute("access_Token");
		if (access_Token!=null) {
			System.out.println("토큰");
		}
		
		session.removeAttribute("midx");
		session.removeAttribute("memberName");
		session.invalidate(); //세션을 없애고 세션에 속해있는 값들을 모두 없앤다
		
		return "redirect:/";
	}
	@RequestMapping(value="/memberList.do")
	//value에 안쓰면 둘다 받겠다 get + foward 
	public String memberList(Model model) {
		
		ArrayList<MemberVo> alist = ms.memberList();
		
		model.addAttribute("alist",alist); //(model=requestsetattribute)에 담아서 가지고 간다
		
		return "member/memberList";
	}
	
	//회원삭제
	@RequestMapping("/memberDelete.do")
	public String deleteMember(@RequestParam("memberId") String memberId) {
		//System.out.println("test1");
		ms.deleteMember(memberId);
		//System.out.println("test2");
		return "redirect:/member/memberList.do"; 
	
	}
	
	//마이페이지
	@RequestMapping("/memberMypage.do")
	public String memberMypage() {   
	    return "member/memberMypage";
	}
	
	//회원정보수정
	@RequestMapping("/memberEditInformation.do")
	public String memberEditInformation(Model model, HttpSession session) {
	    int midx = (Integer) session.getAttribute("midx");
	    
	    
	    MemberVo mv = ms.getMemberInfo(midx);
	    session.setAttribute("mv", mv);
	    session.setAttribute("memberName", mv.getMemberName());
	    session.setAttribute("memberAge", mv.getMemberAge());
	    session.setAttribute("memberPhone", mv.getMemberPhone());
	    session.setAttribute("memberEmail", mv.getMemberEmail());
	    model.addAttribute("mv", mv);
	    
	    
	    return "member/memberEditInformation";
	}
	
	//회원정보수정페이지
	@RequestMapping("/memberUpdate.do")
	public String memberUdpate(Model model, HttpSession session) {
		int midx =(Integer) session.getAttribute("midx");
		MemberVo mv = ms.getMemberInfo(midx);
		model.addAttribute("mv", mv);
		return "member/memberUpdate";
	}
	
	//회원정보수정
	@PostMapping("/memberUpdateAction.do")
	public String memberUpdateAction( 
	        @RequestParam("memberPwd") String memberPwd,
	        @RequestParam("memberName") String memberName,
	        @RequestParam("memberAge") String memberAge,
	        @RequestParam("memberPhone") String memberPhone,
	        @RequestParam("memberEmail") String memberEmail,
	        Model model,
	        HttpSession session) {

	    // 비밀번호 암호화
	    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	    String encryptedPassword = passwordEncoder.encode(memberPwd);

	    MemberVo mv = (MemberVo) session.getAttribute("mv");

	    
	    // 비밀번호 변경 여부 확인 후 업데이트
	    if (!memberPwd.isEmpty()) {
	        mv.setMemberPwd(encryptedPassword);
	    }
	    
	    // 이름과 나이 변경 여부 확인
	    if (!memberName.isEmpty()) {
	        mv.setMemberName(memberName);
	    }
	    if (!memberAge.isEmpty()) {
	        mv.setMemberAge(memberAge);
	    }

	    // 휴대폰번호와 이메일 변경 여부 확인 후 업데이트
	    if (!memberPhone.isEmpty()) {
	        mv.setMemberPhone(memberPhone);
	    }
	    if (!memberEmail.isEmpty()) {
	        mv.setMemberEmail(memberEmail);
	    }

	    //mv.setMemberpwd(encryptedPassword);
	    //mv.setMembername(membername);
	    //mv.setMemberage(memberage);
	    //mv.setMemberphone(memberphone);
	    //mv.setMemberemail(memberemail);
	   
	    // 회원 정보 업데이트
	    ms.updateMember(mv);

	    // 세션에 업데이트된 mv 저장
	    session.setAttribute("mv", mv);
	    session.setAttribute("memberName", mv.getMemberName());
	    session.setAttribute("memberAge", mv.getMemberAge());
	    session.setAttribute("memberPhone", mv.getMemberPhone());
	    session.setAttribute("memberEmail", mv.getMemberEmail());

	    model.addAttribute("mv", mv);

	    return "redirect:/member/memberEditInformation.do";
	}
	
	//회원탈퇴
	@RequestMapping(value = "/memberWithdrawal.do", method = RequestMethod.GET)
	public String memberWithdrawal(HttpServletRequest request, HttpSession session) {
	   
		String memberId = (String) session.getAttribute("memberId");

		ms.withdrawMember(memberId);
		
		session.invalidate(); //회원탈퇴니까 세션에 담겨진 정보 싹 날려보냄
		 
	    return "redirect:/";
	}

	
	//회원리스트에서 회원정보보기
	@RequestMapping("/memberListProfile.do")
	public String memberListProfile(@RequestParam("memberId") String memberId, Model model) {
	    MemberVo mv = ms.getMemberByMemberId(memberId);
	    model.addAttribute("mv", mv);
	    return "member/memberListProfile";
	}
	
	//마이페이지 내가 쓴 글
		@RequestMapping("/memberMyPost.do")
		public String memberMyPost(Model model, HttpSession session) {
			String memberName = (String) session.getAttribute("memberName");
			System.out.println("멤버네임은??"+memberName);
		    ArrayList<BikeJoinVo> blist = ms.getMyPosts(memberName);
		    model.addAttribute("blist", blist);
		    return "member/memberMyPost";
		}
		
		
	//비밀번호 확인 페이지
		@RequestMapping("/memberCheckPwd.do")
		public String memberCheckPwd(@RequestParam(value = "error", defaultValue = "0") int error, Model model,HttpSession session) {
			 if (error == 1) {
			        model.addAttribute("errorMsg", "비밀번호가 일치하지 않습니다. 다시 시도해주세요.");
			    }
			 
			 int midx = (Integer) session.getAttribute("midx");
			 MemberVo mv = ms.getMemberInfo(midx);			
			 //소셜로그인이면 PASS
			 if (mv.getMemberLoginType().equals("구글") || mv.getMemberLoginType().equals("카카오")) {
				return "redirect:/member/memberUpdate.do";
			 }
			  return "member/memberCheckPwd";
		}
		
		//비밀번호 확인 페이지
		@RequestMapping("/memberCheckPwdAction.do")
		public String memberCheckPwdAction(
			@RequestParam("password") String enteredPwd,
			HttpSession session,
			RedirectAttributes rttr) {
			
			//로그인한 midx값으로 memberPwd받아오기
			int midx = (Integer) session.getAttribute("midx");
			MemberVo mv = ms.getMemberInfo(midx);			
			
			//입력한 비밀번호와 memberVo에 담긴 memberPwd 일치 여부 확인
			String loggedInPassword = mv.getMemberPwd();
			
			//memberCheckPwd에서 입력한 비밀번호도 암호화해서 대조해봐야함
			BCryptPasswordEncoder bcryptPasswordEncoder = new BCryptPasswordEncoder();
			 
			System.out.println("입력한비번은?"+enteredPwd);
		    System.out.println("멤버비번은?"+loggedInPassword);
		    if (bcryptPasswordEncoder.matches(enteredPwd, loggedInPassword)) {
		        // 비밀번호가 일치하면 memberUpdate.do로 리다이렉트
		        return "redirect:/member/memberUpdate.do";
		    } else {
		    	// 비밀번호가 일치하지 않으면 에러 메시지를 모델에 담아서 memberCheckPwd.do로 이동
		    	rttr.addFlashAttribute("error", "비밀번호가 일치하지 않습니다. 다시 시도해주세요.");
		    	return "redirect:/member/memberCheckPwd.do?error=1";
		    }
		}
		
		//회원프로필(내 간단소개)/*김병수*/
		@PostMapping("/memberUpdateIntro.do")
		@ResponseBody
		public void memberUpdateIntro(
				HttpSession session,
				@RequestParam("memberIntro") String memberIntro) {
		    System.out.println("간단소개 컨트롤러 들어옴");
		    int midx = (Integer) session.getAttribute("midx");
		   
		    
		    MemberVo mv = new MemberVo();
		    mv.setMidx(midx);
		    mv.setMemberIntro(memberIntro);
		    // 데이터베이스에 memberIntro 업데이트
		    ms.memberUpdateIntro(mv);
		    System.out.println("멤버소개: " + mv.getMemberIntro());

		    // 업데이트된 memberIntro 값을 데이터베이스에서 조회하여 세션에 저장
		    
		    String updatedIntro = ms.getMemberIntro(midx);
		    session.setAttribute("memberIntro", updatedIntro);
		    
		    
		    session.setAttribute("memberIntro", updatedIntro);
		   
		}

		
		//회원 프로필 업데이트 /*김건우*/
		@RequestMapping(value = "/MypageProfile.do", method = RequestMethod.POST)
	    public String gMypageProfile(
	    		HttpServletRequest request, 
	    		@RequestParam("memberProfile") MultipartFile memberProfile
	    		) throws IOException, Exception{
			System.out.println("회원 프로필 업데이트 들어옴");
			HttpSession session = request.getSession();
			Object omidx = session.getAttribute("midx");
		    if (omidx == null) {//midx가 없으면 진입불가
		    	return "redirect:/";
			}
		    int midx = (int)omidx;
		    
		    //회원 프로필 업데이트
		    String profile = ms.memberUpdateMemberProfile(midx,memberProfile);
		    
		    session.setAttribute("memberProfile", profile);
		 
		    return "redirect:/member/memberMypage.do";
	    }
			
		
		
		
		
		
		
		
		

	
}
