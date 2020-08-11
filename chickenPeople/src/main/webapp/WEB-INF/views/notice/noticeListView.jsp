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
	#section{margin: 0 auto; width: 80%; margin-top:150px;}
    #section #article{width: 100%;}
    #section #article .title{text-align:center;}
    #section #article .title h1{height: 100px; line-height: 100px; font-size:60px; box-shadow: 0px 5px 5px rgb(226, 226, 226); color: #735949;;}

    #section #article ul{margin-left: 50px;}
    #section #article ul li{list-style: none;}
    #section #article ul li .content{font-size:30px; font-weight: 600; color: black; margin:0;}
    #section #article ul li .notice_date{font-size: 20px; color: rgb(172, 171, 171);}	
	  
	  /* 페이징 처리 */
	.p-parents { display: flex; flex-direction: column; justify-content: center; align-items: center; margin: 0 auto; }
    .pppp { display: flex; text-align: center; margin : 50px auto; background: rgb(255, 255, 255); height: 36px; border : 1px solid black; border-radius: 5px; justify-content: center; align-items: center; }
    .pppp > ol > li:first-child { border-left : 1px solid black; }
    .pppp > a { display: inline-flex; justify-content: center; align-items: center; padding: 7px 12px; font-size: 13px; font-weight: 500; color:#9c9c9c; text-decoration: none; }
    .pppp > ol { display: inline-flex; list-style: none; justify-content: center; align-items: center; padding:0px;}
    .pppp > ol > li { display: inline-flex; list-style: none; justify-content: center; align-items: center;  border-right: 1px solid; vertical-align: middle; list-style: none; width: 36px; height: 34px; text-decoration: none; }
    .page-list1 { background-color:#1AAB8A; }
    .page-cur {width:100%; height:100%; font-size : 14px; background:none; color: white; padding : 0; border-style : none; }
    .page-nocur {width:100%; height:100%; font-size: 14px; background:none; color: rgb(46,78,178); padding : 0; border-style : none; }
    .page-a:hover { color: black; text-decoration:none; }
    

</style>


<body>
	<jsp:include page="../common/header.jsp"/>
	
	
	<div id="section">
            
	    <div id="article">
	        
	        <div class="title">
	            <h1>공지사항</h1>
	        </div>
	
	        
	        <ul>
	        	<c:forEach var="n" items="${noticeList }">
		            <li class="notice">
		            	<input type="hidden" id="nNum" value="${n.nNum }"/>
		                <p class="content">${n.nTitle }</p>
		                <p class="notice_date">${n.nDate }</p>
		            </li>
	            </c:forEach>
	        </ul>
		 
		 <!-- 커서 올렸을때  --> 
		 
		 
			<div class = "p-parents" style="margin:0 auto">
			    <div class="pppp">
					<c:if test="${pi.currentPage == 1}">
						<a style = "color:#9c9c9c; " disabled>Previous</a>
					</c:if>
					<c:if test="${pi.currentPage gt 1}">
						<c:url var="blistBack" value="nList.do">
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
								<c:url var="blistCheck" value="nList.do">
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
						<c:url var="blistAfter" value="nList.do">
							<c:param name="page" value="${pi.currentPage+1 }"/>
						</c:url>
						<a class="page-a" href="${blistAfter }" style = "color:#9c9c9c">Next</a>
					</c:if>
				</div>
			</div><!-- pagination class p-parents end --> 
		
				 
	
	
			<div id="writer_btn">
		 		<c:if test="${loginUser.id eq 'Admin' }">
			  		<button class="button" onclick ="nWrite()">글쓰기</button>
				</c:if>
			</div>
			<!-- [bWrite/goHome]button end-->

	
		  
		</div> 
	</div>
    <jsp:include page="../common/footer.jsp"/>
</body>
<script>
	$(function() {
		$("#listArea td").mouseenter(function() {
		$(this).parent().css({
			"background" : "#1AAB8A",
			"cursor" : "pointer"
			});
		}).mouseout(function() {
			$(this).parent().css({
			"background" : "white"});
		}).click(function(){
			var nid=$(this).parent().children("input").val();
		});
		
		
        $(document).on("click",".notice",function(){
            location.href="ndetail.do?nNum="+$(this).children("input").val();
        })
    
	});
	
	function nWrite(){
		location.href="nInsertView.do";
	}
</script>	
</html>