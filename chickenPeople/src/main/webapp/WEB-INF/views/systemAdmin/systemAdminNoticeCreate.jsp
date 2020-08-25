<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		#section{position:fixed; top:80px; right:15%; text-align:center;}
		
		table{margin:0 auto; width:100%;}
		table p{font-size:30px;}
		table #nTitle{width: 100%; height:80px; font-size:30px;}
		table #nCont{font-size:25px; resize:none; overflow-y:auto;}
		
		.button{width:200px; height:50px; margin-top:20px; font-size:25px; color:#2e4ead; border:0px;}
		.button:hover{color:white; background-color:#2e4ead;}
		
	</style>
</head>
<body>
	<jsp:include page="../common/systemAdminHeader.jsp"/>
	
	<div id="section">
		
		<form action="ninsert.do" method="post">
			<input type="hidden" name="userId" value="${sessionScope.loginUser.id }">
			<table align="center"> 
				<tr>
					<td>
						<p>Title:</p>
						<input type="text" id="nTitle" name="nTitle" required>
					</td>
				</tr>
				<tr align="center" colspan="2" >
					<td colspan="2"><p>Notice Contents</p></td>
				</tr>
				<tr >
					<td  colspan="2">
						<textarea rows="18" cols="92" id="nCont" name="nCont" required></textarea>
					</td>
				</tr>
				
			</table>
			<input type="submit" class="button" value="등록" >
		</form>
	
	</div>
</body>
<script>
 $(function(){
		$("#notice").children().addClass('active');   //왼쪽 메뉴바 상태 고정시키는 용(계연이가추가했음)

 })
</script>
</html>