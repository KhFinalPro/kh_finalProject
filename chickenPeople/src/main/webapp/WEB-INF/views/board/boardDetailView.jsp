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
   	.button{
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
	.button:hover{
	  background:#fff;
	  color:#1AAB8A;
	}
	.button:before,button:after{
	  content:'';
	  position:absolute;
	  top:0;
	  right:0;
	  height:2px;
	  width:0;
	  background: #1AAB8A;
	  transition:400ms ease all;
	}
	.button:after{
	  right:inherit;
	  top:inherit;
	  left:0;
	  bottom:0;
	}
	.button:hover:before,button:hover:after{
	  width:100%;
	  transition:800ms ease all;
	}
	
	 table {
	 	
	    border-collapse: collapse;
		  }
	  th, td {
	    
	    padding: 10px;
	  }
	
	  
	
    
</style>


<body style="background:#e9ecef;">
  <jsp:include page="../common/header.jsp"/>
  
  <div  style=" width:70%;background:white; margin:0 auto;">
  <br><br><br>
	  
	  <div style="width:80%; height: 1500px; margin:0 auto; ">

		  <br><br><br><br><br>
		  <table align="center"  width="100%" border=1px;> 
		    <br><br>
	  <h1 align="center">${board.bNum} 맛잘알 게시판 상세보기</h1>
	    <br><br><br>
	    
	    		 <tr style="background:white" align="center">
	    		 
				  	<td>번호</td> <!-- 나중에 DB갔다온 후 $붙이기 -->
				  	<td>분류</td>
				  	<td width="45%">제목</td>
				  	
				  	<td width="15%">날짜</td>
				  	<td>조회수</td>
				  	<td>추천수</td>
				  	
				  </tr>
		    	 <tr style="background:#dee2e6">
				  	<th>${board.bNum}</th> <!-- 나중에 DB갔다온 후 $붙이기 -->
				  	<th>${board.bCate}</th>
				  	<th width="45%">${board.bTitle}</th>
				  	
				  	<th width="15%">${board.bDate}</th>
				  	<th>${board.bCount}</th>
				  	<th>${board.bHit}</th>
				  	
				  </tr>
					<tr>
						<td colspan="6"  align="right">작성자: ${board.userId}</td>
					</tr>
				  <tr>
				 	<td colspan="6" >
				 	${board.bCont }
				 	<br><br><br><br><br><br><br>
				 	<br><br><br><br><br><br><br><br>
				 	<br><br><br><br><br><br><br><br>
				 	</td>
				 </tr>
				 
				  <!--  insert 완료후 작성 -->
		 </table>
		 
		 <div style="float:right;">
			   <c:if test="${loginUser.id eq board.userId }">
				  	<button class="button" onclick ="UpBoard()">수정하기</button>
				  	<button class="button" onclick ="DelBoard()">삭제하기</button>
			 </c:if>
		 </div>
		 <br><br> <br><br> <br><br>
		 <!-- 수정하기 -->
		<!--  <script>
		 	function UpBoard(){
		 		location.href="boardUpView.do?bNum=${board.bNum}";
		 	} 
		 </script> -->
		 
		 <!-- 삭제하기 -->
		 <script>
		 	/* function DelBoard(){
		 		location.href="ndelete.do?nNum=${notice.nNum}";
		 	} */
		 </script>
		 
		 <!-- 댓글 등록 -->
		 
		 <table align="center" width="100%"  border="1" >
		 	<tr width="80%">
				<td><textarea cols="85" rows="7" id="rContent"></textarea></td>		 	
				<td>
					<input type="button" id ="rSubmit"  value="등록하기">
					<button >추천하기</button>
				</td>		 	
		 	</tr>
		 	
		 	 <thead  border="1">
		 		<tr>
		 			<td colspan="2"><b id="rCount"></b></td>
		 		</tr>
		 	</thead>
		 	<tbody style="padding-left:10px;">
	 			<tr>
		 			<td colspan="2">여긴 제목?<b id="rCount">여기가 내용</b></td>
		 		</tr>
		 			<tr>
		 			<td colspan="2">여긴 제목?<b id="rCount">여기가 내용</b></td>
		 		</tr>
		 			<tr>
		 			<td colspan="2">여긴 제목?<b id="rCount">여기가 내용</b></td>
		 		</tr>
		 			<tr>
		 			<td colspan="2">여긴 제목?<b id="rCount">여기가 내용</b></td>
		 		</tr>
		 	</tbody>
		 </table>
		 
		 <!-- 댓글 목록 -->
		 <table align="center" width="500" border="1" cellspacing="0" id="rtb">
		 	<thead  border="1">
		 		<tr>
		 			<td colspan="2"><b id="rCount"></b></td>
		 		</tr>
		 	</thead>
		 	<tbody >
	 			<tr>
		 			<td colspan="2">여긴 제목?<b id="rCount">여기가 내용</b></td>
		 		</tr>
		 			<tr>
		 			<td colspan="2">여긴 제목?<b id="rCount">여기가 내용</b></td>
		 		</tr>
		 			<tr>
		 			<td colspan="2">여긴 제목?<b id="rCount">여기가 내용</b></td>
		 		</tr>
		 			<tr>
		 			<td colspan="2">여긴 제목?<b id="rCount">여기가 내용</b></td>
		 		</tr>
		 	</tbody>
		 </table>
		 
		 <!-- 댓글 ajax -->
		

			 <br><br> <br><br> <br><br>
	 <div align="center">
		  	<button class="button" onclick ="toBlist()" value="boardList.do" >목록</button> <!-- 왜 안되지? -->
			<br>
	</div>

	
	
	
	
	
	

<!-- 목록으로~ -->
	<script>
		function toBlist (){
			location.href="boardList.do"; 
		}
	</script>
		  

		  
		  
	 </div> 
  </div>
   <br><br> <br><br> <br><br> <br><br> <br><br> <br><br> <br><br>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>