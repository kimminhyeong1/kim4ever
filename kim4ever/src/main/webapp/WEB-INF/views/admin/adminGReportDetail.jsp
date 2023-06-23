<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.myezen.myapp.domain.*" %>
<%@page import = "java.util.*" %>  


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
#main #content{width:1440px; height:2400px;}
#main #bottom{width:1440px; height:300px;}
h2{text-align: center; margin-top:20px;}
#content table {width:60%; border-collapse:collapse; border:1px solid #ddd; margin: 60px auto 0; text-align:center;  line-height:100px; font-family:'omyu_pretty'; font-size:24px;}
#content table th{width:200px; text-align:center; border:1px solid #ddd; padding:8px;}
#content table td{border:1px solid #ddd; padding:8px; text-align:left;}
#content table td:nth-child(1){width:140px;text-align:center;}
#content table td:nth-child(2){width:400px; text-align:left;}
#content table tr:last-child td input{display: inline-block; width:120px; height:50px;}
input{
  font-family: 'omyu_pretty';
  font-size:24px;
  box-sizing: border-box;
  width: 100%;
  padding: 10px;
  margin: 2px 0;
  border: 1px solid #ccc;
  border-radius: 4px;
}
#content table button{width:160px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content table button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
</style>



</head>
<body>
<div id="main">

	<%@include file="../header4.jsp" %>
	
	<div id="content">
		
	
		<table>
		 <tr>
		    <th colspan="2"><h2>신고 내역</h2></th>
		  </tr>
		  		
				<tr>
					<th>모임명</th>
					<td>${gdtv.gInfoName}</td>
				</tr>
				
				<tr>
					<th>모임장</th>
					<td>${gdtv.TL}</td>
				</tr>
				<tr>
					<th>신고자</th>
					<td>${gdtv.reporterName}</td>
				</tr>
				<tr>
					<th>신고 날짜</th>
					<td>${gdtv.gatheringDeclarationDay.substring(0, 16)}</td>
				</tr>
				<tr>
					<th>신고 내용</th>
					<td>${gdtv.gatheringReportContent}</td>
				</tr>			
				<tr>
					<td colspan="2">
						<button type="button" onclick="location.href='<%=request.getContextPath()%>/admin/adminGReportList.do'">돌아가기</button>
					</td>		
				</tr>
				

		</table>
	

	</div>
</div>



</body>
<%@include file="../footer.jsp" %>
</html>