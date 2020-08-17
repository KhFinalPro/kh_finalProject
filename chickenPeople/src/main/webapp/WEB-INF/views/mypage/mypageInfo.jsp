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
            #mypageInfo{
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
        <form id="mypageInfo" method="post" action="mypageUpdate.do" enctype="multipart/form-data">
            <h2 id="h2">회원정보</h2>
            <table id="logintable">
                <tr>
                    <td id="lab" class="ltd">
                        <label>아이디</label>
                    </td>
                    <td id="inp" class="ltd">
                        <input type="text" id="id" name="id" value="${sessionScope.loginUser.id }" readonly>
                    </td>
                </tr>
                <tr>
                    <td id="lab" class="ltd">
                        <label>비밀번호</label>
                    </td>
                    <td id="inp" class="ltd"> 
                        <input type="password" id="pwd" name="pwd" value="${sessionScope.loginUser.pwd }" required>
                    </td>
                </tr>
                <tr>
                    <td id="lab" class="ltd"> 
                        <label>비밀번호 확인</label>
                    </td>
                    <td id="inp" class="ltd"> 
                        <input type="password" id="pwd_check" name="pwd_check" value="${sessionScope.loginUser.pwd }" required>
                    </td>
                </tr>
                <tr>
                    <td id="lab" class="ltd">
                        <label>이름</label>
                    </td>
                    <td id="inp" class="ltd">
                        <input type="text" id="name" name="name" value="${sessionScope.loginUser.name }" required>
                    </td>
                </tr>
                <tr>
                    <td id="lab" class="ltd">
                        <label>이메일</label>
                    </td>
                    <td id="inp" class="ltd">
                        <input type="email" id="email" name="email" value="${sessionScope.loginUser.email }" required>
                    </td>
                </tr>
                <tr>
                    <td id="lab" class="ltd">
                        <label>휴대폰</label>
                    </td>
                    <td id="inp" class="ltd">
                        <input type="tel" id="tel" name="tel" value="${sessionScope.loginUser.tel }"required>
                    </td>
                </tr>
                <tr>
                	<td id="lab" class="ltd">
                		<label>프로필 사진</label>
                	</td>
                	<td id="inp" class="ltd" rowspan="3">
                		<div id="contentImgArea">
                			<img id="contentImg" src="resources/propic/${sessionScope.loginUser.pic}" width="225px" height="225px">
                		</div>
                		<div id="fileArea">
							<input type="file" id="propic" name="propic" onchange="LoadImg(this)">
						</div>
                	</td>
                </tr>
            </table>
				
            <br><br><br><br><br>
            <div style="text-align: center;">
                <input type="submit" value="수정" id="submit_btn" style="width: 90px; height: 40px; color: white; background: #2ac1bc; border-radius: 7px;" onclick="check();">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <input type="button" value="취소" id="cancel" onclick="location.href='home.do'" style="width: 90px; height: 40px; color: black; background-color: #2ac1bc; border-radius: 7px;">
            </div>
            
        </form>
        <div id="map" style="display:none"></div>
        <%@ include file="../common/footer.jsp"%>
    </body>
    
    <script>
      
            
         	
         	console.log(post_code);
         	
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