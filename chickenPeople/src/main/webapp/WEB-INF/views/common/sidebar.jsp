<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		#side_nav{position: absolute; top: 250px; left: 50px; z-index: 0;}
		#side_nav_table{width: 200px;}
		#side_nav_table tr th{text-align: center; font-size: 30px; border-top: 3px solid #735949; border-bottom: 3px solid #735949; color: #735949;}
		#side_nav_table tr td{text-align: center; height: 30px;}
		#side_nav_table tr td>a{text-decoration: none; color: #2ac1bc; font-size: 20px; font-weight: 600; line-height: 30px; display: block;}
		#side_nav_table tr td>a:hover{color: white; background-color: #2ac1bc;}
	</style>
</head>
<body>
<div class="mypageTitle"><h2>MY PAGE</h2></div>
    <nav>
        <a href="#">회원정보</a>
        <a href="#">포인트</a>
        <a href="#">주문현황</a>
        <a href="#">주문달력/리뷰</a>
        <a href="#">메세지</a>
        <a href="#">찜한가게/글</a>
        <a href="#">1:1 문의</a>
        <div class="animation start-home"></div>
    </nav>
</body>
</html>