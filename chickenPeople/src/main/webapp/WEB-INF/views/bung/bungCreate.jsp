<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
 	
	/*지도 api*/
	.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
	.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
	.map_wrap {position:relative;width:100%;height:500px;}
	#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
	.bg_white {background:#fff;}
	#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
	#menu_wrap .option{text-align: center;}
	#menu_wrap .option p {margin:10px 0;}  
	#menu_wrap .option button {margin-left:5px;}
	#placesList li {list-style: none;}
	#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
	#placesList .item span {display: block;margin-top:4px;}
	#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	#placesList .item .info{padding:10px 0 10px 55px;}
	#placesList .info .gray {color:#8a8a8a;}
	#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
	#placesList .info .tel {color:#009900;}
	#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
	#placesList .item .marker_1 {background-position: 0 -10px;}
	#placesList .item .marker_2 {background-position: 0 -56px;}
	#placesList .item .marker_3 {background-position: 0 -102px}
	#placesList .item .marker_4 {background-position: 0 -148px;}
	#placesList .item .marker_5 {background-position: 0 -194px;}
	#placesList .item .marker_6 {background-position: 0 -240px;}
	#placesList .item .marker_7 {background-position: 0 -286px;}
	#placesList .item .marker_8 {background-position: 0 -332px;}
	#placesList .item .marker_9 {background-position: 0 -378px;}
	#placesList .item .marker_10 {background-position: 0 -423px;}
	#placesList .item .marker_11 {background-position: 0 -470px;}
	#placesList .item .marker_12 {background-position: 0 -516px;}
	#placesList .item .marker_13 {background-position: 0 -562px;}
	#placesList .item .marker_14 {background-position: 0 -608px;}
	#placesList .item .marker_15 {background-position: 0 -654px;}
	#pagination {margin:10px auto;text-align: center;}
	#pagination a {display:inline-block;margin-right:10px;}
	#pagination .on {font-weight: bold; cursor: default;color:#777;}
	
	
	
	#bungCreate_area{margin: auto; width: 50%; text-align: center; margin-top:200px;}
	#bungCreate_area table{width: 100%; text-align: left;}
	#bungCreate_area table tr{margin-bottom: 20px;}
	td:first-child{width: 150px; text-align: center; font-size: 25px; font-weight: 600;}
	#bungCreate_area table #bung_title{height: 50px; width: 515px; font-size: 20px; font-weight: 600;}
	#bungCreate_area table #bung_brand{height: 50px; width: 100px; font-size: 20px; font-weight: 600;}
	#bungCreate_area table .date{height: 50px; font-size: 20px; font-weight: 600;}
	#bungCreate_area table #bung_int{font: 15px; font-weight: 500;}
	#bungCreate_area table #bung_p_no{height: 30px; width: 50px; font-size: 20px; font-weight: 600;}
	#bungCreate_btn{width: 300px; height: 100px; margin-top: 50px; background-color: #2bc1ac; color: black; border: 0px; font-size: 25px; font-weight: 600;}
	
	.map{border:1px solid black;}
	</style>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=adf020d83fc09d8567b48751e315e48a&libraries=services,clusterer,drawing"></script>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
	<section id="bungCreate_area">
		
        <table>
            <tr>
                <td><label>번개 제목</label></td>
                <td><input type="text" id="bung_title" name="bung_title" placeholder="제목을 입력해주세요"></td>
            </tr>
            <tr>
                <td>
                    <label for="">번개 브랜드</label>
                </td>
                <td>
                    <select name="bung_brand" id="bung_brand">                    
                    	<c:forEach var="brand" items="${brandList }">
	                        <option value="${brand.brand_name }">${brand.brand_name }</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="">번개 시간</label>
                </td>
                <td>
                    <input type="date" name="bung_date" id="bung_date" class="date">&nbsp;<input type="time" name="bung_time" id="bung_time" class="date">
                </td>
            </tr>
            <tr>
                <td>
                    <!-- <label for="">번개 장소 : </label>
                    <input type="text" id="sample6_postcode" placeholder="우편번호">
                    <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                    <input type="text" id="sample6_address" placeholder="주소"><br>
                    <input type="text" id="sample6_detailAddress" placeholder="상세주소">
                    <input type="text" id="sample6_extraAddress" placeholder="참고항목"> -->
                    <label for="">소개글</label>

                </td>
                <td>
                    <textarea name="bung_int" id="bung_int" cols="70" rows="5"></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="">인원수</label>
                </td>
                <td>
                    <input type="number" name="bung_p_no" id="bung_p_no" min="0" value="0">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="">태그</label>
                </td>
                <td id="tag_area_td">
                    <textarea class="tag_area" cols="30" rows="1" style="resize: none; height: 25px; font-size: 20px; font-weight: 600;"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" >
                    
                    <div id="tag" name="tag">

                    </div>
                </td>
                
            </tr>
            <tr>
                <td colspan="2">
                    <div class="map_wrap">
                        <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
                    
                        <div id="menu_wrap" class="bg_white">
                            <div class="option">
                                <div>
                                    <form onsubmit="searchPlaces(); return false;">
                                       	키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
                                       	<button type="submit">검색하기</button> 
                                    </form>
                                </div>
                            </div>
                            <hr>
                            <ul id="placesList"></ul>
                            <div id="pagination"></div>
                        </div>
                    </div>
                </td>
            </tr>
        </table>

        <input type="submit" id="bungCreate_btn" value="치킨번개 만들기">
	    
	</section>
	
	<%@ include file="../common/footer.jsp" %>
</body>
	<script>
        //태그관련 jquery
        $(function(){
            
            $(".tag_area").on("keydown", function(key) {
                
                $tag_area = $(".tag_area");
                $tag = $tag_area.val();
                if (key.keyCode == 13) {
                    //태그관련 ajax
                    //db에 등록된 태그가 있으면 select 없으면 insert하고 태그 영역에 표시
                    console.log($tag);
                    $.ajax({
                    	url: "tag.do",
                    	data: {tag_name:$tag},
                    	dataType: "json",
                    	type: "post",
                    	success:function(data){
                    		
                    	},
                    	error:function(data){
                    		alert("error code: " + request.status + "\n"
      	                          +"message: " + request.responseText
      	                          +"error: " + errorData);
                    	}
                    })
                    
                    var tag="<a href='mainSection.html' id='tag'>#"+$tag_area.val()+"</a>"+",";
                    $("#tag").append(tag);
                    
                    $tag_area.val("");
                    // $tag_area.remove();
                    // $("#tag_area_td").append("<textarea id='tag_area' cols='30' rows='1' style='resize: none; height: 25px; font-size: 20px; font-weight: 600;'></textarea>");
                }
            });
            
            $("#bungCreate_btn").on("click",function(){
            	$bung_title = $("#bung_title").val();
            	$bung_brand = $("#bung_brand").val();
            	$bungDate = $("#bung_date").val();
            	$bungTime = $("#bung_time").val();
            	$bung_int = $("#bung_int").val();
            	$bung_p_no = $("#bung_p_no").val();
            	$bung_date = $bungDate +" "+ $bungTime;
            	
            	location.href="bungCreate.do?bung_title="+$bung_title+"&bung_brand="+$bung_brand+"&bung_date="+$bung_date+"&bung_int="+$bung_int+"&bung_p_no="+$bung_p_no;
            })
            
            
        })
    </script>
    <script>
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    
                    var addr = ''; 
                    var extraAddr = ''; 
    
                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }
    
                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("sample6_extraAddress").value = extraAddr;
                    
                    } else {
                        document.getElementById("sample6_extraAddress").value = '';
                    }
    
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }
    </script>

    <script>
        // 마커를 담을 배열입니다
        var markers = [];

        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };  

        // 지도를 생성합니다    
        var map = new kakao.maps.Map(mapContainer, mapOption); 

        // 장소 검색 객체를 생성합니다
        var ps = new kakao.maps.services.Places();  

        // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({zIndex:1});

        // 키워드로 장소를 검색합니다
        searchPlaces();

        // 키워드 검색을 요청하는 함수입니다
        function searchPlaces() {

            var keyword = document.getElementById('keyword').value;

            if (!keyword.replace(/^\s+|\s+$/g, '')) {
                alert('키워드를 입력해주세요!');
                return false;
            }

            // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
            ps.keywordSearch( keyword, placesSearchCB); 
        }

        // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
        function placesSearchCB(data, status, pagination) {
            if (status === kakao.maps.services.Status.OK) {

                // 정상적으로 검색이 완료됐으면
                // 검색 목록과 마커를 표출합니다
                displayPlaces(data);

                // 페이지 번호를 표출합니다
                displayPagination(pagination);

            } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

                alert('검색 결과가 존재하지 않습니다.');
                return;

            } else if (status === kakao.maps.services.Status.ERROR) {

                alert('검색 결과 중 오류가 발생했습니다.');
                return;

            }
        }

        // 검색 결과 목록과 마커를 표출하는 함수입니다
        function displayPlaces(places) {

            var listEl = document.getElementById('placesList'), 
            menuEl = document.getElementById('menu_wrap'),
            fragment = document.createDocumentFragment(), 
            bounds = new kakao.maps.LatLngBounds(), 
            listStr = '';
            
            // 검색 결과 목록에 추가된 항목들을 제거합니다
            removeAllChildNods(listEl);

            // 지도에 표시되고 있는 마커를 제거합니다
            removeMarker();
            
            for ( var i=0; i<places.length; i++ ) {

                // 마커를 생성하고 지도에 표시합니다
                var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                    marker = addMarker(placePosition, i), 
                    itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

                // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                // LatLngBounds 객체에 좌표를 추가합니다
                bounds.extend(placePosition);

                // 마커와 검색결과 항목에 mouseover 했을때
                // 해당 장소에 인포윈도우에 장소명을 표시합니다
                // mouseout 했을 때는 인포윈도우를 닫습니다
                (function(marker, title) {
                    kakao.maps.event.addListener(marker, 'mouseover', function() {
                        displayInfowindow(marker, title);
                    });

                    kakao.maps.event.addListener(marker, 'mouseout', function() {
                        infowindow.close();
                    });

                    itemEl.onmouseover =  function () {
                        displayInfowindow(marker, title);
                    };

                    itemEl.onmouseout =  function () {
                        infowindow.close();
                    };
                })(marker, places[i].place_name);

                fragment.appendChild(itemEl);
            }

            // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
            listEl.appendChild(fragment);
            menuEl.scrollTop = 0;

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
            map.setBounds(bounds);
        }

        // 검색결과 항목을 Element로 반환하는 함수입니다
        function getListItem(index, places) {

            var el = document.createElement('li'),
            itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                        '<div class="info">' +
                        '   <h5>' + places.place_name + '</h5>';

            if (places.road_address_name) {
                itemStr += '    <span>' + places.road_address_name + '</span>' +
                            '   <span class="jibun gray">' +  places.address_name  + '</span>';
            } else {
                itemStr += '    <span>' +  places.address_name  + '</span>'; 
            }
                        
            itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                        '</div>';           

            el.innerHTML = itemStr;
            el.className = 'item';

            return el;
        }

        // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
        function addMarker(position, idx, title) {
            var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
                imgOptions =  {
                    spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                    spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                    offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
                },
                markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                    marker = new kakao.maps.Marker({
                    position: position, // 마커의 위치
                    image: markerImage 
                });

            marker.setMap(map); // 지도 위에 마커를 표출합니다
            markers.push(marker);  // 배열에 생성된 마커를 추가합니다

            return marker;
        }

        // 지도 위에 표시되고 있는 마커를 모두 제거합니다
        function removeMarker() {
            for ( var i = 0; i < markers.length; i++ ) {
                markers[i].setMap(null);
            }   
            markers = [];
        }

        // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
        function displayPagination(pagination) {
            var paginationEl = document.getElementById('pagination'),
                fragment = document.createDocumentFragment(),
                i; 

            // 기존에 추가된 페이지번호를 삭제합니다
            while (paginationEl.hasChildNodes()) {
                paginationEl.removeChild (paginationEl.lastChild);
            }

            for (i=1; i<=pagination.last; i++) {
                var el = document.createElement('a');
                el.href = "#";
                el.innerHTML = i;

                if (i===pagination.current) {
                    el.className = 'on';
                } else {
                    el.onclick = (function(i) {
                        return function() {
                            pagination.gotoPage(i);
                        }
                    })(i);
                }

                fragment.appendChild(el);
            }
            paginationEl.appendChild(fragment);
        }

        // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
        // 인포윈도우에 장소명을 표시합니다
        function displayInfowindow(marker, title) {
            var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

            infowindow.setContent(content);
            infowindow.open(map, marker);
        }

        // 검색결과 목록의 자식 Element를 제거하는 함수입니다
        function removeAllChildNods(el) {   
            while (el.hasChildNodes()) {
                el.removeChild (el.lastChild);
            }
        }
    </script>
    <script>
    	$(function(){
		    $(".item").on("click",function(){
		    	alert("asdasd");
		    	console.log("item");
		    })
    		
    	})
    </script>
</html>