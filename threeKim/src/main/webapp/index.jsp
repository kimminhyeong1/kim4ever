<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert </title>
<style>
/*리셋코드*/
*{margin:0;padding:0;}
li{list-style:none;}

#main{width:1440px; margin:35px auto 70px; text-align:center; border:1px solid #white;      font-family: 'IM_Hyemin-Bold';
}
#main #content{ width: 1440px;height: auto !important;/*우선권*/}
#main #content img{width:1440x; height:800px;}
#main #bottom{width:1440px; height:300px;}
@font-face {
    font-family: 'GangwonEdu_OTFBoldA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'omyu_pretty';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'KCC-Ganpan';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/KCC-Ganpan.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
/* 메인베너 */
body, ul, li, h1, h2, h3, h4, h5 {margin:0; padding:0; list-style:none;}
a{color:inherit; text-decoration:none;}
/* 슬라이더 1 시작 */
.slider-1 {height:600px;position:relative;}
/* 슬라이더 1 - 페이지 버튼 */
.slider-1 > .page-btns {text-align:center; position:absolute; bottom:20px; left:0; width:100%;}

.slider-1 > .page-btns > div {width:50px; height:8px; background-color:rgb(220,220,220); border-radius:4px;   
 display:inline-block; cursor:pointer; border: none;}
.slider-1 > .page-btns > div.active {background-color:rgb(255, 180, 0); border: none;}
/* 1 - 슬라이드 */
.slider-1 > .slides > div {position:absolute; top:0; left:0; right:0; bottom:0; opacity:0; transition:opacity 1.5s;
background-position:center; background-size:cover; background-repeat:no-repeat; border-radius:20px;  }
.slider-1 > .slides > div.active {opacity:1;}
/*  좌우 버튼 */
.slider-1 > .side-btns > div {position:absolute; top:0; left:0; width:25%;
height:100%; cursor:pointer;}
.slider-1 > .side-btns > div:last-child {left:auto; right:0;}
.slider-1 >.side-btns > div > span {position:absolute;top:50%;left:20px;transform:translatey(-50%);
background-color:rgba(255,255,255,0.8);opacity:1;padding:5px; border-radius:50px;font-size:35px;}
.slider-1 >.side-btns > div:last-child > span {left:auto;right:20px; }

/*날씨*/
#ww_73df1f3b67ed7 {border-radius: 20px;}

/*메인2*/
#main2{width:100%; height:500px; margin:0 auto; text-align:center; 
display:flex; justify-content:center; align-items: center; 
background-image: url("resources/banner2/bg_network.jpg");
background-size:cover; background-position: center; background-repeat:no-repeat; position:relative;}
/*메인2_h1*/
#main2 h1 {position:absolute ;top:10%; left:50%; transform:translate(-50%,-50%); 
margin: 0;  font-weight:bold;    font-family: 'omyu_pretty';}
  
/*소형배너*/
#banner, #banner2 {width:300px; height:450px;overflow:hidden; box-shadow:0px 0px 10px rgba(0, 0, 0, 0.8); 
-radius: 20px;}
#banner img, #banner2 img {width:100%; height:100%;}
#banner, #banner2 {position:relative; margin-top:200px; border-radius:20px;}      
#banner img, #banner2 img {position:absolute; top:0; left:0; opacity:0; transition:opacity 3s ease-in-out, transform 0.2s ease-in-out;
border-radius:20px;  float:left; }
#banner img.active, #banner2 img.active {opacity:1; transition:opacity 3s ease-in-out, transform 0.2s ease-in-out; border-radius:20px; }
#banner:hover img, #banner2:hover img {transform:scale(1.05); border-radius:20px;}
  
/*유튜브 아이프레임*//*크기는 아이프레임에서 직접지정*/
#youtube {width:300px; height: 450px; position:relative; float:right;margin-top:200px; margin-left:50px; margin-right:50px;  }
#youtube iframe {border-radius: 20px; box-shadow:0 0 20px rgba(0, 0, 0, 0.8);}

/*메인3*/
#main3{width:1440px; margin:120px auto; text-align:center;  justify-content: center;  
}
.container {margin-top:20px;display:flex; flex-wrap:wrap; justify-content:center;  opacity: 0; }
.item {position:relative; width:calc(27% - 10px); margin-bottom: 20px; margin-right:20px; height:300px; box-shadow:0 4px 8px 0 rgba(0,0,0,0.5);   }
.item img {width:100%; height:70%; transition:opacity 1s ease-in-out, transform 0.5s ease-in-out;}
.item img:hover{transform:scale(1.03); }

.item .text {position:absolute; bottom: 0; left:0; width:89.5%; padding:10px; color:black; text-align: center;}
.item .text h2 {font-size:29px; margin:0 0 5px;     font-family: 'omyu_pretty';}
.item .text p {font-size:14px; margin:0;   font-family: 'omyu_pretty';}

