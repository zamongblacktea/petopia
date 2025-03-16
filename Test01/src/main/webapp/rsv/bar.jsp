<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<link rel="stylesheet" href="../css/bar.css">





</head>

<form>

	<!-- 검색어 입력 -->
	<div class="search-container">
	<div class="search-box">
		<input type="hidden" value="${ sessionScope.user.mem_idx }"
			id="mem_idx"> <input type="text"
			class="search_text form-control w-300" id="search_text"
			value="${ param.search_text }" placeholder="도시, 숙소 이름 검색">
	</div>

	<!-- 날짜 선택 -->
	<div class="date-box">
		<span class="icon">📅</span> <input type="date"
			class="form-control w-150" id="rsv_in" name="rsv_in" required>


		<input type="date" class="form-control w-150" id="rsv_out"
			name="rsv_out" required>
	</div>

	<!-- 인원 선택 -->
	<div class="people-box">
		<span class="icon">👥</span> <select class="search form-control"
			id="room_type">
			<option value="1">1인</option>
			<option value="2">2인</option>
			<option value="3">3인</option>
			<option value="4">4인 이상</option>
		</select>
	</div>


	<div class="people-box">
		<span class="icon">🐶</span> <select class="search form-control"
			id="pet_type">
			<option value="all">모두</option>
			<option value="소형">소형</option>
			<option value="중형">중형</option>
			<option value="대형">대형</option>
			<option value="맹견">맹견</option>
		</select>
	</div>


	<!-- 검색 버튼 -->
        <input type="button" class="search-btn" id="info-button" value="검색"
						onclick="find();">

	</div>
</form>






