<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/bar.css">
<script src="../js/bar.js"></script>
<title>숙소 상세보기</title>
<style>
/* viewer.css  */
.view-container {
	
	width: 1200px;
	height: auto;
	margin: 0 auto;
}


h1{

font-size: 25px;


}

img {
	width: 300px;
	height: 250px;
}

.carousel-container {
	float: left;
	margin: auto;
	width: 800px;
	height: 600px;
	margin-top: 20px;
	margin-left: 20px;
	overflow: hidden;
	/* 이미지가 벗어나지 않도록 설정 */
}

.main {
	width: 100%;
	height: 200px;
	margin-top: 20px;
	border-radius: 20px;

}

.info {
	width: 100%;
	height: 100px;
	text-align: center;
	margin: auto;
	margin-top: 25px;
	
}

.content {
	width: 100%;
	height: auto;
	margin: auto;
}

.footer {
	width: 100%;
	height: 50px;
	margin-top: 20px;
	
}

/* 캐러셀 */
.carousel-item {
	width: 100%;
	height: 100%;
	/* 부모의 높이를 상속받아 크기를 유지 */
}

.carousel-item img {
	width: 750px;
	height: 600px;
	/* 부모 높이와 동일하게 설정 */
	object-fit: cover;
	/* 이미지가 잘리지 않고 꽉 차도록 설정 */
}

/* 중앙 정렬된 오버레이 텍스트 */
.carousel-caption {

	text-align: center;
	background: rgba(0, 0, 0, 0.6);
	margin-left: 70px;
	padding: 20px;
	border-radius: 10px;
	color: #fff;
	width: 50%;
}

.carousel-caption h5 {
	font-size: 32px;
	font-weight: bold;
}

.carousel-caption p {
	font-size: 18px;
}

.search-box {
	display: flex;
	align-items: center;
	gap: 15px;
	width: 100%;
}

.search-text {
	flex: 1;
	width: 300px;
}

.search-box .btn {
	flex: 0.5;
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

#rsv-btn{

margin-top: 140px;

}

.content-box {
	width: 97%;
	height: 99%;
	border-radius: 15px;
	margin-left: 20px;
	margin-bottom: 10px;
}

.room-info {
	padding: 15px;
	width: 98%;
	height: 230px;

}

.room-img {
	float:left;
	width: 300px;
	height: 190px;
}

.room-box1{

	float: left;
	margin: auto;
	width: 550px;
	height: 210px;
	justify-content: center;
	align-items: center;	
	text-align: center;

}


.room-box2 {

	margin: auto;
	width: 250px;
	height: 210px;
	text-align: center;
	float: right;
	justify-content: center;
	align-items: center;
}

.map {
	margin-top: 20px;
	margin-right: 20px;
	float: right;
	width: 350px;
	height: 250px;
}



.map-box {
	margin-top: 20px;
}

.acom-name {
	padding: 15px;
	 
}
</style>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=76c0b7bcbbe38b1ff825aa48ad565606">
	
</script>

<script type="text/javascript">
	function find() {
		let search = $("#search").val();
		let search_text = $("#search_text").val().trim();
		let rsv_in = $("#rsv_in").val();
		let rsv_out = $("#rsv_out").val();
		let room_type = $("#room_type").val();

		if (search != "all" && search_text == "") {//전체검색이 아닌데 비어있을 때 조건식

			alert("검색어를 입력해주세요.");
			$("#search_text").val("");
			$("#search_text").focus("");
			return;

		}

		//검색 정보를 넘겨서 목록 요청하기
		location.href = "list.do?search=" + search + "&search_text="
				+ encodeURIComponent(search_text, "utf-8") + "&rsv_in="
				+ rsv_in + "&rsv_out=" + rsv_out;

	}

	//window.onload=function(){};
	//선택한 카테고리 유지시키기
	$(document).ready(function() {
		var mapyElement = document.getElementById('mapy');
		var mapxElement = document.getElementById('mapx');

		var mapy = parseFloat(mapyElement.value); // 입력 필드의 값을 가져와 숫자로 변환
		var mapx = parseFloat(mapxElement.value);
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(mapy, mapx), //지도의 중심좌표. mpay , mapx 순으로 집어넣기
			level : 3
		//지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options);

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
	});

	function rsv(f) {
		let mem_idx = f.mem_idx.value;//$("#mem_idx").val("${ sessionScope.user.mem_idx }");
		let room_idx = f.room_idx.value;//$("#room_idx").val("${room.room_idx }");
		let acom_idx = f.acom_idx.value;//$("#acom_idx").val("${ acom.acom_idx }");
		let rsv_in = $("#rsv_in").val();
		let rsv_out = $("#rsv_out").val();

		let room_price = f.room_price.value; //$("#room_price").val("${room.room_price}");
		let room_cap = f.room_cap.value;//$("#room_cap").val("${room.room_cap}")

		let total_rsv_chk = f.total_rsv_chk.value;//parseInt($("#total_rsv_chk").val(), 10);

		console.log("total_rsv_chk 값:", total_rsv_chk);

		if (!rsv_in || !rsv_out) {
			alert("체크인/아웃 날짜를 입력해주세요.");
			return;
		}

		if (total_rsv_chk >= room_cap) {

			alert("남은 방이 없어서 예약이 불가능합니다.");

			return;

		} else {

			//검색 정보를 넘겨서 목록 요청하기
			location.href = "booking.do?mem_idx=" + mem_idx + "&acom_idx="
					+ acom_idx + "&room_idx=" + room_idx + "&room_cap="
					+ room_cap + "&room_price=" + room_price + "&rsv_in="
					+ encodeURIComponent(rsv_in) + "&rsv_out="
					+ encodeURIComponent(rsv_out);
			/* location.href = "booking.do?mem_idx=" + encodeURIComponent(mem_idx)
					+ "&acom_idx=" + encodeURIComponent(acom_idx)
					+ "&room_idx=" + encodeURIComponent(room_idx)
					+ "&room_cap=" + encodeURIComponent(room_cap)
					+ "&room_price=" + encodeURIComponent(room_price)
					+ "&rsv_in=" + encodeURIComponent(rsv_in) + "&rsv_out="
					+ encodeURIComponent(rsv_out); */

		}
		//"location.href='booking.do?mem_idx=${ sessionScope.user.mem_idx }&acom_idx=${ acom.acom_idx }&room_idx=${room.room_idx }&rsv_in=${ param.rsv_in }&rsv_out=${ param.rsv_out }&room_type=${ room.room_type }&room_price=${ room.room_price }&room_cap=${ room.room_cap }'
	}
