<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>치민_공지사항</title>
</head>
<style>
#section{margin:0 auto; width:80%; margin-top:150px;}
#section #article{width:100%; overflow-y:auto}
#section h1{height: 40px; line-height: 40px; font-size:25px; box-shadow: 0px 5px 5px rgb(226, 226, 226); color: #735949;}
#section #title{font-size:30px; font-weight: 600; color: black; margin:0; margin-bottom:20px;}
#section #date{font-size: 20px; color: rgb(172, 171, 171);}
#section span{margin-left: 20px;}
#section #article #content{font-size:20px;}

#btn_area button{width:100px; height:50px; background-color: #735949; color: white; border:0px; font-size:20px; font-weight:600;}

</style>


<body>
	<jsp:include page="../common/header.jsp" />

	<div id="section">

		<h1 align="center">공지사항</h1>
			
		<br>
		<p id="title">${notice.nTitle }</p>
		<a id="date">${notice.nDate }</a><span>조회수 : ${notice.nCount }</span>

		<hr>
		<div id="article">
			
			<pre id="content">${notice.nCont }</pre>
		</div>
		
		<div id="btn_area" align="center">
			<button onclick="toNlist()" value="nList.do">목록</button>		
		</div>
	</div>
	
	<br>
	<jsp:include page="../common/footer.jsp" />
</body>

<script>	
	function toNlist (){
		location.href="nList.do"; 
	}

</script>
</html>