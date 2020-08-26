<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>치민_맛잘알</title>
<style>
	#section{margin: 0 auto; width: 80%; text-align: center; margin-top:150px;}
    #section h1{height: 100px; line-height: 100px; font-size:60px; box-shadow: 0px 5px 5px rgb(226, 226, 226); color: #735949;}
    #section #head{margin: 0 auto; width: 80%;}
    #section .head_title img{width: 500px; height: 400px;}
    #section .head_title{float:left; margin:0 auto; width:49%; text-align:center;}
    /* #section .head_title:nth-child(1){margin-right:30px;} */
    #section .head_title #title{margin-left: 50px; font-size: 50px; font-weight: 600; margin-top: 90px;}
    #section .head_title .title_content{margin-left: 50px; font-size: 25px;}
	#section .head_title a{margin-left:20px; margin-right:20px;}
	.head_title_div{float:left;}
	.head_like_good{margin: 0 auto; width:80%; margin-top:15px; text-align:right;}
	.head_like_good a{font-size:20px;}
	.head_like_good a img{width:20px; height:20px;}
	
    .review{margin: 0 auto; width: 70%; height:300px; text-align:center;}
    .review ul li{float:left; list-style:none;}
    .review ul #r_content{width:58%;}
    .review ul #image{width: 30%; float:right;}
    .review ul #r_content .review_content{width:100%;}
    
    .review ul li img{width: 300px; height: 200px;}
    /* .review ul li .number{font-size:20px; width:100px; height:100px; border-radius:40px; background-color:white; border:1px solid black; text-align:center;} */
    .review ul li .number{font-size:20px; width:30px; height:30px;  border-radius:15px; background-color: #ffc000; color:white;}
    .review ul li div{float:left;}
    .review .review_content{font-size:20px;}
    .content{height:40; line-height:40px;}
    
    #report_area{float:right;}
    #report_area>#report{width:80px; height: 40px; background:#EE5917; border:0px; color:white; border-radius:15px; font-weight:600;}
    
    #report_modal{position: fixed; display:none; width: 100%; height: 100%; top: 0; left: 0; background-color: rgba(0, 0, 0, 0.7); z-index: 9999;}
	#report_modal>div{width: 400px; height: 550px; background-color: #fff; border-radius: 20px; position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%);}

	#reply_title{color:white; width:100%; margin:0; margin-top:50px; height:50px; line-height:50px; font-size:20px; font-weight:600; background-color:#EE5917; border-radius:15px;}
	#reply_msg{text-align:right; color:black; width:100%; margin:0; margin-top:5px; height:20px; line-height:20px; font-size:15px;}
	#reply_area{margin:0 auto; width:70%; height:400px; overflow-y:auto;}
	#tung{height:60%; widht:60%; margin-top:100px;}
	#reply_area .reply{margin-top:20px;}
	#reply_area .reply>li{list-style:none; text-align:left;}
	#reply_area .reply>li>.re_reply{margin-left:70px; margin-top:20px;}
	#reply_area .reply>li>.re_reply>li{list-style:none;}
	/* #reply_area .reply>li>.re_reply>li>.re_reply_date{color:gray;} */
	
	#content_insert{height:200px; margin:0 auto; width:54%; margin-top:30px;}
	#content_insert>.content_insert_item{float:left;}
	#content_insert>button{margin-left: 10px; margin-bottom:5px; height:80px; color:white; background-color:#EE5917; border:0px;}
	#content_insert>#replay_content{resize:none;}
	
	#mat_del_btn{float:right; width:100px; height:50px; color:white; background-color:#EE5917; border:0px; border-radius:15px; font-size:20px;}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
     
</head>


<body>
	<jsp:include page="../common/header.jsp"/>	
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
                <div id="report_area" class="head_title_div">
                	<button id="report">신고</button>
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
        <P id="reply_msg">댓글을 클릭하여 댓글을 작성해주세요.</P>
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
    	<div id="content_insert">
    		<textarea id="replay_content" class="content_insert_item" cols="100" rows="5"></textarea>
    		<button id="reply_btn" class="content_insert_item">댓글 작성</button>
    	</div>
    </div>
    
    <!-- ----------------------------------------modal----------------------------------------------------- -->
    <div id="report_modal">
    	<div>
	        <a href="javascript: $('#report_modal').fadeOut(500);" style="width: 25px; height: 25px; position: absolute; top: 30px; right: 35px; display: block;">
	            <img src="resources/images/close.png" style="width: 100%;"/>
	        </a>
	        <div style="position: absolute; top : 53px; left:35px;">
		        <table id="reportMessage">
		            <tr >
		                <th style="width: 100px; height: 50px; font-size:22px;">category</th>
		                <td>
		                	<input type="hidden" id="br_code" name="br_code" value="B_MUK">
		                	<select id="rpt_code" style="border:2px solid; border-radius:6px; height:30px;">
		                		<option value="REPORT_01">타 서비스 홍보 / 광고 / 판매</option>
		                		<option value="REPORT_02">음란물 유포, 요청</option>
		                		<option value="REPORT_03">권리침해 (초상권,저작권,명예훼손)</option>
		                		<option value="REPORT_04">공격적 / 비꼬기 / 비하</option>
		                	</select>
		                </td>
		            </tr>
		        </table>
	    	</div>
		    <div style="position: absolute; top : 100px; left:12px;">
		        <ul style="list-style: none;">
		            <li style="margin-bottom: 12px;  font-size:20px;"><b>Message</b></li>
		            <textarea id="rpt_content" style="width:300px; height:260px; border:2px solid; border-radius: 13px;"></textarea>
		        </ul>
		        <button type="button" id="mukReport" style="position:absolute; left:155px; bottom:-30px; border-radius:10px; padding:5px"><b>신고하기</b></button>
		    </div>
	    </div>
    </div>
  	
  	<br clear="both">
  	<jsp:include page="../common/footer.jsp"/>
</body>
<script>
	$(document).on("click","#likeBtn",function(){
		$id = $("#id").val();
		$bNum = $("#bNum").val();
		console.log($id);
		$.ajax({
			url:"boardLike.do",
			dataType:"json",
			type:"post",
			data:{id:$id, bNum:$bNum},
			success:function(data){
				if(data.msg == "좋아요"){
					$("#like").children("#likeBtn").remove();
					$("#like").text("");
					$("#like").append("<img id='likeBtn' src='resources/images/like.png' style='width:20px; height:20px;'>"+data.count);
					
				}
				else if(data.msg == "싫어요"){
					$("#like").children("#likeBtn").remove();
					$("#like").text("");
					$("#like").append("<img id='likeBtn' src='resources/images/dislike.png' style='width:20px; height:20px;'>"+data.count);
					
				}
			},
			error:function(data){
				alert("회원만 이용가능");
			}
		})
	})

	$("#report").on("click",function(){
			$("#report_modal").css("display","block");
		})
		
	//신고하기버튼 ajax
	$("#mukReport").on("click",function(){
		$bNum = $("#bNum").val();
		$rpt_content = $("#rpt_content").val();
		$rpt_code = $("#rpt_code").val();
		$br_code = $("#br_code").val();
		$user_id = $("#id").val();

		$.ajax({
			url:"reportInsert.do",
			data:{br_Num:$bNum, rpt_Content:$rpt_content, rpt_Code:$rpt_code, br_Code:$br_code, user_Id:$user_id},
			type:"post",
			dataType:"json",
			success:function(data){
				$("#report_modal").css("display","none");
				console.log("성공");
			},
			error:function(request, status, errorData){
           		alert("error code: " + request.status + "\n"
                          +"message: " + request.responseText
                          +"error: " + errorData);
           	}
		})
	})
	
	//댓글 ajax
	$("#reply_btn").on("click",function(){
		$("#tung").remove();
		$content = $("#replay_content").val();
		console.log($content);
		if($content != ""){
			
			$bNum = $("#bNum").val();
			$id = $("#id").val();
			$rep_cont = $content;
			
			$.ajax({	//댓글 등록 ajax
				url:"replyInsert.do",
				data:{user_id:$id, b_num:$bNum, rep_cont:$rep_cont},
				type:"post",
				dataType:"json",
				success:function(data){
					console.log("성공");
					if(data.id != '비회원'){
						$("#reply_area").append("<ul class='reply' style='margin-top:20px;'>"+
	    						"<li style='list-style:none; text-align:left; color:blue;'>"+
	    							"<p class='content' style='height:40; line-height:40px;'>"+
	    							"<input type='hidden' id='rep1_num' value="+ data.currval +">"+
	    							"<a class='reply_id'><b>"+ $id +"</b> : </a><a class='reply_content'>"+$rep_cont+"</a>"+
	    							"</p>"+
								"</li>"+
					    	"</ul>");
						
					}
					else{
						$("#reply_area").append("<ul class='reply' style='margin-top:20px;'>"+
						    						"<li style='list-style:none; text-align:left; color:blue;'>"+
						    							"<p class='content' style='height:40; line-height:40px;'>"+
						    							"<input type='hidden' id='rep1_num' value="+ data.currval +">"+
						    							"<a class='reply_id'><b>"+ data.id +"</b> : </a><a class='reply_content'>"+$rep_cont+"</a>"+
						    							"</p>"+
			    									"</li>"+
										    	"</ul>");
					}
					//$("#replay_content").val("");
					location.reload();
				},
				error:function(data){
					alert("회원만 이용가능합니다.");
				}
			})
		}
		else{
			alert("댓글을 작성해주세요");
			
		}
		
	})
	//-------------------------------------------------------------------------------------------------------
	$(function(){
		
		//댓글
		$(document).on("click",".reply_content",function(){
			console.log("댓글");
			//$(".re_reply_content_area").remove();
			$(this).parents("li").append("<div class='re_reply_content_area'>"+
											"<textarea class='re_reply_content content_insert_item' style='float:left; resize:none;' cols='100' rows='5'>"+
											"</textarea>"+
											"<button class='re_reply_btn content_insert_item' style='float:left; margin-left: 10px; margin-bottom:5px; width:80px; height:80px; color:white; background-color:#EE5917; border:0px;'>댓글달기</button>"+
											"<button class='re_reply_cancel_btn' style='float:left; margin-left: 10px; margin-bottom:5px; width:80px; height:80px; color:white; background-color:#EE5917; border:0px;'>취소</button>"+
										"<br class='br' clear='both'></div>");
		})	
		
		//대댓글 달기 ajax
		$(document).on("click",".re_reply_btn",function(){
			$rep1_num = $(this).parents(".re_reply_content_area").parents("li").children("p").children("#rep1_num").val()
			
			$bNum = $("#bNum").val();
			$id = $("#id").val();
			$rep_cont = $(this).parents(".re_reply_content_area").children(".re_reply_content").val();
			console.log($rep_cont);
			$.ajax({
				url:"reReplyInsert.do",
				data:{user_id:$id, b_num:$bNum, rep_cont:$rep_cont, rep1_num:$rep1_num},
				type:"post",
				dataType:"json",
				success:function(data){
					console.log("답글 성공");
					$(".re_reply_content_area").children(".re_reply_cancel_btn").remove();
					$(".re_reply_content_area").children(".re_reply_content").remove();
					$(".re_reply_content_area").children(".re_reply_btn").remove();
					$(".br").remove();
					if(data.id != '비회원'){
						$(".re_reply_content_area").parents("li").append("<ul class='re_reply'>"+
 								 "<li class='re_reply_item' style='color:blue;'>"+
	  								 "<p class='re_content' style='height:40; line-height:40px;'>"+
										 "<a class='re_reply_id'><b>"+ $id +"</b> : </a>"+
										 "<a class='re_reply_content'>"+ $rep_cont +"</a>"+
									 "</p>"+
								 "</li>"+
							 "</ul>");
					}
					else{
						$(".re_reply_content_area").parents("li").append("<ul class='re_reply'>"+
 								 "<li class='re_reply_item' style='color:blue;'>"+
	  								 "<p class='re_content' style='height:40; line-height:40px;'>"+
										 "<a class='re_reply_id'><b>"+ data.id +"</b> : </a>"+
										 "<a class='re_reply_content'>"+ $rep_cont +"</a>"+
									 "</p>"+
								 "</li>"+
							 "</ul>");
					}
					
					location.reload();    										 
					
				},
				error:function(data){
					
				}
				
			})
			
		})
		
		//---------------------------------------------------------------------------------------------------------------
		//대댓글
		$(document).on("click",".re_reply_content",function(){
			console.log("대댓글");
			//$(".re_reply_content_area").remove();
			$(this).parents("p").parents(".re_reply_item").append("<div class='re_reply_content_area'>"+
																	"<textarea class='re_replt_content content_insert_item' style='float:left; resize:none;' cols='100' rows='5'>"+
																	"</textarea>"+
																	"<button class='re_re_reply_btn content_insert_item' style='float:left; margin-left: 10px; margin-bottom:5px; height:80px; color:white; background-color:#EE5917; border:0px;'>댓글달기</button>"+
																	"<button class='re_reply_cancel_btn' style='float:left; margin-left: 10px; margin-bottom:5px; width:80px; height:80px; color:white; background-color:#EE5917; border:0px;'>취소</button>"+
																	"<br class='br' clear='both'></div>");
		})	
		
		//대대댓글 달기 ajax
		$(document).on("click",".re_re_reply_btn",function(){
			$rep1_num = $(this).parents(".re_reply_content_area").parents(".re_reply_item").parents(".re_reply").parents("li").children(".content").children("#rep1_num").val()
			//$rep1_num = $(this).parents(".content").children("#rep1_num").val();
			console.log($rep1_num);
			$bNum = $("#bNum").val();
			$id = $("#id").val();
			$rep_cont = $(".re_replt_content").val();
			
			$.ajax({
				url:"reReplyInsert.do",
				data:{user_id:$id, b_num:$bNum, rep_cont:$rep_cont, rep1_num:$rep1_num},
				type:"post",
				dataType:"json",
				success:function(data){
					console.log("답글 성공");
					$(".re_reply_content_area").children(".re_reply_cancel_btn").remove();
					$(".re_reply_content_area").children(".re_replt_content").remove();
					$(".re_reply_content_area").children(".re_re_reply_btn").remove();
					$(".br").remove();
					if(data.id != '비회원'){
						$(".re_reply_content_area").parents("li").parents("li").append("<ul class='re_reply'>"+
 								 "<li class='re_reply_item' style='color:blue;'>"+
	  								 "<p class='re_content' style='height:40; line-height:40px;'>"+
										 "<a class='re_reply_id'><b>"+ $id +"</b> : </a>"+
										 "<a class='re_reply_content'>"+ $rep_cont +"</a>"+
									 "</p>"+
								 "</li>"+
							 "</ul>");
					}
					else{
						$(".re_reply_content_area").parents("li").parents("li").append("<ul class='re_reply'>"+
 								 "<li class='re_reply_item' style='color:blue;'>"+
	  								 "<p class='re_content' style='height:40; line-height:40px;'>"+
										 "<a class='re_reply_id'><b>"+ data.id +"</b> : </a>"+
										 "<a class='re_reply_content'>"+ $rep_cont +"</a>"+
									 "</p>"+
								 "</li>"+
							 "</ul>");
					}
					
					location.reload();
				},
				error:function(data){
					
				}
			})
			
		})
		
		//댓글 취소 버튼
		$(document).on("click",".re_reply_cancel_btn", function(){
			$(".re_reply_content_area").remove();
		})
		
		//댓글 삭제 버튼
		$(document).on("mouseenter",".content",function(){
			if($(this).children(".reply_id").children("b").text() == "${sessionScope.loginUser.id}"){
				$(this).append("<img class='content_del' src='resources/images/delete.png' alt='삭제' style='width:2%; height:2%; margin:0px;'>");	
			}
			else if($(this).children(".reply_id").children("b").text() == "비회원"){
				$(this).append("<img class='content_del' src='resources/images/delete.png' alt='삭제' style='width:2%; height:2%; margin:0px;'>");
			}
		})
		
		$(document).on("mouseleave",".content",function(){
			$(this).children("img").remove();
		})
		
		
		$(document).on("mouseenter",".re_content",function(){
			if($(this).children(".re_reply_id").children("b").text() == "${sessionScope.loginUser.id}"){
				$(this).append("<img class='re_content_del' src='resources/images/delete.png' alt='삭제' style='width:2%; height:2%; margin:0px;'>");
			}
			else if($(this).children(".re_reply_id").children("b").text() == "비회원"){
				$(this).append("<img class='re_content_del' src='resources/images/delete.png' alt='삭제' style='width:2%; height:2%; margin:0px;'>");
			}
		})
		
		$(document).on("mouseleave",".re_content",function(){
			$(this).children("img").remove();
		})
		//댓글 석제
		$(document).on("click",".content_del",function(){
			$rep1_num = $(this).parents("p").children("input").val();
			$reply_id = "#"+$rep1_num;
			$.ajax({
				url:"replyDel.do",
				data:{rep1_num:$rep1_num},
				type:"post",
				dataType:"json",
				success:function(data){
					$($reply_id).parents(".content").parents(".reply").remove();
				},
				error:function(data){
					alert("실패");
				}
			})
		})
		
		//대댓글 석제
		$(document).on("click",".re_content_del",function(){
			$rep2_num = $(this).parents("p").children("input").val();
			$re_reply_id = "#"+$rep2_num;
			$.ajax({
				url:"reReplyDel.do",
				data:{rep2_num:$rep2_num},
				type:"post",
				dataType:"json",
				success:function(data){
					$($re_reply_id).parents(".re_content").parents(".re_reply").remove();
				},
				error:function(data){
					alert("실패");
				}
			})
		})
		
		//게시물 삭제
		$("#mat_del_btn").on("click",function(){
			$bNum = $("#bNum").val();
			if($("#mat_del_btn").text() == '삭제'){
				location.href="boardDelete.do?bNum="+$bNum+"&mypageStatus=${mypageStatus}&bWriter=${board.bWriter}";
			}
			else if($("#mat_del_btn").text() == '복구'){
				location.href="boardBackUp.do?bNum="+$bNum+"&mypageStatus=${mypageStatus}&bWriter=${board.bWriter}";
			}
		})
	})

</script>
</html>