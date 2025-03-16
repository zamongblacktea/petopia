<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>숙소 예약</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- 포트 원 결제대행 api lib  -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/bar.css">


<style>
body {
	background-color: #f4f6f8;
}

img {
	width: 390px;
	height: 250px;
	margin-left: 8px;
}

h {
	text-align: center;
}

.hr {
	display: block;
	clear: both;
	margin: auto;
	margin-top: 10px;
}

.container {
	width: 1200px;
	margin: auto;
}

.rsvform {
	width: 58%;
	background: white;
	padding: 20px;
	border-radius: 10px;
	margin-top: 50px;
	margin-right: 10px;
	float: left;
}

.acominfo {
	width: 38%;
	height: auto; background : white;
	border-radius: 10px;
	margin-top: 50px;
	margin-left: 10px;
	padding: 20px;
	float: right;
	background: white;
}

.footer {
	clear: both;
}

.map-box {
	margin-top: 20px;
}

.map {
	margin-top: 30px;
	margin-right: 20px;
	margin: auto; width : 98%;
	height: 250px;
	width: 98%;
}

.acom-img {
	width: 98%;
	height: 250px;
}
.btn{

	float: right;

}
</style>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=76c0b7bcbbe38b1ff825aa48ad565606">
	
</script>



<script>
	function togglePetInfo() {
		let petCount = document.getElementById("rsv_pet").value;
		let petInfoGroup = document.getElementById("rsv_info");
		if (petCount > 0) {
			petInfoGroup.style.display = "block";
		} else {
			petInfoGroup.style.display = "none";
		}
	}

	/*         document.getElementById("bookingForm").addEventListener("submit", function(event) {
	 event.preventDefault(); // 기본 폼 제출 방지
	 alert("예약이 완료되었습니다!");
	 }); */

	/* 		//결제 정보 전송용
	 function send(f){
	 let rsv_in      = f.rsv_in.value();
	 let rsv_out     = f.rsv_out.value();
	 let mem_name    = f.mem_name.value.trim();
	 let mem_phone   = f.mem_phone.value.trim();
	 let mem_email   = f.mem_email.value.trim();
	 let rsv_cap     = f.rsv_cap.value();
	 let rsv_pet     = f.rsv_pet.value();
	 let rsv_petinfo = f.rsv_petinfo.value();
	 let rsv_price   = f.rsv_price.value();
	
	



	 f.action = "";
	 f.method = "POST";
	 f.submit();

	 } */

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

	});
</script>



<!-- 포트원 SDK 라이브러리 추가 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="https://cdn.portone.io/v2/browser-sdk.js"></script>
<script>
	IMP.init("imp23446565"); // 아임포트 가맹점 식별 코드 입력

	function requestPay() {
		const mem_idx = $("#mem_idx").val();
		const rsv_price = $("#rsv_price").val();
		const room_idx = $("#room_idx").val();
		const mem_email = $("#mem_email").val();
		const mem_name = $("#mem_name").val();
		const mem_phone = $("#mem_phone").val();
		const mem_addr = $("#mem_addr").val();

		IMP.request_pay({
			channelKey : "channel-key-7c367284-0269-40b7-aba7-b1437d2fbaaf", // 콘솔에서 발급한 채널키 입력
			pay_method : "card", // 결제 수단 (신용카드)
			merchant_uid : "payment-" + new Date().getTime(), // 주문 고유번호 (현재 타임스탬프 사용)
			name : "펫토피아 숙소 결제 테스트",
			amount : rsv_price, // 결제 금액 (원)
			buyer_email : mem_email,
			buyer_name : mem_name,
			buyer_tel : mem_phone,
			buyer_addr : mem_addr,
		}, function(response) {
			if (response.success) {
				console.log("결제 성공:", response);
				alert("결제가 완료되었습니다! 결제 ID: " + response.imp_uid);

				// 서버에 결제 검증 요청 (AJAX 사용)

				verifyPayment(response.imp_uid, response.merchant_uid);

				location.href="info.do?mem_idx=" + mem_idx;

			} else {
				console.error("결제 실패:", response.error_msg);
				alert("결제 실패: " + response.error_msg);
			}
		});
	}

	// AJAX를 사용한 결제 검증 요청
	function verifyPayment(imp_uid, merchant_uid) {

		const mem_idx = $("#mem_idx").val();
		const acom_idx = $("#acom_idx").val();
		const rsv_price = $("#rsv_price").val();
		const room_idx = $("#room_idx").val();
		const rsv_in = $("#rsv_in").val();
		const rsv_out = $("#rsv_out").val();
		const rsv_pet = $("#rsv_pet").val();
		const rsv_petinfo = $("#rsv_petinfo").val();
		const room_cap = $("#room_cap").val();

		//alert(`[\${mem_idx}]`);

		$.ajax({
			url : "verify.do",
			type : "POST",
			//contentType: "application/json",
			data : {
				"imp_uid" : imp_uid,
				"merchant_uid" : merchant_uid,
				"mem_idx" : mem_idx,
				"acom_idx" : acom_idx,
				"room_idx" : room_idx,
				"rsv_price" : rsv_price,
				"rsv_in" : rsv_in,
				"rsv_out" : rsv_out,
				"rsv_pet" : rsv_pet,
				"rsv_petinfo" : rsv_petinfo,
				"room_cap" : room_cap
			},
			dataType : "json",
			success : function(result) {
				if (result.success) {
					console.log("결제 검증 성공:", result);
					alert("결제 검증 완료!");

				} else {
					console.error("결제 검증 실패:", result.message);
					alert("결제 검증 실패: " + result.message);
				}
			},
			error : function(xhr, status, error) {
				console.error("결제 검증 중 오류 발생:", error);
				alert("결제 검증 오류 발생: " + error);
			}
		});
	}

	// 버튼 클릭 시 결제 요청 실행
	/*     $(document).ready(function () {
	 $("#bookingForm").click(requestPay);
	 }); */
