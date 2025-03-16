<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>인기 여행지 캐러셀</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
        #travelCarousel{
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
    <h2 class="fw-bold">인기 여행지</h2>
    <p class="text-muted">고객분들이 가장 많이 찾는 여행지를 알아보세요</p>

    <div id="travelCarousel" class="carousel slide" data-bs-ride="false">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="row">
                    <div class="col"><img src="../image/경주.png" class="d-block" onclick="location.href='../rsv/list.do?mem_idx=${sessionScope.user.mem_idx}&search_text=경주'">경주</div>
                    <div class="col"><img src="../image/강릉.png" class="d-block" onclick="location.href='../rsv/list.do?mem_idx=${sessionScope.user.mem_idx}&search_text=강릉'">강릉</div>
                    <div class="col"><img src="../image/부산.png" class="d-block " onclick="location.href='../rsv/list.do?mem_idx=${sessionScope.user.mem_idx}&search_text=부산'">부산</div>                  
                    <div class="col"><img src="../image/경기도.png" class="d-block " onclick="location.href='../rsv/list.do?mem_idx=${sessionScope.user.mem_idx}&search_text=경기도'" >경기도</div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="row">
                    <div class="col"><img src="../image/강원.png" class="d-block " onclick="location.href='../rsv/list.do?mem_idx=${sessionScope.user.mem_idx}&search_text=강원'" >강원</div>
                    <div class="col"><img src="../image/양평.png" class="d-block " onclick="location.href='../rsv/list.do?mem_idx=${sessionScope.user.mem_idx}&search_text=양평'" >양평</div>
                    <div class="col"><img src="../image/제주.png" class="d-block " onclick="location.href='../rsv/list.do?mem_idx=${sessionScope.user.mem_idx}&search_text=제주'" >제주</div>
                    <div class="col"><img src="../image/가평.png" class="d-block " onclick="location.href='../rsv/list.do?mem_idx=${sessionScope.user.mem_idx}&search_text=가평'" >가평</div>
                </div>
            </div>
        </div>

        <!-- 이전 버튼 -->
        <button class="carousel-control-prev custom-btn" type="button" data-bs-target="#travelCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        </button>

        <!-- 다음 버튼 -->
        <button class="carousel-control-next custom-btn" type="button" data-bs-target="#travelCarousel" data-bs-slide="next">
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
