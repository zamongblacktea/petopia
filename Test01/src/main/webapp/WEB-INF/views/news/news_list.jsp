<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>웹 레이아웃</title>
</head>
<body>
	<c:forEach var="vo" items="${list}" varStatus="i">
		<div class="article" onclick="location.href='${vo.link}'">
			<a href="${vo.title}" target="blank">${vo.title}</a> <br>
			${vo.content}<br>
			<span>${vo.date}</span>
		</div>
	</c:forEach>


</body>
</html>
