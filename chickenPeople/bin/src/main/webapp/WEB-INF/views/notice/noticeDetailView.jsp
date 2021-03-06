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
  /* 최종버튼 */
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
	
	 table {
	    width: 100%;
	    border-top: 1px solid #444444;
	    border-collapse: collapse;
		  }
	  th, td {
	    border-bottom: 1px solid #444444;
	    padding: 10px;
	  }
	  
	  	html, body {
		  height: 100%;
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


<body style="background:#e9ecef;">
  <jsp:include page="../common/header.jsp"/>
  
  <div  style=" width:70%;background:white; margin:0 auto;">
  <br><br><br>
	  
	  <div style="width:80%; height: 1500px; margin:0 auto; ">

		  <br><br><br><br><br>
		  <table align="center"  cellspacing="" width="80%" > 
		    <br><br>
	  <h1 align="center">${notice.nNum} 공지사항 상세보기</h1>
	    <br><br><br>
		    	 <tr style="background:#dee2e6">
				  	<th>${notice.nNum }</th>
				  	<th width="45%">${notice.nTitle }</th>
				  	<th>${notice.userId }</th>
				  	<th width="20%">${notice.nDate }</th>
				  	<th >${notice.nCount }</th>
				  </tr>
			<%-- 	  
				 <tr align="center">
				 	<td>번호</td>
				 	<td>${notice.nNum }</td>
				 </tr>
				  <tr align="center">
				 	<td>제목</td>
				 	<td>${notice.nTitle }</td>
				 </tr>
				  <tr align="center">
				 	<td>작성자</td>
				 	<td>${notice.userId }</td>
				 </tr>
				  <tr align="center">
				 	<td>날짜</td>
				 	<td>${notice.nDate }</td>
				 </tr>
				  <tr align="center">
				 	<td>조회수</td>
				 	<td>${notice.nCount }</td>
				 </tr> --%>
				  <tr>
				 	<td colspan="5" >
				 	${notice.nCont }
				 	<br><br><br><br><br><br><br>
				 	<br><br><br><br><br><br><br><br>
				 	<br><br><br><br><br><br><br><br>
				 	<td>
				 </tr>
				 
				  <!--  insert 완료후 작성 -->
		 </table>
		 <div style="float:right;">
			   <c:if test="${loginUser.userId eq 'Admin' }">
				  	<button onclick ="#">수정하기</button>
				  	<button onclick ="#">삭제하기</button>
			 </c:if>
		 </div>
		 <br><br> <br><br> <br><br>
		 
		 <!-- 댓글 등록 -->
		 <table align="center" width="500" >
		 	<tr>
				<td><textarea cols="80" rows="7" id="rContent"></textarea></td>		 	
				<td>
					<input type="button" id ="rSubmit" class="button" value="등록하기">
				</td>		 	
		 	</tr>
		 </table>
		 
		 <!-- 댓글 목록 -->
		 <table align="center" width="500" >
		 	<thead>
		 		<tr>
		 			<td colspan="2"><b id="rCount"></b></td>
		 		</tr>
		 	</thead>
		 </table>
		 
		 <!-- 댓글 ajax -->
		 <script>
		 
		 </script>

			 <br><br> <br><br> <br><br>
	 <div align="center">
		  	<button onclick ="toNlist()" value="nlist.do" >목록</button> <!-- 왜 안되지? -->
			<br>
	</div>
	
	




<!-- 목록으로~ -->
	<script>
		function toNlist (){
			location.href="nlist.do"; 
		}
	</script>
		  

		  
		  
	 </div> 
  </div>
   <br><br> <br><br> <br><br> <br><br> <br><br> <br><br> <br><br>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>