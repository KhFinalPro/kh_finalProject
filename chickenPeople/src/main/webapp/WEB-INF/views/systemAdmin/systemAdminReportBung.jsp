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
	*{font-size:22px;}

	.item {background: #fff; overflow:scroll;margin-bottom: 10px; padding: 15px; font-size: 14px; height: 873px; border-bottom-right-radius: 20px;justify-content: center; align-items: center; margin-top: -30px; }

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
	#deleteBtn{margin-left: 1450px; position: fixed;}
	
	#main_section{margin: auto; width: 80%; margin-top: -30px; clear: both;}
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
		
	
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=42ae5ba7b91c000e8dd51ef7b13009b4&libraries=services,clusterer,drawing"></script>

</head>
<body>
<jsp:include page="../common/systemAdminHeader.jsp"/>
	<div class="wrapper">
		<div class="main_container">
			<div class="item">
			<br clear="both">
				<div class="menuHeader">
				
					<p style="font-size:30px;">신고 상세</p>
					<br><hr><br>
						<button id="deleteBtn" onclick="location.href='${updateReport}'">삭제</button>
						<br clear="both">
	
	<input type="hidden" id="bung_num" name="bung_num" value="${bung.bung_num }"/>
	<input type="hidden" id="user_id" value="${sessionScope.loginUser.id }"/>
	<input type="hidden" id="myPageStatus" value="${myPageStatus }">
    <section id="main_section">
        <div id="head_area">
            <div id="brand_logo" class="head_line">
                <img src="resources/images/${bung.bung_img }.png">
            </div>
            <div id="title" class="head_line">
                <h2>${bung.bung_title }</h2>
            </div>
            <br clear="both">
            
            <div id="good_contents" class="head_second_line">
            	<div id="bung_like">
            		<h4>치킨민족 ${bung.bung_like }명이 관심있고, 총 ${bung.bung_hit }번 봤어요</h4>
            	</div>
            </div>
            <br clear="both">
        </div><!-- id head_area end -->
			
        <h4>치킨번개 정보</h4>

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
					
				</div><!-- class menuHeader End -->
			</div><!-- class item end -->
		</div><!--class main_container end -->
	</div><!--class wrapper end -->
</body>
<script>
 $(function(){
		$("#report").children().addClass('active');

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

 })
</script>
</html>