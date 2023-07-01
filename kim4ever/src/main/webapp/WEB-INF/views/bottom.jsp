<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
#main{width:1250px; margin:35px auto 0px; text-align:center;}
#main #content{width:1250px;}
#main #bottom{width:1250px; height:300px;justify-content:center; align-items:center;}
#main #bottom h2{font-size:35px;}
#main #bottom table {width: 80%; border-collapse: collapse;  margin: 20px auto 0; font-family: 'omyu_pretty'; font-size:24px;}
#main #bottom table th{width:100px;padding: 10px;text-align: center; background-color: #ff9833;}
#main #bottom table td{padding: 10px; text-align:center;border-bottom:1px solid #CCCCCC;}

/**********************모바일****************/
@media (min-width: 300px) and (max-width: 940px)  {
#main{width:100%; margin:0 auto;}
#main #content{width:auto;}
#main #bottom{width:auto; height:100px;justify-content:center; align-items:center; margin-bottom:2%;}
#main #bottom h2{ font-size:20px;}
#main #bottom table {width: 80%; border-collapse: collapse;  margin: 10px auto 0; font-family: 'omyu_pretty'; font-size:12px;}
#main #bottom table th{width:100px;padding: 2px;text-align: center; font-size:14px;}
#main #bottom table td{padding: 2px; text-align:center;border-bottom:1px solid #CCCCCC;}
}

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
			  <td>일반자전거</td>
			  <td>1,000원</td>
			</tr>
			 <tr>
			  <td>하이브리드 자전거</td>
			  <td>2,000원</td>
			</tr>
			<tr>
			  <td>전기자전거</td>
			  <td>5,000원</td>
			</tr>
		</table>
	</div>
</div>
