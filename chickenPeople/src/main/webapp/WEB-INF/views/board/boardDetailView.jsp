<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#section{margin: 0 auto; width: 80%; text-align: center; margin-top:150px;}
    #section h1{height: 100px; line-height: 100px; font-size:60px; box-shadow: 0px 5px 5px rgb(226, 226, 226); color: #735949;}
    #section #head{margin: 0 auto; width: 80%;}
    #section .head_title img{width: 500px; height: 400px;}
    #section .head_title{float:left;}
    #section .head_title #title{margin-left: 50px; font-size: 50px; font-weight: 600; margin-top: 90px;}
    #section .head_title .content{margin-left: 50px; font-size: 25px;}
	#section .head_title a{margin-left:20px;}
	
    .review{width: 80%%; height:300px;}
    .review ul li{float:left; list-style:none; width:49%;}
    .review:nth-child(odd){margin-right:10px;}
    .review ul li img{width: 300px; height: 200px;}
    /* .review ul li .number{font-size:20px; width:100px; height:100px; border-radius:40px; background-color:white; border:1px solid black; text-align:center;} */
    .review ul li .number{font-size:30px; width:50px; height:50px;  border-radius:25px; background-color: #ffc000; color:white;}
    .review ul li div{float:left;}
    .review .review_content{font-size:40px;}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
     
</head>


<body>
	<jsp:include page="../common/header.jsp"/>	
	
  	<div id="section">
        <h1>맛잘알 리뷰</h1>
        <div id="head">
            <div class="head_title">
                <img src="resources/buploadFiles/${board.bThumbnail }" alt="">
            </div>
            <div class="head_title">
                <p id="title">${board.bTitle }</p>
                <p class="content">${board.bCont }</p>
                <a>조회수 : ${board.bCount } </a><a> 좋아요 : ${board.bHit }</a>
            </div>
        </div>

        <br clear="both">
        <hr>
        <%int i = 0; %>
        <div class="review">
	        <c:forEach var="p" items="${pList }">
	        <% i++;%>
	        	<ul>
	        		<li>
	            		<div class="number"><%=i %>.</div><div class="review_content">${p.bContent }</div>
	        		</li>
	        		<li>
	        			<img src="resources/buploadFiles/${p.upFileName}" alt="">
	        		</li>
	        	</ul>
		        <br clear="both">
		        <hr>
	        </c:forEach>
        </div>
        
    </div>
  	
  	<br clear="both">
  	<jsp:include page="../common/footer.jsp"/>
</body>
</html>