<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
	.menuSearch { -webkit-appearance: none;  -moz-appearance: none; appearance: none; }
    .menuSearch { width: 400px; background-color:white; padding:7px 25px;  font-family: inherit;  -webkit-appearance: none; -moz-appearance: none; appearance: none; border: 1px solid #999; border-radius: 0px; }
	 select { -webkit-appearance: none;  -moz-appearance: none; appearance: none; background: "lowerArrow.png" no-repeat 95% 50%; /* 화살표 모양의 이미지 */ }
     select { width: 200px; background-color:white; padding:7px 25px;  font-family: inherit; background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;  -webkit-appearance: none; -moz-appearance: none; appearance: none; border: 1px solid #999; border-radius: 0px; }
     select::-ms-expand { /* for IE 11 */ display: none; }
    .menuHeader{margin:0 auto; width:90%; margin-top:30px;}
	.menuResultTable{margin:0 auto; width:90%;}
	.resultTable { width:90%; border-top:1px solid #444444; border-bottom:1px solid #444444; margin:0 auto;} .resultTable td{text-align:center;} .resultTable th,td{padding:7px;}
	.resultTable td .resultTable th{ height:30px; border-bottom:1px solid #444444; border-top:1px solid #444444; padding:10px;}
	.resultTable tr{height:40px;}
	button{border:1px solid rgb(46,78,173); background-color:white; color:rgb(46,78,173); padding:5px;}
	
	.p-parents { display: flex; flex-direction: column; justify-content: center; align-items: center; margin: 0 auto; }
    .pppp { display: flex; text-align: center; margin : 50px auto; background: rgb(255, 255, 255); height: 36px; border : 1px solid black; border-radius: 5px; justify-content: center; align-items: center; }
    .pppp > ol > li:first-child { border-left : 1px solid black; }
    .pppp > a { display: inline-flex; justify-content: center; align-items: center; padding: 7px 12px; font-size: 13px; font-weight: 500; color:#9c9c9c; text-decoration: none; }
    .pppp > ol { display: inline-flex; list-style: none; justify-content: center; align-items: center; }
    .pppp > ol > li { display: inline-flex; list-style: none; justify-content: center; align-items: center;  border-right: 1px solid; vertical-align: middle; list-style: none; width: 36px; height: 34px; text-decoration: none; }
    .page-list1 { background-color:rgb(46,78,178); }
    .page-cur { font-size : 14px; background:none; color: white; padding : 0; border-style : none; }
    .page-nocur { font-size: 14px; background:none; color: rgb(46,78,178); padding : 0; border-style : none; }
    .page-a:hover { color: black; text-decoration:none; }
    
    a:link{text-decoration:none; color:#646464;}
    a:visited{text-decoration:none; color:#646464;}
    a:active{text-decoration:none; color:#646464;}
    a:hover{text-decoration:none; color:#646464;}
</style>
</head>
<body>
<jsp:include page="../common/systemAdminHeader.jsp"/>
<div class="wrapper">
	<div class="main_container">
		<div class="item"> 
			<br clear="both">
			<div class="menuHeader">
				<p style="font-size:20px;">1:1 문의</p>
				<br><hr><br>
			</div>
			<div class="resultTable">
				<table class="searchTable">
					<thead>
						<tr>
							<th>채팅방 번호</th>
							<th>접속자 아이디</th>
							<th>이름</th>			
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${totalRoomData }" >
							<tr>
								<c:url var="goChattingAdmin" value="goChattingAdmin">
									<c:param name="room_no" value="${list.chattingRoom_no}"/>
									<c:param name="client_name" value="${list.client_id }"/>
								</c:url>
								<td>${list }</td>
								<td class="roomNo">${list.chattingRoom_no}</td>
								<td class="userId">${list.client_id}</td>
								<td class="userName">${list.client_name }</td>
								<td><button class="message">채팅하러가기</button> 
							</tr>			
						</c:forEach>
					</tbody><!-- tbody end -->
				</table><!-- class searchTable end -->
			</div><!-- class resultTable end -->
			<div class = "p-parents" style="margin:0 auto">
	            <div class="pppp">
	                    <c:if test="${pi.currentPage eq 1}">
		                    <a style = "color:#9c9c9c; " disabled>Previous</a>
	                    </c:if>
	                    <c:if test="${pi.currentPage gt 1}">
	                    	<c:url var="blistBack" value="systemAdminChat.do">
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
	                    		<c:url var="blistCheck" value="systemAdminChat.do">
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
							<c:url var="blistAfter" value="systemAdminChat.do">
								<c:param name="page" value="${pi.currentPage+1 }"/>

	                    	</c:url>
							<a class="page-a" href="${blistAfter }" style = "color:#9c9c9c">Next</a>
						</c:if>
	           </div>
	        </div><!-- pagination class p-parents end --> 
		</div>
	</div>
</div>
	<script>
		$(function(){
            $(".message").on("click",function(){
            	/* var loginUser="<c:out value='${loginUser.id}'/>"; */
            	var loginUser = $(this).parent().parent().children(".userId").text();
            	var roomNo = $(this).parent().parent().children(".roomNo").text();
            	/* var roomNo = "<c:out value='${list.chattingRoom_no}'/>"; */
            	console.log('loginUser'+loginUser);
            	console.log('roomNo'+roomNo);
        		window.open("goChattingAdmin?loginUserName=Admin"+"&room_no="+roomNo,"","width=400, height=600","menubar=1","status=0");
				
            })
        	$("#chat").children().addClass('active');

		})
	
	</script>
</body>
</html>