<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>    
    
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
 
  .mymenu{
    height: 100px;
    text-align: right;
    /* vertical-align: bottom !important; */
    padding-top: 70px;
    padding-right: 20px;
    padding-bottom: 13px;
 }
  a,span{
   display: inline-block;
 }
 
  img{
  height: 100px;
  width: 350px;
  
  }
 </style>
</head>
<body>
  <nav class="main_nav">
   <!--  <ul> -->
	  <div class="row">
		<div class="col-sm-6" onclick="location.href='../main/main.do'">
		    <img src="../image/펫토피아 메인 투명.png">
		</div>
		  
		
	<div class="col-sm-6 mymenu ">
		
		  <!-- 로그인이 안되었을 경우(session에 user가 없냐?) -->
      <c:if test="${ empty sessionScope.user }">
	     
	  </c:if>  
	  
	  <!-- 로그인이 되어있을 경우(session에 user가 있냐?) -->
      <c:if test="${ not empty sessionScope.user }">
          <b>${ user.mem_name }</b>님 환영합니다&nbsp;&nbsp;&nbsp;&nbsp;
	     
	  </c:if>
	 
	  	<a href="logout.do"><span class="nav-span">로그아웃</span></a>&nbsp;&nbsp;&nbsp;&nbsp;
	   	<a href="../mypage/member_modify_form.do?mem_idx=${user.mem_idx}"><span class="nav-span">내정보</span></a>&nbsp;&nbsp;&nbsp;&nbsp;
    	<a href="../csboard/list.do?mem_idx=${user.mem_idx}"><span class="nav-span">1:1문의</span></a>&nbsp;&nbsp;&nbsp;&nbsp;
 		 <a href="../csboard/list.do?mem_idx=${user.mem_idx}"><span class="nav-span">숙소예약</span></a>&nbsp;&nbsp;&nbsp;&nbsp;
 		
 		
 		<%-- 
 		<li onclick="location.href='logout.do'" ><span class="nav-span">로그아웃</span></li>
 		 <li onclick="location.href='../mypage/member_modify_form.do?mem_idx=${user.mem_idx}'"><span class="nav-span">내정보</span></li>
 		<li onclick="location.href='logout.do'" ><span class="nav-span">숙소예약</span></li> 
  		<li onclick="location.href='../csboard/list.do?mem_idx=${user.mem_idx}'"><span class="nav-span">1:1문의</span>
  		<li onclick="location.href='../csboard/insert_form.do'"><span class="nav-span">1:1문의</span> --%>
  		</div>
  		</div>
  
  		</nav>
 <!--    </ul> -->
 
</body>
</html>