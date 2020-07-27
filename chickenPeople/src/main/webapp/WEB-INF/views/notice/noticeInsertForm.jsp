<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		html, body {
		  height: 100%;
		}
		
		.wrap {
		  height: 100%;
		  display: flex;
		  align-items: center;
		  justify-content: center;
		}
		
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
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<br><br><br><br><br>
	
	
	<br><br><br><br> 
		<p align ="center">
			<button class="button" onclick="goHome()">시작페이지로</button> &nbsp&nbsp
			<button class="button"  onclick="toNlist()">목록으로</button>
		</p>
	<form action="ninsert.do" method="post">
	<!--  enctype="Multipart/form-data"  파일 쓸때 사용-->
	
	<table align="center"width="40%" style='border-left:0;border-right:0;border-bottom:0;border-top:0' > 
	 <h1 align="center">공지글 작성하기</h1>
	 <br><br>
		
			<tr>
				<td>
					title:<textarea  type="text" rows="1" cols="90" name="nTitle"></textarea>
				</td>
			</tr>
			<tr align="center" colspan="2" >
				<td colspan="2">notice contents </td>
			</tr>
			<tr  colspan="2" style="margin-top:150px" >
				<td  colspan="2" ">
					<textarea rows="45" cols="90" name="nCont"></textarea>
				</td>
			</tr>
			<tr align="right">
				<td>
					<input type="text" style="background-color:transparent;border:0 solid black;text-align:right;" name="userId" readonly value="${loginUser.id}" > <!-- 로그인 유저중에 관리자만 글쓰게끔! -->
				</td>
			</tr>
			
			<tr  style="margin-top:150px">
			<td colspan="2"  align="center" style="border-top: 50px solid #fff;">
				<input type="submit" class="button" value="등록" >		
			</td>
			</tr>
		 </table>
		 </form>
		
		<br><br><br><br><br><br><br>
	<script>
		function goHome(){
			location.href="home.do";
		}
		
		function toNlist(){
			location.href="nlist.do"
		}
	</script>
</body>
</html>