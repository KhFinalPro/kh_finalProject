<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>주소지변경</title>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=42ae5ba7b91c000e8dd51ef7b13009b4&libraries=services,clusterer,drawing"></script>
    
        <style>
            #myPage_address_area{margin: 0 auto; width: 90%; margin-top: 150px;}
            #myPage_address_area #add_address{margin: 0 auto; width:80%; text-align:center;}
            #myPage_address_area #add_address #addr1{width:99%; margin-bottom: 10px; height:30px; line-height:30px; font-size: 20px;}
            #myPage_address_area #add_address #post{width:30%; height:30px; line-height:30px; font-size: 20px;}
            #myPage_address_area #add_address #addr2{width:68%; height:30px; line-height:30px; font-size: 20px;}
            #myPage_address_area #add_address button{width:100%; height:50px; border: 0px; background-color: #2ac1bc; color:white; font-size:20px; font-weight:600;}
            #myPage_address_area #address_list{margin: 0 auto; width: 80%; height: 100%; text-align: left; vertical-align: middle;}
		    #myPage_address_area #address_list input{width: 20px; height:20px; border-radius: 15px; border:2px solid #2ac1bc;}
            #myPage_address_area #address_list label{height: 50px; line-height: 50px; font-size: 20px; font-weight:550;}
			#h2{margin-top: 20px; margin-left:20px;}
        </style>
    </head>
    
    <body>
       <jsp:include page="../common/header.jsp"/>
		
		<form id="mypageAddress" method="post" action="addAddress.do">
		
        <section id="myPage_address_area">
            <div id="add_address">
        	<h2 id="h2">주소지변경</h2>
                <input type="text" id="addr1" name="addr1" readonly>
                <input type="text" id="post" name="post" readonly>
                <input type="text" id="addr2" value="addr2">
                <br><br>
                <button type="button" onclick="execPostCode();">주소추가</button>
            </div>
            
            <div id="address_list">
                <hr>
                <h2>최근 주소</h2>
                <input type="checkbox" id="address1" value="주소"><label for="address1">서울특별시 강남구 테헤란로4길 6 (역삼동, 강남역 센트럴 푸르지오 시티)</label><br>
                <input type="checkbox" id="address1" value="주소"><label for="address1">서울특별시 강남구 테헤란로4길 6 (역삼동, 강남역 센트럴 푸르지오 시티)</label><br>
                <input type="checkbox" id="address1" value="주소"><label for="address1">서울특별시 강남구 테헤란로4길 6 (역삼동, 강남역 센트럴 푸르지오 시티)</label><br>
                <input type="checkbox" id="address1" value="주소"><label for="address1">서울특별시 강남구 테헤란로4길 6 (역삼동, 강남역 센트럴 푸르지오 시티)</label><br>
                <p style="float:right">삭제시 주소를 선택해서 삭제해주세요.</p>
                <br clear="both">
            </div>
        </section>
        </form>
        <div id="map" style="display:none"></div>
        <%@ include file="../common/footer.jsp"%>
    </body>
    <script>
	    function execPostCode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	               // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	               var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	               var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	
	               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                   extraRoadAddr += data.bname;
	               }
	               // 건물명이 있고, 공동주택일 경우 추가한다.
	               if(data.buildingName !== '' && data.apartment === 'Y'){
	                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	               }
	               // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	               if(extraRoadAddr !== ''){
	                   extraRoadAddr = ' (' + extraRoadAddr + ')';
	               }
	               // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	               if(fullRoadAddr !== ''){
	                   fullRoadAddr += extraRoadAddr;
	               }
	
	               // 우편번호와 주소 정보를 해당 필드에 넣는다.
	               console.log(data.zonecode);
	               console.log(fullRoadAddr);
	               
	               
	               $("[name=post]").val(data.zonecode);
	               $("[name=addr1]").val(fullRoadAddr);
	               
	               /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
	               document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
	               document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
	           }
	        }).open();
	    }
	    
	    $(function(){
	    	var latlng = "";
	    	var lat = "";
	    	var lng = "";
	    	$("#addr2").on("blur",function(){
	    		
	    		var addr1 = $("#addr1").val();
	    		
				var mapContainer = document.getElementById('map');
				var mapOption = {
				    center: new daum.maps.LatLng(37.450701, 126.570667),
				    level: 5
				};  
				
				var map = new daum.maps.Map(mapContainer, mapOption); 
				
				var geocoder = new daum.maps.services.Geocoder();
				var listData = [
					addr1
				];
				
				listData.forEach(function(addr, index) {
				    geocoder.addressSearch(addr, function(result, status) {
				        if (status === daum.maps.services.Status.OK) {
				            var coords = new daum.maps.LatLng(result[0].y, result[0].x);
				
							latlng = coords;
							lng = latlng.Ga;
							lat = latlng.Ha;
							console.log(latlng);
							
							$("#lat").remove();
							$("#lng").remove();
							
							$("#memberJoin").append("<input type='hidden' id='lat' name='lat' value='"+lat+"'>");
							$("#memberJoin").append("<input type='hidden' id='lng' name='lng' value='"+lng+"'>");
				        } 
				    });
				});
	    		
	    	})
	    })
    </script>
    
</html>