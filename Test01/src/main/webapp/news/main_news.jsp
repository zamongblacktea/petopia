<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/main_news.css">

</head>
<body>
	<div class="main_news_div_btn shadow"
		onclick="location.href='../news/list_form.do?query=' + encodeURIComponent('반려동물')">
		<img alt="반려동물" class="main_news_btn_img"
			src="${ pageContext.request.contextPath }/resources/image/main_animal.jpg">
	</div>

	<div class="main_news_div_btn shadow" onclick="location.href='../news/list_form.do?query=' + encodeURIComponent('강아지')">
		<img alt="강아지" class="main_news_btn_img"
			src="${ pageContext.request.contextPath }/resources/image/main_dog.jpg">
	</div>

	<div class="main_news_div_btn shadow" onclick="location.href='../news/list_form.do?query=' + encodeURIComponent('고양이')">
		<img alt="고양이" class="main_news_btn_img"
			src="${ pageContext.request.contextPath }/resources/image/main_cat.jpg">
	</div>

	<div class="main_news_div_btn shadow" onclick="location.href='../news/list_form.do?query=' + encodeURIComponent('반려동물행사')">
		<img alt="반려동물행사" class="main_news_btn_img"
			src="${ pageContext.request.contextPath }/resources/image/main_festival.jpg">
	</div>



</body>
</html>