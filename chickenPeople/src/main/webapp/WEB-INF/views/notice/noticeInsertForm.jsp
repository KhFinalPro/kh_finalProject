<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		#section{margin: 0 auto; width:80%; margin-top:150px;}
		#section h1{height: 100px; line-height: 100px; font-size:60px; box-shadow: 0px 5px 5px rgb(226, 226, 226); color: #735949;}
		
		table{margin:0 auto; width:100%;}
		table p{font-size:30px;}
		table #nTitle{width: 100%; height:80px; font-size:30px;}
		table #nCont{font-size:25px; resize:none;}
		
		
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
	
	<div id="section">
		<h1 align="center">공지사항 작성하기</h1>
		
		<form action="ninsert.do" method="post">
		
			<table align="center"> 
				<tr>
					<td>
						<p>Title:</p>
						<input type="text" id="nTitle" name="nTitle">
					</td>
				</tr>
				<tr align="center" colspan="2" >
					<td colspan="2"><p>Notice Contents</p></td>
				</tr>
				<tr >
					<td  colspan="2">
						<textarea rows="30" cols="92" id="nCont" name="nCont"></textarea>
					</td>
				</tr>
				<tr align="right">
					<td>
						<input type="hidden" name="userId" readonly value="${sessionScope.loginUser.id}" > <!-- 로그인 유저중에 관리자만 글쓰게끔! -->
					</td>
				</tr>
				
				<tr>
				<td colspan="2"  align="center" style="border-top: 50px solid #fff;">
					<input type="submit" class="button" value="등록" >		
				</td>
				</tr>
			</table>
		</form>
	
	</div>
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
		function goHome(){
			location.href="home.do";
		}
		
		function toNlist(){
			location.href="noticeList.do";
		}
	</script>
</body>
</html>