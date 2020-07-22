<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 _ 쿠폰</title>
<style>
	.item{ width:100%; text-align:center;}
	#coupon_nv{margin:0 auto; width:80%; text-align: right; margin-bottom: 20px;}
	#coupon_nv #couponCreate{width:150px; height:50px; border:0; font-size:25px; font-weight:600; color:#2e4ead;}
	#coupon_nv #couponCreate:hover{color:white; background-color:#2e4ead;}
	.coupon{width: 49.5%; height: 150px; margin-bottom:10px; display:inline-block; border:1px solid black;}
	.coupon img{width:100%; height: 100%;}
	#coupon_area{width:100%; height: 500px;}
	#page_area{margin:0 auto; width:50%; text-align:center;}
	.page_btn{font-size:20px; margin-right:5px;}
</style>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

</head>
<body>
<jsp:include page="../common/systemAdminHeader.jsp"/>
<div class="wrapper">
	<div class="main_container">
		<div class="item"> 
			<div id="coupon_nv">
				<button id="couponCreate">쿠폰 만들기</button>
			</div>
			
			<div id="coupon_area">
				<c:forEach var="c" items="${couponList }">
					<div class="coupon">
						<c:url var="coupon_detail" value="couponDetail.do">
							<c:param name="coup_serial" value="${c.coup_serial }"/>
						</c:url>
						<a href="${coupon_detail }"><img src="resources/coupon/${c.coup_pic }" class="couponDetail" alt=""></a>
						
					</div>
				</c:forEach>
			</div>
			
			<div id="page_area">
				<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
					<c:if test="${p == pi.currentPage }">
						${p }
					</c:if>
					
					<c:if test="${p != pi.currentPage }">
						<c:url var="couponList" value="systemAdminCoupon.do">
							<c:param name="page" value="${p }"/>
						</c:url>
						<a href="${couponList }" class="page_btn">${p }</a>						
					</c:if>
					
				</c:forEach>
			</div>
		
		</div>
	</div>
</div>
</body>
<script>
$(function(){
	$("#coupon").children().addClass('active');
	
	$(".coupon").on("click",function(){
		
	})
	
	$("#couponCreate").on("click",function(){
		location.href="couponCreateView.do";
	})
	
	
	
})
</script>
</html>