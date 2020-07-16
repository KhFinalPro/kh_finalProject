<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	button{
	  background:#1AAB8A;
	  color:#fff;
	  border:none;
	  position:relative;
	  height:50px;
	  font-size:1.2em;
	  padding:0 2em;
	  cursor:pointer;
	  transition:800ms ease all;
	  outline:none;
	}
	button:hover{
	  background:#fff;
	  color:#1AAB8A;
	}
	button:before,button:after{
	  content:'';
	  position:absolute;
	  top:0;
	  right:0;
	  height:2px;
	  width:0;
	  background: #1AAB8A;
	  transition:400ms ease all;
	}
	button:after{
	  right:inherit;
	  top:inherit;
	  left:0;
	  bottom:0;
	}
	button:hover:before,button:hover:after{
	  width:100%;
	  transition:800ms ease all;
	}
</style>


<body style="background:#e9ecef;">
  <jsp:include page="../common/header.jsp"/>
  
  <div  style=" width:70%;background:white; margin:0 auto;">
  <br><br><br>
	  
	  <div style="width:80%; height: 1000px; margin:0 auto; ">

		  <br><br><br><br><br>
		  <table align="center"  width="100%" border="1" > 
		    <br><br>
	  <h1 align="center">공지사항</h1>
	    <br><br><br>
				  <tr>
				  	<th>번호</th>
				  	<th width="45%">제목</th>
				  	<th>글쓴이</th>
				  	<th width="20%">날짜</th>
				  	<th >조회수</th>
				  </tr>
				  
			<c:forEach var="n" items="${list }">
					<tr align="center">
						<td>${n.nNum} </td>
					  	<td width="45%">
					  	<c:if test="${!empty loginUser }">
					  			<c:url var="ndetail" value="ndetil.do">
					  				<c:param name="nId" value="${n.userId }"/>
					  			</c:url>
					  			<a href="${ndetail}">${n.nTitle}</a>
					  		</c:if>
					  		<c:if test="${empty loginUser }">
					  			${n.nTitle }
					  		</c:if>
					  	</td>
					  	<td>${n.userId }</td>
					  	<td width="20%">${n.nDate}</td>
					  	<td>${n.nCount}</td>
					</tr>
			</c:forEach>
		 </table>
			 
			 

		 
	 <div style="float:right">
	 <c:if test="${!empty loginUser }">
		  	<button onclick ="#">글쓰기</button>
	 </c:if>
	 <c:url var="home" value="home.do"/>
	<button>home</button>

	</div>

		  
<!-- 페이징 처리 기능이랑 같이하기.  -->
		  
		  
	 </div> 
  </div>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>