<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="../js/main_bar.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <style>
        .carousel-item {
            text-align: center;
        }

        .custom-btn {
        	margin-top:80px;
            background-color: white !important;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 1 !important;
            border: none;
        }

        .carousel-control-prev-icon,
        .carousel-control-next-icon {
            filter: invert(100%);
        }

        .carousel-control-prev {
            left: -60px;
        }

        .carousel-control-next {
            right: -60px;
        }
        #travelCarousel2{
        width: 99%;
        height: 210px;
        
        
        
        
        }
        
        .d-block{
		margin:auto;
        width: 200px;
        height: 200px;
        border-radius: 15px;
        
        
        }
        
        .col{
        width:24%
		margin-left: 40px;
		margin:auto;
		text-align: center;
		align-content: center;
		justify-content: center;

        
        
        
        }
    </style>
</head>
<body>

<div class="container mt-7">
    <h2 class="fw-bold">핫딜 특가</h2>
    <p class="text-muted">싸게싸게 가려면 지금이 기회!</p>

    <div id="travelCarousel2" class="carousel slide" data-bs-ride="false">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="row">
                	<c:forEach var="vo" begin="0" end="4" items="${ price }">
                    <div class="col" onclick="location.href='../rsv/viewlist.do?mem_idx=${sessionScope.user.mem_idx}&acom_idx=${vo.acom_idx}&room_idx=${vo.room_idx }'">
                    <img src="${vo.acom_img }" class="d-block" >
                    <div>${vo.acom_name }</div> 
                    <div>${vo.acom_addr }</div> 
                    <div><fmt:formatNumber value="${vo.room_price }" type="number" pattern="#,###" />
					원</div> 
                    </div>

					</c:forEach>
                </div>
            </div>

        </div>

        <!-- 이전 버튼 -->
        <button class="carousel-control-prev custom-btn" type="button" data-bs-target="#travelCarousel2" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        </button>

        <!-- 다음 버튼 -->
        <button class="carousel-control-next custom-btn" type="button" data-bs-target="#travelCarousel2" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
        </button>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        let carousel = new bootstrap.Carousel(document.getElementById("travelCarousel"), {
            interval: false
        });
    });
</script>

</body>
</html>