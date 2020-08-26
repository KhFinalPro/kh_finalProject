<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 _ 쿠폰</title>
<style>

	.item {background: #fff; margin-bottom: 10px; padding: 15px; font-size: 14px; height: 873px; border-bottom-right-radius: 20px;justify-content: center; align-items: center; margin-top: -30px; }
	#coupon_nv{margin:0 auto; width:80%; text-align: right; margin-bottom: 20px;}
	#coupon_nv #couponCreate {position:fixed; top:100px; right:50px; width:150px; height:50px; border:0; font-size:25px; font-weight:600; color:#2ac1bc;}
	#coupon_nv #couponCreate:hover{color:white; background-color:#2ac1bc;}
	.coupon{width: 49.5%; height: 150px; margin-bottom:10px; display:inline-block;}
	.coupon img{width:100%; height: 200px; border-radius:20px; border:1px solid black;}
	#coupon_area{margin:0 auto; width:90%; height: 500px; text-align:center; margin-top:-40px;}
	#page_area{position:fixed; top:880px; left:28.5%; margin:0 auto; width:50%; text-align:center; font-size:30px; font-weight:600; margin-right:5px;}
	.page_btn{font-size:30px; font-weight:600; margin-right:5px;}
	
	.couponHeader{margin:0 auto; width:90%; margin-top:50px;}
	#couponCreate{margin-right:70px;}
	button{border:2px solid #2ac1bc; background-color:white; color:#2ac1bc; padding:5px; font-weight:bold}
	
</style>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

</head>
<body>
<jsp:include page="../common/systemAdminHeader.jsp"/>
<div class="wrapper">
	<div class="main_container">
		<div class="item"> 
			<div class="couponHeader">
				<p style="font-size:30px;">쿠폰발행</p>
				<br><hr><br>
			</div><!-- couponHeader end -->
			
			<div id="coupon_nv">
				<button id="couponCreate">쿠폰 생성</button>
			</div>
			<br clear="both"><br><br>
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