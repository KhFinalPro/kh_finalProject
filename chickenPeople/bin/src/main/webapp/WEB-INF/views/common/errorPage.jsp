<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="error-container" style="text-align: center;">
		<h1>Error</h1>
		<h2>
			${requestScope['javax.servlet.error.message'] }
		</h2>
		<a href="home.do">시작페이지로 돌아가기</a>
	</div>

</body>
</html>