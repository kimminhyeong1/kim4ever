<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>모임 소개</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_gathering.css"> 
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" crossorigin="anonymous">  
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<style>
			#main{width:1440px; margin:35px auto 70px; text-align:center;}
			#main #content{width:1440px; height:2400px;}
			#main #bottom{width:1440px; height:300px; }
			#main #content h2{text-align: center; margin-top:20px;}
			#content #gather{width:80%; height:600px; border-collapse:collapse; border:1px solid #ddd; margin: 60px auto 0; text-align:center;  line-height:100px;}
			#content #gather label{font-family:'omyu_pretty'; font-size:30px; margin-left:10px;}
			#content #gather input{box-sizing: border-box; width:100%;padding:20px; border:1px solid #ccc; border-radius:4px;}
			#content button{width:20%; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #99CC99; background:#99CC99;}
			#content button:active {background:#339933; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
			#content img{width:500px; height:500px;}
			#content #gatherCon p{font-family:'omyu_pretty'; font-size:27px;}
			#content #gatherCon{width:80%; height:400px; border-collapse:collapse; border:1px solid #ddd; margin:10px auto 0; text-align:center;  line-height:100px;}
			/*모임슬라이더부분*/
			#gather{vertical-align: top;margin-left:42px; display: inline-block; width: 800px; height: 500px; border: 1px solid #bbb;background-color: #f1f1f1;border-radius: 10px;}
			#gatherCon{vertical-align: top;margin-left:42px; display: inline-block; width: 800px; height: 500px; border: 1px solid #bbb;background-color: #f1f1f1;border-radius: 10px;}
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
		</style>
	</head>
	<body>
		<%@include file="../header2.jsp" %>
		<main id="main">
			<div id="content">
				<div id="gather">
					<h1>모임 소개 사진</h1>
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
				<div id="gatherCon">
					<h1>${gjvlist[0].gInfoName}</h1> 
					<p>${gjvlist[0].gInfoAreaIntroduction}</p>
					<button onclick="location.href='${pageContext.request.contextPath}/gathering/gSimpleInfoAction.do?giidx=${giidx}'">가입하기</button>
					<button onclick="location.href='${pageContext.request.contextPath}/gathering/gatheringList.do'">돌아가기</button>
				</div>
			</div>
		</main>
		<div id="bottom">
		</div>
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