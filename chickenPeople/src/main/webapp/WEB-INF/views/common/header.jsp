<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		header{ position: fixed; top: 0px; left: 0px; width: 100%; margin: 0; padding: 0; z-index: 1;}
		#header{margin: auto; width: 100%; height: 100px; background-color: #2ac1bc;}
		#header>div{ display: inline-block;}
		
		#header_brandName{width: 15%; height: 100%; text-align: center; vertical-align: middle;}
		#header_brandName #brandName{margin: 0;}
		#header_brandName #brandName a{color: white; text-decoration: none;}
		#header_brandName #brandName a:hover{color: black;}
		
		#header_address{width: 63%; height: 100%; text-align: center; vertical-align: middle;}
		#header_address #address{width: 50%; height: 50px; border-radius: 20px;}
		
		#header_userArea{width: 20%; height: 80%;}
		#header_userArea ul {margin: 0 auto; padding: 0;}
		#header_userArea ul li{margin: auto; width: 19%; list-style: none; background-color: #2ac1bc; float: left; line-height: 100px; vertical-align: middle; text-align: center;}
		#header_userArea ul li a{margin: auto; width: 100%; text-decoration: none; color: white; display: block; font-size: 18px; font-weight: bold;}
		#header_userArea ul li a:hover{color:black;}
		
		#header_nav {height: 80px; margin: auto; width: 100%;}
		#header_nav ul{margin: 0 auto; padding: 0;}
		#header_nav ul li{margin: auto; width: 25%; list-style: none; color: white; background-color: #2ac1bc; float: left; line-height: 80px; vertical-align: middle; text-align: center;}
		#header_nav ul li a{margin: auto; width: 100%; text-decoration: none; color: white; display: block; font-size: 20px; font-weight: bold;}
		#header_nav ul li a:hover{color: black;}
	
	           
	</style>
</head>
<body>
	<header>
	    <div id="header">
	        <div id="header_brandName">
	            <h1 id="brandName"><a href="#">치킨의민족</a></h1>
	        </div>
	        <div id="header_address">
	            <select name="address" id="address">
	                <option value="서울특별시 구로구 가마산로 231 보광아파트 6동 404호">서울특별시 구로구 가마산로 231 보광아파트 6동 404호</option>
	                <option value="서울특별시 구로구 가마산로 231 보광아파트 6동 404호">서울특별시 구로구 가마산로 231 보광아파트 5동 401호</option>
	            </select>
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
	
	    <div id="header_nav">
	        <ul>
	            <li>
	                <a href="#">딜리버리</a>
	            </li>
	            <li>
	                <a href="#">치킨번개</a>
	            </li>
	            <li>
	                <a href="#">맛잘알</a>
	            </li>
	            <li>
	                <a href="#">공지사항</a>
	            </li>
	        </ul>
	
	    </div>
	    <br clear="both">
	</header>
</body>
</html>