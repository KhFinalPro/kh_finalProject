<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#write{position:fixed; top:100px; right:50px; width:150px; height:50px; border:0; font-size:25px; font-weight:600; color:#1ac2bc;}
	#write:hover{color:white; background-color:#1ac2bc;}
	
	.item {background: #fff; margin-bottom: 10px; padding: 15px; font-size: 14px; height: 873px; border-bottom-right-radius: 20px;justify-content: center; align-items: center; margin-top: -30px; }
	
    .menuHeader{margin:0 auto; width:90%; margin-top:50px;}
	.menuResultTable{margin:0 auto; width:90%;}
	.resultTable { width:100%; border-top:1px solid #444444; border-bottom:1px solid #444444; margin:0 auto;} .resultTable td{text-align:center;} .resultTable th,td{padding:7px;}
	.resultTable td .resultTable th{border-bottom:1px solid #444444; border-top:1px solid #444444; padding:10px;}
	.resultTable th{height:80px;}
	.resultTable td{height:50px;}
	
	button{border:2px solid #2ac1bc; background-color:white; color:#2ac1bc; padding:5px; font-weight:bold}
	#write {margin-right:10px; margin-left: 1540px; margin-top: 10px;}
	
    .p-parents { display: flex; flex-direction: column; justify-content: center; align-items: center; margin: 0 auto; }
    .pppp { display: flex; text-align: center; margin : 50px auto; background: rgb(255, 255, 255); height: 36px; border : 1px solid black; border-radius: 5px; justify-content: center; align-items: center; }
    .pppp > ol > li:first-child { border-left : 1px solid black; }
    .pppp > a { display: inline-flex; justify-content: center; align-items: center; padding: 7px 12px; font-size: 13px; font-weight: 500; color:#9c9c9c; text-decoration: none; }
    .pppp > ol { display: inline-flex; list-style: none; justify-content: center; align-items: center; }
    .pppp > ol > li { display: inline-flex; list-style: none; justify-content: center; align-items: center;  border-right: 1px solid; vertical-align: middle; list-style: none; width: 36px; height: 34px; text-decoration: none; }
    .page-list1 { background-color:#2ac1bc; }
    .page-cur { font-size : 14px; background:none; color: white; padding : 0; border-style : none; }
    .page-nocur { font-size: 14px; background:none; color: #2ac1bc; padding : 0; border-style : none; }
    .page-a:hover { color: black; text-decoration:none; }
    
    #modal{position:fixed; top:200px; right:30%; width:600px; height:550px; border:1px solid black; background-color:white; display:none; border-radius:20px;}
    #modal img{width:50px; height:50px; float:right;}
</style>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	
	<jsp:include page="../common/systemAdminHeader.jsp"/>
	
	<div class="wrapper">
		<div class="main_container">
			<div class="item">
				<br clear="both">
				<div class="menuHeader">
					<p style="font-size:20px;">공지사항</p>
					<br><br>
				
				</div><!-- menuHeader end -->
		
				<div class="menuResultTable">
				
					<table class="resultTable">
						<thead>
							<th>공지번호</th>
							<th>공지 제목</th>
							<th>조회수</th>
							<th>글쓴 날짜</th>
							<th>글 삭제 여부</th>
							<th>삭제</th>
						</thead>
						<tbody>
							<c:forEach var="n" items="${noticeList }">
								<tr>
									<td class="noticeNum">${n.nNum }</td>
									<td class="noticeTitle">${n.nTitle }</td>
									<td>${n.nCount }</td>
									<td>${n.nDate }</td>
									<c:if test="${n.nStatus == 'N'}">
										<td class="noticeStatus">정상</td>
									</c:if>
									<c:if test="${n.nStatus == 'Y'}">
										<td class="noticeStatus">삭제</td>
									</c:if>
									<td><button class="cencel_btn">삭제</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table><!-- class resultTable end -->
				</div><!-- class menuResultTable end -->
	                		
				<button id="write">글 쓰기</button>

			 	<div class = "p-parents" style="margin:0 auto">
				    <div class="pppp">
						<c:if test="${pi.currentPage == 1}">
							<a style = "color:#9c9c9c; " disabled>Previous</a>
						</c:if>
						<c:if test="${pi.currentPage gt 1}">
							<c:url var="blistBack" value="adminNoticeList.do">
								<c:param name="page" value="${pi.currentPage-1} "/>
							</c:url>
							<a class="page-a" href="${blistBack }" style="color:#9c9c9c" >Previous</a>	
						</c:if>
						<ol>
							<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
								<c:if test="${p == pi.currentPage }">
									<li class = "page-list1"><button disabled class = "page-cur" >${p }</button></li>		
								</c:if>
								<c:if test="${p != pi.currentPage }">
									<c:url var="blistCheck" value="adminNoticeList.do">
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
							<c:url var="blistAfter" value="adminNoticeList.do">
								<c:param name="page" value="${pi.currentPage+1 }"/>
							</c:url>
							<a class="page-a" href="${blistAfter }" style = "color:#9c9c9c">Next</a>
						</c:if>
					</div>
				</div><!-- pagination class p-parents end --> 
	       
			</div>
		</div>
	</div>
	
	<div id="modal">
	<img id="close" src="resources/images/close.png">
	</div>
</body>
<script>
	$(function(){
		$("#notice").children().addClass('active');   //왼쪽 메뉴바 상태 고정시키는 용(계연이가추가했음)

		$("#write").on("click",function(){
			location.href="nInsertView.do";
		})
		
		$("td").on("mouseenter",function(){
			$(this).parents("tr").css("background-color","#e1ecf2");
		})
		$("td").on("mouseout",function(){
			$(this).parents("tr").css("background-color","white");
		})
		
		$("#close").on("click",function(){
			$("#modal").css("display","none");
		})
		
		$(".cencel_btn").on("click",function(){
			$noticeStatus = $(this).parents("tr").children(".noticeStatus").text();
			if($noticeStatus == "정상"){
				$nNum = $(this).parents("tr").children(".noticeNum").text();
				location.href="ndelete.do?nNum="+$nNum;				
			}
		})
		
		$(document).on("click","#update_btn",function(){
			$(this).submit();
		})
		
		
	})
	
	$(".noticeTitle").on("click",function(){
		$nNum = $(this).parents("tr").children(".noticeNum").text();
		$.ajax({
			url:"adminNoticeDetail.do",
			data:{nNum:$nNum},
			type:"post",
			dataType:"json",
			success:function(data){
				$("#modal").css("display","block");
				$("#modal").children("form").remove();
				$("#modal").append("<form action='nupdate.do' method='get'>"+
									"<div style='margin:0 auto; width:90%; '>"+
									"<input type='text' name='nTitle' value='"+ data.title +"' style='width:100%; height:50px; font-size:25px; margin-top:20px;'>"+
									"<input type='hidden' name='nNum' value='"+ data.nNum +"'>"+
									"<input type='text' name='nDate' value='"+ data.date +"' style='border:0px;'>"+
									"</div>"+
									"<div style='margin:0 auto; width:80%; height:300px; margin-top:30px; overflow-y:scroll;'>"+
									//"<input type='text' name='nCont' value='"+ data.content +"' style='width:100%; height:100%;'>"+
									"<textarea name='nCont' style='width:100%; height:100%;'>"+ data.content + "</textarea>"+
									"</div>"+
									"<div style='margin:0 auto; width:80%; text-align:center; margin-top:20px;'>"+
									"<button id='update_btn' style='width:100px; height:30px;'>수정하기</button>"+									
									"</div>"+
									"</form>"
									)
			},
			error:function(request, status, errorData){
           		alert("error code: " + request.status + "\n"
                          +"message: " + request.responseText
                          +"error: " + errorData);
           	}
		});
	})
</script>
</html>