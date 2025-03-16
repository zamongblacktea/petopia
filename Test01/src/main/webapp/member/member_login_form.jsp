<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- bootstrap 사용설정 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- SweetAlert2 설정 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Poor+Story&display=swap" rel="stylesheet">

<style type="text/css">

*{
		font-family: "Poor Story", sans-serif;
}
 #box{
      width: 600px;
      margin: auto;
      margin-top: 150px;
   }
   th{
   vertical-align:middle !important;
   }
   
   input[type='button']{
   width:100px;
   }
</style>

<script type="text/javascript">

function send(f){
	let mem_id	= f.mem_id.value.trim();
	let mem_pwd = f.mem_pwd.value.trim();
	
	
	if(mem_id==""){
		  //alert("아이디를 입력하세요!!");
		  //Swal.fire("아이디를 입력하세요!!");
		  
		  Swal.fire({
			  title: "입력오류",
			  html: "<h5>아이디를 입력하세요!!</h5>",
			  icon: "warning",
			  returnFocus:false
		  }).then(()=>{
			  
			  f.mem_id.value="";
			  f.mem_id.focus();
		  });
		    
		  return;
	}//end:if(mem_id)
	
	
	if(mem_pwd==""){
	//alert("비밀번호를 입력하세요!!"); 
	//Swal.fire("비밀번호를 입력하세요!!")
	   Swal.fire({
			  title: "입력오류",
			  html: "<h4>비밀번호를 입력하세요!!</h4>",
			  icon: "warning",
			  returnFocus:false
		  }).then(()=>{
			  
			  f.mem_pwd.value="";
			  f.mem_pwd.focus();
		  });
		    
		  return;
	}//end : if(mem_pwd)
	
	//f.method = "POST";
	f.action="login.do";//MemberLoginAction
	f.submit();			//지정action호출(데이터전송)
	
}//end:send()
	
	
</script>

<script type="text/javascript">

//현재 HTML문서의 배치가 완료되면 자동호출함수
//초기화 하는 함수
window.onload = function(){

setTimeout(show_message,100);//0.1초후에 show_message 호출	
//show_message();	
	
};

// /member/login_form.do?reason=fail_id
// /member/login_form.do?reason=fail_pwd&mem_id=hong
function show_message(){
	
	//""문자열로 \${}로 묶어주면 데이터로 처리하겠다는 의미->EL사용(jQuery와 헷갈리지않도록)
	if("${ param.reason eq 'fail_id' }" == "true"){
		//alert("아이디가 틀렸습니다!");
		//파라미터로 들어온 reason의 id가 fail된것이 true라면 알림
		
		Swal.fire({
			  title: "로그인 실패",
			  html: "<h5>아이디가 틀렸습니다.!!</h5>",
			  icon: "warning",
			  returnFocus:false
		  }).then(()=>{
				  
			  //f.mem_id.value="";
			  //f.mem_id.focus();
			  //여기는 send함수가 아니니까 jQuery문을 사용해줘야함
			  //foucu()함수를 사용하기 위해서 아이디쪽에 id="mem_id" 식별자를 추가해줘야 한다.
			  $("mem_id").focus();
		  });

	}
	
	if("${ param.reason eq 'fail_pwd' }" == "true"){
		//alert("비밀번호가 틀렸습니다!");
		//파라미터로 들어온 reason의 pwd가 fail된것이 true라면 알림
		
		Swal.fire({
			  title: "로그인 실패",
			  html: "<h5>비밀번호가 틀렸습니다.!!</h5>",
			  icon: "warning",
			  returnFocus:false
		  }).then(()=>{
				  
			  //f.mem_id.value="";
			  //f.mem_id.focus();
			  //여기는 send함수가 아니니까 jQuery문을 사용해줘야함
			  //foucu()함수를 사용하기 위해서 비밀번호에 id="mem_pwd" 식별자를 추가해줘야 한다.
			  $("mem_pwd").focus();
			  
		  });
		
	}
	
}//end: function show_message()
</script>


</head>
<body>

<form>

<div id="box">
<!-- 부트스트랩 패널 요약노트 -->
<div class="panel panel-success">
      <div class="panel-heading"><h3>로그인</h3></div>
      <div class="panel-body">
      <table class="table">
      <tr>
      <th>아이디</th>
      <td><input class="form-control" id= "mem_id" name="mem_id"  value="${ param.mem_id }"></td>
      </tr>
      
      <tr>
      <th>비밀번호</th>
      <td><input class="form-control" type="password" id="mem_pwd" name="mem_pwd"></td>
      </tr>
      <tr>
		<td colspan="2" align="center">
		<input class="btn  btn-success" type="button"  value="로그인"
		onclick="send(this.form);">
		</td>
	    </tr>
      
      
      
      </table>
      
      
      </div>
</div>
</div>
</form>


</body>
</html>