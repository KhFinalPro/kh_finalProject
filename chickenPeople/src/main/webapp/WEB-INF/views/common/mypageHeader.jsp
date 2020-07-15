<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
<title>Insert title here</title>
	<style>
		header{ position: fixed; top: 0px; left: 0px; width: 100%; margin: 0; padding: 0; z-index: 1;}
		#header{margin: auto; width: 100%; height: 100px; background-color: #2ac1bc;}
		#header>div{ display: inline-block;}
		
		#header_brandName{width: 15%; height: 100%; text-align: center; vertical-align: middle;}
		#header_brandName #brandName{margin: 0;}
		#header_brandName #brandName a{color: white; text-decoration: none;}
		#header_brandName #brandName a:hover{color: black;}
		
	
		
		#header_userArea{float: right; width: 20%; height: 80%;}
		#header_userArea ul {margin: 0 auto; padding: 0;}
		#header_userArea ul li{margin: auto; width: 19%; list-style: none; background-color: #2ac1bc; float: left; line-height: 100px; vertical-align: middle; text-align: center;}
		#header_userArea ul li a{margin: auto; width: 100%; text-decoration: none; color: white; display: block; font-size: 18px; font-weight: bold;}
		#header_userArea ul li a:hover{color:black;}
		
		#header_nav {height: 80px; margin: auto; width: 100%;}
		#header_nav ul{margin: 0 auto; padding: 0;}
		#header_nav ul li{margin: auto; width: 25%; list-style: none; color: white; background-color: #2ac1bc; float: left; line-height: 80px; vertical-align: middle; text-align: center;}
		#header_nav ul li a{margin: auto; width: 100%; text-decoration: none; color: white; display: block; font-size: 20px; font-weight: bold;}
		#header_nav ul li a:hover{color: black;}


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
	<header>
	    <div id="header">
	        <div id="header_brandName">
	            <h1 id="brandName"><a href="#">치킨의민족</a></h1>
	        </div>
	        <div id="header_userArea">
	            <ul>
	                <li><a href="#">Join</a></li>
	                <li><a href="#">Login </a></li>
	                <li><a href="msgList.do">MyPage</a></li>
					<li><a href="storeOrder.do">store</a><li>
	                <li><a href="#">System</a>
	            </ul>
	        </div>
	        <br clear="both">
	    </div>
	    <br clear="both">
	</header>
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
</body>

	
</body>
</html>
</body>
</html>