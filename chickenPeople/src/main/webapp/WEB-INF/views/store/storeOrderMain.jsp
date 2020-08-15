<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>치킨의민족</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
	#section{width:auto; background-color: white; display:block; margin-top:150px; }
	#section>div{margin-left: 10%; width: 65%;}
	       
    #footer {width: 100%;height: 100px; background-color: #2CBFB1; display:block;}
	
	#order{width: 100%;}
	
	.store{width: 100%; height:250px;}
	.store>table{width: 100%; height:200px;}
	
	#London{padding: 0; width:100%; float:left;}
	#London ul{margin: 0 auto; padding: 0;}
	#London ul li{margin:0 auto; width:100%; line-height: 50px; list-style: none; background-color: white; font-size: 25px; font-weight: 600;}
	#London ul li>a{margin-left: 20px; color:#735949;}
	#London>ul>li>ul>li{margin-left: 40px; width:80%; color: black; font-weight:600; font-size:20px;}
	
	/*메뉴 카테고리*/
	.menu a{cursor:pointer;}
	.menu .hide{display:none;}
	
	/* #store_info{border:1px solid black;} */
	#store_info :nth-child(1)>td{border-bottom: 1px solid black; font-size:30px; color:#735949;}
	#store_info :nth-child(2) :nth-child(1)>td{border: 1px solid black;}
	
	#reviewCount_titl{margin-left:20px; font-size:15px; font-weight:600;}
	#reviewCount{font-size:15px; font-weight:600;}
	
	.mainmenu_area{text-align: center; overflow-x: scroll; overflow-y: hidden; white-space: nowrap; width: 100%; height: 280px; background-color:#E0F8F7;}
	.main_menu{display: inline-block;border-radius:10px; margin: 10px; margin-top: 20px; width:200px; background-color:white;}
	.imgLen{width:100px; height:100px; margin-top:10px;}
	
	#orderCheck{position: fixed; top: 200px; right:10px; width: 23%; background-color: white; border:1px solid #2ac1bc;}
	.order_btn{margin: 0 auto; width: 100%; height: 50px; font-size: 25px; font-weight: 600; border:0px; background-color:#2ac1bc; color: white; }
	
	
	/*메뉴상세 - 정보*/
	#Tokyo h4{margin-top: 20px; margin-bottom:5px; font-size:25px;}
	.store_info_title{color: #d6d5d5;}
	
	/* Style the tab */
	.tab {overflow: hidden; border-top: 1px solid #2ac1bc; border-bottom: 1px solid #2ac1bc; }
	
	/* Style the buttons inside the tab */
	.tab button {margin:0 auto; width:33.3%; background-color: inherit; font-size: 25px; font-weight: 600; float: left; border: none; outline: none; cursor: pointer; padding: 14px 16px; transition: 0.3s; font-size: 17px;}
	
	/* Change background color of buttons on hover */
	.tab button:hover {color: #735949;}
	
	/* Create an active/current tablink class */
	.tab button.active {background-color: #2ac1bc; color:white;}
	
	/*모달창*/
	#modalReview{display:none; position: fixed; width: 100%; height: 100%; top: 0; left: 0; background-color: rgba(0, 0, 0, 0.7); z-index: 100;}
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
	
	#orderCheck{border:1px solid #2ac1bc;}
	#orderCheck>form>h3{text-align: center;}
	#orderCheck>form>.total_price_area{width:90%; text-align: right;}
	#orderCheck>form>.total_price_area>h4{float:right;}
	#orderCheck>form>.list_area{overflow-y: auto; height: 200px;}
	#orderCheck>form>.list_area>.list_group>.list_group_item{list-style:none;}
	#orderCheck>form>.list_area>.list_group>.list_group_item .col{float:left; width: 40%;}
	#orderCheck>form>.list_area>.list_group>.list_group_item .update{text-align: right;}
	
	/*리뷰*/
	#reivew_header{width:100%; height:50px; margin-left: 40%; margin-top: 10px; margin-bottom: 10px;}
	#reivew_header .rev_head{float: left; line-height: 50px;}
	#reivew_header>img{width: 50px; height: 50px;}
	#reivew_header>h3{font-size: 50px; margin: 0;}
	#reivew_header>a{height:50px; line-height:50px; margin-left:20px; font-size:20px;}
	#reivew_header>span{font-size:20px;}
	
	.review>ul{padding: 10px;}
	.review>ul>li{list-style: none;}
	.review>ul>li>.id{font-size: 20px; font-weight: 600; margin-right: 15px;}
	.review>ul>li>.rev_rate{margin: 0; font-size: 25px;}
	.review>ul>li>.rev_rate_area{margin-top: 16px;}
	.review>ul>li>.order_product{color: #735949;}
	.review>ul>li>.rev_pic{margin:0 auto; width: 100%; height:200px;}
	
	#like_area{margin: 0 auto; width:100%; text-align:center; height:40px; border:0px; background-color: #735949; color: white; border-radius: 10px;}
	#like{font-size: 25px; font-weight:600;}
	
	#showMsg{position:fixed; width:37%; height:300px; z-index:100; left:31.5%; top: 100px; text-align:center; font-size:25px; font_weight:600; background-color: white; display:none; border:2px solid black;}
	.close{width:50px; height:50px; margin-left:85%; margin-top:20px;}
	
	h2{color:#735949;}
</style>
        
</head>
<body>



  <jsp:include page="../common/header.jsp"/>
    
	
	<input type="hidden" id="sto_num" value="${storeList.get(0).sto_num }">
	<input type="hidden" id="loginUserId" value="${sessionScope.loginUser.id }">
	<input type="hidden" id="ord_limit" value="${storeList.get(0).ord_limit }">
	<div id="section">
		<div>
			<div id="order">
				<!--  가게 간단한 정보  -->
				<div class="store">
  					<table id="store_info">
						<tr>
						    <td colspan="3" height="30">
						    	<b>${storeList.get(0).sto_name }</b>
						    </td>
				    		<c:if test="${!empty  sessionScope.loginUser}">
							    <td align="right" style="width:10%;">
							    	<div id="like_area">
								    	<a id="like">찜하기</a>	
							    	</div>
							    </td>
					    	</c:if>					    	
						</tr>
						<tr>
						    <td width="100"><img id="brand_pic" src="resources/images/${storeList.get(0).brand_pic }.png" style="width:100px; height:100px;"></td>
							<td>
								<pre><img src="resources/images/start.png" style="width:20px; height:20px;"><a style="font-size:20px; font-weight:600;"><fmt:formatNumber value="${avg_review_rate }" maxFractionDigits="2"/></a><a id="reviewCount_titl">리뷰 : </a><span id="reviewCount">${reviewCount }개</span></pre>
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
					<h2>메뉴판</h2>
					<div class="mainmenu_area" id="test">						
						<c:forEach var="mainM" items="${storeList }">
							<!-- 메뉴명 줄이기 -->
							<c:set var="menu_subname" value="${fn:substring(mainM.menu_name,0,10) }"/>
							<c:if test="${mainM.cat_code == 1 || mainM.cat_code == 2}">
								<div class="main_menu menu_click">
									<input type="hidden" id="menu_num" value="${mainM.menu_num }">
									<input type="hidden" id="menu_name" value="${mainM.menu_name }">
									<input type="hidden" id="menu_price" value="${mainM.menu_price }">
									<a href="#"><img src="resources/menu/${mainM.menu_pic }.jpg" class="imgLen" alt="image name"></a>	
									<br>
									<h4>${menu_subname }..</h4>
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
												<input type="hidden" id="menu_name" value="${m1.menu_name }">
												<input type="hidden" id="menu_price" value="${m1.menu_price }">
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
												<input type="hidden" id="menu_name" value="${m1.menu_name }">
												<input type="hidden" id="menu_price" value="${m1.menu_price }">
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
												<input type="hidden" id="menu_name" value="${m1.menu_name }">
												<input type="hidden" id="menu_price" value="${m1.menu_price }">
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
												<input type="hidden" id="menu_name" value="${m1.menu_name }">
												<input type="hidden" id="menu_price" value="${m1.menu_price }">
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
												<input type="hidden" id="menu_name" value="${m1.menu_name }">
												<input type="hidden" id="menu_price" value="${m1.menu_price }">
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
												<input type="hidden" id="menu_num" value="${m1.menu_num }">
												<input type="hidden" id="menu_name" value="${m1.menu_name }">
												<input type="hidden" id="menu_price" value="${m1.menu_price }">
												${m1.menu_name } <fmt:formatNumber value="${m1.menu_price }" maxFractionDigits="3"/>원
											</li>
										</c:if>
									</c:forEach>
								</ul>
							</li>
						</ul>
					</div>

					<div id="Paris" class="tabcontent" style="display:none;">
						<div id="reivew_header">
							<img class="rev_head" src="resources/images/start.png"><h3 class="rev_head"><fmt:formatNumber value="${avg_review_rate }" maxFractionDigits="2"/></h3><a>리뷰 : </a><span>${reviewCount }개</span>
						</div>
						<hr>
						<div class="review">
							<c:forEach var="r" items="${reviewList }">
								<ul>
									<li>
										<a class="id">${r.user_id }</a><span>${r.rev_date }</span>
									</li>
									<li>
										<img class="rev_rate_area" src="resources/images/start.png" alt="" style="width: 25px; height: 25px;"><a class="rev_rate rev_rate_area">${r.user_rev_rate }</a>
									</li>
									<li>
										<p class="order_product">치킨 / 음료</p>
									</li>
									<li>
										<p class="rev_cont">${r.rev_cont }</p>
									</li>
									<li>
										<c:if test="${r.rev_pic != null }">
											<img class="rev_pic" src="resources/review/${r.rev_pic }" style="width:25%; height:25%;" alt=""><!-- 리뷰 이미지 -->
										</c:if>
									</li>
									<li>
										<c:if test="${r.rev_re == null}">
											<p></p>
										</c:if>
										<c:if test="${r.rev_re != null	}">
											<p><b>사장님 답변 - </b>${r.rev_re }</p>
										</c:if>
									</li>
								</ul>
								<hr>
							</c:forEach>
						</div>
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
				<form action="paymentView.do" method="get" id="orderCheckForm">
					<input type="hidden" id="brand_code" name="brand_code" value="${storeList.get(0).brand_code }">
					<input type="hidden" name="sto_num" value="${storeList.get(0).sto_num }">
					<input type="hidden" name="address" value="${address }">
					<input type="hidden" name="latlng" value="${latlng }">
					<h3>주문확인</h3>
					<div class="list_area" style="text-align:center;">
						
					</div>
					<div class="total_price_area">
						<h4 id="total_price"></h4>
						<h4>합계: </h4>
					</div>
					<br clear="both">
					<p>이용약관,개인정보 수집 동의,개인정보 제 3자 제공,전자금융거래 이용약관
					만 14세 이상 이용자 내용 확인하였으며 결제에 동의합니다.</p>
					
					<c:if test="${empty sessionScope.loginUser }">
						<button type="button" id="blogin" class="order_btn">주문 못해</button>
					</c:if>
					<c:if test="${!empty sessionScope.loginUser }">
						<c:if test="${storeList.get(0).open_yn == 'Y' }">
							<button type="button" id="order_btn" class="order_btn">주문하기</button>
						</c:if>
						<c:if test="${storeList.get(0).open_yn == 'N' }">
							<button type="button" id="storeClose" class="order_btn">주문 못해</button>
						</c:if>
					</c:if>
				</form>
			</div><!-- orderCheck end-->
		</div> 
	</div>
	<br clear="both">
	<jsp:include page="../common/footer.jsp"/>

	<div id="modalReview">
        <div>
            <a href="javascript: $('#modalReview').fadeOut(500);" id="modal_cancel">
                <img id="shoppingBag_cancel" src="resources/images/close.png"/>
            </a>
            <h2>메뉴상세</h2>
            <div id="menu_option" style="width:100%;">
            	<input type="hidden" id="menu_num" value="">            	
            	<img id="modal_menu_pic">
	            <h3 id="menu_name"></h3>
	            <hr>
	            <h4 id="menu_price_titl">가격 : </h4>
	            <h4 id="modal_menu_price"></h4>
	            <br clear="both">
	            <hr>
	            <h3>추가메뉴</h3>
	            
            </div>
            <br clear="both">
            
            <button id="order_put">담기</button>
       </div>
    </div>
    
    <div id="showMsg">
    	<img class="close" src="resources/images/close.png"/>
    	<h1 id="msg"></h1>
    </div>
</body>
<script>
<!-- 메뉴 카테고리 -->
	// html dom 이 다 로딩된 후 실행된다.
	$(document).ready(function(){
		
		var row;
		
		var total_price = 0;
		var price = 0;
		
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
		
		$(document).on("click",".menu_click",function(){
			row = $("<div class='row' style='text-align:left;'></div");
			
			$menu_num = $(this).children("#menu_num").val();
			$menu_name = $(this).children("#menu_name").val();
			$menu_price = parseInt($(this).children("#menu_price").val());
			$brand_code = $("#brand_code").val();
			$modal = $("#modalReview");

			row.append("<input type='text' class='menu_name' name='menu_name' value='"+ $menu_name +"' style='border: 0px;'><input type='hidden' class='menu_name' name='menu_num' value='"+ $menu_num +"'><input type='hidden' name='price' value='"+$menu_price+"'> : ");
			
			//금액
			price += $menu_price;
			
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
							
							$("#modal_menu_pic").attr('src', "resources/menu/"+data.menu_pic+".jpg");
							$("#menu_name").text(data.menu_name);
							$("#modal_menu_price").text(data.menu_price + "원");
							var sideMenu_list = $("<ul id='modal_ul'></ul>");
							
							for(var i = 0; i<data.sideMenu.length; i++){
								sideMenu_list.append("<li><input type='checkbox' id='side_menu' class='side_menu' name='menu_num' value='"+data.sideMenu[i].menu_num+"'><a>"+data.sideMenu[i].menu_name+"</a> +<span>"+data.sideMenu[i].menu_price+"</span>원</li>");	
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
		
		
		//사이드메뉴 체크박스
		$(document).on("click",".side_menu",function(){
			$menu_name = $(this).parent("li").children("a").text();
			$menu_num = $(this).val();
			$menu_price = parseInt($(this).parent("li").children("span").text());
			
			if($("input[type='checkbox']").is(":checked") == true) {
				row.append("<input type='text' class='menu_name' name='menu_name' value='"+ $menu_name +"' style='border: 0px;'><input type='hidden' class='menu_name' name='menu_num' value='"+ $menu_num +"'><input type='hidden' name='price' value='"+$menu_price+"'> : ");
			}
			
			price += $menu_price; 
		})
		
		
		
		//담기버튼
		$(document).on("click","#order_put",function(){
			
			/* for(var i = 0; i < $("input[type='checkbox']").filter(":checked").size(); i++){
				console.log(i);	
				
			} */
				
			
			$("#total_price").children("span").remove();
			var list_group = $("<ul class='list_group'>");
			var list_group_item = $("<li class='list_group_item'></li>");
			var col = $("<div class='price col' style='float:left; width: 100%; text-align:left;'>");
			
			//메뉴명
			list_group_item.append(row);
									
			
			//금액
			var item_price = $("<a><img class='menu_cancel' src='resources/images/close.png' style='width:20px; height:20px;'/></a><span><input type='text' value='"+price+"' style='border:0px; font-size:20px; width:100px; text-align:right;'>원</span>");
			col.append(item_price);
			list_group_item.append(col);
			
			list_group.append(list_group_item);
			list_group.append("<br clear='both'>");
			$(".list_area").append(list_group);
			$("#modalReview").css('display','none');
			
			total_price += price;
			$("#total_price").append("<span><input type='text' name='total_price' value='"+ total_price +"' style='width:100px; text-align:right; font-size:20px; border:0px;'>원</span>")
			
			price = 0;
			
		})
		
		//취소버튼
		$(document).on("click",".menu_cancel",function(){
			$(this).parent("a").parent(".col").parent(".list_group_item").parent(".list_group").remove();
			
			//total_price
			$price = $(this).parent("a").parent(".col").children("span").children("input").val();
			total_price -= $price;
			
			$("#total_price").children("span").remove();
			$("#total_price").append("<span><input type='text' name='total_price' value='"+ total_price +"' style='width:100px; text-align:right; font-size:20px; border:0px;'>원</span>")
		})
		
		$("#shoppingBag_cancel").on("click",function(){
			price = 0;
		})
		
		//결제 페이지 이동
		var pay_product = [];
		$(document).on("click","#order_btn",function(){
			
			if(total_price >= $("#ord_limit").val()){
				$("#orderCheckForm").submit();				
			}
			else{
				$("#msg").html($("#ord_limit").val() + "원 이상 구매하셔야 합니다.");
	        	$("#showMsg").css('display','block');
			}
		})
		
		//찜하기 버튼
		$("#like").on("click",function(){
			$sto_num = $("#sto_num").val();
			$loginUserId = $("#loginUserId").val();
			$.ajax({
				url:"storeLike.do",
				data:{sto_num:$sto_num, id:$loginUserId},
				dataType:"json",
				type:"post",
				success:function(data){
					console.log(data.msg);
					$("#myPageStoreLike").remove();
					$("#showMsg").css('display','block');
					$("#msg").html(data.msg);
					$("#showMsg").append("<button id='myPageStoreLike' style='width:200px; height: 50px; font-size: 20px; font-weight:600; border:0px; background-color: #735949; color: white;'>찜한 매장 확인하자</button>");
				},
				error:function(request, status, errorData){
	            	alert("error code: " + request.status + "\n"
	                    +"message: " + request.responseText
	                    +"error: " + errorData);
				}
			})
		})
		
		//모달 창 닫기
		$(document).on("click",".close",function(){
        	$("#showMsg").css('display','none');
        })
        
        //마이페이지의 찜한 매장 보러가기
        $(document).on("click","#myPageStoreLike",function(){
        	location.href="storeLikeList.do";
        })
        
        //주문 버튼 shomMsg
        $("#blogin").on("click",function(){
        	$("#msg").html("회원만 이용 가능!!");
        	$("#showMsg").css('display','block');
        })
        
        $("#storeClose").on("click",function(){
        	$("#msg").html("아쉽게 영업이 끝났어요ㅠㅠ");
        	$("#showMsg").css('display','block');
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