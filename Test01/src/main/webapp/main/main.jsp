<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>웹페이지 레이아웃</title>
<link rel="stylesheet" href="../css/main.css">
<script src="../js/main_bar.js"></script>
<!-- 부트스트랩 사용설정 3버전 --> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
<!-- SweetAlert2 설정 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> 

<style type="text/css">
#box{
	width: 1200px;
	margin: auto;
	margin-top: 50px;
}

#title{
text-align: center;
font-size: 28px;
font-weight: bold;
color: pink;

text-shadow: 1px 1px 2px black;
}

td{
vertical-align: middle; !important;
}
</style>


<script type="text/javascript">
function del(mem_idx){
	//삭제 확인?						(취소) 취소버튼을 누르면 return시켜라
	//if(confirm("정말 삭제 하시겠습니까?")==false) return;	
	
	Swal.fire({
	  title: "정말 삭제하시겠습니까??",
	  html:"<font color='red'> 삭제버튼 클릭시 회원정보가 삭제됩니다.</font>",
	  icon: "question",
	  showCancelButton: true,
	  confirmButtonColor: "#3085d6",
	  cancelButtonColor: "#d33",
	  confirmButtonText: "삭제!",
	  cancelButtonText: "취소!"
	  //then 삭제 또는 취소버튼을 누르면(이벤트발생_fire or then이라는 함수) json으로 값이 넙어온다
	}).then((result)=>{  //=>람다식
		if (result.isConfirmed) { //isConfirmed 확인
			//삭제처리			 delete.do?mem_idx=1	
			location.href = "../mypage/delete.do?mem_idx=" + mem_idx; //MemberDeleteAction
		}
	});
	
}
	
	
	
	
function fnClick(){
	
	
	
	
	//alert("11111");
	
	location.href="../rsv/connect.do";
	
	
	
}

function fnClick2(){
	
	
	
	
	//alert("11111");
	
	location.href="../rsv/connect2.do";
	
	
	
}

</script>

</head>

<body>

	<div class="nav-div">
		<%@include file="../nav/nav.jsp"%>
	
	
		<%-- <footer class="footer"> 
		<%@include file="../footer/footer.jsp"%>
		</footer> --%>
	</div>
	<%-- 
	   <!-- 로그인이 안되었을 경우(session에 user가 없냐?) -->
      <c:if test="${ empty sessionScope.user }">
	      <input class="btn btn-danger"  type="button" value="로그인" 
		            onclick="location.href='login_form.do'">
	  </c:if>  
	  
	  <!-- 로그인이 되어있을 경우(session에 user가 있냐?) -->
      <c:if test="${ not empty sessionScope.user }">
          <b>${ user.mem_name }</b>님 환영합니다
	      <input class="btn btn-primary"  type="button" value="로그아웃" 
		            onclick="location.href='logout.do'">
		                                                                   <!--idx 넘기기 -->
		   <input class="btn btn-primary"  type="button" value="내정보" 
		   
		            onclick="location.href='../mypage/member_modify_form.do?mem_idx=${user.mem_idx}'">       
	  </c:if> --%>    
	  
	<div class="header">
	
	
	<%@ include file="../rsv/bar.jsp" %>
	</div>
	
	<div class="content">
	 
	<div class="local">

	<%@ include file="../rsv/location_list.jsp" %>
	
	</div>
	<div class="lowprice">
	<%@ include file="../rsv/rsv_lowPrice.jsp" %>
	
	
	</div>
	<div class="news">
		<%@ include file="../news/main_news.jsp" %>
	</div>	
	
	</div>
	
	<div class="footer">
	
	<div class="footer-box"> 
	<p>주식회사 펫토피아 ｜ 공동대표 !Err404 박태섭 안소현 남가은 ｜ 서울특별시 관악구 청룡동 862-1 | http://www.gith.co.kr/</p>
	<p>고객센터: 02-6020-0052 (평일 오전 9시 ~ 오후 6시)</p>
	<p>Petopia는 통신판매중개자로서 통신판매의 당사자가 아니며 상품 거래정보 및 거래 등에 대해 책임을 지지 않습니다.</p>
	<p>이용약관전자금거래 이용약관개인정보 처리방침</p>
	
	</div>
	
	</div>
</body>

</html>