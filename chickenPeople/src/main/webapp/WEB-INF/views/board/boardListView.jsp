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
	  
	  <div style="width:80%; height: 1000px; margin:0 auto; ">
		  <br><br><br><br><br><br>
	  
		  <table align="center"  width="100%" id="listArea"> 
		  <br><br>
	  <h1 align="center">맛잘알 리뷰 게시판</h1>
		  <br><br><br>
		  
		  	<c:if test="${empty loginUser }">
			 	회원가입이 필요한 서비스 입니다.
			</c:if>
				  <tr>
				  	<th>번호</th>
				  	<th>분류</th>
				  	<th width="45%">제목</th>
				  	<th>글쓴이</th>
				  	<th width="15%">날짜</th>
				  	<th >조회수</th>
				  	<th >추천수</th>
				  </tr>
	
				<c:forEach var="b" items="${boardList }">
					<tr align="center">
						 	<td>	
						 	<c:if test="${!empty loginUser }">
								<c:url var="bdetail" value="bdetail.do">
						  			<c:param name="bNum" value="${b.bNum }"/>
						  		</c:url>
						  		<a href="${bdetail }"style="text-decoration:none;">${b.bNum}</a>
						  	</c:if>
						  	<c:if test="${empty loginUser }">${b.bNum }</c:if>
						  	</td>
						  	<td>${b.bCate}</td>
						  	<td width="45%">
						  		<c:if test ="${!empty loginUser }">
							  		<c:url var="bdetail" value="bdetail.do">
							  			<c:param name="bNum" value="${b.bNum }"/>
							  		</c:url>
							  		<a href="${bdetail }" style="text-decoration:none;">${b.bTitle}</a>
						  		</c:if>
						  		<c:if test ="${empty loginUser }">
						  			${b.bTitle }
						  		</c:if>
					  	</td>
						  	<td>${b.bWriter}</td>
						  	<td width="15%">${b.bDate}</td>
						  	<td >${b.bCount}</td>
						  	<td >${b.bHit}</td>
					</tr>
				</c:forEach>
			 </table>
			 
			 <!-- 시간 될때  로그인하면 사진 미리보기처럼! -->
			  
			 
			 
		<!-- cursor click script -->
		 <script>
		 		$(function() {
			$("#listArea td").mouseenter(function() {
				$(this).parent().css({
					"background" : "darkgray",
					"cursor" : "pointer"
				});
			}).mouseout(function() {
				$(this).parent().css({
					"background" : "white"});
				}).click(function(){
					var nid=$(this).parent().children("input").val();
	
				});
			});
		</script>	 
		<!-- cursor click script end -->
		
		
		 <div class = "p-parents" style="margin:0 auto">
	            <div class="pppp">
	                    <c:if test="${pi.currentPage eq 1}">
		                    <a style = "color:#9c9c9c; " disabled>Previous</a>
	                    </c:if>
	                    <c:if test="${pi.currentPage gt 1}">
	                    	<c:url var="blistBack" value="boardList.do">
	                    		<c:param name="page" value="${pi.currentPage-1} "/>
	                    	</c:url>
	                        <a class="page-a" href="${blistBack }" style="color:#9c9c9c" >Previous</a>	
	                    </c:if>
	                    <ol>
	                    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
	                    	<c:if test="${p eq pi.currentPage }">
	           					<li class = "page-list1"><button disabled class = "page-cur" >${p }</button></li>		
	                    	</c:if>
	                    	<c:if test="${p ne pi.currentPage }">
	                    		<c:url var="blistCheck" value="boardList.do">
	                    			<c:param name="page" value="${p }"/>
	                    		</c:url>
	                    		<li class = "page-list2"><button class="page-nocur" onclick="location.href='${blistCheck}'">${p }</button></li>
	                    	</c:if>
	                    </c:forEach>
	                    </ol>
	                    <c:if test="${pi.currentPage eq pi.maxPage }">
		                    <a style = "color:#9c9c9c"  disabled>Next</a>
	                    </c:if>
						<c:if test="${pi.currentPage lt pi.maxPage }">
							<c:url var="blistAfter" value="boardList.do">
								<c:param name="page" value="${pi.currentPage+1 }"/>
							</c:url>
							<a class="page-a" href="${blistAfter }" style = "color:#9c9c9c">Next</a>
						</c:if>
	           </div>
	        </div><!-- pagination class p-parents end --> 
	
		  
		  
			 <div style="float:right">
			<c:if test ="${!empty loginUser }">
			  	<button class="button" onclick ="bWrite()">글쓰기</button>
			  </c:if>
			  	<button class="button" onclick ="goHome()">home</button>
			  
			  </div> <!-- [bWrite/goHome]button end-->
	
			<script>
				function goHome(){
					location.href="home.do";
				}
				
				function bWrite(){
					location.href="bInsertView.do"
				}
			</script>
		 
	 </div> 
  </div>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>