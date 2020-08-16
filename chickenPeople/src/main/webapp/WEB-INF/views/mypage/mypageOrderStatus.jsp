<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배달현황</title>
<style>
	/* delivery section*/
    #my_delivery{margin: 0 auto; margin-top:20px; width: 70%; height: 700px; overflow: auto; margin-top:100px;}
    #my_delivery #my_delivery_head{margin: 0 auto; width: 100%; height: 80px; line-height: 40px; background-color: white; box-shadow: 0px 10px 5px rgb(235, 235, 232);}
    #my_delivery #my_delivery_head>h2{margin-left: 40px; float: left;}

    #my_delivery #my_delivery_info_area{margin: 0 auto; width: 100%; margin-top: 20px;}
    /* #my_delivery #my_delivery_info_area .my_delivery{display: inline-block;} */
    #my_delivery #my_delivery_info_area .my_delivery{float:left; width: 49%; height: 100%;}
    #my_delivery #my_delivery_info_area #my_delivery_info{border-right: 1px solid black;}
    #my_delivery #my_delivery_info_area #my_delivery_info .delivery_info{margin-bottom: 5px; margin-left: 20px; font-size: 25px; color:rgb(199, 198, 198)}
    #my_delivery #my_delivery_info_area #my_delivery_info .order_num{color: blue;}
    #my_delivery #my_delivery_info_area #my_delivery_info .delivery_info_detail{margin: 0 auto; margin-left: 20px; font-size: 20px;}
    #my_delivery #my_delivery_info_area #my_delivery_info .brand_logo{width: 200px; height: 100px;}

    #my_delivery #my_delivery_info_area #my_menu_info_area{}
    #my_delivery #my_delivery_info_area #my_menu_info_area .menu_area{margin-left: 20px;}
    #my_delivery #my_delivery_info_area #my_menu_info_area .menu_area .menu_info{float: left; margin-right: 10px;}
    #my_delivery #my_delivery_info_area #my_menu_info_area .menu_area .menu_num{margin:0; font-size: 25px; top:0px;}
    #my_delivery #my_delivery_info_area #my_menu_info_area .menu_area img{width: 100px; height: 100px;}

    #map{margin: 0 auto; margin-top: 20px; width: 50%; height: 400px; border: 1px solid black;}

    .delivery_info_title{text-align: center;}
    
    #delivery_status{color:blue;}
    
    #msg_area{text-align:center;}
	#msg_area > img{width:20%; heigth:20%;}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=42ae5ba7b91c000e8dd51ef7b13009b4&libraries=services,clusterer,drawing"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<input type="hidden" id="id" value="${sessionScope.loginUser.id }">
	<input type="hidden" id="brand_code" value="${menuList.get(0).brand_code }"/>
	<input type="hidden" id="sto_addr" value="${menuList.get(0).sto_addr }"/>
	<jsp:include page="../common/header.jsp"/>
	
	
	
	
	<c:if test="${!empty paymentList }">
	
		<div id="my_delivery">
	        <div id="my_delivery_head">
	            <h2>주문일자 : ${paymentList.pay_date }</h2>
	            <h2 id="delivery_status">배달현황 : ${paymentList.ord_status }</h2>
	        </div>
	        <div id="my_delivery_info_area">
	            <!-- 제일 좌측 주문정보 -->
	            <div id="my_delivery_info" class="my_delivery">
	                <h2 class="delivery_info_title">주문정보</h2>
	                <img class="brand_logo delivery_info" src="resources/images/${menuList.get(0).brand_pic }.png">
	                <p id="order_num" class="delivery_info">주문번호:</p>
	                <p class="order_num delivery_info_detail">${paymentList.ord_num }</p>
	                <p id="delivery_time" class="delivery_info">배달 시간:</p>
	                <p class="delivery_time delivery_info_detail">${paymentList.delivery_time }</p>
	                <p id="delivery_addr" class="delivery_info">주소:</p>
	                <p id="user_addr" class="delivery_addr delivery_info_detail">${paymentList.pay_addr }</p>
	                <p id="total_price" class="delivery_info">합계금액:</p>
	                <p class="delivery_total_price delivery_info_detail"><fmt:formatNumber value="${paymentList.pay_toal }" type="currency"/></p>
	            </div>
	
	            <!-- 가운데 메뉴 정보 -->
	            <div id="my_menu_info_area" class="my_delivery">
	                <h2 class="delivery_info_title">메뉴정보</h2>
	                <c:forEach var="m" items="${menuList }">
		                <div class="menu_area">
		                	<input type="hidden" id="menu_num" value="${m.menu_num }">
		                    <p class="menu_num menu_info">${m.mord_num }</p>
		                    <img class="menu_pic menu_info" src="resources/menu/${m.menu_pic }.jpg">
		                    <p class="menu_name menu_info">${m.menu_name }<br><span class="price"><fmt:formatNumber value="${m.menu_price }" type="currency"/>원</span></p>
		                </div>
		                <br clear="both">
		                <br>
	                </c:forEach>
	            </div>
	        </div>
	    </div>
	
	    <div id="map">지도</div>
	</c:if>
	
	<c:if test="${!empty msg }">
		<div id="msg_area">
			<img src="resources/images/tung.png">
		</div>
	</c:if>
	
	<br clear="both">
	
	<jsp:include page="../common/footer.jsp"/>
</body>
<script>
	$(function(){
		
	    $(".brand_logo").on("click",function(){
	    	location.href="searchStore.do?brand_code="+$("#brand_code").val();
	    })
	    
	    //새로고침
	    setInterval(function(){
	    	location.href="orderStatus.do?id="+ $("#id").val();
	    }, 50000);
	    
	    
	    //메뉴 사진 hover시 ajax
	    /* $(".menu_pic").hover(function(){
	    	$.ajax({
	    		
	    	})
	    }) */
	    
	
	
	
		var user_addr = $("#user_addr").text();
	    var sto_addr = $("#sto_addr").val();

	
	   var mapContainer = document.getElementById('map');
	   var mapOption = {
	       center: new daum.maps.LatLng(37.450701, 126.570667),
	       level: 5
	   };  
	
	   var map = new daum.maps.Map(mapContainer, mapOption); 
	
	   var geocoder = new daum.maps.services.Geocoder();
	   var listData = [
		   user_addr, 
	       sto_addr
	   ];
	   var listName = ["사용자", "매장"];
	
	   listData.forEach(function(addr, index) {
	       geocoder.addressSearch(addr, function(result, status) {
	           if (status === daum.maps.services.Status.OK) {
	               var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	
	               var marker = new daum.maps.Marker({
	                   map: map,
	                   position: coords
	               });
	               var infowindow = new daum.maps.InfoWindow({
	                   content: '<div style="width:150px;text-align:center;padding:6px 0;">' + listName[index] + '</div>',
	                   disableAutoPan: true
	               });
	               infowindow.open(map, marker);

	               map.setCenter(coords);
	           } 
	       });
	   });
	})
</script>
</html>