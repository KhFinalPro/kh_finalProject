<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
    <head>
        <title></title>
        <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="/resources/js/addressapi.js"></script>
        <style>
            #storeJoinForm{
                width: 700px;
                margin: 0 auto;
                margin-top: 200px;
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
           div select{
              height: 30px;
              border-radius: 5px;
              width: 80px;
              float: left;
              margin-left: 3px ;
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
        <form id="storeJoinForm" method="post" action="storeJoin.do">
            <h2 id="h2">신규점포 신청</h2>
            <table id="logintable">
                <tr>
                    <td id="lab" class="ltd">
                        <label>식당 이름</label>
                    </td>
                    <td id="inp" class="ltd">
                        <input type="text" id="stoName" name="stoName" required>
                    </td>
                </tr>
                <tr>
                    <td id="lab" class="ltd">
                        <label>연락처</label>
                    </td>
                    <td id="inp" class="ltd">
                        <input type="tel" id="tel" name="tel" required placeholder="-제외 하고 입력">
                    </td>
                </tr>
                <tr>
                    <td id="lab" class="ltd">
                        <label>사장님 성함</label>
                    </td>
                    <td id="inp" class="ltd">
                        <input type="text" id="name" name="name" required placeholder="한글로 2글자 이상">
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
                        <input type="text" id="brand" name="brand" required>
                    </td>
                </tr>
                <tr>
                    <td id="lab" class="ltd">
                        <label>배달 가능 여부</label>
                    </td>
                    <td id="inp" class="ltd">
                        <input type="text" id="delivery" name="delivery" required>
                    </td>
                </tr>
            </table>
            <br>
            <h5 id="agr">약관동의</h5>
            <hr>
            <input type="checkbox" id="checkAll">
            <label style="font-size: 18px;">치킨의민족의 모든 약관을 확인하고 동의합니다.</label>
            <ul>
                <ul>
                    <li style="list-style: none;">
                        <input type="checkbox" id="check1" name = "agree_chk" class="infoBox">
                        <label>(필수)이용약관</label>
                        <lable><a href="memberJoinAgreement.jsp">전체보기</a></lable>
                    </li>
                    <br>
                    <ul>
                        <li style="list-style: none;">
                            <div class="container">
                                <pre>

                                </pre>
                              </div>
                        </li>
                    </ul>
                    <br>
                    <li style="list-style: none;">
                        <input type="checkbox" id="check2" name="agree_chk" class="infoBox">
                        <label>(필수)개인정보 수집 및 이용</label>
                        <lable><a href="memberJoinAgreement.jsp">전체보기</a></lable>
                    </li>
                    <br>
                    <ul>
                        <li style="list-style: none;">
                            <div class="container">
                                <pre>
                                    개인정보 수집 및 이용 동의
1. 개인정보의 수집 ∙ 이용
①회원 가입 시 수집하는 개인정보의 범위
회사의 회원제 서비스 이용을 위해 수집 ∙ 이용하는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 목적 변경 시 별도의 동의를 받는 등 필요한 조치를 이행합니다.
구분	개인정보 수집 · 이용 목적	개인정보 수집 · 이용 항목
회원 가입 및 관리	회원 가입의사 확인, 회원제 서비스 이용을 위한 제한적 본인확인, 불만 처리 등 원활한 의사소통 경로의 확보, 서비스 부정이용 방지, 계약이행을 위한 각종 고지 ∙ 통지 ∙ 안내, 통계 ∙ 분석	[e-mail 가입]
(필수) 이메일 주소, 비밀번호, 휴대전화번호
(선택) 닉네임
[SNS 회원가입 - 네이버]
(필수) 이메일 주소, 휴대전화번호
(선택) 별명, 생일, 성별, 연령대
[SNS 회원가입 – 카카오톡]
(필수) 이메일 주소, 휴대전화번호
(선택) 닉네임, 생일, 연령대, 성별
서비스 이용 시 자동생성되는 정보	서비스 부정이용 방지, 개인정보유효기간제 적용	서비스 이용 기록, 접속 로그, 쿠키, 접속 IP 주소, 기기고유번호(디바이스 아이디 또는 IMEI)
2. 개인정보 보유 ∙ 이용 기간
① 회사는 이용자로부터 개인정보 수집 시에 동의 받은 보유 · 이용기간 내에서 개인정보를 처리·보유합니다.
a. 회원 정보: 회원탈퇴 후 90 일까지
② 1 년 간 회원의 서비스 이용 기록이 없는 경우, 『정보통신망 이용촉진 및 정보보호등에 관한 법률』 제 29 조에 근거하여 회원에게 사전 통지하고 개인정보를 별도로 분리하여 휴면 계정 전환일로부터 4 년 간 보유합니다.
③ 회원 탈퇴 또는 회원 자격 정지 후 회원 재가입, 임의 해지 등을 반복적으로 행하여 회사가 제공하는 할인쿠폰, 이벤트 혜택 등으로 경제상의 이익을 취하거나 이 과정에서 명의를 무단으로 사용하는 등 편법 행위 또는 불법행위를 하는 회원을 차단하고자 회사는 회원 탈퇴 후 90 일 간 회원의 정보를 보유합니다.
                                </pre>
                            </div>
                        </li>
                    </ul>
                    <br>
                    <li style="list-style: none;">
                        <input type="checkbox" id="check3" name="agree_chk" class="infoBox" >
                        <label>(필수)14세 이상입니다. *회원가입은 만 14세 이상부터 가능합니다.</label>
                    </li>
                    <br>
            </ul>
            <br><br>
            <div style="text-align: center;">
                <input type="submit" value="점포신청" id="submit_btn" style="width: 90px; height: 40px; color: white; background: #2ac1bc; border-radius: 7px;" onclick="check();">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <input type="button" value="취소" id="cancel" onclick=cancle(); style="width: 90px; height: 40px; color: black; background-color: #2ac1bc; border-radius: 7px;">
            </div>
            </ul>
            
        </form>      
        <br clear="both">
        <%@ include file="../common/footer.jsp"%>
        
    </body>
     <script>
        $( document ).ready( function() {
          $( '#checkAll' ).click( function() {
            $( '.infoBox' ).prop( 'checked', this.checked );
          } );
        } );
      </script>
    
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
	    
	    

	    $("#idChk").on("click",function(){
	    	if($("#id").val()==""){
	    		alert("아이디를 입력해주세요");
	    	}else{
	    	$.ajax({
	    		url : "idChk.do",
	    		type : "post",
	    		dataType:"json",
	    		data : {"id" : $("#id").val()},
	    		success : function(data){
	    			if(data == 1){
	    				alert("중복된 아이디입니다.");
	    			}else if(data==0){
	    				$("#idChk").attr("value", "중복확인");
	    				alert("사용가능한 아이디입니다.");
	    			}
	    		}
	    	})
	    	}
	    })
    </script>
    
</html>