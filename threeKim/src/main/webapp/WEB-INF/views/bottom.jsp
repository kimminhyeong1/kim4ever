<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
/*리셋코드*/

*{margin:0;padding:0;}
li{list-style:none;}

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

#main{width:1440px; margin:35px auto 70px; text-align:center;}
#main #content{width:1440px;}
#main #bottom{width:1440px; height:300px;justify-content:center; align-items:center;}
#main #bottom h2{font-family: 'KCC-Ganpan'; font-size:30px;}
#main #bottom table {width: 80%; border-collapse: collapse;  margin: 20px auto 0; font-family: 'omyu_pretty'; font-size:24px;}
#main #bottom table th{width:100px;padding: 10px;text-align: center; border-top:3px solid #000 ;border-bottom:3px solid #000;}
#main #bottom table td{padding: 10px; text-align:center;border-bottom:1px solid #CCCCCC;}

</style>

<div id="main">
	<div id="bottom">
		<h2>이용요금안내</h2>
		<table>
			<tr>
			    <th>자전거 유형</th>
			    <th>이용요금(1회 이용)</th>
			</tr>
			<tr>
			  <td>일반자전거, 2인자전거, 어르신자전거</td>
			  <td>1,000원</td>
			</tr>
			 <tr>
			  <td>하이브리드 자전거, 커플자전거</td>
			  <td>2,000원</td>
			</tr>
			<tr>
			  <td>전기자전거</td>
			  <td>5,000원</td>
			</tr>
		</table>
	</div>
</div>
