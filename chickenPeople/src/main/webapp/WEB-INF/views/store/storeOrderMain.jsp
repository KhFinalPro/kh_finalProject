<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
	#section{width:auto; background-color: white; display:block; margin-top:200px; }
	#section>div{margin-left: 10%; width: 65%;}
	       
    #footer {width: 100%;height: 100px; background-color: #2CBFB1; display:block;}
	
	body {font-family: Arial;}
	
	#order{width: 100%; border:1px solid black;}
	
	.store{width: 100%; height:250px;}
	.store>table{width: 100%; height:200px;}
	
	#London{padding: 0; width:100%; float:left;}
	#London ul{margin: 0 auto; padding: 0;}
	#London ul li{margin:0 auto; width:100%; line-height: 50px; list-style: none; background-color: white; color: #2ac1bc; font-size: 25px; font-weight: 600;}
	#London ul li a{margin-left: 20px;}
	#London>ul>li>ul>li{margin-left: 40px; width:80%; color:#735949;}
	
	/*메뉴 카테고리*/
	.menu a{cursor:pointer;}
	.menu .hide{display:none;}
	
	/* #store_info{border:1px solid black;} */
	#store_info :nth-child(1)>td{border-bottom: 1px solid black;}
	#store_info :nth-child(2) :nth-child(1)>td{border: 1px solid black;}
	
	.mainmenu_area{text-align: center; overflow-x: scroll; overflow-y: hidden; white-space: nowrap; width: 100%; height: 280px; background-color:rgb(236, 235, 235);}
	.main_menu{display: inline-block; border:1px solid black; border-radius:10px; margin: 10px; margin-top: 20px; width:200px; background-color:white;}
	.imgLen{width:100px; height:100px; margin-top:10px;}
	
	#orderCheck{position: fixed; top: 200px; right:10px; width: 23%; background-color: white; border:1px solid black;}
	#order_btn{margin: 0 auto; width: 100%; height: 50px; font-size: 25px; font-weight: 600; border:0px;}
	
	/*메뉴상세 - 정보*/
	#Tokyo h4{margin-top: 20px; margin-bottom:5px; font-size:25px;}
	.store_info_title{color: #d6d5d5;}
	
	/* Style the tab */
	.tab {overflow: hidden; border: 1px solid #ccc; background-color: #f1f1f1;}
	
	/* Style the buttons inside the tab */
	.tab button {margin:0 auto; width:33.3%; background-color: inherit; font-size: 25px; font-weight: 600; float: left; border: none; outline: none; cursor: pointer; padding: 14px 16px; transition: 0.3s; font-size: 17px;}
	
	/* Change background color of buttons on hover */
	.tab button:hover {background-color: #ddd;}
	
	/* Create an active/current tablink class */
	.tab button.active {background-color: #ccc;}
	
	/*모달창*/
	#modalReview{display:none; position: fixed; width: 100%; height: 100%; top: 0; left: 0; background-color: rgba(0, 0, 0, 0.7); z-index: 9999;}
	#modalReview>div{width: 450px; height: 600px; background-color: #fff; position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%);}
	#modalReview>div>div{position: absolute; top:58px; bottom:48px; overflow-y:auto;}
	#modalReview>div>a{width: 25px; height: 25px; position: absolute; top: 30px; right: 35px; display: block;}
	#modalReview>div>a>img{width:100%;}
	#modalReview>div>div>#modal_menu_pic{width:50%; height:200px; margin-top:30px; margin-left:25%;}
	#modalReview>div>h2{text-align:center;}
	#modalReview>div>div>#menu_name{text-align:center;}
	#modalReview>div>div>h4{display:inline-block;}
	#modalReview>div>div>h3{margin-left:10px;}
	#menu_price_titl{margin-left:10px;}
	#modal_ul li{list-style:none;}
	#order_put{position: absolute; bottom:0px; right:0px; width:100%; height:50px;}
	
	#orderCheck{border:1px solid black;}
	#orderCheck>h3{text-align: center;}
	#orderCheck>.total_price_area{width:90%; text-align: right;}
	#orderCheck>.total_price_area>h4{float:right;}
	#orderCheck>.list_area{overflow-y: auto; height: 200px;}
	#orderCheck>.list_area>.list_group>.list_group_item{list-style:none;}
	#orderCheck>.list_area>.list_group>.list_group_item .col{float:left; width: 40%;}
	#orderCheck>.list_area>.list_group>.list_group_item .update{text-align: right;}
</style>
        
</head>
<body>



  <jsp:include page="../common/header.jsp"/>
    
	<input type="hidden" id="brand_code" value="${storeList.get(0).brand_code }">
	<div id="section">
		<div>
			<div id="order">
				<!--  가게 간단한 정보  -->
				<div class="store">
  					<table id="store_info">
						<tr>
						    <td colspan="3" height="30"><b>${storeList.get(0).sto_name }</b>
						    </td>          			         
						</tr>
						<tr>
						    <td width="100"><img id="brand_pic" src="resources/images/${storeList.get(0).brand_pic }.png" style="width:100px; height:100px;"></td>
							<td>
								<pre><img src="resources/images/start.png" style="width:20px; height:20px;"></pre>
								<pre>최소주문금액 <b><fmt:formatNumber value="${storeList.get(0).ord_limit }" maxFractionDigits="3"/>원</b></pre>
								<pre>결제 <b>신용카드, 현금</b></pre>
								<pre>배달시간 <b>40~50분</b></pre>
							</td>				        	
  						</tr>
  						<tr>
      						<td colspan="3" height="50">${storeList.get(0).sto_intro }</td>
    					</tr>
					</table>
        		</div>
        
        		<div> <!-- 가게 정보 box1 -->
					<!-- 메뉴판  -->
					<h1>메뉴판</h1>
					<div class="mainmenu_area" id="test">						
						<c:forEach var="mainM" items="${storeList }">
							<!-- 메뉴명 줄이기 -->
							<c:set var="menu_name" value="${fn:substring(mainM.menu_name,0,10) }"/>
							<c:if test="${mainM.cat_code == 1 || mainM.cat_code == 2}">
								<div class="main_menu menu_click">
									<input type="hidden" id="menu_num" value="${mainM.menu_num }">
									<a href="#"><img src="resources/menu/${mainM.menu_pic }.jpg" class="imgLen" alt="image name"></a>	
									<br>
									<h4>${menu_name }..</h4>
									<p><fmt:formatNumber value="${mainM.menu_price }" maxFractionDigits="3"/>원</p>
								</div>
							</c:if>
						</c:forEach>
					</div>

            		<!-- tabs 메뉴 클릭 -->
					<h2>메뉴상세</h2>
					

					<div class="tab" style="width: 99.85%;">
						<button class="tablinks" onclick="openCity(event, 'London')">메뉴판</button>
						<button class="tablinks" onclick="openCity(event, 'Paris')">리뷰</button>
						<button class="tablinks" onclick="openCity(event, 'Tokyo')">정보</button>
					</div>

					<div id="London" class="tabcontent">
						<ul>
							<li class="menu">
							    <a>뼈치킨</a>
							    <ul class="hide">
						    		<c:forEach var="m1" items="${storeList }">
										<c:if test="${m1.cat_code == 1 }">
											<li class="menu_click">
												<input type="hidden" id="menu_num" value="${m1.menu_num }">
												${m1.menu_name } <fmt:formatNumber value="${m1.menu_price }" maxFractionDigits="3"/>원
											</li>
										</c:if>
									</c:forEach>
								</ul>
							</li>

							<li class="menu">
								<a>순살치킨</a>
								<ul class="hide">
									<c:forEach var="m1" items="${storeList }">
										<c:if test="${m1.cat_code == 2 }">
											<li class="menu_click">
												<input type="hidden" id="menu_num" value="${m1.menu_num }">
												${m1.menu_name } <fmt:formatNumber value="${m1.menu_price }" maxFractionDigits="3"/>원
											</li>
										</c:if>
									</c:forEach>
								</ul>
							</li>
							<li class="menu">
								<a>새트메뉴</a>
								<ul class="hide">
									<c:forEach var="m1" items="${storeList }">
										<c:if test="${m1.cat_code == 3 }">
											<li class="menu_click">
												<input type="hidden" id="menu_num" value="${m1.menu_num }">
												${m1.menu_name } <fmt:formatNumber value="${m1.menu_price }" maxFractionDigits="3"/>원
											</li>
										</c:if>
									</c:forEach>
								</ul>
							</li>
							<li class="menu">
								<a>사이드메뉴</a>
								<ul class="hide">
									<c:forEach var="m1" items="${storeList }">
										<c:if test="${m1.cat_code == 4 }">
											<li class="menu_click">
												<input type="hidden" id="menu_num" value="${m1.menu_num }">
												${m1.menu_name } <fmt:formatNumber value="${m1.menu_price }" maxFractionDigits="3"/>원
											</li>
										</c:if>
									</c:forEach>
								</ul>
							</li>
							<li class="menu">
								<a>음료</a>
								<ul class="hide">
									<c:forEach var="m1" items="${storeList }">
										<c:if test="${m1.cat_code == 5 }">
											<li class="menu_click">
												<input type="hidden" id="menu_num" value="${m1.menu_num }">
												${m1.menu_name } <fmt:formatNumber value="${m1.menu_price }" maxFractionDigits="3"/>원
											</li>
										</c:if>
									</c:forEach>
								</ul>
							</li>
							<li class="menu">
								<a>소스</a>
								<ul class="hide">
									<c:forEach var="m1" items="${storeList }">
										<c:if test="${m1.cat_code == 6 }">
											<li class="menu_click">
												<input type="hidden" value="${m1.menu_num }">
												${m1.menu_name } <fmt:formatNumber value="${m1.menu_price }" maxFractionDigits="3"/>원
											</li>
										</c:if>
									</c:forEach>
								</ul>
							</li>
						</ul>
					</div>

					<div id="Paris" class="tabcontent" style="display:none;">
						<h3>여긴 리뷰</h3>
						<p>Paris is the capital of France.</p> 
						<p>여기는 리뷰이다!</p>
					</div>

					<div id="Tokyo" class="tabcontent" style="display:none;">
						<h4>업체정보</h4>
						<hr>
						<c:if test="${storeList.get(0).open_yn == 'Y' }">
							<p class="store_info_title">영업상태</p><p>OPEN</p>
						</c:if>
						<c:if test="${storeList.get(0).open_yn == 'N' }">
							<p class="store_info_title">영업상태</p><p>CLOSE</p>
						</c:if>
						<p class="store_info_title">전화번호</p><p>${storeList.get(0).sto_tel }</p>
						<p class="store_info_title">주소</p><p>${storeList.get(0).sto_addr }</p>

						<h4>결제정보</h4>
						<hr>
						<p class="store_info_title">최소주문금액</p><p><fmt:formatNumber value="${storeList.get(0).ord_limit }" maxFractionDigits="3"/>원</p>
						<p class="store_info_title">결제수단</p><p>신용카드, 현금</p>
					</div>
				</div>
			</div> <!-- 가게 + 메뉴판-->

			<div id="orderCheck"> <!--주문 확인 orderHistory-->
				<h3>주문확인</h3>
				<div class="list_area">
					
				</div>
				<div class="total_price_area">
					<h4 id="total_price"></h4>
					<h4>합계: </h4>
				</div>
				<br clear="both">
				<p>이용약관,개인정보 수집 동의,개인정보 제 3자 제공,전자금융거래 이용약관
				만 14세 이상 이용자 내용 확인하였으며 결제에 동의합니다.</p>
				<button id="order_btn">주문하기</button>
			</div><!-- orderCheck end-->
		</div> 
	</div>
	<br clear="both">
	<jsp:include page="../common/footer.jsp"/>

	<div id="modalReview">
        <div>
            <a href="javascript: $('#modalReview').fadeOut(500);" id="modal_cancel">
                <img src="resources/images/close.png"/>
            </a>
            <h2>메뉴상세</h2>
            <div id="menu_option" style="width:100%;">            	
            	<img id="modal_menu_pic">
	            <h3 id="menu_name"></h3>
	            <hr>
	            <h4 id="menu_price_titl">가격 : </h4>
	            <h4 id="menu_price"></h4>
	            <br clear="both">
	            <hr>
	            <h3>추가메뉴</h3>
	            
            </div>
            <br clear="both">
            
            <button id="order_put">담기</button>
       </div>
    </div> 
</body>
<script>
<!-- 메뉴 카테고리 -->
	// html dom 이 다 로딩된 후 실행된다.
	$(document).ready(function(){
		// menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
		$(".menu>a").click(function(){
			var submenu = $(this).next("ul");
	
			// submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
			if( submenu.is(":visible") ){
				submenu.slideUp();
			}else{
				submenu.slideDown();
			}
		});
		
		$(".menu_click").on("click",function(){
			$menu_num = $(this).children("#menu_num").val();
			$brand_code = $("#brand_code").val();
			$modal = $("#modalReview");
			
			$("#modalReview").toggle(
				function(){
					
					$.ajax({
						url:"menuDetail.do",
						data:{menu_num:$menu_num, brand_code:$brand_code},
						dataType:"json",
						type:"post",
						success:function(data){
							$modal.addClass('show');
							$("#modal_ul").remove();
							console.log(data);
							$("#modal_menu_pic").attr('src', "resources/menu/"+data.menu_pic+".jpg");
							$("#menu_name").text(data.menu_name);
							$("#menu_price").text(data.menu_price+"원");
							var sideMenu_list = $("<ul id='modal_ul'></ul>");
							
							for(var i = 0; i<data.sideMenu.length; i++){
								sideMenu_list.append("<li><input type='checkbox' class='side_menu' name='menu_num' value='"+data.sideMenu[i].menu_num+"'><a>"+data.sideMenu[i].menu_name+"</a> +<span>"+data.sideMenu[i].menu_price+"원</span></li>");	
							}
							$("#menu_option").append(sideMenu_list);
						},
						error:function(request, status, errorData){
			            	alert("error code: " + request.status + "\n"
			                    +"message: " + request.responseText
			                    +"error: " + errorData);
						}
					})	
					
					
					
					
				}
				
			);
		})
		
		//사이드메뉴 클릭하고 담기 버튼
		var sideMenuName = [];	//사이드메뉴 담는 배열	
		var menuNum = [];	//메뉴번호 담는 배열
		var total_price = 0;
		
		$(document).on("click",".side_menu",function(){
			menuNum.push($(this).val());
			sideMenuName.push($(this).parent('li').children('a').text());
			total_price += parseInt($(this).parent('li').children('span').text());
			//alert($(this).children().html());
			console.log(sideMenuName);
		})
		
		//담기버튼
		$(document).on("click","#order_put",function(){
			var list_group = $("<ul id='list_group'></ul>");
			var menu_name = $(this).parent('div').children("#menu_option").children("#menu_name");
			var order_menu_name = $(this).parent('div').children("#menu_option").children("#menu_name").text() + " : ";
			for(i = 0; i<sideMenuName.length; i++){
				order_menu_name += " " + sideMenuName[i];
			};
			list_group.append("<li class='list_group_item'><div class='row'><h4 id='order_menu_name'>"+order_menu_name+"</h4></div><div class='price col'<a>삭제</a><span>"+"가격"+"</span></div><div class='update col'><a class='btn btn_minus'>-</a><span>"+1+"</span><a class='btn btn_plus'>+</a></div></li><br>");
			//$("#order_menu_name").text(order_menu_name);
			$(".list_area").append(list_group);
			//총 합계금액 업데이트
			total_price += parseInt($("#menu_price").text());
			$("#total_price").text(total_price);
			$("#modalReview").css('display','none');
		})
	});
	
	function openCity(evt, cityName) {
		var i, tabcontent, tablinks;
		tabcontent = document.getElementsByClassName("tabcontent");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("tablinks");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className.replace(" active", "");
		}
		document.getElementById(cityName).style.display = "block";
		evt.currentTarget.className += " active";
	}
</script>
</html>