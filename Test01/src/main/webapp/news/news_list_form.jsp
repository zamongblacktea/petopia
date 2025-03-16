<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${query} 관련 뉴스 기사</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Poor+Story&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/news.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/nav.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/switch.css">

<style type="text/css">
*{
		font-family: "Poor Story", sans-serif;
}
 img{
 width: 350px;
 height: 100px;
 padding-left: 30px;
 cursor: pointer;
 }
 
 .main_nav{
 	background-color: white;
 }
 
 .footer{
	width: 100%;
	height: 170px;
	text-align: left; !important;
}


.footer-box{
	width: 70%;
	margin: auto;
	padding-top: 15px;
}

</style>


<script type="text/javascript">

	$(document).ready(function() {
		var query = "${query}"; // request에 설정된 query 값을 JSP에서 불러옴
		send(query,'sim');
	});

	function send(${query},sort) {
		$.ajax({
			url : "list.do", // NewsAction
			data : {
				"query":${query},
				"sort" : sort			
			},
			success : function(res_data) {
				//console.log(res_data); // 서버 응답 확인
				$("#disp").html(res_data);
			},
			error : function(err) {
				alert(err.responseText);
			}
		});
	}
	
	
</script>
</head>
<body>
    <!-- <div class="container"> -->
	<nav class="main_nav">
	     <div class="row">
			<div class="col-sm-12" onclick="location.href='../main/main.do'">
				<img src="${ pageContext.request.contextPath }/image/펫토피아 메인 투명.png">
			</div>
		</div>

	</nav>
	<div class="header"><p>${query} 뉴스 기사</p></div>
		<form action="">
			<div class="container-sw">
				<div class="switches-container">
					<input type="radio" id="sim" name="switchPlan" value="Monthly" checked="checked" /> 
					<input type="radio"	id="date" name="switchPlan" value="Yearly"  /> 
					<label for="sim" onclick="send('${query}','sim');">정확도순</label> 
					<label for="date" onclick="send('${query}','date');">최신순</label>
					<div class="switch-wrapper">
						<div class="switch">
							<div>정확도순</div>
							<div>최신순</div>
						</div>
					</div>
				</div>
			</div>
		</form>

	<div class="content-container">
	<div class="sidebar">
            <h3>뉴스 키워드</h3><br>
            <ul>
                <li><a href="list_form.do?query=반려동물">반려동물</a></li><br><hr>
                <li><a href="list_form.do?query=강아지">강아지</a></li><br><hr>
                <li><a href="list_form.do?query=고양이">고양이</a></li><br><hr>
                <li><a href="list_form.do?query=반려동물행사">반려동물행사</a></li>
            </ul>
        </div>
		<div class="main" id="disp">
			<%-- <c:forEach var="vo" items="${list}" varStatus="i">
                <div class="article" onclick="location.href='${vo.link}'">
                    <a href="${vo.title}" target="blank">${vo.title}</a> <br><br>
                    ${vo.content}<br>
                   <span>${vo.date}</span> <!-- 변환된 날짜 직접 출력 -->
                </div>
            </c:forEach> --%>

		</div>
	</div>
	<div class="footer">
		<div class="footer-box">
			<p>주식회사 펫토피아 ｜ 공동대표 !Err404 박태섭 안소현 남가은 ｜ 서울특별시 관악구 청룡동 862-1 |
				http://www.gith.co.kr/</p>
			
			<p>고객센터: 02-6020-0052 (평일 오전 9시 ~ 오후 6시)</p>
			
			<p>Petopia는 통신판매중개자로서 통신판매의 당사자가 아니며 상품 거래정보 및 거래 등에 대해 책임을 지지
				않습니다.</p>
			
			<p>이용약관전자금거래 이용약관개인정보 처리방침</p>
			

		</div>
	</div>

	<!--  </div> -->

</body>
</html>