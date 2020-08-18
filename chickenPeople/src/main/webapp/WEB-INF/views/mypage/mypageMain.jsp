<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
           
	    body, hmtl{font-family: 'Anton', sans-serif;}
	    #myPage{margin: 0 auto; width: 90%; margin-top: 150px; text-align:center;}
	    #myPage>p{font-size:25px; font-weight:600; color: #735949; box-shadow: 0px 5px 5px rgb(226, 226, 226); height:40px; line-height:40px;}
	    #myPage_nav{margin:0 auto; width: 100%; text-align: center;}
	    .myPage_item{float:left; width:22%; margin: 24px;; height:250px; margin-bottom:100px;  border-radius: 130px;}
	    .myPage_item div{margin: 0 auto; width:50%; height:200px; border: 1px solid black; border-radius: 130px; box-shadow: 0px 10px 10px rgb(226, 226, 226);}
	    .myPage_item div img{width: 60%; height: 60%; margin-top:45px;}
	    .myPage_item p{font-size:20px; font-weight:600;}

	</style>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>
</head>
<body>
	<input type="hidden" id="id" value="${sessionScope.loginUser.id }">
	<jsp:include page="../common/header.jsp"/>
	
	<section id="myPage">
		<p>My치민</p>
	    <div id="myPage_nav">
	        <div class="myPage_item" id="member">
	            <div>
	                <img src="resources/images/myPage_me.png" alt="">
	            </div>
	            <p>회원정보</p>
	        </div>
	        <div class="myPage_item" id="my_address">
	            <div>
	                <img src="resources/images/myPage_address.png" alt="">
	            </div>
	            <p>주소지변경</p>
	        </div>
	        <div class="myPage_item" id="coupMe">
	            <div>
	                <img src="resources/images/myPage_coupMe.png" alt="">
	            </div>
	            <p>쿠폰</p>
	        </div>
	        <div class="myPage_item" id="coup">
	            <div>
	                <img src="resources/images/myPage_coup.png" alt="">
	            </div>
	            <p>쿠폰 받아가기</p>
	        </div>
	        <div class="myPage_item" id="orderStatus">
	            <div>
	                <img src="resources/images/myPage_order.png" alt="">
	            </div>
	            <p>주문현황</p>
	        </div>
	        <div class="myPage_item" id="review">
	            <div>
	                <img src="resources/images/myPage_review.png" alt="">
	            </div>
	            <p>주문달력⊙리뷰</p>
	        </div>
	        <div class="myPage_item" id="my_message">
	            <div>
	                <img src="resources/images/myPage_message.png" alt="">
	            </div>
	            <p>메세지</p>
	        </div>
	        <div class="myPage_item" id="good">
	            <div>
	                <img src="resources/images/myPage_good.png" alt="">
	            </div>
	            <p>찜한매장⊙글</p>
	        </div>
	        <div class="myPage_item" id="bung">
	            <div>
	                <img src="resources/images/hBung.png" alt="">
	            </div>
	            <p>번개</p>
	        </div>
	        <div class="myPage_item" id="myPage_mat">
	            <div>
	                <img src="resources/images/mat.png" alt="">
	            </div>
	            <p>맛잘알</p>
	        </div>
	        <div class="myPage_item" id="myPage_notice">
	            <div>
	                <img src="resources/images/myPage_notice.png" alt="">
	            </div>
	            <p>공지사항</p>
	        </div>
	        <div class="myPage_item" id="myPage_chatting">
	            <div>
	                <img src="resources/images/chatting.png" alt="">
	            </div>
	            <p>1:1 문의</p>
	        </div>
	    </div>
	</section>
	
	<br clear="both">
	<jsp:include page="../common/footer.jsp"/>
</body>
<script>
	$(function(){
		$("#member").on("click",function(){
			$id = $("#id").val();
			location.href="mypageInfo.do?id="+$id;
		})
		
		$("#my_address").on("click",function(){
			
		})
		
		$("#coupMe").on("click",function(){
			$id = $("#id").val();
			location.href="myCoupon.do?id="+$id;
		})
		
		$("#coup").on("click",function(){
			$id = $("#id").val();
			location.href="couponAccept.do?id="+$id;
		})
		
		$("#orderStatus").on("click",function(){
			$id = $("#id").val();
			location.href="orderStatus.do?id="+$id;
		})
		
		$("#review").on("click",function(){
			location.href="calender.do";
		})
		
		$("#my_message").on("click",function(){
			location.href="msgList.do";
		})
		
		$("#good").on("click",function(){
			location.href="storeLikeList.do";
		})
		
		$("#bung").on("click",function(){
			$id = $("#id").val();
			location.href="myBung.do?id="+$id;
		})
		$("#myPage_mat").on("click",function(){
			$id = $("#id").val();
			location.href="myBoardList.do?bWriter="+$id;
		})
		$("#myPage_notice").on("click",function(){
			$id = $("#id").val();
			location.href="nList.do";
		})
		$("#myPage_chatting").on("click",function(){
			var loginUser="<c:out value='${loginUser.id}'/>";
    		window.open("chatting.do?loginUserName="+loginUser,"","width=400, height=600","menubar=1","status=0");
		})
	})
	
</script>
</html>