</script>





</head>

<body>
	<div class="nav-bar">
		<%@include file="../nav/nav_success.jsp"%>

	</div>
	<div class="header">
		<%@include file="./bar.jsp"%>
	</div>
	<div class="view-container">

		<div class="img-comtainer">
			<div class="carousel-container">
				<div id="accommodationCarousel" class="carousel slide carousel-fade"
					data-bs-ride="carousel">
					<div class="carousel-inner">

						<div class="carousel-item active">
							<img src="${acom.acom_img }">
							<div class="carousel-caption">
								<h5>${ acom.acom_name }</h5>


							</div>
						</div>

						<c:forEach var="vo" items="${img}">

							<div class="carousel-item">
								<img src="${vo.roomimg1}">

							</div>
							<div class="carousel-item">
								<img src="${vo.roomimg2}">

							</div>
						</c:forEach>
					</div>

					<button class="carousel-control-prev" type="button"
						data-bs-target="#accommodationCarousel" data-bs-slide="prev">
						<span class="carousel-control-prev-icon"></span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#accommodationCarousel" data-bs-slide="next">
						<span class="carousel-control-next-icon"></span>
					</button>
				</div>

			</div>
			<div class="map-box">
				<h4>숙소 지도</h4>
				<hr style="border: 1px solid black;">
				<div class="map" id="map"></div>


			</div>
			<div class="map-box">
				<h6>정보</h6>
				<hr style="border: 1px solid black;">
				<p>숙소명 : ${ acom.acom_name }</p>
				<p>전화 : ${ acom.tel }</p>
				<p>주소 : ${ acom.acom_addr }</p>

			</div>
			<div style="clear: both;"></div>
		</div>

		<input type="hidden" id="mapx" value="${ acom.mapx }" name="mapx">
		<input type="hidden" id="mapy" value="${ acom.mapy }" name="mapy">



		<div class="main shadow">
			<div class="acom-name">
				<h2>${ acom.acom_name }</h2>
			</div>



		</div>
		<div class="info"><h1>객실 정보</h1></div>
		<div class="content">
			<div class="content-box shadow">


				<c:forEach var="room" items="${ room_list }">
				<div class="room-info">
					<form>
						<input type="hidden" name="mem_idx"
							value="${ sessionScope.user.mem_idx }"> <input
							type="hidden" name="acom_idx" value="${ room.acom_idx }">
						<input type="hidden" name="room_idx" value="${ room.room_idx }">

						<input type="hidden" name="total_rsv_chk"
							value="${ room.total_rsv_chk }"> <input type="hidden"
							name="room_price" value="${ room.room_price }"> <input
							type="hidden" name="room_cap" value="${ room.room_cap }">

						
							<hr style="border: 1px solid black;">
							<img class="room-img" src="${room.roomimg1 }">
							<div class="room-box1">
								<div>${ room.room_type }</div>
								<div>객실 수 : ${ room.room_cap } 체크인 수: ${ room.total_rsv_chk }</div>
								<div>가격 : <fmt:formatNumber value="${room.room_price }" type="number"
										pattern="#,###" />
									원</div>
							
							</div>
							<div class="room-box2">
								
								<input type="button" class="search-btn" id="rsv-btn" value="예약하기"
									onclick="rsv(this.form);">
							</div>
							<div style="clear: both;"></div>
						

						<br>
					</form>
					</div>
				</c:forEach>


			</div>




		</div>

		<!-- form 끝  -->
		<div class="footer">
			<div>
				<p>주식회사 펫토피아 ｜ 공동대표 !Err404 박태섭 안소현 남가은 ｜ 서울특별시 관악구 청룡동 862-1 |
					http://www.gith.co.kr/</p>
			</div>
		</div>


	</div>

</body>

</html>