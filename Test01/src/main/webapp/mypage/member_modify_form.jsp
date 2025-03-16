<%@page import="vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!--  부트스트랩 적용 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 다음 주소 검색 API  -->

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style type="text/css">



#box{
width: 500px;
margin: auto;
margin-top: 100px;
}
th{
/*  !improtant : 현재속성을 우선 적용*/
vertical-align: middle !important;

}
</style>

<script type="text/javascript">

const regular_number = /^[0-9]{1,3}$/;

	function del(a_idx){
	//del ->예약어 아님 내가 만든 함수임 
	//function delete: 이게 자바스크립트 삭제 예약어임
		
	//탈퇴 확인 체크(확인:true 취소:false)
	if(confirm("정말 탈퇴 하시겠습니까?")==false) return;
	
	//alert(idx + "번 삭제");
	//location.href ="delete.do?mem_idx=" + mem_idx; //MemberDeleteAction를 호출
	location.href ="delete.do?mem_idx=" + a_idx; //MemberDeleteAction를 호출
	//del함수의 특징 mem_idx인데 변수값으로 a_idx를 넣어야함 mem_idx를 넣으면 x
	//a_idx는 임시변수임 내가 명명하는 것임.
	//dele
	}//end: function del()
	const regular_email = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;

function send(f){
	let mem_idx		= f.mem_idx.value;
	let mem_name 	= f.mem_name.value.trim();
	let mem_pwd  	= f.mem_pwd.value.trim();
	let mem_email	= f.mem_email.value;
	let mem_phone   = f.mem_phone.value.trim();
	let mem_zipcode = f.mem_zipcode.value.trim();
	let mem_addr 	= f.mem_addr.value.trim();
	
	
	if(mem_name==""){
		
		alert("이름을 입력하세요!");
		f.mem_name.value="";
		f.mem_name.focus();
		return;		
	}
	
	if(mem_pwd==""){
		
		alert("비밀번호를 입력하세요!");
		f.mem_pwd.value="";
		f.mem_pwd.focus();

		return;		
	}
	
	if(regular_email.test(mem_email)==false){
		
		alert("이메일 형식을 확인하세요!");
		f.mem_email.value="";
		f.mem_email.focus();
		return;		
	}
	
	
	if(mem_phone==""){
		
		alert("전화번호를 입력하세요!");
		f.mem_phone.value="";
		f.mem_phone.focus();
		return;		
	}
	
	if(mem_zipcode==""){
		
		alert("우편번호를 입력하세요!");
		f.mem_zipcode.value="";
		f.mem_zipcode.focus();
		return;		
	}
	
	if(mem_addr==""){
		
		alert("주소를 입력하세요!");
		f.mem_addr.value="";
		f.mem_addr.focus();
		return;		
	}
	
	//수정확인
	if(confirm("정말 수정하시겠습니까?")==false){
		//자신의 페이지를 호출 : 새로고침효과
		location.href = ""; //아무도 지정하지 않으면 자기 자신을 호출한다.(refresh효과)
		return;
	}
	 f.action="member_modify.do"  //MemberModifyAction
			
	 f.submit();//지정된 action으로 form data 전송 
	 
	 
}//end:send(f)

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
		 	 			$("#mem_zipcode").val(data.zonecode);
		 	 			$("#mem_addr").val(data.address);
		 	        }
		 	    }).open();
		 }//end:fine_addr()

</script>


</head>

<body>

<form>
<input type="hidden" class= "form-control" name="mem_idx" value="${vo.mem_idx}">
	<div class="container">
  <h3>내정보 수정하기</h3>
   <input class="btn btn-success" type="button" value="1:1문의하기"
					 onclick="location.href='../csboard/insert_form.do';">        
  <table class="table table-striped">
    <thead>
					<tr>
						<th>&nbsp;</th>
					
	</thead>
	 <tbody>
					<tr>
						<th>이름</th>
						<td><input class="form-control" name="mem_name" value="${vo.mem_name}" ></td>
					</tr>
					
					<tr>
						<th>아이디</th>
						<td><input class="form-control" name="mem_id" value="${vo.mem_id}" readonly="readonly"></td>
					</tr>
						<tr>
						<th>비밀번호</th>
						<td><input class="form-control" name="mem_pwd" value="${vo.mem_pwd}"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input class="form-control" name="mem_email" value="${vo.mem_email}"></td>
					</tr>
					<tr>
						<th>휴대폰번호</th>
						<td><input class="form-control" name="mem_phone" value="${vo.mem_phone}"></td>
					</tr>
					
					
					<tr>
						<th>우편번호</th>
						<td><input class="form-control" id="mem_zipcode" name="mem_zipcode" value="${vo.mem_zipcode}">
						<input  class="btn btn-info"  type="button" value="주소검색" onclick="find_addr();"> </td>
						
						</tr>
					
					
					<tr>
						<th>주소</th> <!--  id를 빼먹음-->
						<td><input class="form-control" id="mem_addr" name="mem_addr" value="${vo.mem_addr}"></td>
					</tr>
					<td colspan="2" align="center">
					<input class="btn" style="background-color: #d9edf7;" type="button" value="수정하기"
						onclick="send(this.form);">
						
					 <input class="btn btn-danger" type="button" value="회원탈퇴"
					 onclick="del('${vo.mem_idx}');"> 
					 
					 <!-- <input class="btn btn-success" type="button" value="1:1문의하기"
					 onclick="location.href='../csboard/insert_form.do';">  -->
                    
                    <%-- onclick="location.href='../csboard/list.do?mem_idx=${user.mem_idx}';" --%>
                </td>
				
				
					</td>
				  </tbody>
				</table>
			</div>
	
</form>

</body>
</html>