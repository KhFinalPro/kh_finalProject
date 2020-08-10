<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#section{margin:0 auto; width:80%; margin-top:150px;}
#section #article{width:100%; height:500px; overflow-y:auto}
#section h1{height: 100px; line-height: 100px; font-size:60px; box-shadow: 0px 5px 5px rgb(226, 226, 226); color: #735949;}
#section #title{font-size:50px; font-weight: 600; color: black; margin:0; margin-bottom:20px;}
#section #date{font-size: 20px; color: rgb(172, 171, 171);}
#section span{margin-left: 20px;}
#section #article #content{font-size:20px;}
/* 최종버튼 */
button {
	background: #1AAB8A;
	color: #fff;
	border: none;
	position: relative;
	height: 50px;
	font-size: 1.2em;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
}

button:hover {
	background: #fff;
	color: #1AAB8A;
}

button:before, button:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #1AAB8A;
	transition: 400ms ease all;
}

button:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

button:hover:before, button:hover:after {
	width: 100%;
	transition: 800ms ease all;
}

table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
}



.wrap {
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
}

/* 댓글 버튼 */
.button {
	width: 140px;
	height: 45px;
	font-family: 'Roboto', sans-serif;
	font-size: 11px;
	text-transform: uppercase;
	letter-spacing: 2.5px;
	font-weight: 500;
	color: #000;
	background-color: #fff;
	border: none;
	border-radius: 45px;
	box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease 0s;
	cursor: pointer;
	outline: none;
}

.button:hover {
	background-color: #2ac1bc;
	box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
	color: #fff;
	transform: translateY(-7px);
}
</style>


<body>
	<jsp:include page="../common/header.jsp" />

	<div id="section">

		<h1 align="center">공지사항</h1>
			
		<hr>
		
		<p id="title">${notice.nTitle }</p>
		<a id="date">${notice.nDate }</a><span>조회수 : ${notice.nCount }</span>

		<hr>
		<div id="article">
			
			<p id="content">${notice.nCont }</p>
		</div>
		
		<div align="center">
			<c:if test="${loginUser.id eq 'Admin' }">
				<button  class="ubutton" onclick="UpNotice()">수정하기</button>
			</c:if>
			<button onclick="toNlist()" value="nList.do">목록</button>		
			<c:if test="${loginUser.id eq 'Admin' }">
				<button class="dbutton" onclick="DelNotice()">삭제하기</button>
			</c:if>
		</div>
	</div>
	
	<br>
	<jsp:include page="../common/footer.jsp" />
</body>

<script>
	function UpNotice(){
		location.href="nupView.do?nNum=${notice.nNum}";
	}

	
	<!-- 삭제하기 -->

	function DelNotice(){
		location.href="ndelete.do?nNum=${notice.nNum}";
	}

	
	
	<!-- 목록으로~ -->

	function toNlist (){
		location.href="nList.do"; 
	}
</script>
</html>