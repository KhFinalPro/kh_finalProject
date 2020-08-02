<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#coupon_area{margin: 0 auto; margin-top: 200px; width: 70%; text-align: center;}
	#coupon_area_title{margin: 0; width: 100%; height: 50px; line-height: 50px; text-align: center; font-size: 40px; font-weight: 600;}
	/* #coupon_area .coupon{width: 1000px; height: 300px; margin-bottom: 10px; background-image: url("../workspace/images/coupon1.png");} */
	#coupon_area .coupon{width: 1000px; height: 100%; margin-bottom: 10px;}
	#coupon_area .coupon img{border-radius: 20px; transition: box-shadow 0.5s;}
	#coupon_area .coupon img:hover{border-radius: 20px; box-shadow: 7px 7px 7px #2ca494;}
	#coupon_area .coupon .create_date{margin: 0; margin-top: 10px; text-align: right; font-size: 20px; font-weight: 600; color: black;}
	#coupon_area .coupon ul{bottom: 10px;}
	#coupon_area .coupon .coup_term{text-align: right; margin-right: 10px; font-size: 20px; font-weight: 600; color: black;}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/sidebar.jsp" %>
	
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>