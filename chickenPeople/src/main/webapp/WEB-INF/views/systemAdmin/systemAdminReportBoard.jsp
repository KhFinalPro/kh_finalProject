<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<style>
	*{font-size:22px;}

	.item {background: #fff; overflow:scroll; margin-bottom: 10px; padding: 15px; font-size: 14px; height: 873px; border-bottom-right-radius: 20px;justify-content: center; align-items: center; margin-top: -30px; }

 	.menuSearch { -webkit-appearance: none;  -moz-appearance: none; appearance: none; }
    .menuSearch { width: 400px; background-color:white; padding:7px 25px;  font-family: inherit;  -webkit-appearance: none; -moz-appearance: none; appearance: none; border: 1px solid #999; border-radius: 0px; }
	 select { -webkit-appearance: none;  -moz-appearance: none; appearance: none; background: "lowerArrow.png" no-repeat 95% 50%; /* 화살표 모양의 이미지 */ }
     select { width: 400px; background-color:white; padding:7px 25px;  font-family: inherit; background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;  -webkit-appearance: none; -moz-appearance: none; appearance: none; border: 1px solid #999; border-radius: 0px; }
     select::-ms-expand { /* for IE 11 */ display: none; }
    .menuHeader{margin:0 auto; width:90%; margin-top:30px;}
	.menuResultTable{margin:0 auto; width:90%;}
	.resultTable { width:100%; border-top:1px solid #444444; border-bottom:1px solid #444444; margin:0 auto;} .resultTable td{text-align:center;} .resultTable th,td{padding:7px;}
	.resultTable td .resultTable th{border-bottom:1px solid #444444; border-top:1px solid #444444; padding:10px;}
	
	button{border:2px solid #2ac1bc; background-color:white; color:#2ac1bc; padding:5px; font-weight:bold}
	
	#section{margin: 0 auto; width: 80%; text-align: center; margin-top:50px;}
    #section h1{height: 80px; line-height: 100px; font-size:30px; box-shadow: 0px 3px 3px rgb(226, 226, 226); color: #735949;}
    #section #head{margin: 0 auto; width: 80%;}
    #section .head_title img{width: 500px; height: 200px;}
    #section .head_title{float:left; margin:0 auto; width:49%; text-align:center;}
    /* #section .head_title:nth-child(1){margin-right:30px;} */
    #section .head_title #title{margin-left: 50px; font-size: 25px; font-weight: 600; margin-top: 90px;}
    #section .head_title .title_content{margin-left: 50px; font-size: 20px;}
	#section .head_title a{margin-left:20px; margin-right:20px;}
	.head_title_div{float:left;}
	.head_like_good{margin: 0 auto; width:80%; margin-top:15px; text-align:right;}
	.head_like_good a{font-size:15px;}
	.head_like_good a img{width:20px; height:20px;}
	
    .review{margin: 0 auto; width: 70%; height:200px; text-align:center;}
    .review ul li{float:left; list-style:none;}
    .review ul #r_content{width:58%;}
    .review ul #image{width: 30%; float:right;}
    .review ul #r_content .review_content{width:100%;}
    
    .review ul li img{width: 300px; height: 200px;}
    /* .review ul li .number{font-size:20px; width:100px; height:100px; border-radius:40px; background-color:white; border:1px solid black; text-align:center;} */
    .review ul li .number{font-size:15px; width:30px; height:30px;  border-radius:15px; background-color: #ffc000; color:white;}
    .review ul li div{float:left;}
    .review .review_content{font-size:15px;}
    .content{height:40; line-height:40px;}
    
    #report_area{float:right;}
    #report_area>#report{width:80px; height: 40px; background:#EE5917; border:0px; color:white; border-radius:15px; font-weight:400;}
    
    #report_modal{position: fixed; display:none; width: 100%; height: 100%; top: 0; left: 0; background-color: rgba(0, 0, 0, 0.7); z-index: 9999;}
	#report_modal>div{width: 400px; height: 500px; background-color: #fff; border-radius: 20px; position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%);}

	#reply_title{color:white; width:100%; margin:0; margin-top:50px; height:50px; line-height:50px; font-size:20px; font-weight:600; background-color:#EE5917; border-radius:15px;}
	#reply_msg{text-align:right; color:black; width:100%; margin:0; margin-top:5px; height:20px; line-height:20px; font-size:15px;}
	#reply_area{margin:0 auto; width:70%; height:400px; overflow-y:auto;}
	#tung{height:60%; widht:60%; margin-top:100px;}
	#reply_area .reply{margin-top:15px;}
	#reply_area .reply>li{list-style:none; text-align:left;}
	#reply_area .reply>li>.re_reply{margin-left:70px; margin-top:20px;}
	#reply_area .reply>li>.re_reply>li{list-style:none;}
	#reply_area .reply>li>.re_reply>li>.re_reply_date{color:gray;} 
	
	#content_insert{height:200px; margin:0 auto; width:54%; margin-top:30px;}
	#content_insert>.content_insert_item{float:left;}
	#content_insert>button{margin-left: 10px; margin-bottom:5px; height:80px; color:white; background-color:#EE5917; border:0px;}
	#content_insert>#replay_content{resize:none;}
	
	#mat_del_btn{float:right; width:100px; height:50px; color:white; background-color:#EE5917; border:0px; border-radius:15px; font-size:20px;}
	
	#deleteBtn{margin-left: 1450px; position: fixed;}
  
</style>
</head>
<body>
<jsp:include page="../common/systemAdminHeader.jsp"/>
	<div class="wrapper">
		<div class="main_container">
			<div class="item">
			<br clear="both">
			<div class="menuHeader">
				<c:url var="updateReport" value="reportStatusUpdate.do">
					<c:param name="br_code" value="${brCode}"/>
					<c:param name="br_num" value="${brNum}"/>
					<c:param name="rpt_num" value="${rptNum}"/>
				</c:url>
				<p style="font-size:30px;">신고 상세</p>
				<br><hr><br>
					<button id="deleteBtn" onclick="location.href='${updateReport}'">삭제</button>
			</div><!-- class menuHeader end -->	
			
				<input type="hidden" id="id" value="${sessionScope.loginUser.id }">
				<input type="hidden" id="bNum" value="${board.bNum}">
			  	<div id="section">
			        <c:if test="${sessionScope.loginUser.id == board.bWriter }">
			        	<c:if test="${board.bStatus == 'N'}">
			        		<button id="mat_del_btn">삭제</button>
			        	</c:if>
			        	<c:if test="${board.bStatus == 'Y'}">
			        		<button id="mat_del_btn">복구</button>
			        	</c:if>
			        </c:if>
			        <div id="head">
			            <div class="head_title">
			                <img src="resources/buploadFiles/${board.bThumbnail }" alt="">
			            </div>
			            <div class="head_title">
			                <p id="title">${board.bTitle }</p>
			                <p class="title_content">${board.bCont }</p>
			                
			                <div class="head_title_div head_like_good">
				                <a>조회수 : ${board.bCount } </a>
				                <c:if test="${!empty sessionScope.loginUser}">
				                	<c:if test="${msg == '싫어요' }">
				                		<a id="like"><img id="likeBtn" src="resources/images/like.png" style='width:20px; height:20px;'>${board.bHit }</a>
				                	</c:if>
				                	<c:if test="${msg == '좋아요' }">
				                		<a id="like"><img id="likeBtn" src="resources/images/dislike.png" style='width:20px; height:20px;'>${board.bHit }</a>
				                	</c:if>
				                </c:if>
				                <c:if test="${empty sessionScope.loginUser}">
				                	<a id="like"><img src="resources/images/dislike.png" style='width:20px; height:20px;'>${board.bHit }</a>
				                </c:if>
			                </div>
			            </div>
			        </div>
			
			        <br clear="both">
			        <p id="reply_title">review</p>
			        <%int i = 0; %>
			        <div class="review">
				        <c:forEach var="p" items="${pList }">
				        <% i++;%>
				        	<ul>
				        		<li id="r_content">
				            		<div class="number"><%=i %>.</div><div class="review_content"><div>${p.bContent }</div></div>
				        		</li>
				        		<li id="image">
				        			<img src="resources/buploadFiles/${p.upFileName}" alt="">
				        		</li>
				        	</ul>
					        <br clear="both">
					        <hr>
				        </c:forEach>
			        </div>
			        <br clear="both">
			        
			        <p id="reply_title">reply</p>
				    <div id="reply_area">
				    	<c:if test="${!empty replyList }">
				    		<c:forEach var="r" items="${replyList }">
						    	<ul class="reply">
						    		<li>
						    			<p class="content">
						    				<input type="hidden" id="${r.rep1_num }" value="${r.rep1_num }">
						    				<input type="hidden" id="rep1_num" value="${r.rep1_num }">
						    				<a class="reply_id"><b>${r.user_id }</b> : </a>
						    				<a class="reply_content">${r.rep_cont }</a>
					    				</p>
					    				<c:if test="${!empty reReplyList }">
					    					<c:forEach var="rr" items="${reReplyList}">
					    						<c:if test="${r.rep1_num == rr.rep1_num }">
						    						<ul class="re_reply">
											    		<li class="re_reply_item">
											    			<p class="re_content">
											    				<input type="hidden" id="${rr.rep2_num }" value="${rr.rep2_num }">
											    				<input type="hidden" id="rep1_num" value="${rr.rep2_num }">
												    			<a class="re_reply_id"><b>${rr.user_id }</b> : </a>
												    			<a class="re_reply_content">${rr.rep_cont }</a>
															</p>			    			
											    		</li>
											    	</ul>
										    	</c:if>
					    					</c:forEach>
					    				</c:if>
					    				<c:if test="${empty reReplyList }">
					    					
					    				</c:if>
						    		</li>
							    	<hr>	    	
						    	</ul>
				    		</c:forEach>
				    	</c:if>
				    	<c:if test="${empty replyList }">
				    		<img id="tung" src="resources/images/tung.png">
				    	</c:if>
				    </div>
			    	
			    </div>
			
			
			
			
			</div><!-- class item end -->
		</div><!-- class main_container end -->
	</div><!-- class wrapper end -->

</body>
<script>
$(function(){
	$("#report").children().addClass('active');
})
</script>
</html>