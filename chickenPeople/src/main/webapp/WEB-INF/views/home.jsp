<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    

<html>
<head>
   <title>치킨의 민족</title>
   <style>
		.contents{margin: 0 auto; width: 100%; height: 300px; z-index: 0; margin-top: 100px;}
        .banner {position: relative; width: 100%; height: 300px;  margin:0 auto; padding:0; overflow: hidden;}
        .banner ul {position: absolute; margin: 0px; padding:0; width: 100%; list-style: none; }
        .banner ul li {float: left; width: 100%; height: 300px; margin:0; padding:0;}
        .banner ul li a{width: 100%;}
        
        
        /*main body*/
        .first_area{text-align: center;}
        .main_area{margin: 0 auto; width: 90%; text-align: center; }
        .main_area>.first_area>.place_area{width: 32.59%; height: 350px; margin-top: 10px; margin-bottom: 10px; border-radius: 25px; float: left; box-shadow: 0px 5px 5px rgb(226, 226, 226);}
        .main_area .first_area .place_area a .logo {margin: 0 auto; width: 100%; height: 250px; margin-top: 10px; border-radius: 20px;}
        .main_area .first_area .place_area div p{font-size: 25px; font-weight: 600;}

        
        #chicken_live{margin: 0px; font-size: 50px; font-weight: 600; margin-left: 5%; color:#735949;}
		
		.showMsg{position:fixed; width:30%; height:200px; z-index:100; left:35%; top: 100px; text-align:center; font-size:30px; font_weight:600; background-color: white; display:none;}
		.close{width:50px; height:50px; margin-left:85%; margin-top:20px;}
   </style>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="common/header.jsp"/>
	<input type="hidden" id="id" value="${sessionScope.loginUser.id }">
	<br clear="both">
        

    <div class="contents">
        <div class="banner">
            <ul>
            	<c:if test="${empty sessionScope.loginUser}">
	            	<li>	
	                	<a href="#"><img src="resources/images/banner1.png" width="100%" height="300px"></a>  <!--쿠폰함-->
	                </li>
                </c:if>
                <li><img class="myCouponView" src="resources/images/banner5.png" width="100%" height="300px"></li>  <!--나의 쿠폰함-->
                <li><a href="bungList.do"><img src="resources/images/banner2.png" width="100%" height="300px"></a></li>  <!--번개-->
                <li><a href="#"><img id="" src="resources/images/banner3.png" width="100%" height="300px"></a></li>  <!--배달 현황-->
                <li><a href="deliverView.do"><img src="resources/images/banner4.png" width="100%" height="300px"></a></li>  <!--딜리버리-->
                <li><a href="boardList.do"><img src="resources/images/banner6.png" width="100%" height="300px"></a></li>  <!--맛잘알-->
            </ul>
        </div>
    </div>

    <br clear="both">
    <p id="chicken_live">Chicken's Minjok LIVE</p>

    

    <section class="main_area">
        
    	<div class="first_area">
        	<div class="place_area" style="margin-right: 10px;" onclick="deliver();">
                <a href="#">
                    <img class="logo" src="resources/images/delivery.png" alt="logo">
                </a>
                <div align="center">
                    <p>치킨 먹고 싶니~?!?</p>
                </div>
            </div>
            <div class="place_area" style="margin-right: 10px;" onclick="bung();">
                <a href="#">
                    <img class="logo" src="resources/images/bung.png" alt="logo">
                </a>
                <div align="center">
                    <p>치킨 먹을 사람~~</p>
                </div>
            </div>
            <div class="place_area" style="margin-right: 10px;" onclick="matjalal();">
                <a href="#">
                    <img class="logo" src="resources/images/matjalal.png" alt="logo">
                </a>
                <div align="center">
                    <p>치킨의 황금 레시피!!</p>
                </div>
            </div>
            <div class="place_area" style="margin-right: 10px;" onclick="coupon();">
                <a href="#">
                    <img class="logo" src="resources/images/coupon.png" alt="logo">
                </a>
                <div align="center">
                    <p>회원 가입하고 쿠폰 받아가자!!</p>
                </div>
            </div>
            <div class="place_area" style="margin-right: 10px;" onclick="apply();">
                <a href="#">
                    <img class="logo" src="resources/images/apply.png" alt="logo">
                </a>
                <div align="center">
                    <p>점포신청!!</p>
                </div>
            </div>
            <div class="place_area" style="margin-right: 10px;" onclick="notice();">
                <a href="#">
                    <img class="logo" src="resources/images/notice.png" alt="logo">
                </a>
                <div align="center">
                    <p>무슨 공지사항이야~??</p>
                </div>
            </div>
        </div>
	</section>
	<br clear="both">

	<%@ include file="../views/common/footer.jsp" %>
	
	<div class="showMsg">
    	<img class="close" src="resources/images/close.png"/>
    	
   	</div>	
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
	        $banner.css("width", $bannerWidth  + "px");
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
	
	function deliver(){
		if($("#id").val() == ""){
			location.href="deliverView.do";
		}
		else{
			location.href="deliverView.do?latlng=" + $("#address option:selected").val() + "&address=" + $("#address option:selected").text();
		}
	}
	
	function bung(){
		location.href="bungList.do";
	}
	
	function matjalal(){
		location.href="boardList.do";
	}
	
	function coupon(){
		location.href="couponAccept.do";
	}
	
	function apply(){
		
	}
	
	function notice(){
		location.href="nList.do";
	}

	$(function(){
		$(".close").on("click",function(){
        	$(".showMsg").css('display','none');
        })
	})
	
</script>

</html>
