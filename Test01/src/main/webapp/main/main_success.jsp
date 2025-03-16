<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>웹페이지 레이아웃</title>
<link rel="stylesheet" href="../css/main.css">
<!-- 부트스트랩 사용설정 3버전 --> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="../js/main_bar.js"></script>
<style type="text/css">


</style>

</head>

<body>

	<div class="nav-div">
		<%@include file="../nav/nav_success.jsp"%>
	
	</div>
	
	<div class="header">
		
	
		<%@ include file="../rsv/bar.jsp" %>
	</div>
	
	<div class="content">
	<hr style="border: 1px solid black;">
	<div class="local">
	
		<%@ include file="../rsv/location_list.jsp" %>
	</div>
	
	<div class="lowprice">
		<%@ include file="../rsv/rsv_lowPrice.jsp" %>
	</div>
	
	<div></div>	
	<div class="news"><h2>뉴스</h2> 
		<%@ include file="../news/main_news.jsp" %>
	</div>	
	
	
	</div>
	
	<div class="footer">
	
	<div class="footer-box"> 
	<p>주식회사 펫토피아 ｜ 공동대표 !Err404 박태섭 안소현 남가은 ｜ 서울특별시 관악구 청룡동 862-1 | http://www.gith.co.kr/</p>
	<p>고객센터: 02-6020-0052 (평일 오전 9시 ~ 오후 6시)</p>
	<p>Petopia는 통신판매중개자로서 통신판매의 당사자가 아니며 상품 거래정보 및 거래 등에 대해 책임을 지지 않습니다.</p>
	<p>이용약관전자금거래 이용약관개인정보 처리방침</p>
	
	</div>
	
</body>

</html>