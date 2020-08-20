<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>치민_번개</title>
	<style>
		#main_section{margin: auto; width: 80%; margin-top: 100px; clear: both;}
		#main_section>h2{color:#0070C0;}
		#main_section>#head_area{margin: auto; width: 90%; height: 100%; z-index: 0;}
		
		#main_section>#head_area>.head_line{float: left; text-align: center;}
		/*로고*/
		#main_section>#head_area>#brand_logo{width: 40%; height: 250px;}
		#main_section>#head_area>#brand_logo>img{width: 100%; height: 250px;}
		/*제목*/
		#main_section>#head_area>#title{width: 55%; height: 250px; line-height: 50px; font-size: 25px; color: black; word-break: break-all;}
		#main_section>#head_area>#title>h2{margin-top: 100px;}
		/*관심*/
		#main_section>#head_area>#good>h3{margin: 0 auto; width: 100px; height: 50px; border-radius: 15px; background-color: #0070C0; color: white; line-height: 50px; text-align: center;}
		#main_section>#head_area>#good>h3:hover{color:black; cursor:pointer;}
		#main_section>#head_area>#good_contents{margin-left: 10px;}
		#main_section>#head_area>.head_second_line{float: left;}
		
		/*마감*/
		#main_section>#head_area>#bung_status>h3{margin: 0 auto; width: 100px; height: 50px; border-radius: 15px; background-color: #0070C0; color: white; line-height: 50px; text-align: center;}
		#main_section>#head_area>#bung_status>h3:hover{color:black; cursor:pointer;}
		/* #main_section>#head_area>#good_contents{margin-left: 10px;} */
		#main_section>#head_area>.head_second_line{float: left;}
		
		/*채팅*/
		#main_section>#head_area>#chatting>h3{margin: 0 auto; width: 100px; height: 50px; border-radius: 15px; background-color: #0070C0; color: white; line-height: 50px; text-align: center;}
		#main_section>#head_area>#chatting>h3:hover{color:black; cursor:pointer;}
		#main_section>#head_area>#chatting_status{margin-left: 10px;}
		#main_section>#head_area>.head_tree_line{float: left;}
		
		/*채팅*/
		#main_section>#head_area>#massage>h3{margin: 0 auto; width: 100px; height: 50px; border-radius: 15px; background-color: #0070C0; color: white; line-height: 50px; text-align: center;}
		#main_section>#head_area>#massage>h3:hover{color:black; cursor:pointer;}
		#main_section>#head_area>#chatting_status{margin-left: 10px;}
		#main_section>#head_area>.head_tree_line{float: left;}
		
		#main_section>#head_area>#report>h3{margin: 0 auto; width: 100px; height: 50px; border-radius: 15px; background-color: #0070C0; color: white; line-height: 50px; text-align: center;}
		#main_section>#head_area>#chatting_status{margin-left: 10px;}
		#main_section>#head_area>.head_tree_line{float: left;}
		
		/*시간 정보*/
		#main_section>#date>img{width: 50px; height: 50px;}
		#main_section>#date_info{margin-left: 10px; height: 25px; line-height: 25px;}
		#main_section>.info_first_area{float: left;}
		
		/*위치 정보*/
		#main_section>#location>img{width: 50px; height: 50px;}
		#main_section>#location_info{margin-left: 10px; height: 25px; line-height: 25px;}
		#main_section>.info_second_area{float: left;}
		
		/*모임 정보*/
		#main_section>#user>img{width: 50px; height: 50px;}
		#main_section>#user_info{margin-left: 10px; height: 25px; line-height: 25px;}
		#main_section>.info_tree_area{float: left;}
		
		/*지도*/
		#main_section>#map{width: 100%; height: 400px; border: 1px solid black;}
		
		/*게시글 등록자*/
		#main_section>#my>img{width: 50px; height: 50px; border-radius:25px; border:1px solid black;}
		#main_section>#my_info{margin-left: 10px; height: 25px; line-height: 25px;}
		#main_section>.info_four_area{float: left;}
		
		/*태그*/
		#main_section>#tag_area{margin: 20px; color:blue;}
		#main_section>#tag_area:hover{cursor:pointer;}
		
		/*번개 내용 / 소개 */
		#main_section>#text_area{margin: auto; width: 90%;}
		#main_section>#text_area>p{font-size:20px; font-weight:600;}
		#main_section>#text_area>pre{margin: auto; width: 100%; font-size: 15px; font-weight: 600; resize:none;}
		
		/*번개 수정하기 버튼*/
		#UpdateBung{float:right; height: 50px; width: 200px; font-size:25px; font-weight:600; border: 0px;}
		#UpdateBung:hover{color:#2ac1bc; background-color: white;}
		
		#msgReplyModal{position: fixed; display:none; width: 100%; height: 100%; top: 0; left: 0; background-color: rgba(0, 0, 0, 0.7); z-index: 9999;}
		#msgReplyModal>div{width: 400px; height: 500px; background-color: #fff; border-radius: 20px; position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%);}
		
		#report_modal{position: fixed; display:none; width: 100%; height: 100%; top: 0; left: 0; background-color: rgba(0, 0, 0, 0.7); z-index: 9999;}
		#report_modal>div{width: 400px; height: 550px; background-color: #fff; border-radius: 20px; position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%);}
	</style>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=42ae5ba7b91c000e8dd51ef7b13009b4&libraries=services,clusterer,drawing"></script>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
	<br clear="both">
	
	<input type="hidden" id="bung_num" name="bung_num" value="${bung.bung_num }"/>
	<input type="hidden" id="user_id" value="${sessionScope.loginUser.id }"/>
	<input type="hidden" id="myPageStatus" value="${myPageStatus }">
    <section id="main_section">
    	<c:if test="${myPageStatus == 'y' }">
    		<button id="UpdateBung">번개 수정하기</button>
        </c:if>
        
        
        <div id="head_area">
            <div id="brand_logo" class="head_line">
                <img src="resources/images/${bung.bung_img }.png">
            </div>
            <div id="title" class="head_line">
                <h2>${bung.bung_title }</h2>
            </div>
            
            <br clear="both"><br>

            <div id="good" class="head_second_line">
                <h3 id="good_click">관심있음</h3>
            </div>
            <div id="good_contents" class="head_second_line">
            	<div id="bung_like">
            		<h4>치킨민족 ${bung.bung_like }명이 관심있고, 총 ${bung.bung_hit }번 봤어요</h4>
            	</div>
            </div>
            <c:if test="${sessionScope.loginUser.id == bung.user_id }">
            	<div id="bung_status" class="head_second_line" style="float:right;">
            		<c:if test="${bung.bung_status == '모집중' }">
            			<h3>마감</h3>
            		</c:if>
            		<c:if test="${bung.bung_status == '마감' }">
            			<h3>모집</h3>
            		</c:if>
           		</div>
            </c:if>

            <br clear="both">
            <c:if test="${!empty sessionScope.loginUser }">
	            <div id="massage" class="head_tree_line">
	            	<h3 id="massage_click">메세지</h3>
	            </div>
	            <div id="report" class="head_tree_line" style="float:right;">
	            	<h3 id="report_click">신고</h3>
	            </div>
            </c:if>

            <br clear="both">
        </div>

        <hr>
        <h2>치킨번개 정보</h2>

        <div id="date" class="info_first_area"><img src="resources/images/date.png" alt=""></div>
        <div id="date_info" class="info_first_area"><h4>${bung.bung_date }</h4></div>
        <br clear="both">

        <div id="location" class="info_second_area"><img src="resources/images/location.png" alt=""></div>
        <div id="location_info" class="info_second_area"><h4>${bung.bung_addr }</h4></div>
        <br clear="both">

        <div id="user" class="info_tree_area"><img src="resources/images/userIcon.png" alt=""></div>
        <div id="user_info" class="info_tree_area"><h4>${bung.bung_p_no }명까지</h4></div>

        <br clear="both"><br>

        <div id="map">
        	<input type="text" id="address" name="address" value="${bung.bung_addr }"/>  
        </div>

        <br><br>
        <c:if test="${!empty bung.pic }">
        	<div id="my" class="info_four_area"><img src="resources/propic/${bung.pic }" alt=""></div>
        </c:if>
        <c:if test="${empty bung.pic }">
        	<div id="my" class="info_four_area"><img src="resources/images/hMypage.png" alt=""></div>
        </c:if>
        <div id="my_info" class="info_four_area"><h4 id="create_user_id">${bung.user_id }</h4></div>

        <br clear="both">

        <div id="tag_area">
        	<c:forEach var="t" items="${tagList }">
            	<a class="tagBtn" value="${t.tag_num }">#${t.tag_name }</a>&nbsp;
            </c:forEach>
        </div>

        <div id="text_area">
            <p>치킨번개 모집 내용 / 소개</p>
            <pre>${bung.bung_int }</pre>
        </div>
    </section>

    <br clear="both">
	
	<%@ include file="../common/footer.jsp" %>

	<!-- 모달 -->
	<div id="msgReplyModal">
	    <div>
	        <a href="javascript: $('#msgReplyModal').fadeOut(500);" style="width: 25px; height: 25px; position: absolute; top: 30px; right: 35px; display: block;">
	            <img src="resources/images/close.png" style="width: 100%;"/>
	        </a>
	        <div style="position: absolute; top : 53px; left:35px;">
		        <table id="replyMessage">
		            <tr >
		                <th style="width: 100px; height: 50px; font-size:22px;">Title</th>
		                <td><input id="modal_reply_title" type="text" style="border:2px solid; border-radius:6px; height:20px;"></td>
		            </tr>
		        </table>
	    	</div>
		    <div style="position: absolute; top : 100px; left:12px;">
		        <ul style="list-style: none;">
		            <li style="margin-bottom: 12px;  font-size:20px;"><b>Message</b></li>
		            <textarea id="modal_reply_content" style="width:300px; height:260px; border:2px solid; border-radius: 13px;">
		
		            </textarea>
		        </ul>
		        <button type="button" id="bungMessage" style="position:absolute; left:155px; bottom:-30px; border-radius:10px; padding:5px"><b>보내기</b></button>
		    </div>
	    </div>
    </div>
    
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
		                	<input type="hidden" id="br_code" name="br_code" value="B_BUNG">
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
		        <button type="button" id="bungReport" style="position:absolute; left:155px; bottom:-30px; border-radius:10px; padding:5px"><b>신고하기</b></button>
		    </div>
	    </div>
    </div>
