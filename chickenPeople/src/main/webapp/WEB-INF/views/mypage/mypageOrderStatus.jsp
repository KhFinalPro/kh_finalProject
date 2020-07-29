<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배달현황</title>
<style>
	/* delivery section*/
    #delivery_sec{margin:0 auto; width: 90%; margin-top: 10px;}
    #delivery_sec p{margin: 0; width: 100%; text-align: center; height: 50px; line-height: 50px; background-color: #2ac1bc; color: white; font-size: 30px; font-weight: bold;}
    #delivery_sec #progress_area{margin: auto; margin-top: 50px; width: 90%; height: 50px;}
    #delivery_sec #progress_area progress{width: 100%; height: 100px; color: #735949;}
    #delivery_sec #progress_area #progress_status{margin: auto; width: 100%;}
    #delivery_sec #progress_area #progress_status ul{margin: 0 auto; padding: 0;}
    #delivery_sec #progress_area #progress_status ul li{float: left; margin: auto; width: 33.33%; list-style: none; font-size: 20px;}
    #delivery_sec #location{margin: auto; width: 90%; margin-top: 50px; height: 400px; border: 1px solid black; text-align: center;}
    #map{width:100%; height:100%;}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=42ae5ba7b91c000e8dd51ef7b13009b4&libraries=services,clusterer,drawing"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<jsp:include page="../common/sidebar.jsp"/>
	
	<section id="delivery_sec">

	    <p>주문현황</p>
	
	    <div id="progress_area">
	        <progress value="0" max="100" id="progress"></progress>
	        <div id="progress_status">
	            <ul>
	                <li style="text-align: left;">배달 준비중</li>
	                <li style="text-align: center;">배달 중</li>
	                <li style="text-align: right;">배달 완료</li>
	            </ul>
	        </div>
	    </div>
	    <br clear="both">
	    <div id="location">
	        <div id="map"></div>
	    </div>
	</section>
	
	<br clear="both">
	
	<jsp:include page="../common/footer.jsp"/>
</body>
<script>
	$(function(){
	    startVal=0;
	    maxVal=40;
	
	    setInterval(function(){
	        if(startVal <= maxVal){
	            startVal++;
	            $("#progress").val(startVal);
	        }
	    },10)
	})
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(37.516186, 127.059691), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	 
	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [
	    {
	        title: '사용자', 
	        latlng: new kakao.maps.LatLng(37.516186, 127.059691)
	    },
	    {
	        title: '매장', 
	        latlng: new kakao.maps.LatLng(37.486888, 127.103443)
	    }
	];
	
	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	    
	for (var i = 0; i < positions.length; i ++) {
	    
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	    });
	}
</script>
</html>