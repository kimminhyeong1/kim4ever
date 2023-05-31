<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>소모임 검색</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_gathering.css">
		<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script><!-- 풀캘린더 라이브러리 -->  
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" crossorigin="anonymous">
		 <style type="text/css">
		 	/*부분*/
		 	/* *{outline: 1px solid #f00;} */
		 	.gContainer{border: 1px solid #0000;}
		 	/*모임이름부분*/
		 	#gIntro_gThumbnail{text-align:left;}
			#gIntro{display: inline-block; width: 400px; height: 500px; border: 1px solid #bbb;background-color: #f1f1f1;border-radius: 10px;}
			#gIntro>div:nth-child(1){font-size: 40px; font-weight: bold; width: 150px; display: inline-block; margin: 20px 0px 20px 20px;}
			#gIntro>div:nth-child(2){font-size: 20px; width: 150px; display: inline-block;}
			#gIntro>div:nth-child(3){width: 90%; height: 50%; margin: 20px 20px 20px 20px; border: 1px solid #bbb;}
			#gIntro>div:nth-child(3)>img{width: 100%; height: 100%;}
			#gIntro>div:nth-child(4){font-size: 20px; width: 90%; height: 4%; margin: 20px 20px 20px 20px;}
			#gIntro>div:nth-child(5){width: 90%; height: 13%; margin: 20px 20px;}
			/*모임슬라이더부분*/
			#gThumbnail{vertical-align: top;margin-left:42px; display: inline-block; width: 800px; height: 500px; border: 1px solid #bbb;background-color: #f1f1f1;border-radius: 10px;}
			#gThumbnail>div>div:nth-child(1){font-size: 20px;font-weight: bold;margin-top: 15px;margin-left: 20px;}
			/* 슬라이더 1 시작 */
			.slider-1 {height:420px;position:relative; margin: 15px auto; width: 700px;}
			/* 슬라이더 1 - 페이지 버튼 */
			.slider-1 > .page-btns {text-align:center; position:absolute; bottom:20px; left:0; width:100%;}
			
			.slider-1 > .page-btns > div {width:50px; height:6px; background-color:rgb(255,255,255); border-radius:4px;   
			 display:inline-block; cursor:pointer; border: none;}
			.slider-1 > .page-btns > div.active {background-color:rgb(255, 160, 0); border: none;}
			/* 1 - 슬라이드 */
			.slider-1 > .slides > div {position:absolute; top:0; left:0; right:0; bottom:0; opacity:0; transition:opacity 1.5s;
			background-position:center; background-size:cover; background-repeat:no-repeat; border-radius:20px;  }
			.slider-1 > .slides > div.active {opacity:1;}
			/*  좌우 버튼 */
			.slider-1 > .side-btns > div {position:absolute; top:0; left:0; width:25%;
			height:100%; cursor:pointer; color:white;}
			.slider-1 > .side-btns > div:last-child {left:auto; right:0;}
			.slider-1 >.side-btns > div > span {position:absolute;top:50%;left:20px;transform:translatey(-10%);
			opacity:1;padding:5px; border-radius:50px;font-size:50px;}
			.slider-1 >.side-btns > div:last-child > span {left:auto;right:20px; }
			/*모임멤버부분*/
			#gMembers{margin-top:30px; width: 100%; height: 130px; border: 1px solid #bbb;background-color: #f1f1f1;border-radius: 10px; text-align: left;}
			#gMembers>div:nth-child(1){font-size: 20px;font-weight: bold;margin-top: 15px;margin-left: 20px;}
			#gMembers>div:nth-child(1)>span{color: #f00;} 
			#gMembers>div:nth-child(2){width: 80%; display: inline-block;margin: 10px 20px;}
			#gMembers>div:nth-child(2)>div{width: 60px; height: 60px;display: inline-block; margin-left: 20px; vertical-align: bottom;}
			#gMembers>div:nth-child(2)>div>img{width: 100%; height: 100%; border-radius: 30px; border: 1px solid #bbb;}
			#gMembers>div:nth-child(2)>div>span{width: 100%; height: 100%;color:#bbb;text-align: center;line-height: 50px;font-size: 50px;}
			#gMembers>div:nth-child(3){width: 7%;  display: inline-block;vertical-align: top;margin-top: 20px;}
			#gMembers>div:nth-child(4){width: 7%; display: inline-block;vertical-align: top; margin-top: 20px; margin-left: 10px;}
			/*모임일정부분*/
			#gSchedule{margin-top:30px;width: 100%; height: 1000px; border: 1px solid #bbb;background-color: #f1f1f1;border-radius: 10px;}
			#calendar {}
			/*모임공지사항부분*/
			#gNotice{margin-top:30px;width: 100%;  border: 1px solid #bbb;background-color: #f1f1f1;border-radius: 10px;}
			/*공지사항부분*/
			.gNotice{text-align: left; font-size: 20px; margin: 40px 60px;}
			.gNotice>div>div{display: inline-block; font-size: 25px; font-weight: bold;}
			.gNotice>div>div:nth-child(1){color: #f00; margin-right: 20px;}
			.gNotice>div:nth-child(2){border-bottom: 2px solid #bbb; padding-bottom: 10px; margin-top: 10px;}/* 끝나는바*/
			/*모임기타버튼부분*/
			#gReportExit{margin-top:30px;width: 100%; height: 100px; border: 1px solid #bbb;background-color: #f1f1f1;border-radius: 10px;text-align: right;}
			#gReportExit>button{color: rgb(149, 165, 166);margin-top: 30px;margin-left: 10px;margin-right: 20px;width: 132px;height: 40px;font-size: 25px;border: 1px solid #0000;}
			#gReportExit>button:active{color: #000;} 
		 </style>
		     <script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });

    </script>
	</head> 
	<body>  
	<%@include file="../header2.jsp" %>
	<%@include file="header3.jsp" %>
	<main id="main">
		<section class="gContainer">
			<div id="gIntro_gThumbnail">
				<div id="gIntro">
					<div>모임 이름</div>
					<div>모임 지역</div>
					<div><img alt="모임장 프로필" src="../resources/bikeimg/mukbang2.gif"></div>
					<div>모임장: 홍길동</div> 
					<div>모임 소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글 </div>
				</div>
				<div id="gThumbnail">
					<div>
						<div>모임 소개 사진</div> 
						<div class="slider-1">
						    <div class="slides">
						        <div class="active" style="background-image:url(../resources/mainbanner/cycleCourse1-3.jpg);"></div>
						                <div style="background-image:url(../resources/mainbanner/cycleCourse2-3.jpg);"></div>
						                <div style="background-image:url(../resources/mainbanner/cycleCourse3-3.jpg);"></div> 
						                <div style="background-image:url(../resources/mainbanner/cycleCourse4-3.jpg);"></div>
						                <div style="background-image:url(../resources/mainbanner/cycleCourse5-3.jpg);"></div>   
						                <div style="background-image:url(../resources/mainbanner/cycleCourse6-3.jpg);"></div>  
						                <div style="background-image:url(../resources/mainbanner/cycleCourse7-3.jpg);"></div> 
						                <div style="background-image:url(../resources/mainbanner/cycleCourse8-3.jpg);"></div>              
						    	</div>
							    <div class="page-btns">
							        <div class="active"></div>
							        <div></div>
							        <div></div>
							        <div></div>
							        <div></div>
							        <div></div>
							        <div></div>     
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
			</div>
			<div id="gMembers">
				<div>모임 멤버(0명/30명)<span> 5+[승인대기]</span></div>
				<div>
					<div><img alt="" src="../resources/bikeimg/mukbang1.jpg"></div>
					<div><img alt="" src="../resources/bikeimg/mukbang1.jpg"></div>
					<div><img alt="" src="../resources/bikeimg/mukbang1.jpg"></div>
					<div><img alt="" src="../resources/bikeimg/mukbang1.jpg"></div>
					<div><img alt="" src="../resources/bikeimg/mukbang1.jpg"></div>
					<div><img alt="" src="../resources/bikeimg/mukbang1.jpg"></div>
					<div><img alt="" src="../resources/bikeimg/mukbang1.jpg"></div>
					<div><img alt="" src="../resources/bikeimg/mukbang1.jpg"></div>
					<div><img alt="" src="../resources/bikeimg/mukbang1.jpg"></div>
					<div><img alt="" src="../resources/bikeimg/mukbang1.jpg"></div>
					<div><span>...</span></div>						
				</div>
				<div><button class="gBtn">초대하기</button></div>
				<div><button class="gBtn">더보기</button></div>			
			</div>
			<div id="gSchedule">
				<div id='calendar'></div>
	
			</div>
			<div id="gNotice">
				<div class="gNotice">
					<div>
						<div>공지사항</div>
						<div>공지사항 제목</div>
					</div>
					<div>일정이 취소되었습니다</div>
				</div>
				<div class="gNotice">
					<div>
						<div>공지사항</div>
						<div>공지사항 제목</div>
					</div>
					<div>일정이 취소되었습니다</div>
				</div>
				<div class="gNotice">
					<div>
						<div>공지사항</div>
						<div>공지사항 제목</div>
					</div>
					<div>일정이 취소되었습니다</div>
				</div>
			</div>
			<div id="gReportExit">
				<button>모임 신고하기</button> 
				<button>모임 나가기</button>
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
	</body>
</html>