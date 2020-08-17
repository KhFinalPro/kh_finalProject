<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>치킨의 민족</title>
	<style>
		/* body, hmtl{background: #ecf0f1;} */
		#storeList{margin: 0 auto; width: 90%; margin-top: 150px; text-align: center;}
		#store_category{float: right; width: 100px; height: 30px; border: 1px solid black; margin-bottom: 10px; margin-right:20px;}

		.store_area{margin:0 auto; margin-right:5px; margin-left:5px;  margin-bottom: 10px; width: 19.0%; height: 230px; border: 2px solid rgb(177, 175, 175); border-radius: 15px; float:left;}
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
		
		#store_category{width:100px; height:50px; font-size:20px; font-weight:600; border:0px; background-color:#735949; color:white; border-radius:15px;}
		
		#msg{font-size:25px; font-weight:600;}
	</style>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<section id="storeList">
		<c:if test="${empty deliveryList }">
			<c:if test="${!empty sessionScope.loginUser.id }">
				<p id="msg">주소를 선택해주세요~</p>
			</c:if>
			<c:if test="${empty sessionScope.loginUser.id }">
				<p id="msg">로그인시 이용가능합니다~</p>
			</c:if>
			<img src="resources/images/tung.png">
		</c:if>
		
		<!-- 주소지 입력시 -->
		<c:if test="${!empty deliveryList }">	 
			<input type="hidden" id="select_latlng" value="${latlng }">
			<input type="hidden" id="select_address" value="${address }">
	        <p id="store_count"><b>${count }</b>개 치킨집 배달 가능</p>
	        <p>${address }</p>
	        <select name="store_category" id="store_category">
	            <option value="distance">거리순</option>
	            <option value="good">인기순</option>
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
		                        <li class="store_minPrice"><img src="resources/images/start.png" alt="start"><fmt:formatNumber value="${d.rev_rate }" maxFractionDigits="2"/> 최소주문 ${d.ord_limit }원</li>
		                        <li class="store_delivery_time">40~50분</li>
		                    </ul>
		                </li>
		            </ul>
		        </div>
			</c:forEach>
		</c:if>
        
        
    </section>
    
    <br clear="both">
    
    <div id="move_area">
    	<button id="top" class="move_btn">Top</button><br>
    	<button id="bottom" class="move_btn">Bottom</button>
    </div>
	
	<jsp:include page="../common/footer.jsp"/>
	<div id="scrollbottom"></div>
</body>

<script>
	$(function(){		

		
		//$address = $("#select_address").val();
		//$("#address").val($address).prop("select",true);
		
		
		//카테고리별 ajax
		$("#store_category").on("change",function(){

			$latlng = $("#select_latlng").val();
			$address = $("#select_address").val();
			
			$store_category = $(this).val();

			$.ajax({
				url:"ajaxDeliveryList.do",
				data:{latlng:$latlng, address:$address, store_category:$store_category},
				dataType:"json",
				type:"post",
				success:function(data){

					$(".store_area").remove();
					$("#store_count").children("b").text(data.count);
					
					for(var i = 0; i < data.deliveryList.length; i++){
						var store_area = $("<div class='store_area'></div>");
						var store = $("<ul class='store'></ul>");
						
						$("#select_latlng").val(data.latlng);
						$("#select_address").val(data.address);
						
						store_area.append("<input type='hidden' id='sto_num' name='sto_num' value='"+ data.deliveryList[i].sto_num +"'/>");
						
						store.append("<li><div class='store_img'><img src='resources/images/"+ data.deliveryList[i].brand_pic +".png' alt='"+ data.deliveryList[i].brand_pic +"'></div><ul><li class='store_name'><b>" + data.deliveryList[i].sto_name +"</b></li><li class='store_minPrice'><img src='resources/images/start.png' alt='start'>" + data.deliveryList[i].rev_rate + " 최소주문" + data.deliveryList[i].ord_limit + "원</li><li class='store_delivery_time'>40~50분</li></ul></li>")
						
						store_area.append(store);
						
						$("#storeList").append(store_area);
						
					}
					
				},
				error:function(request, status, errorData){
					
				}
			})
		})
		
		//top bottom 버튼 함수
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
			
			location.href="deliveryList.do?latlng=" + $("#address option:selected").val() + "&address=" + $("#address option:selected").text();

		})
		
		//매장 상세 페이지이동		
		$(document).on("click",".store_area",function(){
			$sto_num = $(this).children("#sto_num").val();
			location.href="storeDetail.do?sto_num="+$sto_num +"&latlng=" + $("#select_latlng").val() + "&address=" + $("#select_address").val();
		})
	})
</script>
</html>