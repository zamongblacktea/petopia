<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
     
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<!-- bootstrap 사용설정 3점대 --> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
	<h1 id="title">1:1 문의내역</h1>
		
<%-- 	<a href="list.do?mem_idx=${sessionScope.user.mem_idx}">1:1 문의 내역 보기</a> --%>
	<!-- forEach문 사용하려면 jstl 등록하기 -->
	<!-- for(CsboardVo vo) : list)  -->
	<c:forEach var="vo" items="${requestScope.list}">
	
	<!-- 글 하나의 항목을 패널로 생성 -->
	<!--   form class="form-inline"> form은 어딘가에 제출하는거니까 있을필요가 없음 -->
	<%-- 	<input type="hidden" name="mem_idx" value="${list }"> --%>

	
	<form method="get" action="csboard/list.do">
	
	 
	 <input type="hidden" name="mem_idx" value="${vo.mem_idx}">
		<div class="panel panel-primary">  
	      <div class="panel-heading"><h4><b>${vo.mem_name}</b>님의 문의제목:
	      ${vo.cs_title}
	      <!-- <div class="panel-body"> -->
	       <%--  <div class="mycsboard">${vo.cs_title}</div> --%>
	      
	      </h4></div>
	      
            <div class="mycsboard">${vo.cs_content}</div>
	      <%--   <div class="mycsboard">${list.cs_title}</div>
	      	<div class="mycsboard">${list.cs_content}</div> --%>
	      	
	      	</div>
		</div>
		</form>
		</c:forEach>  
	
  <!--  Object memIdxSession = session.getAttribute("user");
    if (memIdxSession == null) {
        out.println("<p style='color:red;'>세션에 user 정보가 없습니다!</p>");
    } else {
        out.println("<p style='color:green;'>세션에서 user.mem_idx: " + ((MemberVo) memIdxSession).getMem_idx() + "</p>"); -->
 
</body>
</html>