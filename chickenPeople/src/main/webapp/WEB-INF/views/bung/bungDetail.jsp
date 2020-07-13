<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		#main_section{margin: auto; width: 80%; margin-top: 200px; clear: both;}
		#main_section>#head_area{margin: auto; width: 90%; height: 100%; z-index: 0;}
		
		#main_section>#head_area>.head_line{float: left; text-align: center;}
		/*로고*/
		#main_section>#head_area>#brand_logo{width: 40%; height: 250px;}
		#main_section>#head_area>#brand_logo>img{width: 100%; height: 250px;}
		/*제목*/
		#main_section>#head_area>#title{width: 55%; height: 250px; line-height: 50px; font-size: 25px; color: black; word-break: break-all;}
		#main_section>#head_area>#title>h2{margin-top: 100px;}
		/*관심*/
		#main_section>#head_area>#good>h3{margin: 0 auto; width: 100px; height: 50px; border-radius: 15px; background-color: #2ac1bc; color: white; line-height: 50px; text-align: center;}
		#main_section>#head_area>#good_contents{margin-left: 10px;}
		#main_section>#head_area>.head_second_line{float: left;}
		
		/*채팅*/
		#main_section>#head_area>#chatting>h3{margin: 0 auto; width: 100px; height: 50px; border-radius: 15px; background-color: #2ac1bc; color: white; line-height: 50px; text-align: center;}
		#main_section>#head_area>#chatting_status{margin-left: 10px;}
		#main_section>#head_area>.head_tree_line{float: left;}
		
		/*시간 정보*/
		#main_section>#date>img{width: 50px; height: 50px;}
		#main_section>#date_info{margin-left: 10px; height: 25px; line-height: 25px;}
		#main_section>.info_first_area{float: left;}
		
		/*위치 정보*/
		#main_section>#location>img{width: 50px; height: 50px;}
		#main_section>#location_info{margin-left: 10px; height: 25px; line-height: 25px;}
		#main_section>.info_second_area{float: left;}
		
		/*모임 정보*/
		#main_section>#user>img{width: 50px; height: 50px;}
		#main_section>#user_info{margin-left: 10px; height: 25px; line-height: 25px;}
		#main_section>.info_tree_area{float: left;}
		
		/*지도*/
		#main_section>#map{width: 500px; height: 400px; border: 1px solid black;}
		
		/*게시글 등록자*/
		#main_section>#my>img{width: 50px; height: 50px;}
		#main_section>#my_info{margin-left: 10px; height: 25px; line-height: 25px;}
		#main_section>.info_four_area{float: left;}
		
		/*태그*/
		#main_section>#tag_area{margin: 20px;}
		
		/*번개 내용 / 소개 */
		#main_section>#text_area{margin: auto; width: 90%;}
		#main_section>#text_area>textarea{margin: auto; width: 100%;}
	</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
	<br clear="both">

    <section id="main_section">
        <div id="head_area">
            <div id="brand_logo" class="head_line">
                <img src="resources/images/bbqLogo.png" alt="bbq">
            </div>
            <div id="title" class="head_line">
                <h2>치킨 번개 제목(교촌치킨 허니콤보 or 오븐에 빠진 닭)</h2>
            </div>
            
            <br clear="both"><br>

            <div id="good" class="head_second_line">
                <h3>관심있음</h3>
            </div>
            <div id="good_contents" class="head_second_line"><h4>치킨민족 8명이 관심있고, 총 100번 봤어요</h4></div>
            <br clear="both">

            <div id="chatting" class="head_tree_line"><h3>채팅중</h3></div>
            <div id="chatting_status" class="head_tree_line"><h4>치킨민족 4명 참여중이에요</h4></div>
            <br clear="both">
            
        </div>

        <hr>
        <h3>치킨번개 정보</h3>

        <div id="date" class="info_first_area"><img src="resources/images/date.png" alt=""></div>
        <div id="date_info" class="info_first_area"><h4>07월 11일 토요일 오후 10시</h4></div>
        <br clear="both">

        <div id="location" class="info_second_area"><img src="resources/images/location.png" alt=""></div>
        <div id="location_info" class="info_second_area"><h4>강남역 교촌치킨 강남1호점 - 야식 치킨 레츠고</h4></div>
        <br clear="both">

        <div id="user" class="info_tree_area"><img src="resources/images/user.png" alt=""></div>
        <div id="user_info" class="info_tree_area"><h4>20세 ~ 99세 치킨민족 참여가능 최대 6명까지</h4></div>

        <br clear="both"><br>

        <div id="map">
                        지도
        </div>

        <br><br>
        
        <div id="my" class="info_four_area"><img src="resources/images/user.png" alt=""></div>
        <div id="my_info" class="info_four_area"><h4>사용자 닉네임</h4></div>

        <br clear="both">

        <div id="tag_area">
            <a href="#">#치킨번개</a>&nbsp;
            <a href="#">#교촌치킨</a>&nbsp;
            <a href="#">#강남역</a>&nbsp;
            <a href="#">#맥주</a>&nbsp;
        </div>

        <div id="text_area">
            <h4>치킨번개 모집 내용 / 소개</h4>
            <textarea name="contents" id="contents" cols="127" rows="10"></textarea>
        </div>
    </section>

    <br clear="both">
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>