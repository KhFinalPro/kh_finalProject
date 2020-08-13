<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
    <head>
        <title></title>
        <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=42ae5ba7b91c000e8dd51ef7b13009b4&libraries=services,clusterer,drawing"></script>
        <style>
            #storeJoinForm{
                width: 700px;
                margin: 0 auto;
                margin-top: 120px;
            }
            #storeJoin{
                margin: 0;
                padding:0;
                width: 700px;
                border-top: 1px solid #444444;
                border-collapse: collapse;
            }
            .ltd {
                border-bottom: 1px solid #444444;
                padding: 10px;
            }
            #lab{
                background-color: #2ac1bc;
                color: black;
                text-align: center;
                padding: 10px;   
            }
            #inp{
               padding: 10px;
               padding-left: 110px;
               padding-right: 100px;
            }
            tr td input{
                border-radius: 5px;
                height: 30px;
                width: 280px;
            }
            
            tr td select{
                border-radius: 5px;
                height: 30px;
                width: 290px;
                font: bold;
                font-size: 15px;
            }
            
           #h2{
               margin-left: 20px;
           }
           #h3{
               float: left;
               margin-left: 20px;
           }
           #hh5{
               float:right;
               margin-bottom: 0;
               color: lightgray;
           }
            input::-webkit-input-placeholder { 
                color: lightgray; 
            }
            
        </style>
    </head>
    <body>
    	<jsp:include page="../common/header.jsp"/>
        <form id="storeJoinForm" method="post" action="storeJoin.do">
            <h2 id="h2">신규점포 신청</h2>
            <table id="storeJoin">
                <tr>
                    <td id="lab" class="ltd">
                        <label>식당 이름</label>
                    </td>
                    <td id="inp" class="ltd">
                        <input type="text" id="stoName" name="sto_name" required>
                    </td>
                </tr>
                <tr>
                    <td id="lab" class="ltd">
                        <label>연락처</label>
                    </td>
                    <td id="inp" class="ltd">
                        <input type="tel" id="tel" name="sto_tel" required placeholder="-제외 하고 입력">
                    </td>
                </tr>
                <tr>
                    <td id="lab" class="ltd">
                        <label>사장님 성함</label>
                    </td>
                    <td id="inp" class="ltd">
                        <input type="text" id="name" name="ceo_name" required placeholder="한글로 2글자 이상">
                    </td>
                </tr>
                 <tr>
                    <td id="lab" class="ltd">
                        <label>이메일</label>
                    </td>
                    <td id="inp" class="ltd">
                        <input type="email" id="email" name="sto_email" required>
                    </td>
                </tr>
                <tr>
                    <td id="lab" class="ltd">
                    <label>우편번호</label>
                    </td>
                    <td id="inp" class="ltd">
                        <input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="post" id="post" type="text" readonly="readonly" >
    					<button type="button" style="height: 30px; border-radius: 4px; width: 100px; background: #2ac1bc; color: white; border: none;" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>   
                    </td>
                </tr>
                <tr>
                    <td id="lab" class="ltd">
                        <label>도로명 주소</label>
                    </td>
                    <td id="inp" class="ltd">
                        <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="addr1" id="addr1" type="text" readonly="readonly" />
                    </td>
                </tr>
                <tr>
                    <td id="lab" class="ltd">
                        <label>상세 주소</label>
                    </td>
                    <td id="inp" class="ltd">
                        <input class="form-control" placeholder="상세주소" name="addr2" id="addr2" type="text"  />
                    </td>
                </tr>
                <tr>
                    <td id="lab" class="ltd"> 
                        <label>브랜드명</label>
                    </td>
                    <td id="inp" class="ltd"> 
                        <select name="brand_code" required>
                        	<option value="BB">비비큐</option>
                        	<option value="DD">또래오래</option>
                        	<option value="BH">BHC</option>
                        	<option value="NO">노랑통닭</option>
                        	<option value="KK">깐부치킨</option>
                        	<option value="BR">바른치킨</option>
                        	<option value="NN">네네치킨</option>
                        	<option value="HS">호식이치킨두마리</option>
                        	<option value="GC">교촌치킨</option>
                        	<option value="PE">페리카나</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td id="lab" class="ltd">
                        <label>배달 가능 여부</label>
                    </td>
                    <td id="inp" class="ltd">
                        <select name="delivery" required>
                        	<option value="Y">가능</option>
                        	<option value="N">불가능</option>
                        </select>
                    </td>
                </tr>
                <tr>
                	<td id="lab" class="ltd">
                		<label>사장님 한마디</label>
                	</td>
                	<td id="inp" class="ltd" rowspan="4">
                		<textarea rows="4" cols="38" id="sto_intro" name="sto_intro" placeholder="한말씀만 써주세요~"></textarea>
                	</td>
                </tr>
            </table>
            <br><br>
            <div style="text-align: center;">
                <input type="submit" value="점포신청" id="submit_btn" style="width: 90px; height: 40px; color: white; background: #2ac1bc; border-radius: 7px;" onclick="check();">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <input type="button" value="취소" id="cancel" onclick=cancel(); style="width: 90px; height: 40px; color: black; background-color: #2ac1bc; border-radius: 7px;">
            </div>
            <div id="map" style="display:none"></div>
        </form>      
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
    		// 가게이름
    		 $("#stoName").change(function(){
                 var value = $("#stoName").val();
                 var reg = /^[가-힣]{2,6}$/;
                 
                 if(!reg.test(value)){
                     alert("한글로 2글자 이상 입력해주세요.");
                     $("#stoName").focus().val('');
                 }
             });
    		
    		
    		// 이름
    		 $("#name").change(function(){
                 var value = $("#name").val();
                 var reg = /^[가-힣]{2,6}$/;
                 
                 if(!reg.test(value)){
                     alert("한글로 2글자 이상 입력해주세요.");
                     $("#name").focus().val('');
                 }
             });
    		 
    		// 폰번호
    		 $("#tel").change(function(){
                 var value = $("#tel").val();
                 var reg = /^[0-9]{11}$/;
                 
                 if(!reg.test(value)){
                     alert("-를 제외한 11자리 숫자만 입력해 주세요.");
                     $("#tel").focus().val('');
                 }
             })
    	});
    
	    
	    
	    
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
    								

    			    		    	$("#sto_lat").remove();
    			    		    	$("#sto_lng").remove();
    								
    								
    								$("#storeJoinForm").append("<input type='hidden' id='sto_lat' name='sto_lat' value='"+lat+"'>");
    								$("#storeJoinForm").append("<input type='hidden' id='sto_lng' name='sto_lng' value='"+lng+"'>");
    					        } 
    					    });
    					});
    		    		
    		    	})
    		    })
	    
    </script>
    
    
    
</html>