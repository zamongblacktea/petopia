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

<!-- 다음 주소 검색 API  -->

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Poor+Story&display=swap');
*{
	font-family: "Poor Story","Gamja Flower", sans-serif;
}
	#box{
		width: 700px;
		margin: auto;
		margin-top:120px;
	}
	
	textarea {
	resize: none;
	}
	
	.csboard{
	margin-bottom:10px;
	}

</style>
<script type="text/javascript">


	function send(f){
		
	let cs_title	= f.cs_title.value.trim();
	let cs_content = f.cs_content.value.trim();
	let cs_type 	= f.cs_type.value.trim();
	
	//값을줄때는 밸유속성을 주면안된다. ->어디에 해당하는 말인지?
	
	if( cs_title==""){ //등호연산자는 == 같은가? 비교 주의!
		alert("문의제목을 입력하세요!");
		f.cs_title.value="";
		f.cs_title.focus();
		return;
		
	}
	
	if(cs_content ==""){
		alert("내용을 입력하세요!");
		f.cs_content.value="";
		f.cs_content.focus();
		return;
		
	}
	
	if(cs_type ==""){
		alert("문의타입을 설정하세요!");
		f.cs_type.value="";
		f.cs_type.focus();
		return;
		
	}
	
	f.action = "insert.do"; //CsboardInsertAction
	f.submit();				//전송(제출)
	
	}			
</script>
	
	



</head>
<body>

<!-- form에 인라인넣어보고 이것저것 크기 맞춰보기 -->
<form>
<input type="hidden" name="mem_idx" value="${user.mem_idx }">
<input type="hidden" name="mem_name" value="${user.mem_name }">

<!-- bootstrap 패널 설정 -->
	<div id="box">
		<div class="panel panel-info">
	      <div class="panel-heading"><h4>문의하기</h4></div>
	      <div class="panel-body">
	      	<!-- form  parameter 제목/문의내용/문의타입 3가지가 입력된다 -->
	      	
	      <!-- 	아래 코드 추가했는데 발생하는 오류
	      	Cannot invoke "org.apache.ibatis.session.SqlSessionFactory.openSession(boolean)" because "this.factory" is null 
	      		 -->
	      		
	      		<div class="csboard">
	      			<label>제목</label>
	      			<input class="form-control" name="cs_title">
	      		</div>
	      		
	      		<div  class="csboard">
	      			<label>문의내용</label>
	      			<textarea class="form-control" name="cs_content" rows="5" cols=""></textarea>
	      		</div>
	      		
	      		<!-- 문의유형 수정 필요 -->
	      		<!-- <div  class="csboard"> -->
	      		<div>
	      		문의유형 : <select id="cs_type" name="cs_type" class="form=control">
					<option value="이용문의">이용문의</option>
					<option value="예약취소">예약 및 취소문의</option>
					<option value="입점문의">입점문의</option>
					
			   </select> 
			   </div>
		   
		   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	      		
	      		
	      		<div style="text-align: center;"> 
	      			<input class="btn btn-info" type="button" value="문의하기"
	      					onclick="send(this.form)">
	      			
	      		</div>
	      		
	      </div>
		</div>
	
	</div>
</form>


</body>


</html>