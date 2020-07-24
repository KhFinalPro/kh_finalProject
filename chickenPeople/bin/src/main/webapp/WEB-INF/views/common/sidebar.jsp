<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		#mypage_nav{margin-top:200px}
		    .mypageTitle{
            text-align: center;
            margin-top: 120px;
        }
        body{
            font-family: 'Montserrat', sans-serif; ;
           
        }
        nav{
            border-radius: 10px;
            position:relative;
            margin:0 auto 0;
          
            width: 840px;
            height: 50px;
            background:lightgrey;
            box-shadow: 0 2px 3px 0 rgba(0,0,0,.1);
        }
        nav a{
            font-weight: bold;
            font-size: 13px;
            color: white;
            text-decoration: none;
            line-height: 50px;
            position:relative;
            z-index: 1;
            display: inline-block;
            text-align: center;
        }
        nav .animation{
            position:absolute;
            height:100%;
            top:0;
            z-index: 0;
            background:#1abc9c;
            width:100px;
            border-radius: 10px;
            transition: all .2s ease 0s;
        }

        a:nth-child(1){
            width:115px;
        }
        nav .start-home,a:nth-child(1):hover~.animation{
            width:115px;
            left:0px;
        }

        a:nth-child(2){
            width:115px;
        }

        nav .start-home,a:nth-child(2):hover~.animation{
            width:115px;
            left:115px;
        }

        a:nth-child(3){
            width:115px;
        }

        nav .start-home,a:nth-child(3):hover~.animation{
            width:115px;
            left:240px;
        }

        a:nth-child(4){
            width:115px;
        }

        nav .start-home,a:nth-child(4):hover~.animation{
            width:115px;
            left:360px;
        }
        a:nth-child(5){
            width:115px;
        }

        nav .start-home,a:nth-child(5):hover~.animation{
            width:115px;
            left:483px;
        }
        a:nth-child(6){
            width:115px;
        }

        nav .start-home,a:nth-child(6):hover~.animation{
            width:115px;
            left:602px;
        }
        a:nth-child(7){
            width:115px;
        }
        nav .start-home,a:nth-child(7):hover~.animation{
            width:115px;
            left:724px;
        }
	</style>
</head>
<body>
<div id="mypage_nav">
	<div class="mypageTitle"><h2>MY PAGE</h2></div>
	    <nav>
	        <a href="#">회원정보</a>
	        <a href="#">포인트</a>
	        <a href="#">주문현황</a>
	        <a href="#">주문달력/리뷰</a>
	        <a href="msgList.do">메세지</a>
	        <a href="storeLikeList.do">찜한매장/글</a>
	        <a href="#">번개</a>
	        <div class="animation start-home"></div>
	    </nav>
</div>
</body>
</html>