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
	    width: 100%;
	    border-top: 1px solid #444444;
	    border-collapse: collapse;
		  }
	  th, td {
	    border-bottom: 1px solid #444444;
	    padding: 10px;
	  }
	  
	  /* 페이징 처리 */
	.p-parents { display: flex; flex-direction: column; justify-content: center; align-items: center; margin: 0 auto; }
    .pppp { display: flex; text-align: center; margin : 50px auto; background: rgb(255, 255, 255); height: 36px; border : 1px solid black; border-radius: 5px; justify-content: center; align-items: center; }
    .pppp > ol > li:first-child { border-left : 1px solid black; }
    .pppp > a { display: inline-flex; justify-content: center; align-items: center; padding: 7px 12px; font-size: 13px; font-weight: 500; color:#9c9c9c; text-decoration: none; }
    .pppp > ol { display: inline-flex; list-style: none; justify-content: center; align-items: center; }
    .pppp > ol > li { display: inline-flex; list-style: none; justify-content: center; align-items: center;  border-right: 1px solid; vertical-align: middle; list-style: none; width: 36px; height: 34px; text-decoration: none; }
    .page-list1 { background-color:#1AAB8A; }
    .page-cur { font-size : 14px; background:none; color: white; padding : 0; border-style : none; }
    .page-nocur { font-size: 14px; background:none; color: rgb(46,78,178); padding : 0; border-style : none; }
    .page-a:hover { color: black; text-decoration:none; }
    
</style>


<body style="background:#e9ecef;">
  <jsp:include page="../common/header.jsp"/>
  
  <div  style=" width:70%;background:white; margin:0 auto;">
  <br><br><br>
	  
	  <div style="width:80%; height: 1500px; margin:0 auto; ">

		  <br><br><br><br><br>
		  <table align="center"  width="80%" > 
		    <br><br>
	  <h1 align="center">${board.bNum} 맛잘알 게시판 상세보기</h1>
	    <br><br><br>
		    	 <tr style="background:#dee2e6">
				  	<th>${board.bNum}</th> <!-- 나중에 DB갔다온 후 $붙이기 -->
				  	<th>${board.bCate}</th>
				  	<th width="45%">${board.bTitle}</th>
				  	<th>${board.bWriter}</th>
				  	<th width="15%">${board.bDate}</th>
				  	<th>${board.bCount}</th>
				  	<th>${board.bHit}</th>
				  	
				  </tr>
			
				  <tr>
				 	<td colspan="5" >
				 	${board.bCont }
				 	<br><br><br><br><br><br><br>
				 	<br><br><br><br><br><br><br><br>
				 	<br><br><br><br><br><br><br><br>
				 	<td>
				 </tr>
				 
				  <!--  insert 완료후 작성 -->
		 </table>
		 
		 <div style="float:right;">
			   <c:if test="${loginUser.id eq board.bWriter }">
				  	<button class="button" onclick ="UpBoard()">수정하기</button>
				  	<button class="button" onclick ="DelBoard()">삭제하기</button>
			 </c:if>
		 </div>
		 <br><br> <br><br> <br><br>
		 <!-- 수정하기 -->
		 <script>
		/*  	function UpBoard(){
		 		location.href="nupView.do?nNum=${notice.nNum}";
		 	} */
		 </script>
		 
		 <!-- 삭제하기 -->
		 <script>
		 	/* function DelBoard(){
		 		location.href="ndelete.do?nNum=${notice.nNum}";
		 	} */
		 </script>
		 
		 <!-- 댓글 등록 -->
		 <button style=float:right;">추천하기</button>
		 <table align="center" width="500" >
		 	<tr>
				<td><textarea cols="80" rows="7" id="rContent"></textarea></td>		 	
				<td>
					<input type="button" id ="rSubmit" class="button" value="등록하기">
				</td>		 	
		 	</tr>
		 </table>
		 
		 <!-- 댓글 목록 -->
		 <table align="center" width="500" border="1" cellspacing="0" id="rtb">
		 	<thead>
		 		<tr>
		 			<td colspan="2"><b id="rCount"></b></td>
		 		</tr>
		 	</thead>
		 	<tbody>
		 	</tbody>
		 </table>
		 
		 <!-- 댓글 ajax -->
		 <script>
		 	$(function(){
		 		getReplyList();
		 		
		 		setInterval(function(){
		 			getReplyList();
		 		},10000);
		 		
		 		$("#rSubmit").on("click",function(){
		 			var rContent = $("#rContent").val();
		 			var refBwriter =${board.bWriter};
		 			
		 			$.ajax({
		 				url:"addReply.do",
		 				data:{rContent:rContent, refBwriter:refBwriter},
		 				success:function(data){
		 					if(data == "success"){
		 						getReplyList();
		 						
		 						$("#rContent").val("");
		 					}
		 				},
		 				error:function(request,status,errorData){
		 					alert("error code:"+request.status+"\n"
		 							+"message:"+request.responseText
		 							+"error"+errorData);
		 				}
		 			})
		 		})
		 	})
		 	
		 	
		 	
		 	/* function getReplyList(){
		 		var bWriter = ${board.bWriter};
		 		
		 		$.ajax({
		 			url:"rList.do",
		 			data:{bWriter,bWriter},
		 			dataType="json",
		 			success:function(data){
		 				$tableBody=$("rtb tbody");
		 				$tableBody.html("");
		 				
		 				var $tr; 
		 				var $userId; 
		 				var $repCont; 
		 				var $repUpDate; 
		 				
		 				$("#rCount").text("댓글("+data.length+")");
		 				
		 				if(data.length>0){
		 					for(var i in data){
		 						for(var i in data){
		 							$tr=$("<tr>");
		 							$userId=$("<td width='100'>").text(data[i].userId);
									$refCont=$("<td>").text(data[i].refCont);
									$refUpDate=$("<td width='100'>").text(data[i].repUpDate);
									
									$tr.append($userId);
									$tr.append($refCont);
									$tr.append($refUpDate);
									$tableBody.append($tr);
								}
							}else{						// 댓글이 없으면
								$tr = $("<tr>");
								$refCont=$("<td colspan='3'>").text("등록된 댓글이 없습니다.");
								$tr.append($refCont);
								
								$tableBody.append($tr);
							}
							
							
							
							
						},
						error:function(request, status, errorData){
							alert("error code: " + request.status + "\n"
									+"message: " + request.responseText
									+"error: " + errorData);
						}
					})
				} */
		 </script>

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