<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
	section{margin-top:200px;}
	#main_area{margin:0 auto; width:80%; text-align:center;}
	#main_area>h1{font-size:40px; color:#735949;}
	
	#main_area>.title{font-size:25px; font-weight:600; color:#735949;}
	#main_area>#ord_num{font-size:30px; font-weight:600; color:#2CBFB1;}
	#main_area>#address{font-size:30px; font-weight:600; color:#2CBFB1;}
	
	#main_area>button{margin-top:30px; width:200px; height:50px; font-size:25px; font-weight:600;}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<input type="hidden" id="id" value="${sessionScope.loginUser.id }">
	<section>
		<div id="main_area">
			<h1>주문완료</h1>
			<a class="title">주문번호 : </a><span id="ord_num">${payInfo.ord_num }</span><br>
			<a class="title">배달 주소 : </a><span id="address">${payInfo.pay_addr }</span><br>
			<a class="title">결제 시간 : </a><span id="address">${payInfo.pay_date }</span><br>
			<a class="title">받는사람 : </a><span id="address">${payInfo.pay_rcv }</span><br>
			<a class="title">메세지 : </a><span id="address">${payInfo.pay_msg }</span><br>
			<br>
			<button id="home" style="margin-right:10px;">메인화면</button><button id="orderStatus" style="margin-left:10px;">배달현황</button>
		</div>
	</section>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
<script>
	$(function(){
		$(document).on("click","#home",function(){
			location.href="home.do";
		})
		
		$(document).on("click","#orderStatus",function(){
			location.href="orderStatus.do?id="+$("#id").val();
		})
		
	})
</script>
</html>