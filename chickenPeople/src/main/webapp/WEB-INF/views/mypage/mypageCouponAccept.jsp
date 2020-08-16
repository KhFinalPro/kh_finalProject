<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* body, hmtl{background: #ecf0f1; font-family: 'Anton', sans-serif;} */
	#coupon_area{margin: 0 auto; margin-top: 100px; width: 53%; text-align: center;}
	#coupon_area p{margin: 0; width: 100%; height: 50px; line-height: 50px; text-align: center; font-size: 20px; font-weight: 600; color:#735949;}
	/* #coupon_area .coupon{width: 1000px; height: 300px; margin-bottom: 10px; background-image: url("../workspace/images/coupon1.png");} */
	#coupon_area .coupon{width: 1000px; height: 100%; margin-bottom: 10px;}
	#coupon_area .coupon img{border-radius: 20px; transition: box-shadow 0.5s; border:1px solid black;}
	#coupon_area .coupon img:hover{border-radius: 20px; box-shadow: 7px 7px 7px #2ca494;}
	#coupon_area .coupon .create_date{margin: 0; margin-top: 10px; text-align: right; font-size: 20px; font-weight: 600; color: black;}
	#coupon_area .coupon ul{bottom: 10px;}
	#coupon_area .coupon .coup_term{text-align: right; margin-right: 10px; font-size: 20px; font-weight: 600; color: black;}

	.showMsg{position:fixed; width:30%; height:200px; z-index:100; left:35%; top: 100px; text-align:center; font-size:30px; font_weight:600; background-color: white; display:none;}
	.close{width:50px; height:50px; margin-left:85%; margin-top:20px;}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
	<input type="hidden" id="id" value="${sessionScope.loginUser.id }"/>
	
	<section id="coupon_area">
		<p>쿠폰 받아가자!</p>
        <c:forEach var="coupon" items="${couponList }">
	        <div class="coupon" >
	            <input type="hidden" id="coup_serial" value="${coupon.coup_serial }"/>
	            <p class="create_date">
	                <b>유효기간(발급일로 부터) : </b> ${coupon.coup_term }일
	            </p>
	            <img src="resources/coupon/${coupon.coup_pic }" alt="">
	            
	        </div>
        </c:forEach>

        
    </section>
    
    
    <input type="hidden" id="msg" value="${msg }">
    <div class="showMsg">
    	<img class="close" src="resources/images/close.png"/>
   	</div>	
	<%@ include file="../common/footer.jsp" %>
</body>
<script>
    $(function(){
        $(".coupon").on("click",function(){
        	if($("#id").val() != ""){
        		console.log($(this).children("#coup_serial").val());
        		$coup_serial = $(this).children("#coup_serial").val()
	            location.href="couponIssue.do?id="+$("#id").val()+"&coup_serial="+$coup_serial;    
        	}
        	else{
        		$(".showMsg").children("p").remove();
        		$(".showMsg").css("display","block");
	            $(".showMsg").append("<p>로그인시 이용가능.</p>");
        	}
        })
        
        if($("#msg").val() != ""){
        	$(".showMsg").children("p").remove();
        	$(".showMsg").css("display","block");
            $(".showMsg").append("<p>"+$("#msg").val()+"</p>");
        }
        
        $(".close").on("click",function(){
        	$(".showMsg").css('display','none');
        })
    })
</script>
</html>