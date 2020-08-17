<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.chickenPeople.store.model.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
 	.menuSearch { -webkit-appearance: none;  -moz-appearance: none; appearance: none; }
    .menuSearch { width: 400px; background-color:white; padding:7px 25px;  font-family: inherit;  -webkit-appearance: none; -moz-appearance: none; appearance: none; border: 1px solid #999; border-radius: 0px; }
	 select { -webkit-appearance: none;  -moz-appearance: none; appearance: none; background: "lowerArrow.png" no-repeat 95% 50%; /* 화살표 모양의 이미지 */ }
     select { width: 200px; background-color:white; padding:7px 25px;  font-family: inherit; background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;  -webkit-appearance: none; -moz-appearance: none; appearance: none; border: 1px solid #999; border-radius: 0px; }
     select::-ms-expand { /* for IE 11 */ display: none; }
    .menuHeader{margin:0 auto; width:90%; margin-top:30px;}
	.menuResultTable{margin:0 auto; width:90%;}
	.resultTable { width:100%; border-top:1px solid #444444; border-bottom:1px solid #444444; margin:0 auto;} .resultTable td{text-align:center;} .resultTable th,td{padding:7px;}
	.resultTable td .resultTable th{ height:30px; border-bottom:1px solid #444444; border-top:1px solid #444444; padding:10px;}
	.resultTable tr{height:40px;}
	button{border:1px solid rgb(46,78,173); background-color:white; color:rgb(46,78,173); padding:6px; width:200px;}
	
	#map{margin: 0 auto; margin-top: 20px; width: 100%; height: 600px; border: 1px solid black;}
	
</style>
</head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=42ae5ba7b91c000e8dd51ef7b13009b4&libraries=services,clusterer,drawing"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<body>
<jsp:include page="../common/systemAdminHeader.jsp"/>
<div class="wrapper">
	<div class="main_container">
		<div class="item"> 
		<br clear="both">
			
			<input type="hidden" id="storeList" value="${searchStoreList }"/>
			<div class="menuHeader">
				<p style="font-size:20px;">멘트추천받습니다</p>
				<br><hr><br>
				
				<form action="systemAdminMap.do" method="get">
					<table class="searchTable">
						<tr>
							<td><b>매장 검색</b></td>
							<c:if test="${empty searchStatus.searchName}">
								<td><input class="menuSearch" name="storeSearch" type="text" placeholder="주소명을 입력해주세요.(예:구로구)"></td>
							</c:if>
							<c:if test="${not empty searchStatus.searchName }">
								<td><input class="menuSearch" name="storeSearch" type="text" value="${searchStatus.searchName}"></td>
							</c:if>
							<td colspan="2">
								<button type="submit">검색</button>
							</td>
						</tr>
						
					</table>
				</form>
			</div><!-- menuHeader end -->
			<div class="menuResultTable">
			<br><hr><br>
				<div id="map"></div>
				<!-- 여기에 지도 -->
			</div><!-- class menuResultTable end -->
		</div><!-- class item end -->
	</div><!-- class main_container end -->
</div><!-- class wrapper end -->
<script>
$(function(){
	/* var user_addr1 = new Array();
	var user_addr2 = new Array();
	user_addr1 = $("#storeList").val();
	 */
	//user_addr2 = "<c:out value='${searchStoreList[0]}'/>"
	
	
    var addrList = new Array();
	var nameList = new Array();
	
	<c:forEach var="addr" items="${searchStoreList }">
		addrList.push("${addr.sto_addr}");
		nameList.push("${addr.sto_name}");
	</c:forEach>
	
	
   var mapContainer = document.getElementById('map');
   var mapOption = {
       center: new daum.maps.LatLng(37.450701, 126.570667),
       level: 5
   };  

   var map = new daum.maps.Map(mapContainer, mapOption); 

   var geocoder = new daum.maps.services.Geocoder();
/*    var listData = [];
   var listName = []; */
   

   addrList.forEach(function(addr, index) {
	   console.log(addr);
       geocoder.addressSearch(addr, function(result, status) {
           if (status === daum.maps.services.Status.OK) {
               var coords = new daum.maps.LatLng(result[0].y, result[0].x);

               var marker = new daum.maps.Marker({
                   map: map,
                   position: coords
               });
               var infowindow = new daum.maps.InfoWindow({
                   content: '<div style="width:150px;text-align:center;padding:6px 0;">' + nameList[index] + '</div>',
                   disableAutoPan: true
               });
               infowindow.open(map, marker);

               //map.setCenter(coords);
           } 
       });
   });
})
</script>
</html>