</body>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch($("#map").children("#address").val(), function(result, status) {
		
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="margin: auto; width:150px; text-align:center; padding:6px 0; background-color: #2ac1bc; color:white;">번개 장소</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
</script>
<script>
	$(function(){
		$("#good_click").on("click",function(){
			$bung_num = $("#bung_num").val();
			$.ajax({
				url:"bungLike.do",
				data:{bung_num:$bung_num},
				dataType:"json",
				type:"post",
				success:function(data){
					var value="";
					value += "<h4>치킨민족 " + data.list[0].bungLike + "명이 관심있고, 총 " + data.list[0].bungHit + "번 봤어요</h4>";						
					$("#bung_like").html(value);	
				},
				error:function(data){
					alert("error code: " + request.status + "\n"
	                          +"message: " + request.responseText
	                          +"error: " + errorData);
				}
			})
		})
		
		$(".tagBtn").on("click",function(){
			$tag_num = $(this).attr('value');
			
			location.href="bungTagList.do?tag_num=" + $tag_num;
		})
		
		$("#UpdateBung").on("click",function(){
			$bung_num = $("#bung_num").val();
			location.href="bungUpdateView.do?bung_num=" + $bung_num;
		})
		
		$("#massage_click").on("click",function(){
			$("#msgReplyModal").fadeIn(500);
		})
		
		$("#bungMessage").on("click",function(){
			$rev_id = $("#create_user_id").text();
			$send_id = $("#user_id").val();
			$msg_contents = $("#modal_reply_content").val();
			$msg_title = $("#modal_reply_title").val();
			$.ajax({
				url:"bungMessage.do",
				data:{rev_id:$rev_id, send_id:$send_id, msg_contents:$msg_contents, msg_title:$msg_title},
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.success == 'y'){
						console.log("메세지 성공");
						$("#msgReplyModal").fadeOut(500);
					}						
					else{
						console.log("실패");
					}
				},
				error:function(request, status, errorData){
	            	alert("error code: " + request.status + "\n"
	                    +"message: " + request.responseText
	                    +"error: " + errorData);
				}
			})
		})
		
		//신고
		$("#report").on("click",function(){
			$("#report_modal").css("display","block");
		})
		
		//신고하기버튼 ajax
		$("#bungReport").on("click",function(){
			$bung_num = $("#bung_num").val();
			$rpt_content = $("#rpt_content").val();
			$rpt_code = $("#rpt_code").val();
			$br_code = $("#br_code").val();
			$user_id = $("#create_user_id").html();
			$.ajax({
				url:"reportInsert.do",
				data:{br_Num:$bung_num, rpt_Content:$rpt_content, rpt_Code:$rpt_code, br_Code:$br_code, user_Id:$user_id},
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
		
		//마감처리
		$("#bung_status").on("click",function(){
			$bung_num = $("#bung_num").val();
			$user_id = $("#create_user_id").html();
			$myPageStatus = $("#myPageStatus").val();
			$bung_status = $("#bung_status").children("h3").text();
			
			if($bung_status == "모집"){
				$bung_status = "모집중";
				location.href="bungStatusUpdate.do?bung_num="+$bung_num+"&user_id="+$user_id+"&bung_status="+$bung_status+"&myPageStatus="+$myPageStatus;
			}
			else if($bung_status == "마감"){
				$bung_status = "마감";
				location.href="bungStatusUpdate.do?bung_num="+$bung_num+"&user_id="+$user_id+"&bung_status="+$bung_status+"&myPageStatus="+$myPageStatus;
			}
		})
	})
</script>
</html>