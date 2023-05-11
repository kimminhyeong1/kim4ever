<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
 <link rel="stylesheet" href="/resources/demos/style.css">
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script> 
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
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
#main #bottom{width:1440px; height:300px; }

h2{text-align: center; margin-top:20px;}
#content #gather{width:80%; height:1500px; border-collapse:collapse; border:1px solid #ddd; margin: 60px auto 0; text-align:center;  line-height:100px;}
#content #gather label{font-family:'omyu_pretty'; font-size:30px; margin-left:10px;}
#content #gather p{text-align:left;}
#content #gather input{box-sizing: border-box; width:100%;padding:20px; border:1px solid #ccc; border-radius:4px;}
#content button{width:100%; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
/*달력css*/
.ui-widget-header {border: 0px solid #dddddd; background: #fff;} 
.ui-datepicker-calendar>thead>tr>th{font-size: 14px !important;} 
.ui-datepicker .ui-datepicker-header{position: relative; padding: 10px 0;} 
.ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default, .ui-button,
html .ui-button.ui-state-disabled:hover, html .ui-button.ui-state-disabled:active{border: 0px solid #c5c5c5; background-color: transparent; font-weight: normal; color: #454545; text-align: center; } 
.ui-datepicker .ui-datepicker-title{margin: 0 0em; line-height: 16px; text-align: center; font-size: 14px; padding: 0px; font-weight: bold;} 
.ui-datepicker{display: none; background-color: #fff; border-radius: 4px; margin-top: 10px; margin-left: 0px; margin-right: 0px; padding: 20px; padding-bottom: 10px; width: 300px; box-shadow: 10px 10px 40px rgba(0, 0, 0, 0.1); } 
.ui-widget.ui-widget-content{border: 1px solid #eee;} 
#datepicker:focus>.ui-datepicker{display: block;}
.ui-datepicker-prev, .ui-datepicker-next{cursor: pointer; }
.ui-datepicker-next float: right;} 
.ui-state-disabled{cursor: auto; color: hsla(0, 0%, 80%, 1);}
.ui-datepicker-title{text-align: center; padding: 10px; font-weight: 100; font-size: 20px;}
.ui-datepicker-calendar{width: 100%;} 
.ui-datepicker-calendar>thead>tr>th{padding: 5px; font-size: 20px; font-weight: 400;} 
.ui-datepicker-calendar>tbody>tr>td>a{color: #000; font-size: 12px !important; font-weight: bold !important; text-decoration: none;}
.ui-datepicker-calendar>tbody>tr>.ui-state-disabled:hover{cursor: auto; background-color: #fff;}
 ui-datepicker-calendar>tbody>tr>td{border-radius: 100%; width: 44px; height: 30px; cursor: pointer; padding: 5px; font-weight: 100; text-align: center; font-size: 12px;} 
.ui-datepicker-calendar>tbody>tr>td:hover{background-color: transparent; opacity: 0.6; }  .ui-state-hover, .ui-widget-content .ui-state-hover, .ui-widget-header .ui-state-hover, .ui-state-focus,
.ui-widget-content .ui-state-focus, .ui-widget-header .ui-state-focus, .ui-button:hover,
.ui-button:focus{border: 0px solid #cccccc; background-color: transparent; font-weight: normal; color: #2b2b2b; } 
.ui-datepicker-calendar>tbody>tr>td:first-child a{color: red !important;}
.ui-datepicker-calendar>tbody>tr>td:last-child a{color: #0099ff !important;}
.ui-datepicker-calendar>thead>tr>th:first-child{color: red !important;}
.ui-datepicker-calendar>thead>tr>th:last-child{color: #0099ff !important;} 
.ui-datepicker-current-day .ui-state-default { background: #3f51b5 !important; color: #fff; font-weight: bold; border-radius: 50%;  padding-top: 10px; padding-bottom: 10px;}

.ui-state-highlight, .ui-widget-content .ui-state-highlight, .ui-widget-header .ui-state-highlight { border: 0px; background: #FFA07A; border-radius: 50%; padding-top: 10px; padding-bottom: 10px; } 
.inp { padding: 10px 10px; background-color: #FFA07A; border-radius: 4px; border: 0px;} 
.inp:focus {outline: none; background-color: #eee;} 

</style>
 <script>//달력 한글로 변환
 $.datepicker.setDefaults({
     dateFormat: 'yy-mm-dd',
     prevText: '이전 달',
     nextText: '다음 달',
     monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
     monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
     dayNames: ['일', '월', '화', '수', '목', '금', '토'],
     dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
     dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
     showMonthAfterYear: true,
     yearSuffix: '년',
      });

 $(function() {
     $("#datepicker1").datepicker();


 });
 

  </script>


</head>
<body>
<div id="main">
	
	<%@include file="../header.jsp" %>

	<div id="content">

	
	<div id="gather">
     
     <p>
	 <label>소모임 이름</label>
     <input type="text"/>
     </p>
     
     <p>
	 <label>소모임 최대 멤버 수</label>
     <input type="text"/>
     </p>
      
      <p>
	 <label>소모임 장소</label>
     <input type="text"/>
     </p>
     
     <p>
	 <label>날짜</label>     
	 <input type="text" id="datepicker1">    
	 </p>
	 
     <p>
	 <label>소모임 소개</label>
     <input type="text" style="height:200px;"/>
     </p>
  	
  	


  
  	 <button>소모임 생성</button>
  
  
	
	</div>


	</div>
	
	
	
	<div id="bottom">
	
	
	
	</div>


</div>
</body>
<%@include file="../footer.jsp" %>
</html>