</script>

</head>
<body>
	<div class="container">
		<input type="hidden" id="mapx" value="${ acom.mapx }" name="mapx">
		<input type="hidden" id="mapy" value="${ acom.mapy }" name="mapy">
		<div class="rsvform shadow">
			<h2 class="text-center mb-4">숙소 예약</h2>
			<form id="bookingForm">
				<input type="hidden" name="mem_idx" id="mem_idx"
					value="${sessionScope.user.mem_idx }"> <input type="hidden"
					name="acom_idx" id="acom_idx" value="${param.acom_idx }"> <input
					type="hidden" name="room_idx" id="room_idx"
					value="${param.room_idx }"> <input type="hidden"
					name="room_cap" id="room_cap" value="${param.room_cap }">
				<div class="mb-3">
					<label for="check_in" class="form-label">체크인</label> <input
						type="date" class="form-control" id="rsv_in" name="rsv_in"
						value="${ param.rsv_in }" required>
				</div>
				<div class="mb-3">
					<label for="check_out" class="form-label">체크아웃</label> <input
						type="date" class="form-control" id="rsv_out" name="rsv_out"
						value="${ param.rsv_out }" required>
				</div>
				<div class="mb-3">
					<label for="name" class="form-label">이름</label> <input type="text"
						class="form-control" id="mem_name" name="mem_name"
						value="${ sessionScope.user.mem_name }" required>
				</div>
				<div class="mb-3">
					<label for="phone" class="form-label">전화번호</label> <input
						type="tel" class="form-control" id="mem_phone" name="mem_phone"
						value="${ sessionScope.user.mem_phone }" required>
				</div>
				<div class="mb-3">
					<label for="email" class="form-label">이메일</label> <input
						type="email" class="form-control" id="mem_email" name="mem_email"
						value="${ sessionScope.user.mem_email }" required>
				</div>
				<div class="mb-3">
					<label for="addr" class="form-label">주소</label> <input type="text"
						class="form-control" id="mem_addr" name="mem_addr"
						value="${ sessionScope.user.mem_addr }" required>
				</div>
				<div class="mb-3">
					<label for="rsv_pet" class="form-label">반려동물 수</label> <input
						type="number" class="form-control" id="rsv_pet" name="rsv_pet"
						min="0" value="0" onchange="togglePetInfo()" required="required">
				</div>
				<div class="mb-3" id="rsv_info" style="display: none;">
					<label for="rsv_petinfo" class="form-label">반려동물 정보</label>
					<textarea class="form-control" id="rsv_petinfo" name="rsv_petinfo"
						rows="2" required="required"></textarea>
				</div>
				<div class="mb-3">
				<label for="rsv_price" class="form-label">가격</label> <input
						type="hidden" class="form-control" id="rsv_price" name="rsv_price"
						value="${param.room_price}"
						readonly>
						<fmt:formatNumber value='${param.room_price}' type='number' pattern='#,###' />

				</div>
				<div class="btn">
				<input type="button" class="search-btn"
					onclick="requestPay()" value="예약하기">
				</div>
			</form>
		</div>
		<div class="acominfo shadow">
			<h4>숙소 정보</h4>
			<div class="acom-img">
				<img src="${acom.acom_img } ">
			</div>
			<div class="hr">
				<hr style="border: 1px solid black;">
			</div>
			<div class="map-box">


				<div class="map" id="map"></div>


			</div>
			<div class="map-box">
				<hr style="border: 1px solid black;">
				<p>숙소명 : ${ acom.acom_name }</p>
				<p>전화 : ${ acom.tel }</p>
				<p>주소 : ${ acom.acom_addr }</p>

			</div>
			<div style="clear: both;"></div>
		</div>




	</div>



	<div class="footer"></div>

</body>
</html>
