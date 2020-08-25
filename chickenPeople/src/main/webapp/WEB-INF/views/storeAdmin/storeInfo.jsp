<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.chickenPeople.storeAdmin.storeInfo.model.vo.*" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	ArrayList<StoreInfo> storeInfoList = (ArrayList<StoreInfo>)request.getAttribute("storeInfoList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
<style>
/***폼****/
.wrapper2{
	font-size:15px;
    max-width:1000px;
    width:100%;
    background:#fff;
    margin:20px auto;
    padding:0px;
   /*  box-shadow: 1px 1px 89px rgba(1,1,1,0.125); */
}
.wrapper2 .title{position:fixed; top:100px; right:200px;}

.wrapper2 .title .name,
.wrapper2 .title .ceoName,
.wrapper2 .title .brandName,{
   float: right;
   vertical-align: bottom;
}


.wrapper2 .title .profile_img{
	
    float: right;
    width:100px;
    height:100px;
    display: block;
    border-radius: 30px; 
    box-shadow: 1px 1px 89px rgba(1,1,1,0.125);
    
}

.profile:after { 
    display:block; 
    content:""; 
    clear:both; 
}

.wrapper2 .title{
    font-size:20px;
    font-weight: 700;
    margin-bottom: 30px;
    color:black;

}

.storeId{
 float:right;
 margin-right:20px;
}


.wrapper2 .form{
    width: 100%;
}

.wrapper2 .form .input_field{
    margin-bottom: 30px;
    display: flex;
    align-items: center;
}

.wrapper2 .form .input_field label{
    font-weight: bold;
    width:200px;
    color: #757575;
    margin-right:10px;
    font-size:22px;
}

.wrapper2 .form .input_field{
    font-size:14px;
}

.wrapper2 .form .input_field .input,
.wrapper2 .form .input_field .textarea{
    /* width:20%; */
    width:100px;
    outline:none;
    border:1px solid lightgrey;
    font-size: 15px;
    padding: 5px 7px;
    border-radius: 3px;
    transition :all 0.3s ease;

}




.wrapper2 .form .input_field .name,
.wrapper2 .form .input_field .brandName,
.wrapper2 .form .input_field .ceoName,
.wrapper2 .form .input_field .pwd,
.wrapper2 .form .input_field .pwd_check{
    outline:none;
    border:1px solid lightgrey;
    font-size: 15px;
    padding: 5px 7px;
    border-radius: 3px;
    transition :all 0.3s ease;
    width: 210px;
    
}


input{height:45px; font-size:22px;}
.wrapper2 .form .input_field .address{
  	outline:none;
    border:1px solid lightgrey;
    font-size: 15px;
    padding: 5px 7px;
    border-radius: 3px;
    transition :all 0.3s ease;
    width: 310px;
}

.wrapper2 .form .input_field .address2{
  	outline:none;
    border:1px solid lightgrey;
    font-size: 15px;
    padding: 5px 7px;
    border-radius: 3px;
    transition :all 0.3s ease;
    width: 200px;
}

.wrapper2 .form .input_field .postcode{
  	outline:none;
    border:1px solid lightgrey;
    font-size: 15px;
    padding: 5px 7px;
    border-radius: 3px;
    transition :all 0.3s ease;
    width: 210px;
}

.wrapper2 .form .input_field .textarea{
    width: 350px;
    height:130px;
    resize:none;
}



.wrapper2 .form .input_field .select_phone{
    position: relative;
    height:20px;
}

.wrapper2 .form .input_field .select_phone select{
    -webkit-appearance:none;
    appearance: none;
    border:1px solid lightgrey;
    position: relative;
    height:28px;
    width:100px;
    padding: 5px 7px;
    border-radius: 3px;
    outline:none;
}

.wrapper2 .form .input_field .input:focus,
.wrapper2 .form .input_field .textarea:focus,
.wrapper2 .form .input_field .address:focus,
.wrapper2 .form .input_field .postcode:focus,
.wrapper2 .form .input_field .pwd:focus,
.wrapper2 .form .input_field .pwd_check:focus,
.wrapper2 .form .input_field select:focus
{
    border :1px solid #2e4ead;
}

.addressBtn{
    width:200px;
    padding:8px 10px;
    font-size: 15;
    border:0;
    background:#757575;
    color:#fff;
    cursor: pointer;
    border-radius: 3px;
    outline:none;
}
.wrapper2 .form .input_field .btn{
    width:200px;
    padding:8px 10px;
    font-size: 15;
    border:0;
    background:#4360b5;
    color:#fff;
    cursor: pointer;
    border-radius: 3px;
    outline:none;
    margin-left: auto; 
    margin-right: auto;

}
/***사이더바***/

.wrapper .main_container{

    width:94.8%;
    margin-top:70px;
    margin-left: 114px;
    padding:15px;
    transition: all 0.3s ease;
    overflow: hidden;
}

