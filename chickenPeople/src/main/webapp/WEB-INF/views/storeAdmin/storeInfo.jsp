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
    font-size:13px;
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
.wrapper2 .form .input_field .ceoName{
    outline:none;
    border:1px solid lightgrey;
    font-size: 15px;
    padding: 5px 7px;
    border-radius: 3px;
    transition :all 0.3s ease;
    width: 210px;
    
}

.wrapper2 .form .input_field .address{
  	outline:none;
    border:1px solid lightgrey;
    font-size: 15px;
    padding: 5px 7px;
    border-radius: 3px;
    transition :all 0.3s ease;
    width: 310px;
}

.wrapper2 .form .input_field .textarea{
    width: 350px;
    height:130px;
}

/* .wrapper2 .form .input_field .brand_select{
    position: relative;
    height:20px;
}

.wrapper2 .form .input_field .brand_select select{
    -webkit-appearance:none;
    appearance: none;
    border:1px solid lightgrey;
    position: relative;
    height:28px;
    width:210px;
    padding: 5px 7px;
    border-radius: 3px;
    outline:none;
} */



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
.wrapper2 .form .input_field select:focus
{
    border :1px solid #2e4ead;
}

.addressBtn{
    width:100px;
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
    width:100px;
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
				            <label>매장 주소</label>
				            <input type="text" class="address"  value="${storeInfoList.get(0).stoAddr }">&nbsp;
				            <button class="addressBtn">주소검색</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				            <label style="display:none">수정불가 항목입니다.</label>
				        </div>
				        <div class="input_field">
				            <label>배달 여부</label>
				            <input type="radio" class="deliver" checked>&nbsp;배달가능 &nbsp;
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
<!-- $(function () { 	
$('#brandName').toggle(function() {
  $("#labelBrandName").css("display","block");
  $("#labelBrandName").css("display","none");
})
});
</script> -->
 
<!-- <script>
function modifyInfo(stoInfoNotice){
/* 	alert('gg'); */
	var test = stoInfoNotice;
	console.log('입력한거가져와봐'+test);
	
	var param = {'stoInfoNotice':stoInfoNotice};
	
	$.ajax({
		type:'POST',
		url:'modifyInfo.do',
		data:param,
		success:function(data){
			alert('성공적으로 수정되었습니다!');
			
		},error:function(request, status, errorData){
            alert("error code: " + request.status + "\n"
                    +"message: " + request.responseText
                    +"error: " + errorData);
        } 
	})
	
	
}
</script>  -->

<script>
$(function(){
    var responseMessage = "<c:out value="${message}" />";
    if(responseMessage != ""){
        alert(responseMessage);
    }
}) 
</script>

</html>