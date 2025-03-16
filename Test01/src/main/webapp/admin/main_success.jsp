<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
function del(mem_idx){
	//삭제 확인?						(취소) 취소버튼을 누르면 return시켜라
	//if(confirm("정말 삭제 하시겠습니까?")==false) return;	
	
	Swal.fire({
	  title: "정말 삭제하시겠습니까??",
	  html:"<font color='red'> 삭제버튼 클릭시 회원정보가 삭제됩니다.</font>",
	  icon: "question",
	  showCancelButton: true,
	  confirmButtonColor: "#3085d6",
	  cancelButtonColor: "#d33",
	  confirmButtonText: "삭제!",
	  cancelButtonText: "취소!"
	  //then 삭제 또는 취소버튼을 누르면(이벤트발생_fire or then이라는 함수) json으로 값이 넙어온다
	}).then((result)=>{  //=>람다식
		if (result.isConfirmed) { //isConfirmed 확인
			//삭제처리			 delete.do?mem_idx=1	
			location.href = "../mypage/delete.do?mem_idx=" + mem_idx; //MemberDeleteAction
		}
	});
	
}
	
	

</script>


</head>
<body>


<div id="box">
<h1 id="title">반려Today</h1>
<!-- 로그인/회원가입-->

 <div class="row"  style="margin-top: 30px; margin-bottom: 5px;">
    <div class="col-sm-3 col-md-3" >
      <input class="btn btn-danger"  type="button" value="회원가입" 
	            onclick="location.href='join_form.do'">
    </div>
    <div class="col-sm-9 col-md-9" style="text-align: right">
     
      <!-- 로그인이 안되었을 경우(session에 user가 없냐?) -->
      <c:if test="${ empty sessionScope.user }">
	      <input class="btn btn-danger"  type="button" value="로그인" 
		            onclick="location.href='login_form.do'">
	  </c:if>  
	  
	  <!-- 로그인이 되어있을 경우(session에 user가 있냐?) -->
      <c:if test="${ not empty sessionScope.user }">
          <b>${ user.mem_name }</b>님 환영합니다
	      <input class="btn btn-primary"  type="button" value="로그아웃" 
		            onclick="location.href='../main/logout.do'">
		                                                                   <!--idx 넘기기 -->
		   <input class="btn btn-primary"  type="button" value="내정보" 
		   
		            onclick="location.href='../mypage/member_modify_form.do?mem_idx=${user.mem_idx}'">       
	  </c:if>       
	  
	         <!-- Grid System : 4:8비율   -->    
    <div class="row" style="margin-top: 20px; margin-bottom: 5px;">
	  <div class="col-sm-4">
	       <input  class="btn  btn-primary" type="button" value="1:1문의"  
                onclick="location.href='../csboard/insert_form.do'">
     </div>
      <div class="row" style="margin-top: 20px; margin-bottom:5px;">
	  <div class="col-sm-4">
	 																
	       <input  class="btn  btn-primary" type="button" value="1:1문의리스트"  
                onclick="location.href='../csboard/list.do?mem_idx=${sessionScope.user.mem_idx}'">           
</div>
</div>
	            
	            
    
  </div>
   

			<!-- 회원목록 출력 -->
			<table class="table table-hover">
				<!-- title -->
				<tr class="info">
					<th>번호</th>
					<th>이름</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이메일</th>
					<th>휴대폰</th>
					<th>우편번호</th>
					<th>주소</th>
					<th>아이피</th>
					<th>등급</th>
					
					<!-- 로그인 유저가 관리자면 -->
					<c:if test="${sessionScope.user.mem_grade eq '관리자' }">
					<th>편집</th>
					</c:if>
				</tr>

				<!-- 데이터 출력 -->
				<!--데이터가 없을경우  -->
				<!-- requestScope 가 생략되어있음 -->
				<c:if test="${empty list }">
					<tr>
						<td colspan="11" align="center"><font color="red">
								가입된회원정보가 없습니다.</font></td>
					</tr>
				</c:if>

				<!-- 데이터가 있는 경우 -->
				<!--for(MemberVo vo: list) 동일  -->
				<c:forEach var="vo" items="${ list }">
					<tr>
						<td>${vo.mem_idx }</td>
						<td>${vo.mem_name }</td>
						<td>${vo.mem_id }</td>
 						<td>${vo.mem_pwd }</td>
						<td>${vo.mem_email }</td>
						<td>${vo.mem_phone }</td>
						<td>${vo.mem_zipcode }</td>
						<td>${vo.mem_addr }</td>
						<td>${vo.mem_ip }</td>
						<td>${vo.mem_grade }</td>
						
						<!-- 로그인 유저가 관리자면 수정 삭제 가능 -->
						<c:if test="${sessionScope.user.mem_grade eq '관리자' }">
						<td><input class="btn btn-success" type="button" value="수정"
									onclick="location.href='../mypage/member_modify_form.do?mem_idx=${vo.mem_idx}'">
									 
									<!-- 404가 떨어지지면 mem_idx넘어가는지 확인 -->
							<input class="btn btn-danger" type="button" value="삭제"
									onclick="del('${vo.mem_idx}');"> 
								<!-- 세션에있는 로그인한 user를 날림-->
								<!-- 회원을 삭제하려면 vo를 삭제해야함-->
									
						</td>
						</c:if>	
					</tr>
				</c:forEach>

			</table> 


		</div>
</body>
</html>