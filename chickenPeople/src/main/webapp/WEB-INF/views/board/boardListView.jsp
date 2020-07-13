<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		  <br><br><br><br><br><br>
	  
		  <table align="center"  width="100%"> 
		  <br><br>
	  <h1 align="center">맛잘알 리뷰 게시판</h1>
		  <br><br><br>
				  <tr>
				  	<th>번호</th>
				  	<th>분류</th>
				  	<th width="45%">제목</th>
				  	<th>글쓴이</th>
				  	<th width="20%">날짜</th>
				  	<th >조회수</th>
				  	<th >추천수</th>
				  	
				  </tr>
			 </table>
		  <hr><br>
		  <hr><br>
		  <hr><br>
		  <hr><br>
		  <hr><br>
		  <hr><br>
		  <hr><br>
		  <hr><br>
		  <hr><br>
		  <hr><br>
		  <hr><br>
		  <hr><br>
		  <hr><br>
		  <hr><br>
		  <hr><br>
		  
		  
		 
		  
		 <div style="float:right">
		  	<button onclick ="" style="">글쓰기</button>
		  	<button onclick ="">목록</button>
		  
		  </div>
<!-- 페이징 처리 기능이랑 같이하기.  -->
		  
		  
	 </div> 
  </div>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>