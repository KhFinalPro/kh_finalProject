<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	 /*main_section*/
     #main_section{margin: auto; clear: both; margin-top:200px;} 
     #main_section>.bungae_area{display: inline-block; margin: 0; margin-bottom:10px; width: 49.6%; height: 280px; border:1px solid black;}
     #main_section>.bungae_area>.brand_logo{width: 31%; height: 210px;}
     #main_section>.bungae_area>.brand_logo>a>img{width: 100%; height: 100%;}

     #main_section>.bungae_area>.first_line{float: left; height: 210px;}
     #main_section>.bungae_area>.bungae_title{width: 65%; margin-left: 20px; margin-top: 15px; text-align: center;}

     #main_section>.bungae_area>.brand_name{text-align:center; font-size: 30px; font-weight: 600; line-height: 50px; width: 31%; height: 50px; border-radius: 15px; color: white; background-color: #2ac1bc;}
     #main_section>.bungae_area>.status{width: 100px; margin-left: 20px; height: 50; line-height: 50px; }
     #main_section>.bungae_area>.second_line{float: left;}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<br clear="both">

    <div id="main_section">
    	
    	<%for(int i = 0; i < 10; i++) { %>
			<div class="bungae_area">
			    <div class="brand_logo first_line">
			        <a href="#"><img src="resources/images/bbqLogo.png" alt="logo"></a>
			    </div>
			    <div class="first_line bungae_title">
			        <h2>치킨 번개 모집합니다~</h2>
			        <h3>7월 4일 이번 주 토요일 오후 7시 강남역 1번 출구</h3>
			        <h4>20세 ~ 99세 8명까지</h4>
			    </div>
			    <br clear="both">
			    <div class="brand_name second_line ">
			        BBQ
			    </div>
			    <div class="status second_line">
			              모집중
			    </div>
			</div>
		<%} %>
    </div>
    <%@ include file="../common/footer.jsp" %>
</body>

<script>
	$(function(){
		$(".bungae_area").on("click",function(){
			location.href="bungDetail.do"
		})
	})
</script>
</html>