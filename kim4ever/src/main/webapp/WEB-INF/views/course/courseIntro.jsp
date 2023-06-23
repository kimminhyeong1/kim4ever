<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코스소개</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
/*리셋코드*/

*{margin:0;padding:0;}
li{list-style:none;}


#main{width:1440px; margin:35px auto 70px; text-align:center; }
#main #content{width:1440px; height:2400px;}
#main #content img{width:60%; height:auto; margin-top:20px; border-radius:10px;}
#main #bottom{width:1440px; height:300px; }
#main #content h1 {
  font-size: 35px;
  text-align: center;
  color: #333;
  margin-top: 40px;
  margin-bottom: 20px;
  font-family: 'KCC-Ganpan';
  letter-spacing: -1px;
  text-shadow: 1px 1px #fff;
  background-color: #fff;
  border: none;
  padding-bottom: 10px;
}
#courseList a{
  font-family: 'omyu_pretty';
  font-size: 32px;
  display: inline-block;
  padding: 5px 10px;
  background-color: #f0f0f0;
  border-radius: 5px;
  margin: 50px 10px 0 0;
  color: #333;
  text-decoration: none;
}
/*active 가상 클래스 선택자 사용했음*/
#courseList a:focus,
#courseList a:active {
  background-color: #333;
  color: #fff;
  border: 1px solid #333;
  outline: none;
}

#course{width: 100%; height: 1200px; margin-top:20px;border: none;}
#main #content h1{margin-top:30px; text-align:center;}



	/*****************************************모바일***************************************************************/
		
	@media (min-width: 300px) and (max-width: 940px)  {	
	#main{width:auto; margin:35px auto 70px; text-align:center; }
#main #content{width:auto; height:auto;}
#main #content img{width:80%; height:auto; margin-top:20px; border-radius:10px;}
#main #bottom{width:auto; height:10px; }
#main #content h1 {font-size: 15px; text-align: center; color: #333; margin-top: 40px; margin-bottom: 20px; font-family: 'KCC-Ganpan'; letter-spacing: -1px; text-shadow: 1px 1px #fff; background-color: #fff; border: none; padding-bottom: 10px;}
#courseList a{font-family: 'omyu_pretty'; font-size: 11px; display: inline-block; padding: 3px 3px; background-color: #f0f0f0; border-radius: 5px; margin: 10px 1px 0 0; color: #333; text-decoration: none;}
/*active 가상 클래스 선택자 사용했음*/
#courseList a:focus,
#courseList a:active {background-color: #333; color: #fff; border: 1px solid #333; outline: none;}

#course{width: 100%; height:700px ; margin-top:20px;border: none;}
#main #content h1{margin-top:30px; text-align:center;}
	}
</style>

</head>
<body>
<div id="main">

	<%@include file="../header.jsp" %>
	
	<div id="content">
	<h1>타:바 자전거 추천 코스 소개</h1>
	<img src="../resources/map/courseIntro.PNG" alt="코스소개"/>
		
	
	<div id="courseList">
		<a target="course" href="course1.do">01 송천 길</a>
		|&nbsp;
		<a target="course" href="course2.do">02 덕진 길</a>
		|&nbsp;
		<a target="course" href="course3.do">03 오목 길</a>
		|&nbsp;
		<a target="course" href="course4.do">04 평화 길</a>
		|&nbsp;
		<a target="course" href="course5.do">05 효자 길</a>
	
	</div>
	<iframe id="course" name="course" src="course1.do"></iframe>
	
	</div>
	
	
	
	<div id="bottom">
	
	</div>

</div>

<!-- <script>
        var courseLink = document.querySelectorAll('#coureList a');
        var courseFrame = document.querySelector('#course');
		//courseLink가 0보다 커지면 iframe이 열리게 설정하였음
        for (var i = 0; i < courseLink.length; i++) {
            courseLink[i].addEventListener('click', function(e) {
                e.preventDefault();
                courseFrame.src = this.getAttribute('href');
                courseFrame.style.display = 'block';
            });
        }

        courseFrame.style.display = 'none';
    </script> -->
</body>
<%@include file="../footer.jsp" %>
</html>