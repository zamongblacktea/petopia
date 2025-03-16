<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>

        .filter-container {
            background: white;
            padding: 20px;
            border-radius: 15px;
            margin-left: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 96%;
            margin-top:10px;
            height: 100%;
        }
        .filter-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .filter-group {
            margin-bottom: 20px;
        }
        .range-container input {
            width: 100%;
        }
        .text-checkbox {
            display: flex;
            gap: 15px;
        }
        .text-checkbox label {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 80px;
            height: 40px;
            background: rgba(0, 0, 0, 0.1);
            border-radius: 20px;
            cursor: pointer;
            transition: 0.3s;
            font-size: 14px;
            font-weight: bold;
            color: #333;
            text-transform: uppercase;
        }
        .text-checkbox label:hover {
            background: rgba(0, 123, 255, 0.5);
            color: white;
        }
        .text-checkbox input {
            display: none;
        }
        .text-checkbox input:checked + label {
            background: #007bff;
            color: white;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }
        .apply-button {
            background: #007bff;
            color: white;
            padding: 10px;
            border: none;
            width: 30%;
            border-radius: 15px;
            cursor: pointer;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <div class="filter-container">
        <div class="filter-title">필터</div>
        <hr style="border: 1px solid black;">
        <!-- 가격 필터 -->
        <form action="">
        <div class="filter-group">
            <h3>가격 범위</h3>
            <div class="range-container">
                <input type="range" id="priceRange" min="10000" max="500000" step="1000" value="100000" oninput="updatePriceValue()">
            </div>
            <div id="priceValue">100,000원</div>
        </div>
        
        <!-- 편의시설 필터 (심플한 반투명 글자형 버튼) -->
        <div class="filter-group text-checkbox">
            <input type="checkbox" id="roominternet"><label for="roominternet">WiFi</label>
            <input type="checkbox" id="roomtv"><label for="roomtv">TV</label>
            <input type="checkbox" id="roompc"><label for="roompc">PC</label>
            <input type="checkbox" id="roomcook"><label for="roomcook">취사</label>
        </div>
        <div class="filter-group text-checkbox">
            <input type="checkbox" id="roomaircondition"><label for="roomaircondition">에어컨</label>
            <input type="checkbox" id="roomhometheater"><label for="roomhometheater">프로젝터</label>
            <input type="checkbox" id="roombath"><label for="roombath">욕조</label>
            <input type="checkbox" id="roombathfacility"><label for="roombathfacility">스파</label>
        </div>
        
        <button class="search-btn" onclick="applyFilters(this.form)">필터 적용</button>
        </form>
    </div>
	
    <script>
        function updatePriceValue() {
            let price = document.getElementById("priceRange").value;
            document.getElementById("priceValue").innerText = parseInt(price).toLocaleString() + "원";
        }

        function applyFilters(f) {
            let price 			= f.priceRange.value;
            let roominternet 	= f.roominternet.value.checked;
            let roomtv 			= f.roomtv.value.checked;
            let roompc 			= f.roompc.value.checked;
            let roomcook 		= f.roompc.value.checked;
            let roomaircondition= f.roompc.value.checked;
            let roomhometheater = f.roompc.value.checked;
            let roombath 		= f.roompc.value.checked;
            let roombathfacility= f.roompc.value.checked;
            
            let filters = {
                price: parseInt(price),
                roominternet: roominternet,
                internet: internet,
                roomtv: roomtvtv,
                roompc: roompc,
                roomcook: roomcook,
                roomaircondition: roomaircondition,
                roomhometheater: roomhometheater,
                roombath: roombath,
                roombathfacility:roombathfacility,
            };
            
            f.action="list.do?search=" + search + "&search_text="
			+ encodeURIComponent(search_text, "utf-8") + "&rsv_in="
			+ rsv_in + "&rsv_out=" + rsv_out + "&mem_idx=" + mem_idx
			+ "&room_type=" + room_type + "&pet_type=" + pet_type; "&amen="
            f.submit();

        }
    </script>
</body>
</html>
