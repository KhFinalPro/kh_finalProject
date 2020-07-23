<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		 header{ position: fixed; top: 0px; left: 0px; width: 100%; margin: 0; padding: 0; z-index: 6;}
            #header{margin: auto; width: 100%; height: 100px; background-color: #2ac1bc;}
            #header>div{ display: inline-block;}

            #header_brandName{width: 15%; height: 100%; text-align: center; vertical-align: middle;}
            #header_brandName #brandName{margin: 0;}
            #header_brandName #brandName a{color: white; text-decoration: none;}
            #header_brandName #brandName a:hover{color: black;}

            #header_address{width: 74%; height: 100%; text-align: center; vertical-align: middle;}
            #header_address #address{width: 50%; height: 50px; border-radius: 20px;}


            #header_userArea{width: 10%; height: 80%;}
            #header_userArea ul {list-style-type: none; height: 40px; padding: 0; margin: 0;}
            #header_userArea ul li{float: left; position: relative; padding: 0; line-height: 50px;}
            #header_userArea ul li img{width: 50px; height: 50px; margin-top: 20px;}
            #header_userArea ul li ul{opacity: 0; position: absolute; left: 0; list-style-type: none; padding: 0; margin: 0;}
            #header_userArea ul li:hover ul{opacity: 1;}
            #header_userArea ul li ul li{float: none; position: static; height: 0px; line-height: 0; background: none; width: 100px;}
            #header_userArea ul li:hover ul li{width: 100px; height: 30px; line-height: 30px; padding:5px 0;}
            #header_userArea ul li ul li a{text-decoration: none; text-align: center; font-weight:600; font-size:25px; color:black; width: 100px;}
            #header_userArea ul li ul li a:hover{color:black;}

            #header_nav {height: 80px; margin: auto; width: 100%;}
            #header_nav ul{margin: 0 auto; padding: 0;}
            #header_nav ul li{margin: auto; width: 25%; list-style: none; color: white; background-color: #2ac1bc; float: left; line-height: 80px; vertical-align: middle; text-align: center;}
            
            #header_nav ul li a{margin: auto; width: 100%; text-decoration: none; color: white; display: block; width: 150px; font-size: 30px; font-weight: bold;}
            #header_nav ul li a:hover{color: black;}

            #modal{position: fixed; display: none; opacity: 0.9; left: 0; top: 0px; width: 100%; height: 100%; text-align: center; background-color: rgb(199, 197, 197); border: 1px solid black; z-index: 2;}
            #modal #search_cancel{margin-right: 0px; margin-left: 1800px; margin-top: 200px; width: 70px; height: 70px;}
            #modal #search_input{margin: auto; width: 50%; height: 60px; margin-top: 100px; border:2px solid black;}
            #modal #submit{height: 60px; width: 100px; opacity: 1; font-size: 15px; font-weight: 600; border:2px solid black;}
        	#modal #search_category{height: 60px;}
        </style>
        <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>

	<body>
		<header>

            <div id="header">
                <div id="header_brandName">
                    <h1 id="brandName"><a href="home.do">치킨의민족</a></h1>
                </div>
                <div id="header_address">
                    <select name="address" id="address">
                    	<c:if test="${!empty sessionScope.loginUser }">
                    		<c:forEach var="addr" items="${sessionScope.address }">
		                        <option value="${addr.address }">${addr.address }</option>
                        	</c:forEach>
                        </c:if>
                        <c:if test="${empty sessionScope.loginUser }">
                        	<option value=""></option>
                        </c:if>
                    </select>
                </div>
                <div id="header_userArea">
                    <ul>
                        <li>
                            <img id="search" src="resources/images/search.png" alt="">
                        </li>
                        <li>
                            <img src="resources/images/user.png" alt="">
                            
                            <ul>
								<c:if test="${empty sessionScope.loginUser}">
									<li><a href="memberJoinView.do">Join </a></li>
                                	<li><a href="loginView.do">Login </a></li>
                                </c:if>
                                
                                <c:if test="${!empty sessionScope.loginUser}">
                                	<li><a href="logoutView.do">Logout </a></li>
	                                <li><a href="msgList.do">MyPage</a></li>
	                                <li><a href="storeOrder.do">Store</a></li>
	                                <c:if test="${sessionScope.loginUser.uLvl eq '관리자' }">
	                                	<li><a href="systemAdmin.do">System</a></li>
	                                </c:if>
                                </c:if>

                            </ul>
                        </li>
                    </ul>
                    
                </div>
                <br clear="both">
            </div>

            <div id="header_nav">
                
                <ul>
                    <li>
                        <a id="delivery">딜리버리</a>
                    </li>
                    <li>
                        <a href="bungList.do">치킨번개</a>
                    </li>
                    <li>
                        <a href="board.do">맛잘알</a>
                    </li>
                    <li>
                        <a href="nlist.do">공지사항</a>
                    </li>
                </ul>

            </div>
            <br clear="both">
        </header>

	
        <c:if test="${empty msg}">
	        <div id="modal" style="display: none">
	            <!-- <input type="button" id="search_cancel" > -->
	            <img id="search_cancel" src="resources/images/cancel.png" alt="">
	            <form action="homeSearch.do" method="post">
	                <br clear="both">
	                <!-- <select name="option">
	                	<option value="sto_name">매장이름 검색</option>
	                	<option value="brand_name">브랜드 검색</option>
	                </select> -->
	                <select name="search_category" id="search_category">
	                	<option value="brand">브랜드</option>
	                	<option value="store">매장</option>
	                </select>
	                <input type="text" id="search_input" name="search_input" placeholder="치킨 매장(브랜드)만 검색해주세요.">
	                <input type="submit" id="submit" value="검색">
	            </form>
	        </div>
        </c:if>
       
        
    </body>

    <script>
        $(function(){
            $modal=$("#modal");
            
            $("#search").on("click",function(){
                // $("#modal").css('display','none');
                $("#modal").toggle(

                    function(){$modal.addClass('show')}, //클릭하면 show클래스 적용되서 보이기

                    function(){$modal.addClass('hide')} //한 번 더 클릭하면 hide클래스가 숨기기

                );
            })
            $("#search_cancel").on("click",function(){
                $modal.css('display','none');
                location.href="home.do";
            })
            
            $("#delivery").on("click",function(){
            	$("#address option:selected").val();
            	location.href="deliveryList.do";
            })
        })
    </script>

</html>