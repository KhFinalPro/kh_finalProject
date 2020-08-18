<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    

<html>
<head>
   <title>치킨의 민족</title>
   <style>
         /*GLOBALS*/

      a{text-decoration:none; color:#666;}
      a:hover{color:#1bc1a3;}
      body, hmtl{background: #ecf0f1; font-family: 'Anton', sans-serif;}
      
      
      #wrapper{width: 88%;margin:0 auto;height:300px;position:relative;color:black; margin-top: 100px;  }
      
      #slider-wrap{width:1200px;height:300px;position:relative;overflow:hidden; margin:0; padding:0; list-style:none;}
      
      #slider-wrap ul#slider{width:100%;height:100%;position:absolute;top:0;left:0; margin:0; padding:0; list-style:none;}
      
      #slider-wrap ul#slider li{float:left;position:relative;width:1200px;height:300px; margin:0; padding:0; list-style:none;}
      
      #slider-wrap ul#slider li > div{position:absolute;top:20px;left:35px; margin:0; padding:0; list-style:none;}
      
      #slider-wrap ul#slider li > div h3{font-size:36px;text-transform:uppercase; margin:0; padding:0; list-style:none;}
      
      #slider-wrap ul#slider li > div span{font-family: Neucha, Arial, sans serif;font-size:21px; margin:0; padding:0; list-style:none;}
      
      #slider-wrap ul#slider li img{display:block; width:100%; height: 300px; margin:0; padding:0; list-style:none;}
      
      
      /*btns*/
      .btns{position:absolute;width:50px;height:60px;top:50%;margin-top:-25px;line-height:57px;text-align:center;cursor:pointer; background:rgba(0,0,0,0.1);z-index:100;-webkit-user-select: none;  -moz-user-select: none; -khtml-user-select: none; -ms-user-select: none;-webkit-transition: all 0.1s ease;-moz-transition: all 0.1s ease;-o-transition: all 0.1s ease;-ms-transition: all 0.1s ease;transition: all 0.1s ease; margin:0; padding:0; list-style:none;}
      
      .btns:hover{background:rgba(0,0,0,0.3); }
      
      #next{right:-50px; border-radius:7px 0px 0px 7px; margin:0; padding:0; list-style:none;}
      #previous{left:-50px; border-radius:0px 7px 7px 7px; margin:0; padding:0; list-style:none;}
      #counter{top: 30px; right:35px; width:auto; position:absolute; margin:0; padding:0; list-style:none;}
      
      #slider-wrap.active #next{right:0px;}
      #slider-wrap.active #previous{left:0px;}
      
      
      /*bar*/
      #pagination-wrap{min-width:20px;margin-top:350px;margin-left: auto; margin-right: auto;height:15px;position:relative;text-align:center;}
      
      #pagination-wrap ul {width:100%;}
      
      #pagination-wrap ul li{margin: 0 4px;display: inline-block;width:5px;height:5px;border-radius:50%;background:#fff;opacity:0.5;position:relative;top:0;}
      
      #pagination-wrap ul li.active{width:12px; height:12px; top:3px; opacity:1; box-shadow:rgba(0,0,0,0.1) 1px 1px 0px; }
      
      
      
      
      /*Header*/
      h1, h2{text-shadow:none; text-align:center;}
      h1{ color: #666; text-transform:uppercase;  font-size:36px;}
      h2{ color: #7f8c8d; font-family: Neucha, Arial, sans serif; font-size:18px; margin-bottom:30px;} 
      
      
      
      
      /*ANIMATION*/
      #slider-wrap ul, #pagination-wrap ul li{-webkit-transition: all 0.3s cubic-bezier(1,.01,.32,1); -moz-transition: all 0.3s cubic-bezier(1,.01,.32,1); -o-transition: all 0.3s cubic-bezier(1,.01,.32,1); -ms-transition: all 0.3s cubic-bezier(1,.01,.32,1); transition: all 0.3s cubic-bezier(1,.01,.32,1); }
      
      #login_area{width: 330px; height: 300px; text-align: center; margin-left:50px;}
      .banner_login{float: left;}
      .banner_login #login_title{font-family: Neucha, Arial, sans serif;font-size: 30px; font-weight: 600; margin-top: 5px; margin-bottom: 20px;}
      .banner_login #login{font-family: Neucha, Arial, sans serif;font-size: 25px; font-weight: 600; color: black; margin-top: 20px;}
      .banner_login img{width: 100px; height: 100px;}
      .banner_login .btn{width: 49%; height: 50px; margin-top: 1px; border: 0px; background-color: #735949; color:white;  font-size: 15px; font-weight: 600;}
      .banner_login ul li{margin-top: 10px;}
      .banner_login ul li a{font-size: 20px;}
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
      
      /*프로필 이미지 둥글게*/
      .imagebox {margin: 0 auto; width: 100px; height: 100px; border-radius: 70%; overflow: hidden; }
	  .profile { width: 100%; height: 100%; object-fit: cover;}
   </style>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
   <link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>
</head>
<body>
   <jsp:include page="common/header.jsp"/>
   <input type="text" id="id" value="${sessionScope.loginUser.id }">
   <br clear="both">
        

    
    
    <!-- -------------------------------------------- -->
    <div id="wrapper">
       <div id="slider-wrap" class="banner_login">
           <ul id="slider">
               <li>            
                   <a href="#"><img src="resources/images/banner1.png"></a>
               </li>
               
               <li>
                   <img class="myCouponView" src="resources/images/banner5.png">
               </li>
               
               <li>
                   <a href="bungList.do"><img src="resources/images/banner2.png"></a>
               </li>
               
               <li>
                   <a href="#"><img id="" src="resources/images/banner3.png"></a>
               </li>
               
               <li>
                   <a href="deliverView.do"><img src="resources/images/banner4.png"></a>
               </li>
               <li>
                   <a href="boardList.do"><img src="resources/images/banner6.png"></a>
               </li>
               
           </ul>
           
           <!--controls-->
           <div class="btns" id="next"><i class="fa fa-arrow-right"></i></div>
           <div class="btns" id="previous"><i class="fa fa-arrow-left"></i></div>
           <div id="counter"></div>
           
           <div id="pagination-wrap">
               <ul>
               </ul>
           </div>
           <!--controls-->  
                   
       </div>
        <c:if test="${!empty sessionScope.loginUser}">
           <c:if test="${sessionScope.loginUser.uLvl == '관리자' }">
              <div id="login_area" class="banner_login">
                 <p id="login_title">치킨의민족 시작하기</p>
                 
				 <c:if test="${empty loginUser.pic}">
	                 <img src="resources/images/user1.png" alt="">
				 </c:if>         
                 <p id="login">${sessionScope.loginUser.name }</p>
         
                 <button class="system_btn btn">System</button>
                 <button class="logout_btn btn">LogOut</button>
              </div>
           </c:if>
           <c:if test="${sessionScope.loginUser.uLvl == '소비자' }">
              <div id="login_area" class="banner_login">
                 <p id="login_title">치킨의민족 시작하기</p>
                 <c:if test="${!empty loginUser.pic}">
	                 <div class='imagebox'>
	                 	<img class="profile" src="resources/propic/${loginUser.pic }" alt="">
	         		 </div>
         		 </c:if>
                 <c:if test="${empty loginUser.pic}">
 		                 <img src="resources/images/user1.png" alt="">
				 </c:if>         		 
                 <p id="login">${sessionScope.loginUser.name }</p>
         
                 <button class="my_btn btn">MyPage</button>
                 <button class="logout_btn btn">LogOut</button>
              </div>
           </c:if>
           <c:if test="${sessionScope.loginUser.uLvl == '판매자' }">
              <div id="login_area" class="banner_login">
                 <p id="login_title">치킨의민족 시작하기</p>
                 
                  <c:if test="${!empty loginUser.pic}">
	                 <div class='imagebox'>
	                 	<img class="profile" src="resources/images/${loginUser.pic }.png" alt="">
	         		 </div>
         		 </c:if>
                 <c:if test="${empty loginUser.pic}">
 		                 <img src="resources/images/user1.png" alt="">
				 </c:if>
         
                 <p id="login">${sessionScope.loginUser.name }</p>
         
                 <button class="store_btn btn" id="storeModal">Store</button>
                 <button class="logout_btn btn">LogOut</button>
              </div>
           </c:if>
          
      </c:if>
      
        <c:if test="${empty sessionScope.loginUser}">
           <div id="login_area" class="banner_login">
              <p id="login_title">치킨의민족 시작하기</p>
              
              <img src="resources/images/user1.png" alt="">
      
              <p id="login">로그인해주세여~</p>
      
              <button class="login_btn btn">Login</button>
              <button class="Join_btn btn">Join</button>
           </div>
      </c:if>
           
       
   
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
      
      <!-- 다슬 판매자시작하기 모달 -->
	<div id="startModal" style="position: fixed; display:none; width: 100%; height: 100%; top: 0; left: 0; background-color: rgba(0, 0, 0, 0.75); z-index: 9999;">
	  <div style="width: 380px; height: 300px; background-color: #fff; border-radius: 20px; position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%);">
	  <a href="home.do;" style="width: 25px; height: 25px; position: absolute; top: 30px; right: 35px; display: block;">
	 <img src="resources/images/close.png" style="width: 100%;"/></a> 
	  <div style="position: absolute; top : 100px; left:80px;">
	         <b style="font-size:20px;">장사를 시작하시겠습니까?</b>
	  </div>
	      <button type="button" onclick="start()" style="position:absolute; left:140px; background:#587be4; color:#fff; padding:10px; bottom:70px; border:none; border-radius:10px;"><b>확인</b></button>
	      <button type="button" onclick="exit()" style="position:absolute; left:190px; background:#efefef; color:#21232b;  padding:10px; bottom:70px; border:none; border-radius:10px;"><b>취소</b></button>
	  </div>
	</div>
	
	 
</body>


<!-- 다슬스크립트 -->
<script>

$("#storeModal").click(function(){
	//alert('장사를 종료하시겠습니까?');
	$('#startModal').fadeIn(500);
	
});

function start(){
	
	
	$.ajax({
		type:'GET',
		url:'updateOpenStatusYes.do',
		dataType:'JSON',
		success:function(){
			alert('장사를 시작합니다!');
			$('#startModal').fadeOut(500);
			location.href="storeAdminMain.do";
			
			
		},error:function(request, status, errorData){
            alert("error code: " + request.status + "\n"
                    +"message: " + request.responseText
                    +"error: " + errorData);
        } 
	})
}


function exit(){

	$('#startModal').fadeOut(500);
	
}
</script>










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
      location.href="storeJoinForm.do";
   }
   
   function notice(){
      location.href="nList.do";
   }

   $(function(){
      $(".close").on("click",function(){
           $(".showMsg").css('display','none');
        })
   })
   
   $(".login_btn").on("click",function(){      //로그인
      location.href="loginView.do"
   })
   
   $(".join_btn").on("click",function(){      //회원가입
      location.href="memberJoinView.do";
   })
   
   $(".my_btn").on("click",function(){         //마이페이지
      location.href="mypage.do";
   })
   
   $(".logout_btn").on("click",function(){      //로그아웃
      location.href="logoutView.do";
   })
   
   $(".system_btn").on("click",function(){      //시스템 페이지 이동
      location.href="brandTotalGraph.do";
   })
   
/*    $(".store_btn").on("click",function(){
      location.href="storeAdminMain.do";
   }) */
   
    var pos = 0;
   //number of slides
   var totalSlides = $('#slider-wrap ul li').length;
   //get the slide width
   var sliderWidth = $('#slider-wrap').width();
   
   
   $(document).ready(function(){
       
       
       /*****************
        BUILD THE SLIDER
       *****************/
       //set width to be 'x' times the number of slides
       $('#slider-wrap ul#slider').width(sliderWidth*totalSlides);
       
       //next slide    
       $('#next').click(function(){
           slideRight();
       });
       
       //previous slide
       $('#previous').click(function(){
           slideLeft();
       });
       
       
       
       /*************************
        //*> OPTIONAL SETTINGS
       ************************/
       //automatic slider
       var autoSlider = setInterval(slideRight, 3000);
       
       //for each slide 
       $.each($('#slider-wrap ul li'), function() { 
   
          //create a pagination
          var li = document.createElement('li');
          $('#pagination-wrap ul').append(li);    
       });
       
       //counter
       countSlides();
       
       //pagination
       pagination();
       
       //hide/show controls/btns when hover
       //pause automatic slide when hover
       $('#slider-wrap').hover(
         function(){ $(this).addClass('active'); clearInterval(autoSlider); }, 
         function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, 3000); }
       );
       
       
   
   });//DOCUMENT READY
       
   
   
   /***********
    SLIDE LEFT
   ************/
   function slideLeft(){
       pos--;
       if(pos==-1){ pos = totalSlides-1; }
       $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));    
       
       //*> optional
       countSlides();
       pagination();
   }
   
   
   /************
    SLIDE RIGHT
   *************/
   function slideRight(){
       pos++;
       if(pos==totalSlides){ pos = 0; }
       $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos)); 
       
       //*> optional 
       countSlides();
       pagination();
   }
   
   
   
       
   /************************
    //*> OPTIONAL SETTINGS
   ************************/
   function countSlides(){
       $('#counter').html(pos+1 + ' / ' + totalSlides);
   }
   
   function pagination(){
       $('#pagination-wrap ul li').removeClass('active');
       $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
   }
       //-->  
</script>

</html>