<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<h1 align="center">공지글 작성하기</h1>
	
	<br>
	<form action="ninsert.do" method="post" enctype="Multipart/form-data">
	<table align="center"  cellspacing="" width="80%" > 
		    <br><br>
	  <h1 align="center">${notice.nNum} 공지사항 상세보기</h1>
	    <br><br><br>
		    	 <tr style="background:#dee2e6">
				  	<td>
					<input type="text" size="50" name="nTitle">
					</td>
				  	<td width="45%">${notice.nTitle }</td>
				  	<td>${notice.userId }</td>
				  	<td width="20%">${notice.nDate }</td>
				  	<td >${notice.nCount }</td>
				  </tr>
				  <tr align="center">
				 	<td colspan="5">
				 	${notice.nCont }
				 	<td>
				 </tr>
				 <tr>
				 <tr>
				<td>제목</td>
				<td>
					<input type="text" size="50" name="nTitle">
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text"  name="nWriter" readonly > 로그인 유저중에 관리자만 글쓰게끔!
				</td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="7" cols="50" name="nContent"></textarea>
				</td>
			</tr>
			
			<br><br><br><br><br>
			<td colspan="2" align="center">
				<input type="submit" value="등록하기"> &nbsp;
				<input type="reset" value="등록취소"> 				
			</td>
				 </tr>
	
		 </table>
		 </form>
	<!-- <form action="ninsert.do" method="post" enctype="Multipart/form-data">
		<table align="center" border="1" cellspacing="0" width="400">
			<tr>
				<td>제목</td>
				<td>
					<input type="text" size="50" name="nTitle">
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text"  name="nWriter" readonly > 로그인 유저중에 관리자만 글쓰게끔!
				</td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="7" cols="50" name="nContent"></textarea>
				</td>
			</tr>
			
			<br><br><br><br><br>
			<td colspan="2" align="center">
				<input type="submit" value="등록하기"> &nbsp;
				<input type="reset" value="등록취소"> 				
			</td>
		</table>
	
	<p align ="center">
		<a href="home.do">메인으로</a>
		<a href="nlist.do">목록으로</a>
	</p>
	
	</form>
	 -->
	
	
</body>
</html>