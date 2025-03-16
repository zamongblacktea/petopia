<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/bar.css">
<script src="../js/bar.js"></script>


<title>숙소 검색</title>
<style>
/* board.css  */

a {
	text-decoration: none;
	text-align: center;
}

/* .search{

	width: 100px;


} */
.board-container {
	width: 1400px;
	height: auto;
	margin: 20px auto;
	background: white;

	padding: 10px;
}

.left-menu {
	width: 68%;
	height: auto;
	margin-top: 20px;
	margin-bottom: 20px;
	background: #fff;
	float: left;
}

.right-sidebar {
	width: 30%;
	height: 650px;
	background: #fff;
	margin-top: 20px;
	margin-bottom: 20px;
	margin-left: 10px;
	float: right;
}

.right-box {
	width: 95%;
	height: 98%;
	margin-top: 10px;
	margin-left: 5px;
	padding: 15px border-radius: 15px;
	border-radius: 15px;
}

.footer {
	margin-top: 20px;
	height: 50px;
	background: #333;
	color: white;
	text-align: center;
	line-height: 50px;
	clear: both;
}

.left-box {
	width: 98%;
	height: 99%;
	margin-left: 5px;
	margin-top: 10px;
	border-radius: 15px;
	padding: 15px;
}

.list-box {
	justify-content: center;
	height: 350px;
	padding: 10px;
	margin-left: 20px;
	width: 95%;
}

.acom_img {
	float: left;
	width: 370px;
	height: 250px;
}

.acom-box {
	width: 380px;
	height: 240px;
	margin: auto;
	text-align: center;
	float: right;
}

#info-box {
	width: 100px;
}

#info-button {
	width: 100px;
}

#rsv_in {
	width: 150px;
}

#rsv_out {
	width: 150px;
}

.pagination {
	align-items: center;
	align-content: center;
	text-align: center;
}

.pre {
	width: 48%;
	float: left;
}

.next {
	width: 48%;
	float: right;
	margin-left: 10px;
}
</style>





<script type="text/javascript">
	function find() {
		let search = $("#search").val();
		let search_text = $("#search_text").val().trim();
		let rsv_in = $("#rsv_in").val();
		let rsv_out = $("#rsv_out").val();
		let room_type = $("#room_type").val();
		//console.log(room_type);
		let pet_type = $("#pet_type").val();
		//console.log(pet_type);
		let mem_idx = $("#mem_idx").val();
		//console.log(mem_idx);

		//검색 정보를 넘겨서 목록 요청하기
		location.href = "list.do?search=" + search + "&search_text="
				+ encodeURIComponent(search_text, "utf-8") + "&rsv_in="
				+ rsv_in + "&rsv_out=" + rsv_out + "&mem_idx=" + mem_idx
				+ "&room_type=" + room_type + "&pet_type=" + pet_type;

	}

	//window.onload=function(){};
	//선택한 카테고리 유지시키기
	$(document).ready(function() {
		if ("${ not empty param.search }" == "true") {

			$("#search").val("${ param.search}");

		}

		if ("${ param.search eq 'all'}" == "true") {

			$("#search_text").val("");

		}

		if ("${ not empty param.rsv_in }" == "true") {

			$("#rsv_in").val("${ param.rsv_in}");

		}

		if ("${ not empty param.rsv_out }" == "true") {

			$("#rsv_out").val("${ param.rsv_out}");

		}

		if ("${ not empty param.room_type }" == "true") {

			$("#room_type").val("${ param.room_type}");

		}
		if ("${ not empty param.pet_type }" == "true") {

			$("#pet_type").val("${ param.pet_type}");

		}
	});
</script>


</head>
<body>
	<div class="nav-bar">

		<%@include file="../nav/nav_success.jsp"%>

	</div>

	<div class="header">

		<%@include file="./bar.jsp"%>

	</div>
	<div class="board-container">



		<div class="left-menu">

			<div class="search-results">
				<div class="left-box shadow">
					<h1>숙소 목록</h1>
					<c:forEach var="acom" items="${ list }">

						<hr style="border: 1px solid black;">
						<img class="acom_img" src=" ${acom.acom_img}">
						<div class="acom-box">
							<div class="acom_name">
								<H2>${acom.acom_name}</H2>
							</div>
							<br>
							<div class="acom_addr">
								<h4>${acom.acom_addr}</h4>
							</div>
							<br>
							<div class="acom_addr">
								<h4>${acom.tel}</h4>
							</div>
							<br>
							<c:forEach var="room" begin="0" end="0"
								items="${acom.room_list }">
								<div class="room_pirce" name="room_pirce">
									<fmt:formatNumber value="${room.room_price }" type="number"
										pattern="#,###" />
									원

								</div>
								<div class="detail">
									<input type="button" class="search-btn" value="상세보기"
										onclick="location.href='viewlist.do?mem_idx=${ sessionScope.user.mem_idx }&acom_idx=${ acom.acom_idx }&room_idx=${room.room_idx }&rsv_in=${ param.rsv_in }&rsv_out=${ param.rsv_out }'">
								</div>
							</c:forEach>
						</div>

						<div style="clear: both;"></div>

					</c:forEach>

					<!-- 페이지 버튼 -->
					<div class="pagination">
						<c:if test="${page > 1}">
							<div class="pre">
								<a
									href="list.do?page=${page - 1}&search_text=${param.search_text}">
									<h3>PREV</h3>
								</a>
							</div>
						</c:if>
						<div class="next">
							<a
								href="list.do?page=${page + 1}&search_text=${param.search_text}"><h3>NEXT</h3></a>
						</div>
						<div style="clear: both;"></div>
					</div>

				</div>
			</div>
		</div>

		<div class="right-sidebar">

			<%@include file="./filter.jsp"%>

		</div>



		<div class="footer">
			<div>
				<p>주식회사 펫토피아 ｜ 공동대표 !Err404 박태섭 안소현 남가은 ｜ 서울특별시 관악구 청룡동 862-1 |
					http://www.gith.co.kr/</p>
			</div>

		</div>
	</div>

</body>
</html>
