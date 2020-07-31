<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .contents{margin: 0 auto; width: 90%; height: 300px; z-index: 0; margin-top: 200px;}
   .banner {position: relative; width: 1200px; height: 300px;  margin:0 auto; padding:0; overflow: hidden;}
   .banner ul {position: absolute; margin: 0px; padding:0; width: 100%; list-style: none; }
   .banner ul li {float: left; width: 1200px; height: 300px; margin:0; padding:0;}
   
   
   /*main body*/
   #first_title{margin: 0; width: 100%; height: 50px; line-height: 50px; color:white; background-color: #2ac1bc;}
   .first_area{text-align: center;}
   .second_area{text-align: center;}
   .tree_area{text-align: center;}
   .title{margin-top: 20px; width: 100%; height: 50px; line-height: 50px; color:white; background-color: #2ac1bc;}
   .main_area{margin: 0 auto; width: 90%;}
   .main_area .place_area:hover{border: 2px solid #2ac1bc;}

   .main_area>.first_area>.place_area{width: 18%; height: 320px; background-color: #BDF2E8; margin-top: 10px; margin-bottom: 10px; border-radius: 10px; display: inline-block;}
   .main_area .first_area .place_area a .logo {margin: 0 auto; width: 100%; height: 150px; margin-top: 10px;}
   .main_area .first_area .place_area .start{width: 15px; height: 15px;}

   
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<br clear="both">
        <div class="contents">
            <div class="banner">
                <ul>
                    <li><a href="#"><img src="resources/images/benu1.png" width="1200px" height="300px"></a></li>
                    <li><a href="#"><img src="resources/images/benu2.png" width="1200px" height="300px"></a></li>
                    <li><a href="#"><img src="resources/images/benu3.png" width="1200px" height="300px"></a></li>
                    <li><a href="#"><img src="resources/images/benu4.png" width="1200px" height="300px"></a></li>
                    
                </ul>
            </div>
        </div>
    <br clear="both"><br><br>
    
    <c:if test="${menu_name != '' }">
		<h2 align="center" id="first_title">"${menu_name }"를 판매하는 매장</h2>
	</c:if>
	<c:if test="${menu_name == '' }">
		<h2 align="center" id="first_title">"${storeList.get(0).brand_name }"매장</h2>
	</c:if>
	
	<section class="main_area">
	    
	    <div class="first_area">
	    	<c:forEach var="s" items="${storeList }">
		        <div class="place_area" style="margin-right: 10px;">
		        	<input type="hidden" id="sto_num" name="sto_num" value="${s.sto_num }"/>
		            <a href="#">
		                <img class="logo" src="resources/images/${s.brand_pic }.png" alt="logo">
		            </a>
		            <div align="center">
		                <h3>${s.brand_name }</h3>
		                <h3>${s.sto_name }</h3>
		                <img class="start" src="resources/images/start.png" alt="start"><fmt:formatNumber value="${s.rev_rate }" maxFractionDigits="2"/>&nbsp;&nbsp;&nbsp;&nbsp;
		                40~50분 소요예정
		            </div>
		        </div>
	        </c:forEach>
	        
	    </div>
	</section>
</body>

<script language="JavaScript">
    
    $(document).ready(function() {
        var $banner = $(".banner").find("ul");

        var $bannerWidth = $banner.children().outerWidth();//이미지의 폭
        var $bannerHeight = $banner.children().outerHeight(); // 높이
        var $length = $banner.children().length;//이미지의 갯수
        var rollingId;

        //정해진 초마다 함수 실행
        rollingId = setInterval(function() { rollingStart(); }, 4000);//다음 이미지로 롤링 애니메이션 할 시간차
    
        function rollingStart() {
            $banner.css("width", $bannerWidth * $length + "px");
            $banner.css("height", $bannerHeight + "px");
            //alert(bannerHeight);
            //배너의 좌측 위치를 옮겨 준다.
            $banner.animate({left: - $bannerWidth + "px"}, 2000, function() { //숫자는 롤링 진행되는 시간이다.
                //첫번째 이미지를 마지막 끝에 복사(이동이 아니라 복사)해서 추가한다.
                $(this).append("<li>" + $(this).find("li:first").html() + "</li>");
                //뒤로 복사된 첫번재 이미지는 필요 없으니 삭제한다.
                $(this).find("li:first").remove();
                //다음 움직임을 위해서 배너 좌측의 위치값을 초기화 한다.
                $(this).css("left", 0);
                //이 과정을 반복하면서 계속 롤링하는 배너를 만들 수 있다.
            });
        }
    });  
</script>
<script>
	$(function(){
		$(".place_area").on("click",function(){
			$sto_num = $(this).children("#sto_num").val();
			alert($sto_num);
		})
	})
</script>
</html>