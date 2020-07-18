<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
    .menuSearch { -webkit-appearance: none;  -moz-appearance: none; appearance: none; }
    .menuSearch { width: 400px; background-color:white; padding:7px 25px;  font-family: inherit;  -webkit-appearance: none; -moz-appearance: none; appearance: none; border: 1px solid #999; border-radius: 0px; }
	.menuHeader{margin:0 auto; width:90%; margin-top:130px;}
	.menuResultTable{margin:0 auto; width:90%;}
	.resultTable { width:90%; border-top:1px solid #444444; margin:0 auto;} .resultTable td{text-align:center;} .resultTable th,td{padding:7px;}
	.resultTable td{border-bottom:1px solid #444444; padding:10px;}
	
	button{border:1px solid rgb(46,78,173); background-color:white; color:rgb(46,78,173); padding:5px;}
	
</style>
</head>
<body>
<jsp:include page="../common/systemAdminHeader.jsp"/>

<div class="wrapper">
	<div class="main_container">
		<div class="item"> 
			<div class="menuHeader">
				<p style="font-size:20px;">메뉴 관리</p>
				<br><hr><br>
				<table class="searchTable">
					<tr>
						<td><b>메뉴 검색</b></td>
						<td><input class="menuSearch" type="text" placeholder="메뉴명을 입력해주세요."></td>
					</tr>
					<tr>
						
					</tr>
					<tr>
						<td colspan="2"><button>검색</button></td>
					</tr>
				</table>
			</div><!-- menuHeader end -->
			<div class="menuResultTable">
				<br><hr><br>
				<p>검색 결과 입니다.</p>
				<br><br><br>
				<table class="resultTable">
					<th>번호</th>
					<th>카테고리</th>
					<th>브랜드 명</th>
					<th>가격</th>
					<th>메뉴 설명</th>
					<th>판매 상태</th>
				</table>
			</div>
		</div>
	</div>
</div>
</body>
<script>
$(function(){
	$("#menu").children().addClass('active');
})
</script>
</html>