<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 부트스트랩 사용설정 3버전 --> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
<!-- SweetAlert2 설정 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> 

<style type="text/css">
#box{
	width: 1200px;
	margin: auto;
	margin-top: 50px;
}

#title{
text-align: center;
font-size: 28px;
font-weight: bold;
color: pink;

text-shadow: 1px 1px 2px black;
}

td{
vertical-align: middle; !important;
}
</style>


<script type="text/javascript">

	
	

</script>


</head>
<body>



<div id="box">
<h1 id="title">Petopia</h1>

   


			<table class="table table-hover">
				<!-- title -->
				<tr class="info">
					<th>예약 번호</th>
					<th>예약자</th>
					<th>이메일</th>
					<th>휴대폰</th>
					<th>예약 금액</th>
					<th>체크인</th>
					<th>체크아웃</th>
					

					<c:if test="${sessionScope.user.mem_grade eq '관리자' }">
					<th>수정</th>
					<th>취소</th>
					</c:if>
				</tr>

				<!-- 데이터 출력 -->
				<!--데이터가 없을경우  -->
				<!-- requestScope 가 생략되어있음 -->
				<c:if test="${empty list_one }">
					<tr>
						<td colspan="11" align="center"><font color="red">
								예약된 내역이 없습니다.</font></td>
					</tr>
				</c:if>

				<!-- 데이터가 있는 경우 -->
				
				<c:forEach var="vo" items="${ list_one }">
					<tr>
							<td>${ vo.rsv_idx }</td>
							<td>${ sessionScope.user.mem_name }</td>
							<td>${ sessionScope.user.mem_email }</td>
							<td>${ sessionScope.user.mem_phone }</td>
							<td><fmt:formatNumber value='${ vo.rsv_price }' type='number' pattern='#,###' />원</td>
							<td>${ vo.rsv_in }</td>
							<td>${ vo.rsv_out }</td>
						
						
	<%-- 					<c:if test="${sessionScope.user.mem_grade eq '관리자' }">
						<td><input class="btn btn-success" type="button" value="수정"
									onclick="location.href='modify_form.do?mem_idx='">
									<!-- 404가 떨어지지면 mem_idx넘어가는지 확인 -->
							<input class="btn btn-danger" type="button" value="삭제"
									onclick="del('');">
						</td>
						</c:if>	 --%>
					</tr>
				</c:forEach>

			</table> 


		</div>
</body>
</html>