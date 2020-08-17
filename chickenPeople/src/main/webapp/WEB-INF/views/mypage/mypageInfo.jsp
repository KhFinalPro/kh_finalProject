<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
    <head>
        <title>회원정보</title>
        <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=42ae5ba7b91c000e8dd51ef7b13009b4&libraries=services,clusterer,drawing"></script>
        <style>
            #memberJoin{
                width: 700px;
                margin: 0 auto;
                margin-top: 120px;
            }
            #logintable{
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
            #checkAll{
               zoom: 2.0;
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
           #agr{
               
               margin-left: 20px;
           }
           .container {
                width: 500px;
                height: 200px;
                overflow: auto;
                border: 1px solid black;
                border-radius: 10px;
            }
            
            .container::-webkit-scrollbar {
                width: 10px;
            }
            
            .container::-webkit-scrollbar-thumb {
                background-color: white;
                border-radius: 10px;
                background-clip: padding-box;
                border: 2px solid transparent;
            }
            
            .container::-webkit-scrollbar-track {
                background-color: black;
                border-radius: 10px;
                box-shadow: inset 0px 0px 5px white;
            }
            
            input::-webkit-input-placeholder { 
                color: lightgray; 
            }
            
        </style>
    </head>
    <body>
    <jsp:include page="../common/header.jsp"/>
        <form id="mypageInfo" method="post" action="mypageInfo.do" enctype="multipart/form-data">
            <h2 id="h2">회원정보</h2>
            <table id="logintable">
                <tr>
                    <td id="lab" class="ltd">
                        <label>아이디</label>
                    </td>
                    <td id="inp" class="ltd">
                        <input type="text" id="id" name="id" readonly>
                    </td>
                </tr>
                <tr>
                    <td id="lab" class="ltd">
                        <label>비밀번호</label>
                    </td>
                    <td id="inp" class="ltd"> 
                        <input type="password" id="pwd" name="pwd" required placeholder="6글자 이상 18글자 이하 영문자(소문자)와 숫자">
                    </td>
                </tr>
                <tr>
                    <td id="lab" class="ltd"> 
                        <label>비밀번호 확인</label>
                    </td>
                    <td id="inp" class="ltd"> 
                        <input type="password" id="pwd_check" name="pwd_check" required>
                    </td>
                </tr>
                <tr>
                    <td id="lab" class="ltd">
                        <label>이름</label>
                    </td>
                    <td id="inp" class="ltd">
                        <input type="text" id="name" name="name" readonly>
                    </td>
                </tr>
                <tr>
                    <td id="lab" class="ltd">
                        <label>이메일</label>
                    </td>
                    <td id="inp" class="ltd">
                        <input type="email" id="email" name="email" required>
                    </td>
                </tr>
                <tr>
                    <td id="lab" class="ltd">
                        <label>휴대폰</label>
                    </td>
                    <td id="inp" class="ltd">
                        <input type="tel" id="tel" name="tel" required placeholder="-제외 하고 입력">
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
                        <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="addr1" id="addr1" class="addr1" type="text" readonly="readonly" />
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
                		<label>프로필 사진</label>
                	</td>
                	<td id="inp" class="ltd" rowspan="3">
                		<div id="contentImgArea">
                			<img id="contentImg" src="" onerror="this.src='resources/images/profileSample.png'" width="225px" height="225px">
                		</div>
                		<div id="fileArea">
							<input type="file" id="propic" name="propic" onchange="LoadImg(this)">
						</div>
                	</td>
                </tr>
            </table>
				
            <br><br><br><br><br>
            <div style="text-align: center;">
                <input type="submit" value="회원정보 수정" id="submit_btn" style="width: 90px; height: 40px; color: white; background: #2ac1bc; border-radius: 7px;" onclick="check();">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <input type="button" value="취소" id="cancel" onclick="location.href='home.do'" style="width: 90px; height: 40px; color: black; background-color: #2ac1bc; border-radius: 7px;">
            </div>
            
        </form>
        <div id="map" style="display:none"></div>
        <%@ include file="../common/footer.jsp"%>
    </body>
    
    <script>
        $( document ).ready( function() {
          $( '#checkAll' ).click( function() {
            $( '.infoBox' ).prop( 'checked', this.checked );
          } );
        } );
        
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
	   
            
         	
         	
         	// 비밀번호 정규화
            $("#pwd").change(function(){
                var value = $("#pwd").val();
                var reg = /^[a-z0-9]{6,18}$/;
                if(!reg.test(value)){
                    alert("영문자와 숫자로 6글자 이상 12글자 이하여야 합니다.");
                    $("#pwd").focus().val('');
                }
            });
         	
         	// 비밀번호 체크 정규화
            $("#pwd_check").change(function(){
                var pw1 = $("#pwd").val();
                var pw2 = $("#pwd_check").val();
                
                if(pw1 == pw2){
                    $("#pwd_check").val();
                }else{
                    alert("비밀번호가 일치하지 않습니다.");
                    $("#pwd_check").focus().val('');
                }
            });
         	
         	// 이름 정규화
            $("#name").change(function(){
                var value = $("#name").val();
                var reg = /^[가-힣]{2,6}$/;
                
                if(!reg.test(value)){
                    alert("한글로 2글자 이상 입력해주세요.");
                    $("#name").focus().val('');
                }
            });
         	
            // 휴대폰 정규화
            $("#tel").change(function(){
                var value = $("#tel").val();
                var reg = /^[0-9]{11}$/;
                
                if(!reg.test(value)){
                    alert("-를 제외한 11자리 숫자만 입력해 주세요.");
                    $("#tel").focus().val('');
                }
            });
         
            
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
							
							$("#lat").remove();
							$("#lng").remove();
							
							$("#memberJoin").append("<input type='hidden' id='lat' name='lat' value='"+lat+"'>");
							$("#memberJoin").append("<input type='hidden' id='lng' name='lng' value='"+lng+"'>");
				        } 
				    });
				});
	    		
	    	})
	    })
	    
	    $(function(){
						$("#fileArea").hide();
						$("#contentImgArea").click(function(){
							$("#propic").click();
						})
					})
					function LoadImg(value){
						if(value.files && value.files[0]){
							
				   			var reader = new FileReader();
							reader.onload = function(e){
								console.log(e);
								console.log("사진변경");
								var src = $("#contentImg").attr("src",e.target.result);
								
								console.log(src)
							}
							reader.readAsDataURL(value.files[0]);
						}
					}
	    
    </script>
    
</html>