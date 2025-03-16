<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!-- 포트 원 결제대행 api lib  -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>


<style>
body {
	background-color: #f8f9fa;
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
	margin: auto;
}

.footer {
	clear: both;
}
</style>

<script type="text/javascript">

//주소 검색
function find_addr(){
	//다음에서 가져온 코드 넣는다
	 new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	            // data: JSON형식
	            //data = {"zonecode":"06789","address":"서울시 관악구 남부순환로 111",...}
	            //console.log(data);
	 
	 			//id=mem_zipcode로 줬음
	 			$("#acom_zipcode").val(data.zonecode);
	 			$("#acom_addr").val(data.address);
	        }
	    }).open();
    
} //end:find_addr()


function send(f) {
	
	let
	let
	let
	let
	let
	let
	let
	let
	
	
	
	
	
	
}


	
</script>

</head>
<body>
	<div class="container">
		<div class="rsvform shadow">
			<h2 class="text-center mb-4">숙소 등록</h2>
			<form id="bookingForm">
				<input type="hidden" name="mem_idx" id="mem_idx"
					value="${sessionScope.user.mem_idx }">
				<div class="mb-3">
					<label for="acom_name" class="form-label">숙소명</label> <input
						type="text" class="form-control" name="acom_name" id="acom_name"
						required>
				</div>
				<div class="mb-3">
					<label for="acom_desc" class="form-label">숙소 설명</label> <textarea
						type="text" class="form-control" name="acom_desc" id="acom_desc"
						required> </textarea>
				</div>
				<div class="mb-3">
					<label for="acom_zipcode" class="form-label">우편 번호</label> <input
						class="form-control" required="required" id="acom_zipcode"
						name="acom_zipcode"> <input class="btn btn-info"
						type="button" value="주소검색" onclick="find_addr();">
				</div>
				<div class="mb-3">
					<label for="acom_addr" class="form-label">주소</label> <input
						class="form-control" required="required" name="acom_addr"
						id="mem_acom">
				</div>
				<div class="mb-3">
					<label for="acom_img" class="form-label">숙소 이미지 등록</label> <input
						type="text" class="form-control" name="acom_img" id="acom_img">
				</div>
				<h2 class="text-center mb-4">객실 정보 입력</h2>
				<div class="mb-3">
					<label for="room_type" class="form-label">1인실(객실 수)</label> <input
						type="text" class="form-control" name="room_cap" id="room_cap"
						required> <label for="room_price" class="form-label">가격</label>
					<input type="text" class="form-control" name="room_price"
						id="room_price" required>
				</div>
				<div class="mb-3">
					<label for="room_type" class="form-label">2 ~ 3인실</label> <input
						type="text" class="form-control" name="room_cap" id="room_cap"
						required> <label for="room_price" class="form-label">가격</label>
					<input type="text" class="form-control" name="room_price"
						id="room_price" required>
				</div>
				<div class="mb-3">
					<label for="room_type" class="form-label">3 ~ 4인실</label> <input
						type="text" class="form-control" name="room_cap" id="room_cap"
						required> <label for="room_price" class="form-label">가격</label>
					<input type="text" class="form-control" name="room_price"
						id="room_price" required>
				</div>
				<div class="mb-3">
					<label for="room_type" class="form-label">4인실</label> <input
						type="text" class="form-control" name="room_cap" id="room_cap"
						required> <label for="room_price" class="form-label">가격</label>
					<input type="text" class="form-control" name="room_price"
						id="room_price" required>
				</div>
				<div class="mb-3">
					<label for="room_type" class="form-label">대형룸</label> <input
						type="text" class="form-control" name="room_cap" id="room_cap"
						required> <label for="room_price" class="form-label">가격</label>
					<input type="text" class="form-control" name="room_price"
						id="room_price" required>
				</div>
				<div class="mb-3">
					<label for="acom_room" class="form-label">총 객실</label> <input
						type="text" class="form-control" name="acom_room" id="acom_room"
						required>
				</div>

				<div class="mb-3">
					<label for="room_amen" class="form-label">객실 시설 정보 입력</label> <textarea
						type="text" class="form-control" name="room_amen" id="room_amen"
						required> </textarea>
				</div>
				<div class="mb-3">
					<label for="room_img" class="form-label">객실 이미지 등록</label> <textarea
						type="text" class="form-control" name="room_img" id="room_img"
						required> </textarea>
				</div>



				<input type="button" class="btn btn-primary w-100"
					onclick="send(this.form)" value="등록하기">
			</form>
		</div>
	</div>

	<div class="footer"></div>

</body>
</html>
