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
	
    .review{float: left; width: 49.5%; height:300px;}
    .review:nth-child(odd){margin-right:10px;}
    .review img{width: 100%; height: 90%;}
    .review a{font-size:20px;}
    .review span{font-size:20px;}
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
        <c:forEach var="p" items="${pList }">
        <% i++;%>
	        <div class="review">
	            <img src="resources/buploadFiles/${p.upFileName}" alt="">
	            <a><%=i %>. </a><span class="review_content">${p.bContent }</span>
	        </div>
        </c:forEach>
        
    </div>
  	
  	<br clear="both">
  	<jsp:include page="../common/footer.jsp"/>
</body>
</html>