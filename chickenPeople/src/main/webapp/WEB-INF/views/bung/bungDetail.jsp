<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		#main_section{margin: auto; width: 80%; margin-top: 200px; clear: both;}
		#main_section>#head_area{margin: auto; width: 90%; height: 100%; z-index: 0;}
		
		#main_section>#head_area>.head_line{float: left; text-align: center;}
		/*로고*/
		#main_section>#head_area>#brand_logo{width: 40%; height: 250px;}
		#main_section>#head_area>#brand_logo>img{width: 100%; height: 250px;}
		/*제목*/
		#main_section>#head_area>#title{width: 55%; height: 250px; line-height: 50px; font-size: 25px; color: black; word-break: break-all;}
		#main_section>#head_area>#title>h2{margin-top: 100px;}
		/*관심*/
		#main_section>#head_area>#good>h3{margin: 0 auto; width: 100px; height: 50px; border-radius: 15px; background-color: #2ac1bc; color: white; line-height: 50px; text-align: center;}
		#main_section>#head_area>#good>h3:hover{color:black;}
		#main_section>#head_area>#good_contents{margin-left: 10px;}
		#main_section>#head_area>.head_second_line{float: left;}
		
		/*채팅*/
		#main_section>#head_area>#chatting>h3{margin: 0 auto; width: 100px; height: 50px; border-radius: 15px; background-color: #2ac1bc; color: white; line-height: 50px; text-align: center;}
		#main_section>#head_area>#chatting>h3:hover{color:black;}
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
		#main_section>#my>img{width: 50px; height: 50px;}
		#main_section>#my_info{margin-left: 10px; height: 25px; line-height: 25px;}
		#main_section>.info_four_area{float: left;}
		
		/*태그*/
		#main_section>#tag_area{margin: 20px;}
		
		/*번개 내용 / 소개 */
		#main_section>#text_area{margin: auto; width: 90%;}
		#main_section>#text_area>textarea{margin: auto; width: 100%;}
	</style>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=adf020d83fc09d8567b48751e315e48a&libraries=services"></script>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
	<br clear="both">
	
	<input type="hidden" id="bung_num" name="bung_num" value="${bung.bung_num }"/>
	
    <section id="main_section">
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
            <br clear="both">

            <div id="chatting" class="head_tree_line">
            	<h3 id="chatting_click">채팅참여</h3>
            </div>
            <div id="chatting_status" class="head_tree_line"><h4>치킨민족 ${bung.bung_chat }명 참여중이에요</h4></div>
            <br clear="both">
            
        </div>

        <hr>
        <h3>치킨번개 정보</h3>

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
        
        <div id="my" class="info_four_area"><img src="resources/images/userIcon.png" alt=""></div>
        <div id="my_info" class="info_four_area"><h4>${bung.user_id }</h4></div>

        <br clear="both">

        <div id="tag_area">
        	<c:forEach var="t" items="${tagList }">
            	<a class="tagBtn" value="${t.tag_num }">#${t.tag_name }</a>&nbsp;
            </c:forEach>
        </div>

        <div id="text_area">
            <h4>치킨번개 모집 내용 / 소개</h4>
            <textarea name="contents" id="contents" cols="127" rows="10">${bung.bung_int }</textarea>
        </div>
    </section>

    <br clear="both">
	
	<%@ include file="../common/footer.jsp" %>

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
					value += "<h4>치킨민족 " + data.list[0].bungLike + "명이 관심있고, 총" + data.list[0].bungHit + "번 봤어요</h4>";						
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
	})
</script>
</html>