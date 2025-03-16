<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- bootstrap 사용설정 : 요약노트-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Poor+Story&display=swap" rel="stylesheet">
<!-- 다음 주소 검색 API  -->

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<style type="text/css">
*{
		font-family: "Poor Story", sans-serif;
}
#box {
	width: 800px;
	margin: auto;
	margin-top: 80px;
}

th{
width: 100px;
vertical-align: middle !important;
}

#id_msg{
margin-left: 10px;
}

</style>

<script type="text/javascript">

const regular_email = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;

function send(f){
	
	//입력값 체크 
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
	
	
	//위의것을 확인하고 이상이 없으면 MemberJointAction으로 보내버린다.
	f.action="join.do";//MemberJointAction
	f.submit();
} //end : send


//중복아이디 체크함수
function check_id(){
	//아래는 jQuery : js에서의 의미 : document.getElmentById("mem_id").value;
	let mem_id=$("#mem_id").val();
	
	//가입버튼 비활성화     attr(attribute)=prop(property)   
	$("#btn_register").prop("disabled",true);
	//disabled 사용불가능할때 true /활성화 시키려면 false 
	
	
	
	if(mem_id.length <3){
		
		$("#id_msg").html("아이디는 3자리이상 문자를 사용해야합니다").css("color","red");
		return;
		
	}
	//$("#id_msg").html("사용가능한 아이디입니다.").css("color","blue");
	
	//서버로 입력된 아이디를 전송 ->중복 아이디 체크 
	//Ajax를 통해서 background로 요청
	$.ajax({
	url  	: "check_id.do",		//MemberCheckIdAction(중복아이디 체크하는 객체)
	data 	: {"mem_id": mem_id},   //parameter : check_id.do?mem_id=hong
	dataType: "json",				 //결과수신을 JSON으로 받겠다 ->json으로 줘야 성공/실패를 할수있음
	success : function(res_data){
			//				사용가능							이미사용중임	
			//res_data ={"result": ture} or res_data = {"result":false}
	
		if(res_data.result==true){
			$("#id_msg").html("사용가능한 아이디 입니다.").css("color","blue");
			//이때 활성화 시켜야함 
			
			//가입버튼 활성화
			//아래는 jQuery이고 Js로는 document.getElementById("btn_register").disabled = false
			$("#btn_register").prop("disabled",false);
			
		}else{
			$("#id_msg").html("이미 사용중인 아이디 입니다.").css("color","red");
		}
		
	
	},//end : fuction(res_data)
	error	: function(err){
		alter(err.responseText);
	}
		
	});
}//end:check_id()

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
	 			$("#mem_zipcode").val(data.zonecode);
	 			$("#mem_addr").val(data.address);
	        }
	    }).open();
    
} //end:find_addr()

</script>

</head>
<body>


	<!-- 패널생성  : 요약노트 -->
	<form class="form-inline">
		<div id="box">
			<div class="panel panel-info">
				<div class="panel-heading">회원가입</div>
				<div class="panel-body">

					<table class="table">
						<!-- 이름  -->
						<tr>
							<th>이름</th>
							<td><input class="form-control" name="mem_name"
								style="width: 30%;"></td>
						</tr>

						<!-- 아이디  -->
						<tr>
							<th>아이디</th>
							<td>
							    <input class="form-control" id="mem_id" name="mem_id" style="width: 30%;" onkeyup="check_id();">
							    <span id="id_msg"></span>
							</td>
							
						</tr>

						<!-- 비밀번호 -->
						<tr>
						<th>비밀번호</th>
							<td>
							   <input class="form-control" type="password" 
							          name="mem_pwd" style="width: 30%;">
							</td>
						</tr>


						<!-- 이메일 -->
					
						<tr>
							<th>이메일</th>
							<td><input class="form-control" required="required"
								type="email" name="mem_email" style="width: 30%;"></td>
						</tr>
						
						
						<!--휴대폰  -->
						<tr>
							<th>휴대폰</th>
							<td><input class="form-control" required="required" id="mem_phone"
								 name="mem_phone" style="width: 30%;"></td>
						</tr>
			      
						<!-- 우편번호 -->
							      <tr>
							         <th>우편번호</th>
							         <td>
							            <input  class="form-control"  required="required"   id="mem_zipcode" name="mem_zipcode" style="width: 30%;">
							            <input  class="btn btn-info btn-sm"  type="button" value="주소검색" onclick="find_addr();">   
				 		             </td>
							      </tr>


 					<!-- 주소 -->
			      <tr>
			         <th>주소</th>
			         <td><input  class="form-control"  required="required"   name="mem_addr" id="mem_addr" style="width:100%;"></td>
			      </tr>
						
						<!-- 일반회원/사업자 -->
					
						
						<!-- 버튼 -->
			      <tr>
			         <td colspan="2" align="center">
			             <input class="btn" type="button"  value="Home" onclick="location.href='../main/main.do'">
			             <input class="btn btn-primary" type="button"  value="회원가입" onclick="send(this.form);"
			                    id="btn_register"  disabled="disabled">
			         </td>
			      </tr> 
			      
					</table>

				</div>
			</div>
		</div>
	</form>
</body>
</html>