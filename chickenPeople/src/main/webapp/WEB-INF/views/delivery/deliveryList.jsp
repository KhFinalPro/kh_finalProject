<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>

		#storeList{margin: 0 auto; width: 100%; margin-top: 200px; text-align: center;}
		#store_category{float: right; width: 200px; height: 30px; border: 1px solid black; margin-bottom: 10px;}

		.store_area{margin: 0 auto; margin-bottom: 10px; width: 19.0%; height: 230px; border: 2px solid rgb(177, 175, 175); border-radius: 15px; display: inline-block;}

		.store_area:hover{border: 2px solid #2ac1bc;}
		.store_area .store{padding: 0; text-align: left;}
		.store_area .store b{font-size:20px;}
		.store_area .store .store_img img{width: 100%; height: 100px;}
		.store_area .store li{list-style: none;}
		.store_area .store li a{text-decoration: none; color: black;}
		.store_area .store li ul{padding: 10px;}
		.store_area .store li ul .store_name a{font-size: 20px;}
		.store_area .store li ul .store_minPrice a{font-size: 15px; color: gray;}
		.store_area .store li ul .store_delivery_time a{font-size: 15px; color: gray;}
		.store_area .store li ul .store_minPrice img{width: 15px; height: 15px;}
		
		#move_area{position:fixed; bottom:100px; right:10px;}
		.move_btn{width:80px; height:50px; border-radius: 10px; border:0px; font-size:20px; font-weight:600; color:white; background-color:#2ac1bc;}
		.move_btn:hover{color:black;}		
		#top{margin-bottom: 10px;}
		
		#store_count{font-size: 30px;}
		#store_count>b{font-size:50px;}
	</style>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<section id="storeList">
		<input type="hidden" id="select_address" value="${address }">
        <p id="store_count"><b>${count }</b>개 치킨집 배달 가능</p>
        <select name="store_category" id="store_category">
            <option value="">거리순</option>
            <option value="">인기순</option>
            <option value="">찜한목록순</option>
        </select>
    
        <br clear="both">
        <hr style="color: gray;">
        
		<c:forEach var="d" items="${deliveryList }">
	        <div class="store_area">
	        	<input type="hidden" id="sto_num" name="sto_num" value="${d.sto_num }"/>
	            <ul class="store">
	                <li>
	                    <div class="store_img">
	                        <img src="resources/images/${d.brand_pic }.png" alt="${d.brand_pic }">
	                    </div>
	                    <ul>
	                        <li class="store_name"><b>${d.sto_name }</b></li>
	                        <li class="store_minPrice"><img src="resources/images/start.png" alt="start">${d.rev_rate } 최소주문 ${d.ord_limit }원</li>
	                        <!-- <li class="store_bestMenu"><a href="#">(BEST)후라이드치킨</a></li> -->
	                        <li class="store_delivery_time">40~50분</li>
	                    </ul>
	                </li>
	            </ul>
	        </div>
		</c:forEach>
        
        
    </section>
    
    <div id="move_area">
    	<button id="top" class="move_btn">Top</button><br>
    	<button id="bottom" class="move_btn">Bottom</button>
    </div>
	
	<jsp:include page="../common/footer.jsp"/>
	<div id="scrollbottom"></div>
</body>

<script>
	$(function(){		

		$address = $("#select_address").val();
		$("#address").val($address).prop("selected",true);
		
		//매장 상세 페이지이동
		$(".store_area").on("click",function(){
			$(this).children("#sto_num").val();
			//location.href="";
			alert($(this).children("#sto_num").val());
		})
		
		$("#store_category").on("change",function(){
			alert("카테고리 변화");
		})
		$("#top").on("click",function(){
			location.href="#";
		})
		$("#bottom").on("click",function(){
			location.href="#scrollbottom";
		})
		
		$(".move_btn").on("mouseenter",function(){
			$(this).css('cursor','pointer');
		})
		
		//header.jsp 의 주소창 변경시 딜리버리에 뿌려줄 매장 가져오기
		$("#address").on("change",function(){
			
			location.href="deliveryList.do?address=" + $("#address option:selected").val();
		
			
		})
		
		
	})
</script>
</html>