<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#section{margin: 0 auto; width: 80%; text-align: center; margin-top:150px;}
    #section h1{height: 100px; line-height: 100px; font-size:60px; box-shadow: 0px 5px 5px rgb(226, 226, 226); color: #735949;}
    #section #head{margin: 0 auto; width: 80%;}
    #section .head_title img{width: 500px; height: 400px;}
    #section .head_title{float:left; margin:0 auto; width:49%; text-align:center;}
    /* #section .head_title:nth-child(1){margin-right:30px;} */
    #section .head_title #title{margin-left: 50px; font-size: 50px; font-weight: 600; margin-top: 90px;}
    #section .head_title .content{margin-left: 50px; font-size: 25px;}
	#section .head_title a{margin-left:20px;}
	
    .review{width: 80%%; height:300px;}
    .review ul li{float:left; list-style:none; width:49%;}
    .review:nth-child(odd){margin-right:10px;}
    .review ul li img{width: 300px; height: 200px;}
    /* .review ul li .number{font-size:20px; width:100px; height:100px; border-radius:40px; background-color:white; border:1px solid black; text-align:center;} */
    .review ul li .number{font-size:30px; width:50px; height:50px;  border-radius:25px; background-color: #ffc000; color:white;}
    .review ul li div{float:left;}
    .review .review_content{font-size:40px;}
    
    #report_area{float:right;}
    #report_area>#report{width:100px; height:25px;}
    
    #report_modal{position: fixed; display:none; width: 100%; height: 100%; top: 0; left: 0; background-color: rgba(0, 0, 0, 0.7); z-index: 9999;}
	#report_modal>div{width: 400px; height: 550px; background-color: #fff; border-radius: 20px; position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%);}

	#reply_title{color:#735949; width:100%; margin:0; margin-top:50px; height:50px; line-height:50px; font-size:20px; font-weight:600; border-top:1px solid #735949; border-bottom:1px solid #735949;}
	#reply_area{margin:0 auto; width:100%; height:400px; overflow-y:auto;}
	#tung{height:60%; widht:60%; margin-top:100px;}
	#reply_area .reply{margin-top:20px;}
	#reply_area .reply>li{list-style:none; text-align:left;}
	#reply_area .reply>li>.re_reply{margin-left:70px; margin-top:20px;}
	#reply_area .reply>li>.re_reply>li{list-style:none;}
	/* #reply_area .reply>li>.re_reply>li>.re_reply_date{color:gray;} */
	
	#content_insert{height:200px;}
	#content_insert>button{ margin-bottom:5px;}
	#content_insert>#replay_content{resize:none;}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
     
</head>


<body>
	<jsp:include page="../common/header.jsp"/>	
	<input type="hidden" id="id" value="${sessionScope.loginUser.id }">
	<input type="hidden" id="bNum" value="${board.bNum}">
  	<div id="section">
        <!-- <h1>맛잘알 리뷰</h1> -->
        <div id="head">
            <div class="head_title">
                <img src="resources/buploadFiles/${board.bThumbnail }" alt="">
            </div>
            <div class="head_title">
                <p id="title">${board.bTitle }</p>
                <p class="content">${board.bCont }</p>
                <a>조회수 : ${board.bCount } </a><a id="like"> 좋아요 : ${board.bHit }</a>
                <div id="report_area">
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
	        		<li>
	            		<div class="number"><%=i %>.</div><div class="review_content">${p.bContent }</div>
	        		</li>
	        		<li>
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
			    			<p>
			    				<input type="hidden" id="rep1_num" value="${r.rep1_num }">
			    				<a class="reply_id">${r.user_id } : </a>
			    				<a class="reply_content">${r.rep_cont }</a>
		    				</p>
		    				<c:if test="${!empty reReplyList }">
		    					<c:forEach var="rr" items="${reReplyList}">
		    						<c:if test="${r.rep1_num == rr.rep1_num }">
			    						<ul class="re_reply">
								    		<li class="re_reply_item">
								    			<p>
									    			<a class="re_reply_id">${rr.user_id } : </a>
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
			    	</ul>
			    	<hr>	    	
	    		</c:forEach>
	    	</c:if>
	    	<c:if test="${empty replyList }">
	    		<img id="tung" src="resources/images/tung.png">
	    	</c:if>
	    </div>
    	<div id="content_insert">
    		<textarea id="replay_content" cols="100" rows="11"></textarea>
    		<button id="reply_btn">댓글 작성</button>
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
		            <textarea id="rpt_content" style="width:300px; height:260px; border:2px solid; border-radius: 13px;">
		
		            </textarea>
		        </ul>
		        <button type="button" id="mukReport" style="position:absolute; left:155px; bottom:-30px; border-radius:10px; padding:5px"><b>신고하기</b></button>
		    </div>
	    </div>
    </div>
  	
  	<br clear="both">
  	<jsp:include page="../common/footer.jsp"/>
</body>
<script>
	$("#like").on("click",function(){
		$id = $("#id").val();
		$bNum = $("#bNum").val();
		console.log($id);
		$.ajax({
			url:"boardLike.do",
			dataType:"json",
			type:"post",
			data:{id:$id, bNum:$bNum},
			success:function(data){
				if(data.msg == "성공"){
					$("#like").text("");
					$("#like").text(" 좋아요 : " + data.count);
				}
				else{
					
				}
			},
			error:function(data){
				
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
					$("#reply_area").append("<ul class='reply' style='margin-top:20px;'>"+
					    						"<li style='list-style:none; text-align:left;'>"+
					    							"<p><input type='hidden' id='rep1_num' value="+ data.currval +"><a class='reply_id'>"+ $id +" : </a><a class='reply_content'>"+$rep_cont+"</a></p>"+
		    									"</li>"+
									    	"</ul>");
				},
				error:function(data){
					
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
			$(this).parents("li").append("<div class='re_reply_content_area'>"+
											"<textarea class='re_reply_content' cols='100' rows='11'>"+
											"</textarea>"+
											"<button class='re_reply_btn'>댓글달기</button>"+
										"</div>");
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
					$(".re_reply_content_area").parents("li").append("<ul class='re_reply'>"+
										  								 "<li class='re_reply_item'>"+
											  								 "<p>"+
									    										 "<a class='re_reply_id'>"+ $id +" : </a>"+
									    										 "<a class='re_reply_content'>"+ $rep_cont +"</a>"+
								    										 "</p>"+
							    										 "</li>"+
						    										 "</ul>");
						    										 
					$(".re_reply_content_area").remove();
				},
				error:function(data){
					
				}
			})
			
		})
		
		//---------------------------------------------------------------------------------------------------------------
		//대댓글
		$(document).on("click",".re_reply_content",function(){
			console.log("대댓글");
			$(this).parents("p").parents(".re_reply_item").append("<div class='re_reply_content_area'>"+
																	"<textarea class='re_replt_content' cols='100' rows='11'>"+
																	"</textarea>"+
																	"<button class='re_re_reply_btn'>댓글달기</button>"+
																	"</div>");
		})	
		
		//대대댓글 달기 ajax
		$(document).on("click",".re_re_reply_btn",function(){
			$rep1_num = $(this).parents(".re_reply_content_area").parents("li").children("p").children("#rep1_num").val()
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
					$(".re_reply_content_area").parents("li").parents("li").append("<ul class='re_reply'>"+
										  								 "<li class='re_reply_item'>"+
											  								 "<p>"+
									    										 "<a class='re_reply_id'>"+ $id +" : </a>"+
									    										 "<a class='re_reply_content'>"+ $rep_cont +"</a>"+
								    										 "</p>"+
							    										 "</li>"+
						    										 "</ul>");
						    										 
					$(".re_reply_content_area").remove();
				},
				error:function(data){
					
				}
			})
			
		})
		
	})
</script>
</html>