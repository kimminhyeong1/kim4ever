<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>타:바-모임-게시글보기</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_gathering.css">
		<link rel="stylesheet" media="(min-width: 300px) and (max-width: 940px)" href="${pageContext.request.contextPath}/css/style_gathering_mo.css">
		<link rel="icon" href="${pageContext.request.contextPath}/resources/logo/logo7.png">
		<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script><!-- 풀캘린더 라이브러리 -->  
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" crossorigin="anonymous">
		<meta name="viewport" content="width=device-width, initial-scale=1">		
		 <style type="text/css">
		 	a{text-decoration: none; color: #000;}	
		 	/*부분*/
		 	/* *{outline: 1px solid #f00;} */
		 	.gContainer{border: 1px solid #0000;}
		 	.midmenu:nth-child(1) {color: #05d100 ;} /* 메뉴글자색*/
		 	
		 	/*모임이름부분*/
		 	#gIntro_gThumbnail{text-align:left;}
			#gIntro{display: inline-block; width: 430px; height: 500px; border: 1px solid #bbb;background-color: #fbfdfa;border-radius: 20px;}
			#gIntro>div:nth-child(1){font-size: 35px;  display: inline-block; margin: 20px 0px 20px 20px;}
			#gIntro>div:nth-child(2){font-size: 24px; width: 100px; display: inline-block; margin-left:20px;}
			#gIntro>div:nth-child(3){width: 90%; height: 50%; margin: 20px 20px 20px 20px;  border-radius:20px;}
			#gIntro>div:nth-child(3)>img{width: 100%; height: 100%;border-radius:20px;}
			#gIntro>div:nth-child(4){font-size: 24px; width: 90%; height: 4%; margin: 20px 20px 20px 20px;}
			#gIntro>div:nth-child(5){font-size: 20px; width: 90%; height: 13%; margin: 20px 20px;  overflow: hidden; text-overflow: ellipsis; word-wrap: break-word;}
			/*모임슬라이더부분*/
			#gThumbnail{vertical-align: top;margin-left:20px; display: inline-block; width: 780px; height: 500px; border: 1px solid #bbb;background-color: #fbfdfa;border-radius: 20px; float:right;}
			#gThumbnail>div>div:nth-child(1){font-size: 20px;font-weight: bold;margin 0 auto;}
			/* 슬라이더 1 시작 */
			.slider-1 {height:100%;position:relative; margin:0 auto; width: 100%; object-fit:contain;}
			/* 슬라이더 1 - 페이지 버튼 */
			.slider-1 > .page-btns {text-align:center; position:absolute; bottom:20px; left:0; width:100%;}
			
			.slider-1 > .page-btns > div {width:25px; height:6px; background-color:#ffff; border-radius:4px;   
			 display:inline-block; cursor:pointer; border: none;}
			.slider-1 > .page-btns > div.active {background-color:#05d100; border: none;}
			/* 1 - 슬라이드 */
			.slider-1 > .slides > div {position:absolute; top:0; left:0; right:0; bottom:0; opacity:0; transition:opacity 1.5s;
			background-position:center;  background-repeat:no-repeat; border-radius:20px;  object-fit: contain; background-size:contain; }
			.slider-1 > .slides > div.active {opacity:1;}
			/*  좌우 버튼 */
			.slider-1 > .side-btns > div {position:absolute; top:0; left:0; width:25%;
			height:100%; cursor:pointer; color:white; display:none}
			.slider-1 > .side-btns > div:last-child {left:auto; right:0;}
			.slider-1 >.side-btns > div > span {position:absolute;top:50%;left:20px;transform:translatey(-10%);
			opacity:1;padding:5px; border-radius:50px;font-size:50px;}
			.slider-1 >.side-btns > div:last-child > span {left:auto;right:20px; }
			/*모임멤버부분*/
			#gMembers{margin-top:30px; width: 100%; height: 130px; border: 1px solid #bbb;background-color: #fbfdfa;border-radius: 20px; text-align: left;}
			#gMembers>div:nth-child(1){font-size: 24px;margin-left: 17px;margin-top: 17px;}
			#gMembers>div:nth-child(1)>span{color: #f00;} 
			#gMembers>div:nth-child(2){width: 80%; display: inline-block;margin: 10px 20px; }
			#gMembers>div:nth-child(2)>div{width: 60px; height: 60px;display: inline-block; margin-left: 20px; vertical-align: bottom; }
			#gMembers>div:nth-child(2)>div>img{width: 100%; height: 100%; border-radius: 20px; border: 1px solid #bbb;}
			#gMembers>div:nth-child(2)>div>span{width: 100%; height: 100%;color:#bbb;text-align: center;line-height: 50px;font-size: 50px;}
			#gMembers>div:nth-child(3){width: 15%;  display: inline-block;vertical-align: top;margin-top: -32px;}
			#gMembers>div:nth-child(4){width: 7%; display: inline-block;vertical-align: top; margin-top: 20px; margin-left: 10px;}
			/*모임일정부분*/
			#gSchedule{margin-top:30px;width: 100%; height: 1140px; border: 1px solid #bbb;background-color: #fbfdfa;border-radius: 20px;text-align: left;}
			#gSchedule>div:nth-child(1){font-size: 35px;margin-top: 15px;margin-left: 20px;} 
			#calendar {margin: 20px 20px;}
			#gSchedule>div:nth-child(3){text-align: right;margin-right: 20px;}
			#gSchedule>div:nth-child(3)>button{width: 150px; height: 50px;} 
			/*모임공지사항부분*/
			#gNotice{margin-top:30px;width: 100%;  border: 1px solid #bbb;background-color: #fbfdfa;border-radius: 20px;}
			/*공지사항부분*/
			.gNotice{text-align: left; font-size: 20px; margin: 20px 60px;}
			.gNotice>div>div{display: inline-block; font-size: 25px;}
			.gNotice>div>div:nth-child(1){color: #f00; margin-right: 20px;}
			.gNotice>div:nth-child(2){border-bottom: 2px solid #bbb; font-size:24px; padding-bottom: 10px; margin-top: 10px; white-space: nowrap; overflow: hidden;  text-overflow: ellipsis;}/* 끝나는바*/
			/*모임기타버튼부분*/
			#gReportExit{margin-top:40px;width: 100%; height: 100px; border: 1px solid #bbb;background-color: #fbfdfa;border-radius: 20px;text-align: right;}
			#gReportExit>button{font-size:21px; border-radius:20px; border:0px solid #99CC99; background:#05d100; color:white;margin-top: 30px;margin-left: 10px;margin-right: 20px;width: 132px;height: 40px;font-size: 21px;}
			#gReportExit>button:active{color: #000;} 
			/*캘린더*/
			.fc-daygrid-event {white-space: break-spaces;}
			.gBtn {margin-top: 12px;}
		.fc .fc-button-primary {background:#05d100; border-color:white;font-size:20px; border-radius:20px;} /*달력*/
		.fc .fc-button-primary:disabled{background:#05d100; border-color:white;font-size:20px }
		.fc .fc-toolbar-title {font-size:35px; font-weight:normal; margin-left:40px;}
		.fc .fc-scrollgrid {font-size: 20px;}
			/*#empty*/
			#empty{line-height: 100px;font-size: 24px;text-align: left;margin-left: 20px;}
		.fc-daygrid-block-event .fc-event-time, .fc-daygrid-block-event .fc-event-title {cursor:pointer; font-size:15px;}
			/*************************모바일****************************************/
				/*****모바일 넓이***/
				@media (min-width: 300px) and (max-width: 940px)  {
		
		 	.gContainer{border: 1px solid #0000; padding-top:5%; max-width:500px;}
		 	#main{width:auto; height:auto; }
		 	/*모임슬라이더부분*/
			#gThumbnail{vertical-align: top; width: 61%; height:98%; margin-left:1%; margin-top: 0px; position: absolute;}
			#gThumbnail>div>div:nth-child(1){font-size: 20px;font-weight: bold; margin 0 auto;}
			
		 	/*모임이름부분*/
		 	#gIntro_gThumbnail{text-align:left; position: relative; overflow:hidden;}
			#gIntro{display: inline-block; width: 37%; height: auto;  margin: 0 auto;}
			#gIntro>div:nth-child(1){font-size: 20px;  display: inline-block; margin:10px; margin-bottom:0px;}
			#gIntro>div:nth-child(2){font-size: 15px; width: 150px; display: inline-block; margin-left: 70%;}
			#gIntro>div:nth-child(3){width: 70%; height: 50%; margin: 0 auto; border: 0px solid #bbb;}
			#gIntro>div:nth-child(3)>img{width: 100%; height: 80%;  text-align: center;}
			#gIntro>div:nth-child(4){font-size: 18px; width: 90%;  margin: 5px;}
			#gIntro>div:nth-child(5){width: 90%; height: 13%; margin: 5px; font-size:15px;}
	
		
			/*모임멤버부분*/
			#gMembers{margin-top:10px; width: 99%; height: 110px;  text-align: left;}
			#gMembers>div:nth-child(1){font-size: 20px;margin-top: 5px;margin-left: 20px;}
			#gMembers>div:nth-child(1)>span{color: #f00;} 
			#gMembers>div:nth-child(2){width: 80%; display: inline-block;margin: 10px 20px;}
			#gMembers>div:nth-child(2)>div{width: 45px; height: 45px;display: inline-block; margin-left: 0px; vertical-align: bottom;}
			#gMembers>div:nth-child(2)>div>img{width: 100%; height: 100%; border-radius: 30px; }
			#gMembers>div:nth-child(2)>div>span{width: 100%; height: 100%;color:#bbb;text-align: center;line-height: 50px;font-size: 50px;}
			#gMembers>div:nth-child(3){width: 30%;  display: inline-block;vertical-align: top;margin-top: 20px;}
			#gMembers>div:nth-child(4){width: 7%; display: inline-block;vertical-align: top; margin-top: 20px; margin-left: 10px;}
			/*모임일정부분*/
			#gSchedule{margin:10px 0;width: 99%; height: auto; text-align: left;}
			#gSchedule>div:nth-child(1){font-size: 20px; margin-top: 15px;margin-left: 20px;} 
			#calendar {margin: 20px 20px;}
			#gSchedule>div:nth-child(3){text-align: right;margin-right: 20px;}
			#gSchedule>div:nth-child(3)>button{width: 100px; height: 30px;}
			/*모임공지사항부분*/
			#gNotice{margin-top:0px;width: 99%;}
			/* 슬라이더*/
			.slider-1 > .page-btns > div {width: 20px; height: 6px;  background-color: #ffffff; border-radius: 4px; display: inline-block; cursor: pointer; border: none;}
			.slider-1 >.side-btns > div > span {position: absolute; top: 40%; left: 20px; transform: translatey(-10%); opacity: 1; padding: 5px;    border-radius: 50px; font-size: 50px;}
			/*공지사항부분*/
			.gNotice{text-align: left; font-size: 20px; margin: 15px 30px;}
			.gNotice>div>div{display: inline-block; font-size: 20px;}
			.gNotice>div>div:nth-child(1){ margin-right: 20px;}
			.gNotice>div:nth-child(2){padding-bottom: 10px; margin-top: 10px; font-size:18px;}/* 끝나는바*/
			/*모임기타버튼부분*/
			#gReportExit{margin-top:30px;width: 99%; height: 40px; text-align: right; margin-bottom:30px; margin-top:10px;}
			#gReportExit>button{margin-top: 5px;margin-left: 10px;margin-right: 20px;width: 100px;height: 30px;font-size: 18px;}
			
			#calendar{min-height:450px;}
			.gbox{width:200px}
			.gBtn{position: relative; bottom:100px; margin-top:14px;  left: 235%;}
			}
						/*캘린더*/
			.fc-daygrid-event {white-space: break-spaces;}
			.gBtn {margin-top: 12px;}
		.fc .fc-button-primary {background:#05d100; border-color:white;font-size:12px; border-radius:20px;} /*달력*/
		.fc .fc-button-primary:disabled{background:#05d100; border-color:white;font-size:13px }
		.fc .fc-toolbar-title {font-size:20px; font-weight:normal; margin-left:40px;}
		.fc .fc-scrollgrid {font-size: 15px;}
		.fc .fc-toolbar.fc-header-toolbar {margin-bottom: 0.5em;}
			#empty{width:99%; font-size:20px;}
				.fc-direction-ltr .fc-daygrid-event .fc-event-time {margin-right: 3px;  width: 50px;  white-space: nowrap;  overflow: initial;}
.fc-daygrid-block-event .fc-event-time, .fc-daygrid-block-event .fc-event-title { padding: 1px;  white-space: nowrap;  overflow: hidden;  text-overflow: ellipsis;}

	
}
			/*#empty*/
			#empty{line-height: 100px;font-size: 20px;text-align: left;margin-left: 20px;}
		
			
		 </style>

		<script>
		  document.addEventListener('DOMContentLoaded', function() {
		    var calendarEl = document.getElementById('calendar');
		    var calendar = new FullCalendar.Calendar(calendarEl, {
		      initialView: 'dayGridMonth',
		      locale: 'ko', // 한국어로 설정
		      events: [
		        // 서버에서 받은 스케줄 데이터를 여기에 반영
		        // 예를 들어, 서버에서 스케줄 데이터를 events 받음
		        <c:forEach var="gsvlist" items="${gsvlist}">
		          {
		            title: '${gsvlist.gScheduleTitle} 정원 (${gsvlist.gScheduleParticipating}/${gsvlist.gScheduleCapacity}명)',
		            start: '${gsvlist.gScheduleStartDay}',
		            end: '${gsvlist.gScheduleEndDay}',
		            display: 'block', // 이벤트 표시 방식 설정
		            gsidx: '${gsvlist.gsidx}'
		          },
		        </c:forEach>
		      ],
		      eventClick: function(info) {
		        // 클릭한 이벤트의 정보를 가져옴
		        var eventgsidx = info.event.extendedProps.gsidx; // 이벤트의 고유 ID
		
		        // 클릭한 스케줄의 정보를 페이지로 전달하고 이동
		        window.location.href = '${pageContext.request.contextPath}/gathering/gScheduleDetails.do?gsidx=' + eventgsidx;
		      }
		    });
		
		    calendarEl.style.width = '1210px;'; // 원하는 너비로 설정
		    calendar.render();
		  });
		  
		  
		  function exitGathering(midx, giidx) {
			    var confirmExit = confirm("모임을 나가시겠습니까?");
			    if (confirmExit) { 
			    	$.ajax({
			            url: "${pageContext.request.contextPath}/gathering/exitGathering.do?midx=" + midx,
			            method: "POST",
			            data: {
			                midx: midx,
			                giidx: giidx
			            },
			            success: function(response) {
			                
			                if (response === false) {
			                	alert("모임장은 나가실 수 없습니다. 권한을 넘겨주세요.");
			                } else {
			                	alert("모임에서 나가셨습니다."); 
			                	 window.location.href = "${pageContext.request.contextPath}/gathering/gList.do";
			                }
			            },
			            error: function() {
			                // 요청 실패 시 동작
			                alert("모임 나가기 요청에 실패했습니다.");
			            }
			        });
			    }
			}
		  
		  
		  
		</script>
	</head> 
	<body>  
	<%@include file="../header2.jsp" %>
	<%@include file="header3.jsp" %>
	<main id="main">
		<section class="gContainer">
			<div id="gIntro_gThumbnail">
				<div id="gIntro">
					<div>${gjvlist[0].gInfoName}</div>
					<div>${gjvlist[0].gInfoArea}</div>
					<div><img alt="모임장 프로필" src="../resources/MemberProfile/${gjvlist[0].memberProfile}"></div>
					<div>모임장: ${gjvlist[0].memberName}</div> 
					<div>${gjvlist[0].gInfoAreaIntroduction} </div>
				</div>
				<div id="gThumbnail">
						<div class="slider-1">
						    <div class="slides">
						    	<c:set var="GImages" value="${gjvlist}" />
								<c:forEach var="gjv" items="${GImages}" varStatus="status">
								    <div class="${status.index == 0 ? 'active' : ''}" style="background-image:url(../resources/GImages/${gjv.imageName});"></div>
		
							
								</c:forEach>            
						    	</div>
							    <div class="page-btns">
	    					    	<c:forEach var="gjv" items="${GImages}" varStatus="status">
									    <div class="${status.index == 0 ? 'active' : ''}"></div>
									</c:forEach>       
							    </div>
							    <div class="side-btns">
							        <div>
							            <span><i class="fas fa-angle-left"></i></span>
							        </div>
							        <div>
							            <span><i class="fas fa-angle-right"></i></span>
							        </div>
							    </div>
					</div>
				</div>
			</div>
			<div id="gMembers">
				<div>모임 멤버(${gjvlist[0].gInfoParticipating}명/${gjvlist[0].gInfoCapacity}명)
					<c:if test="${WaitCNT ne '0'}">
						<span> ${WaitCNT}+[승인대기]</span>
					</c:if>
				</div>				
				<div>
					<c:forEach var="gjvm" items="${gjvmlist}">
					    <div><img alt="" src="../resources/MemberProfile/${gjvm.memberProfile}"></div>
					</c:forEach> 
					<div><span>...</span></div>						
				</div>
				<div class="gBox">
				<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.2.0/kakao.min.js"integrity="sha384-x+WG2i7pOR+oWb6O5GV5f1KN2Ko6N7PTGPS7UlasYWNxZMKQA63Cj/B2lbUmUfuC" crossorigin="anonymous"></script>
				<script>
				  Kakao.init('20f538f14cf29a1eb30d2f9dbaa4e1fb'); // 사용하려는 앱의 JavaScript 키 입력
				</script>
				
				<a id="kakaotalk-sharing-btn"  href="javascript:shareMessage()">
				 <button class="gBtn">초대하기</button>
				</a>
				
				<script>
				  function shareMessage() {
				    Kakao.Share.sendDefault({
				      objectType: 'feed',
				      content: {
				        title: '${gjvlist[0].gInfoName}',
				        description: '#타바 모임초대 #타바 자전거모임',
				        imageUrl:
				          'http://jjezen.cafe24.com/kim4ever/resources/MemberProfile/${gjvlist[0].memberProfile}',
				        link: {
				          // [내 애플리케이션] > [플랫폼] 에서 등록한 사이트 도메인과 일치해야 함
				          mobileWebUrl: 'http://jjezen.cafe24.com/kim4ever/',
				          webUrl: 'http://jjezen.cafe24.com/kim4ever/',
				        },
				      },
				      buttons: [
				        {
				          title: '웹으로 보기',
				          link: {
				            mobileWebUrl: 'http://jjezen.cafe24.com/kim4ever/gathering/gSimpleInfo.do?giidx=${giidx}',
				            webUrl: 'http://jjezen.cafe24.com/kim4ever/gathering/gSimpleInfo.do?giidx=${giidx}',
				          },
				        },
				        {
				          title: '앱으로 보기',
				          link: {
				            mobileWebUrl: 'http://jjezen.cafe24.com/kim4ever/gathering/gSimpleInfo.do?giidx=${giidx}',
				            webUrl: 'http://jjezen.cafe24.com/kim4ever/gathering/gSimpleInfo.do?giidx=${giidx}',
				          },
				        },
				      ],
				    });
				  }
				</script>
				
				<div><button class="gBtn" onclick="location.href='${pageContext.request.contextPath}/gathering/gMemberList.do'">더보기</button></div>
				</div>			
			</div>
			<div id="gSchedule">
				<div>모임 일정</div>
				<div id='calendar'></div>
				<c:if test="${MGatheringMemberType eq 'TL' or MGatheringMemberType eq 'TLD' }">
					<div><button class="gBtn2" onclick="location.href='${pageContext.request.contextPath}/gathering/gScheduleMake.do'">일정 만들기</button></div>				
				</c:if>
			</div>
			<div id="gNotice">
				<c:if test="${empty gbvlist}">
					<div id="empty">공지사항이 없습니다.</div>
				</c:if>
				<c:forEach var="gbv" items="${gbvlist}">
					<div class="gNotice">
						<div>
							<div>공지사항</div>
							<div><a href="${pageContext.request.contextPath}/gathering/gBoard/${gbv.gbidx}/Content.do">${gbv.gBoardTitle}</a></div>
						</div>
						<div><a href="${pageContext.request.contextPath}/gathering/gBoard/${gbv.gbidx}/Content.do">${gbv.gBoardContents}</a></div>
					</div>
				</c:forEach>
			</div>
			<div id="gReportExit">
				<button onclick="location.href='${pageContext.request.contextPath}/gathering/gDeclarationCheck.do?giidx=${giidx}'">모임 신고하기</button> 
				<button type="button" onclick="exitGathering(${midx}, ${giidx})">모임 나가기</button>
			</div>
			
		</section>
	</main>
	<%@include file="../footer.jsp" %>
	<script type="text/javascript">
		console.clear();
		// 버튼형 슬라이더
		$('.slider-1 > .page-btns > div').click(function(){
		 var $this = $(this);
		 var index = $this.index();
		 
		 $this.addClass('active');
		 $this.siblings('.active').removeClass('active');
		 
		 var $slider = $this.parent().parent();
		 
		 var $current = $slider.find(' > .slides > div.active');
		 
		 var $post = $slider.find(' > .slides > div').eq(index);
		 
		 $current.removeClass('active');
		 $post.addClass('active');
		});
		
		//좌우 버튼 추가 슬라이더
		$('.slider-1 > .side-btns > div').click(function(){
		 var $this = $(this);
		 var $slider = $this.closest('.slider-1');
		 
		 var index = $this.index();
		 var isLeft = index == 0;
		 
		 var $current = $slider.find(' > .page-btns > div.active');
		 var $post;
		 
		 if ( isLeft ){
		     $post = $current.prev();
		 }
		 else {
		     $post = $current.next();
		 };
		 
		 if ( $post.length == 0 ){
		     if ( isLeft ){
		         $post = $slider.find(' > .page-btns > div:last-child');
		     }
		     else {
		         $post = $slider.find(' > .page-btns > div:first-child');
		     }
		 };
		 
		$post.click();});
		
		setInterval(function(){ $('.slider-1 > .side-btns > div').eq(1).click();}, 3000);
	</script>
	
	<script>
	window.onload = function() {
	    var alertMessage = "${alertMessage}"; //알림 메시지를 가져옴
	    if (alertMessage) {
	        alert(alertMessage); //알림 메시지를 출력
	    }
	}
</script>
	</body>
</html>