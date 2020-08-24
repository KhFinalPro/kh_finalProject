<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>치민_번개</title>
 <style>
 	/* body, hmtl{background: #ecf0f1;} */
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
	
	
	
	#bungCreate_area{margin: auto; width: 50%; text-align: center; margin-top:150px;}
	#bungCreate_area table{width: 100%; text-align: left;}
	#bungCreate_area table tr{margin-bottom: 20px;}
	td:first-child{width: 40%; text-align: center; font-size: 20px; font-weight: 600;}
	#bungCreate_area table #bung_title{height: 50px; width: 100%; font-size: 20px; font-weight: 600;}
	#bungCreate_area table #bung_brand{height: 50px; width: 100%; font-size: 20px; font-weight: 600;}
	#bungCreate_area table .date{height: 50px; font-size: 20px; width:48%; font-weight: 600;}
	#bungCreate_area table #bung_int{font: 15px; font-weight: 500; resize:none;}
	#bungCreate_area table #bung_p_no{height: 30px; width: 100%; font-size: 20px; font-weight: 600;}
	#bungCreate_btn{width: 300px; height: 100px; margin-top: 50px; background-color: #2bc1ac; color: white; border: 0px; border-radius:15px; font-size: 25px; font-weight: 600;}
	#bungCreate_btn:hover{color:black; cursor:pointer;}
	.map{border:1px solid black;}
	#detail_address{width:100%;}
	#bung_addr{heigth:50px; width:50%; text-align:center; font-size:25px; font-weight:600;}
	</style>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=42ae5ba7b91c000e8dd51ef7b13009b4&libraries=services,clusterer,drawing"></script>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
	<section id="bungCreate_area">

		<input type="hidden" id="user_id" value="${sessionScope.loginUser.id }"/>
        <table>
            <tr>
                <td><label>*번개 제목</label></td>
                <td><input type="text" id="bung_title" name="bung_title" placeholder="제목을 입력해주세요" required></td>
            </tr>
            <tr>
                <td>
                    <label for="">*번개 브랜드</label>
                </td>
                <td>
                    <select name="bung_brand" id="bung_brand" required>                    
                    	<c:forEach var="brand" items="${brandList }">
	                        <option value="${brand.brand_name }">${brand.brand_name }</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="">*번개 시간</label>
                </td>
                <td>
                    <input type="date" name="bung_date" id="bung_date" class="date" required>&nbsp;<input type="time" name="bung_time" id="bung_time" class="date" required>
                </td>
            </tr>
            <tr>
                <td>                    
                    <label for="">*소개글</label>
                </td>
                <td>
                    <textarea name="bung_int" id="bung_int" cols="100" rows="5" required></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="">*인원수</label>
                </td>
                <td>
                    <input type="number" name="bung_p_no" id="bung_p_no" min="0" value="0" required>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="">태그</label>
                </td>
                <td id="tag_area_td">
                    <textarea class="tag_area" cols="60" rows="1" style="resize: none; height: 25px; font-size: 20px; font-weight: 600;"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" >
                    
                    <div id="tagArea" class="tag">

                    </div>
                </td>
                
            </tr>
            <tr>
                <td colspan="2">
	            	<p style="font-size:18px; color:#2bc1ac;">*선택할 주소는 왼쪽리스트에서 클릭하여 선택해주세요.*</p>            	
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
            <tr>
            	<td colspan="2"><div id="detail_address"><input type="text" name="bung_addr" id="bung_addr"  readonly required placeholder="선택한 주소"></div></td>
            </tr>
        </table>

        <input type="submit" id="bungCreate_btn" value="치킨번개 만들기">

	</section>
	
	<%@ include file="../common/footer.jsp" %>
</body>

	<script type="text/javascript">
    	
    	function myFunction(item){
    		$bung_addr = $(item).children(".info").children(".gray").text();
    		
    		var addr = "<input type='text' id='bung_addr' value='"+$bung_addr+"' readonly/>";
    		$("#bung_addr").remove();
    		$("#detail_address").append(addr);
    	}
    	
    </script>
    
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
                    		console.log(data);
                    		var tag="<a  id='tag' style='color:blue'>#"+data.tag_name+"</a>"+"," 
                    				+ "<input type='hidden' id='tagNum' name='tag_num' value='"+ data.tag_num +"'/>";
                            $("#tagArea").append(tag);
                            
                            $tag_area.val("");
                    	},
                    	error:function(request, status, errorData){
                    		alert("error code: " + request.status + "\n"
      	                          +"message: " + request.responseText
      	                          +"error: " + errorData);
                    	}
                    })
                    
                    
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
            	$user_id = $("#user_id").val();
            	$bung_addr = $("#bung_addr").val();
            	console.log($user_id);
            	
            	if($bung_title != "" && $bungDate != "" && $bungTime != "" && $bung_int != "" && $bung_p_no > 0 && $bung_addr != ""){
	            	$tagNumArr = new Array();
	            	$(".tag input").each(function(index, item){
		            	$tagNumArr.push($("#tagArea").children("#tagNum").eq(index).val());            		
	            	})
	            	
	            	location.href="bungCreate.do?bung_title="+$bung_title+"&user_id="+ $user_id +"&bung_brd="+$bung_brand+"&bung_addr="+$bung_addr+
	            								"&bung_date="+$bung_date+"&bung_int="+$bung_int+"&bung_p_no="+$bung_p_no + "&tag_num=" + $tagNumArr;            		
            	}
            	else{
            		alert("필수항목을 입력해주세요.");
            	}
            	
            })
            
        })
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
            el.setAttribute("onclick","myFunction(this)");

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
    
    
</html>