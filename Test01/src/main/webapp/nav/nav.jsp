<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 부트스트랩 사용설정 3버전 -->
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<link rel="stylesheet" href="../css/nav.css">

<style>
 #logo{
 width: 350px;
 height: 100px;
 padding-left: 30px;
 }

.logo{

 /* margin-right: 90%; */
}


  

 .mymenu{
    height: 100px;
    text-align: right;
    /* vertical-align: bottom !important; */
    padding-top: 70px;
    padding-right: 40px;
    padding-bottom: 20px;
 }
 
 a,span{
   display: inline-block;
 }
 
</style>

 

 
 
</head>
<body>
  
  <nav class="main_nav">
    <!-- <ul>
      <li class="logo"><img src="../image/펫토피아 메인 투명.png"></li>
      <li  onclick="location.href='../member/login_form.do'"><span class="nav-span">로그인</span></li>
      <li  onclick="location.href='../member/join_form.do'"><span class="nav-span">회원가입</span></li>
    </ul> -->
	<div class="row">
		<div class="col-sm-6" onclick="location.href='../main/main.do'">
		    <img id="logo" src="../image/펫토피아 메인 투명.png">
		</div>
		<div class="col-sm-6 mymenu ">
		    <a href="../member/login_form.do"><span class="nav-span">로그인</span></a>&nbsp;&nbsp;
		    <a href="../member/join_form.do"><span class="nav-span">회원가입</span></a>
		</div>
	</div>


	</nav>
  
  
</body>
</html>