.wrapper .main_container .item{

   background: #fff; 
   margin-bottom: 10px; 
   padding: 15px; 
   font-size: 19x; 
   height: 873px; 
   border-bottom-right-radius: 20px;
   justify-content: center; 
   align-items: center; 
   margin-top: -30px;
   overflow-y: scroll;
   
} 

.item::-webkit-scrollbar {
	display:none;
}

.wrapper.collapse .sidebar{
    width:70px;
}

.wrapper.collapse .sidebar ul li a{
    text-align:center;
}

/* .wrapper.collapse .sidebar ul li a span.icon{
    margin:0;
} */

.wrapper.collapse .sidebar ul li a span.title{
    display:none;
}

.wrapper.collapse .main_container{
    width:calc(100% - 70px);
    margin-left:70px;
}

</style>
</head>
<body>

<jsp:include page="../common/adminSidebar.jsp"/>
 <div class="wrapper">
   		<div class="main_container">
   				<div class="item">
	   				  <div class="wrapper2">
				     <!--    <br> -->
						<div class="title">
				           
				                <div class="profile">
				                <img src="resources/images/${storeInfoList.get(0).brandPic }.png" class="profile_img">
				              <%--   <img src="resources/menu/${i.menu_Pic }.jpg" width="40px" height="40px"> --%>
				                </div><br>
				                <div class="storeId"><h5>${userId } 님</h5></div>
				        </div> 
				      
				   
				        <br>
				        <form action="modifyInfo.do" method="post">
					        <div class="form">
						        <div class="input_field">
						            <label>브랜드</label>
						             <input type="text" id="brandName" class="brandName" value="${storeInfoList.get(0).brandName }"readonly>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						        	<label style="display:none" id="labelBrandName">수정불가 항목입니다.</label>
						        </div>
						        <div class="input_field">
						            <label>비밀번호</label>
						             <input type="password" id="pwd" class="pwd" name="pwd" value=""<%-- value="${storeInfoList.get(0).userPwd }" --%>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						        </div>
						          <div class="input_field">
						            <label>비밀번호 확인</label>
						             <input type="password" id="pwd_check" class="pwd_check" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						        </div>
						        <div class="input_field">
						            <label>매장 이름</label>
						            <input type="text" id="storeName" class="name" value="${storeInfoList.get(0).stoName }"readonly>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						            <label style="display:none">수정불가 항목입니다.</label>
						        </div>
						        <div class="input_field">
						            <label>사장님 이름</label>
						            <input type="text" id="ceoName" class="ceoName" value="${storeInfoList.get(0).ceoName }" readonly>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						            <label style="display:none">수정불가 항목입니다.</label>
						        </div>
						        <div class="input_field">
						            <label>매장 전화번호</label>
						            <input type="text" class="input" value="${phone1 }" name="tel1"> 
						            -<input type="text" class="input" value="${phone2 }" name="tel2">-<input type="text" class="input" value="${phone3 }" name="tel3"> 
						        </div>
						         <div class="input_field">
						            <label>우편 번호</label>
						            <input type="text" class="postcode" name=post>&nbsp;
						            <button type="button" class="addressBtn" onclick="execPostCode()">우편번호검색</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						        </div>
						        <div class="input_field">
						            <label>매장 주소</label>
						            <input type="text" class="address"  value="${storeInfoList.get(0).stoAddr }" name=addr1>&nbsp;<input type="text" class="address2" placeholder="상세주소를 입력해주세요" name=addr2>&nbsp;
						        </div>
						        <div class="input_field">
						            <label>최소 주문금액</label>
						           <input type="text" class="address"  value="${storeInfoList.get(0).ordLimit }원" name=ordLimit>
						          <!--   <input type="radio" class="deliver" checked>배달+테이크아웃 가능 -->
						        </div>
						        <div class="input_field">
						            <label>운영 시간</label>
						            <input type="text" class="input" value="${storeInfoList.get(0).stoOpen }" name="stoOpen">-<input type="text" class="input" value="${storeInfoList.get(0).stoClose }" name="stoClose">
						        </div>
						        <div class="input_field">
						            <label>사장님 한마디 / 공지사항</label>
						            <textarea cols="10" rows="4" class="textarea" id="stoInfoNotice" name="stoIntro">${storeInfoList.get(0).stoIntro }</textarea>
						        </div>
						        <div class="input_field">
						         <!--    <input type="submit" vaue="modify" class="btn"> -->
						        	<button type="submit" class="btn"><b>수정하기</b></button>&nbsp;
						            <!-- <button id="modifyInfoBtn" onclick="modifyInfo()" class="btn">수정하기</button> -->
						        </div>
					        </div>
				        </form>
				        
				    </div>
   				</div>
   		</div>
 </div>

</body>


<script>
$(function(){
    var responseMessage = "<c:out value="${message}" />";
    if(responseMessage != ""){
        alert(responseMessage);
    }
}) 

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
</script>

</html>