/*메인2 글자효과추가*/
.main2-title {order: 2; color: white; font-weight: 900;  text-transform: uppercase; font-size: 84px; line-height: 0.75em; text-align: center;
text-shadow: 3px 1px 1px #000000, 2px 2px 1px #fec339, 4px 2px 1px #ff7f00,
  3px 3px 1px #fec339, 5px 3px 1px #ff7f00, 4px 4px 1px #fec339,
  6px 4px 1px #ff7f00, 5px 5px 1px #fec339, 7px 5px 1px #ff7f00,
  6px 6px 1px #fec339, 8px 6px 1px #ff7f00, 7px 7px 1px  #000000 ,
  9px 7px 1px #ffff;  span {display: block; position: relative; &:before {content: attr(data-text);}}


</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>/*메인3 스크립트*/	/*나타나는효과*/
var $j = jQuery.noConflict();

$j(document).ready(function() {
    $j(window).scroll( function(){
			
        $j('.container').each( function(i){
            
            var bottom_of_element = $j(this).offset().top + $j(this).outerHeight() /5;
            var bottom_of_window = $j(window).scrollTop() + $j(window).height();
            if (bottom_of_window > bottom_of_element && $j(this).css('opacity') !=0.9) 
            if( bottom_of_window > bottom_of_element ){
                $j(this).animate({'opacity':'1'},2000);
            }
            
        }); 
    });
});
</script>


</head>
<body>

	<div id="main">

	<%@include file="WEB-INF/views/header.jsp" %>
   
	<div id="content">
   
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" crossorigin="anonymous">

			<div class="slider-1">
		    <div class="slides">
		        <div class="active" style="background-image:url(resources/mainbanner/cycleCourse1-3.jpg);"></div>
		                <div style="background-image:url(resources/mainbanner/cycleCourse2-3.jpg);"></div>
		                <div style="background-image:url(resources/mainbanner/cycleCourse3-3.jpg);"></div> 
		                <div style="background-image:url(resources/mainbanner/cycleCourse4-3.jpg);"></div>
		                <div style="background-image:url(resources/mainbanner/cycleCourse5-3.jpg);"></div>   
		                <div style="background-image:url(resources/mainbanner/cycleCourse6-3.jpg);"></div>  
		                <div style="background-image:url(resources/mainbanner/cycleCourse7-3.jpg);"></div> 
		                <div style="background-image:url(resources/mainbanner/cycleCourse8-3.jpg);"></div>              
		        
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

   
   <div id="ww_73df1f3b67ed7" v='1.3' loc='id' a='{"t":"responsive","lang":"ko","sl_lpl":1,"ids":["wl7404"],"font":"Arial","sl_ics":"one_a","sl_sot":"celsius","cl_bkg":"rgba(255,224,150,0)","cl_font":"rgba(0,0,0,1)","cl_cloud":"rgba(77,222,255,1)","cl_persp":"#81D4FA","cl_sun":"rgba(249,68,4,1)","cl_moon":"#FFC107","cl_thund":"#FF5722"}'>Weather for the Following Location: <a href="https://2ua.org/de/kor/jeonju/karte/" id="ww_73df1f3b67ed7_u" target="_blank">karte von Jeonju</a></div><script async src="https://app1.weatherwidget.org/js/?id=ww_73df1f3b67ed7"></script>
   
   
      <!-- 미니 배너 -->
   </div>
        </div>   
        
   <div id= main2><!-- 메인2번째 구역 -->   
    <h1 class="main2-title">
      <span data-text="main2">전주에서 즐기자!!</span>   <!--메인2 대문 -->
      </h1>      
    <div id="banner">
                    <img src="resources/rentphoto/photo1.jpg"alt="Banner 1">
                    <img src="resources/rentphoto/photo2.jpg"alt="Banner 2">
                    <img src= "resources/rentphoto/photo3.jpg"alt="Banner 3">
                    <img src= "resources/rentphoto/photo4.jpg"alt="Banner 4">
                    
                </div>
<script>
var banner = document.getElementById('banner');
var images = banner.getElementsByTagName('img');
var index = 0;
images[index].classList.add('active');

var interval = setInterval(function() {
  images[index].classList.remove('active');
  index++;
  if (index >= images.length) {
    index = 0;
  }
  images[index].classList.add('active');
}, 5000);

</script>

<div id=youtube>
<iframe width="300" height="450" src="https://www.youtube.com/embed/vVKg2t31Yko" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
</div>

<!-- 미니배너2 -->
<div id="banner2">
    <img src="resources/banner2/img_festival01.jpg"alt="Banner2-1">
    <img src="resources/banner2/img_festival02.jpg"alt="Banner 2-2">
    <img src= "resources/banner2/img_festival04.jpg"alt="Banner 2-3">
    <img src= "resources/banner2/img_festival05.jpg"alt="Banner 2-4">
    <img src= "resources/banner2/img_festival07.jpg"alt="Banner 2-5">    
</div>

<script>
var banner2 = document.getElementById('banner2');
var images2 = banner2.getElementsByTagName('img');
var index2 = 0;
images2[index2].classList.add('active');

var interval2 = setInterval(function() {
  images2[index2].classList.remove('active');
  index2++;
  if (index >= images2.length) {
    index2 = 0;
  }
  images2[index].classList.add('active');
}, 5000);


</script>

	</div>
	   <!--메인3 -->	
      <div id= "main3">   <!--상자형안내판 -->
<div class="container">
	       	<div class="item"><!-- 아이탬링크추가 -->
	       	<a href="https://map.naver.com/v5/search/%EC%95%84%EC%A4%91%EC%A0%80%EC%88%98%EC%A7%80?c=15,0,0,0,dh" target="_blank">
	        <img src="resources/main3/main3-1.jpg">
	        </a>
	        <div class="text">
	        <h2>아중저수지</h2>
	        <p>수상 산책로 데크길이 둘러싸여 있어 평온한 마음으로 아중호수를 감상할 수 있으며, 200명 정도 수용이 가능한 수상데크 광장이 있어 공연이나 축제 행사가 가능한 공간을 갖추고 있다. </p>
	        </div>
	       	</div>
	       	
	       	<div class="item">
	       	 	<a href="https://map.naver.com/v5/search/%EC%A0%84%EC%A3%BC%20%EB%8F%99%EB%AC%BC%EC%9B%90/place/11886776?c=15,0,0,0,dh&placePath=%3Fentry%253Dbmp" target="_blank">
	        <img src="resources/main3/main3-2.jpg">
	        </a>
	        <div class="text">
	        <h2>전주생태동물원</h2>
	       	<p>전주동물원은 도심 속에서 지친 여러분을 위한 푸른 쉼터로서 1978년 6월에 개원하여 언제든지 관람하실 수 있도록 연중무휴로 운영하고 있습니다. 그리고 100여종의 동물과 계절 식물들이 자라나 있습니다.</p>
	        </div>
	     	</div>
	 
	        <div class="item">
	         	<a href="https://map.naver.com/v5/search/%EC%A0%84%EB%8F%99%EC%84%B1%EB%8B%B9/place/12942911?c=15,0,0,0,dh&placePath=%3Fentry%253Dbmp" target="_blank">
	        <img src="resources/main3/main3-3.jpg">
	        </a>
	        <div class="text">	        
	        <h2>전동성당</h2>
	        <p>한옥마을 초입에 서 있는 소박하고 아담한 모습의 전동성당 1914년 완공됐다 로마네스크 양식으로 동서양이 융합된 모습이고 비잔틴 풍의 종머리는 건물 본체와 잘 어우러져 사진촬영 명소로도 각광받고 있다</p>
	        </div>
	        </div>
      
	        <div class="item">
	         	<a href="https://map.naver.com/v5/search/%EA%B2%BD%EA%B8%B0%EC%A0%84/place/34648763?c=15,0,0,0,dh&placePath=%3Fentry%253Dbmp" target="_blank">
	        <img src="resources/main3/main3-4.jpg">
	        </a>
	        <div class="text">
	        <h2>경기전</h2>
	        <p>태조 이성계의 어진을 봉안하고 제사하는 전각, 경기전. 정전(보물 1578)은 태조 이성계의 어진(국보 317호)을 봉안한 곳으로, 정면 3칸, 측면 3칸 규모이고 세종때 붙인 이름이다. </p>
	      	</div>
	     	</div>

            <div class="item">
             	<a href="https://map.naver.com/v5/search/%ED%95%9C%EC%98%A5%EB%A7%88%EC%9D%84/place/13208779?c=15,0,0,0,dh&placePath=%3Fentry%253Dbmp" target="_blank">
            <img src="resources/main3/main3-5.jpg">
            </a>
            <div class="text">
            <h2>한옥마을</h2>
            <p> 전주 한옥마을은 추억 보증수표와 같은 강력한 추천여행지다. 오목대 둘레길, 남천교 청연루와 각종 맛집과 여러 체험들이 가능하며 주변에 경기전, 어진박물관도 있어 볼거리가 풍성하다.</p>
          	</div>
        	</div>
          
            <div class="item">
             	<a href="https://lib.jeonju.go.kr/index.jeonju?contentsSid=410" target="_blank">
            <img src="resources/main3/main3-6.jpg">
            </a>
            <div class="text">
            <h2>책의 도시</h2>
            <p>자전거로 산책 후 새로운 도시문화 트렌드로 이끌어가는,이색적이고 독특한 전주의 독서공간들을 찾아가 보자. 무거운 몸은 가벼워지고, 빈곤한 마음에는 포동포동 살이 오를 것이다.</p>
          	</div>
        	</div>
        	</div>  
      </div>

 	<div id="bottom">
	<%@include file="WEB-INF/views/bottom.jsp" %>
	</div>
</body>
<%@include file="WEB-INF/views/footer.jsp" %>
</html>