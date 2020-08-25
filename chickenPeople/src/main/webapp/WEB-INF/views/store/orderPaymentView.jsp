<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>치민 결제</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

        <style>
            
            section{width:90%; margin:0 auto; margin-top:200px; position:relative;}

            section>#order{width:60%; margin: 0 auto; height:auto;}
            section>#order>.order_info{width:100%;}
            section>#order>.order_info>table{width:100%;}

            #payment_title{width:100%; height:50px; text-align: center; line-height: 50px; font-size:30px;}
          
            .title{height: 50px; line-height: 50px; font-size: 25px; font-weight: 600; border-top: 1px solid black; color:#735949;}
            .order_info #info{font-size: 25px; font-weight: 600; height: 50px; line-height: 50px; font-size: 25px; font-weight: 600; color:#735949;}
            .order_info #pay_addr{font-size: 35px; font-weight: 600; color:#2CBFB1;}
            .order_info #detail_address_area{margin-top: 10px; height:60px; line-height: 60px; font-size: 20px; background-color: rgb(238, 236, 236); vertical-align:middle;}
            .order_info #detail_address_area #detail_address{margin-bottom:5px; background-color: white; border:0px; height:30px; margin:0px; width:400px;}
            .order_info #pay_rcv{height:30px; margin-top:20px; margin-bottom:20px;}
            .order_info #phone{margin-top: 50px; font-size: 30px; font-weight: 300;}
            .order_info a{margin-left:20px; font-size: 20px;}
            
            #menuList_area{margin-top: 50px; width:100%; height: 250px; overflow-y: auto;}
            #menuList_area ul li{list-style: none; float: left; line-height: 100px;}
            #menuList_area ul .text{width: 40%;}
            #menuList_area ul .price{width: 20%; text-align: right;}
            #menuList_area ul .price .order_price{width: 80%; text-align: right; font-size: 25px; font-weight: 400; border: 0px;}
            #menuList_area ul li img{width: 100px; height: 100px;}
            #menuList_area ul li a{font-size: 30px; font-weight: 600;}
            #menuList_area ul li p{font-size: 25px; font-weight: 400; margin: 0;}

            #order_msgArea{margin-top: 50px; width:100%; }
            #order_msgArea #msg{width: 90%; height: 50px; margin: auto; overflow-x: auto; border: 0px; background-color: rgb(238, 236, 236);}

            #coupon_area{margin-top: 50px; width:100%;}
            #coupon_area #coupon_choice{width: 80%; height: 50px;}


            #pay_method_area ul li{list-style: none; float: left; margin-right: 20px;}
            #footer {width: 100%;height: 100px; background-color: #2CBFB1; display:block;}
			
			#orderCheck_area{position:fixed; top: 200px; right:10px; width:20%;height:380px;margin-right:0; border:soild; margin-left:15px; text-align: center; border: 2px solid #735949;}
            #orderCheck_area > h4{font-size: 30px;}
            #orderCheck{width: 90%; margin: 0 auto;}
            #orderCheck tr{height: 50px;}
            #orderCheck .orderCheck_item_title{text-align: left; font-size: 20px;}
            #orderCheck .orderCheck_item{text-align: right; font-size: 20px;} 
            #orderCheck .resultPrice{text-align: right; font-size: 30px; font-weight: 600;}
			
            #payment_btn{width: 80%; height: 70px; margin-top: 10px; font-size: 25px; font-weight: 600; border: 0px; color: white; background-color: #2ac1bc;}
        </style>
        
    </head>
    <body>
		<jsp:include page="../common/header.jsp"/>
   

    	<section>
    		<input type="hidden" id="id" name="id" value="${sessionScope.loginUser.id }">
    		<input type="hidden" id="sto_num" name="sto_num" value="${sto_num }">
    		
        <!-- <h2 id="payment_title">주문하기</h2> -->
	        <div id="order">
	        <!--  가게 간단한 정보  -->
	        
	            <div class="order_info">
	                
	
	                <p id="info" class="">배달정보</p>
	                <p id="pay_addr">${address }</p>
	                <div id="detail_address_area">&nbsp;&nbsp;&nbsp;*상세주소 : <input type="text" id="detail_address" name="detail_address" placeholder="상세주소를 입력해주세요." required></div>
					<a>*받으실분 : </a><span class="pay_rcv"><input type="text" id="pay_rcv" value="" placeholder="받으실분 성함." required></span><br>
	                <a>전화번호 : </a><span id="phone">${sessionScope.loginUser.tel }</span>
	            </div>
	                
	            <!-- 가게 정보 box1 -->
	            
	            <!-- 메뉴판  -->
	            <div id="menuList_area">
	            	<form action="payment.do" method="post" id="paymentForm">
	            		<input type="hidden" id="latlng" name="latlng" value="${latlng }">
	            		<input type="hidden" name="sto_num" value="${sto_num }">
	            		<input type="hidden" name="brand_code" value="${brand_code }">
		            	<c:forEach var="m" items="${menuList }">
			                <ul>
			            		<input type="hidden" class="menu_num" name="menu_numArr" value="${m.menu_num }">
			            		<input type="hidden" name="mord_numArr" value="${m.mord_num }">
			                    <%-- <li>
			                        <img src="resources/menu/${m.menu_Pic }.jpg" alt="">
			                    </li> --%>
			                    <li class="text">
			                        <a>${m.menu_name }</a>
			                        
			                    </li>
			                    <li class="text">
			                        <a>${m.mord_num }개</a>
			                    </li>
			                    <li class="price">
			                        <p><input type="text" class="order_price" readonly value="<fmt:formatNumber value="${m.price }" pattern=""/>">원</p>
			                    </li>
			                    <br clear="both">
			                </ul>
		                </c:forEach>
	                </form>
	            </div>
	    
	            <!-- tabs 메뉴 클릭 -->
	            <div id="order_msgArea">
	                <h2 class="title">요청사항</h2>
	                <p>가게 사장님께</p>
	                <!-- <textarea name="" id="" cols="30" rows="10"></textarea> -->
	                <input type="text" id="msg" placeholder="예) 견과류 빼주세요. 덜 맵게 해주세요.">
	            </div>
	
	            <div id="pay_method_area">
	                <h2 class="title">결제수단</h2>
	                <ul>
	                    <li>
	                        <input type="radio" id="card" name="method" value="card" checked="checked"><label for="card">현장카드</label>
	                    </li>
	                    <li>
	                        <input type="radio" id="cash" name="method" value="cash"><label for="cash">현장현금</label>
	                    </li>
	                    <li>
	                        <input type="radio" id="kakao" name="method" value="kakao"><label for="kakao">카카오페이</label>
	                    </li>
	                </ul>
	            </div>
	
	            <div id="coupon_area">
	                <h2 class="title">쿠폰</h2>
	                <select name="coup_num" id="coupon_choice">
	                	<c:if test="${empty myCouponList }"> <!-- 보유한 쿠폰이 없으면 -->
	                		<option value="" selected disabled hidden >보유하신 쿠폰이 없습니다..</option>
	                	</c:if>
	                	<c:if test="${!empty myCouponList }"> <!-- 보유한 쿠폰이 있으면 -->
	                		<option value="" >선택해주세요.</option>
	                		<c:forEach var="c" items="${myCouponList }">
	                    		<option value="${c.coup_num }">${c.coup_name } ${c.coup_disc }</option>
	                    	</c:forEach>
	                	</c:if>
	                </select>
	                <p id="coupon_info">
	                   	 
	                </p>
	            </div>
	            
	        </div> <!-- 가게 + 메뉴판-->
	
	        
	    </section>   
	    <div id="orderCheck_area"> <!--주문 확인 orderHistory-->
	        <h4>주문금액</h4>
	        <table id="orderCheck">
	            <tr>
	                <td class="orderCheck_item_title">메뉴 합계 금액</td>
	                <td class="orderCheck_item" id="price"><a>${total_price }</a>원</td>
	            </tr>
	            <tr>
	                <td class="orderCheck_item_title">쿠폰 사용 금액</td>
	                <td class="orderCheck_item" id="coup_price"></td>
	            </tr>
	            <tr>
	                <td class="orderCheck_item_title">최종 결제 금액</td>
	                <td class="resultPrice"><a>${total_price }</a>원</td>
	                <input type="hidden" id="pay_toal" value="${total_price }">
	            </tr>
	        </table>
	        <button id="payment_btn">결제하기</button>
	    </div><!-- orderCheck end-->

	
    	<jsp:include page="../common/footer.jsp"/>
    </body>
    <script>
        $(function() {
        	var price1 = $("#price").children("a").text().split(",")[0];
    		var price2 = $("#price").children("a").text().split(",")[1];
    		var price = price1 + price2;
    		$("#pay_toal").val(price);
        	var IMP = window.IMP;
        	IMP.init('imp33962000');
        	var msg;
        	
        	//결제
            $("#payment_btn").on("click",function(){
            	
            	var address = $("#pay_addr").text() + " " + $("#detail_address").val();
            	var tel = $("#phone").text();
            	var pay_msg = $("#msg").val();
            	//var pay_toal = $(".resultPrice").children("a").text();
            	var pay_toal = $("#pay_toal").val();
            	var coup_num = $("#coupon_choice option:selected").val();
            	var id = $("#id").val();
            	var pay_method = $("input[name='method']:checked").val();   
            	var pay_rcv = $("#pay_rcv").val();
            	
            	if($("#detail_address").val() != "" && $("#pay_rcv").val() != ""){
            		
	            	if($("input[name='method']:checked").val() == 'kakao'){
	            		IMP.request_pay({
	                        pg : 'kakaopay',
	                        pay_method : 'card',
	                        merchant_uid : 'merchant_' + new Date().getTime(),
	                        name : '치킨의 민족',
	                        amount : $(".resultPrice").children("a").text(),
	                        buyer_name : '최상원',
	                        buyer_tel : $("#phone").text(),
	                        buyer_addr : address,
	                        buyer_postcode : '123-456',
	                        //m_redirect_url : 'http://www.naver.com'
	                    }, function(rsp) {
	                        if ( rsp.success ) {
	                        	$("#paymentForm").append("<input type='hidden' name='pay_addr' value='"+ address +"'</input>");
	                        	$("#paymentForm").append("<input type='hidden' name='pay_tel' value='"+ tel +"'</input>");
	                        	$("#paymentForm").append("<input type='hidden' name='pay_msg' value='"+ pay_msg +"'</input>");
	                        	$("#paymentForm").append("<input type='hidden' name='pay_toal' value='"+ pay_toal +"'</input>");
	                        	$("#paymentForm").append("<input type='hidden' name='coup_num' value='"+ coup_num +"'</input>");
	                        	$("#paymentForm").append("<input type='hidden' name='user_id' value='"+ id +"'</input>");
	                        	$("#paymentForm").append("<input type='hidden' name='pay_method' value='"+ pay_method +"'</input>");
	                        	$("#paymentForm").append("<input type='hidden' name='pay_rcv' value='"+ pay_rcv +"'</input>");
	                        	$("#paymentForm").submit();
	                        	
	                        	
	                        } else {
	                            msg = '결제에 실패하였습니다.';
	                            msg += '에러내용 : ' + rsp.error_msg;
	                            //실패시 이동할 페이지
	                            
	                        }
	                    });
	            		//카카오결제 진행후 insert
	            	}
	            	else{
	            		$("#paymentForm").append("<input type='hidden' name='pay_addr' value='"+ address +"'</input>");
	                	$("#paymentForm").append("<input type='hidden' name='pay_tel' value='"+ tel +"'</input>");
	                	$("#paymentForm").append("<input type='hidden' name='pay_msg' value='"+ pay_msg +"'</input>");
	                	$("#paymentForm").append("<input type='hidden' name='pay_toal' value='"+ pay_toal +"'</input>");
	                	$("#paymentForm").append("<input type='hidden' name='coup_num' value='"+ coup_num +"'</input>");
	                	$("#paymentForm").append("<input type='hidden' name='user_id' value='"+ id +"'</input>");
	                	$("#paymentForm").append("<input type='hidden' name='pay_method' value='"+ pay_method +"'</input>");
	                	$("#paymentForm").append("<input type='hidden' name='pay_rcv' value='"+ pay_rcv +"'</input>");
	            		$("#paymentForm").submit();
		            }
            	}
            	else{
            		alert("필수 항목을 입력해주세요.")
            	}
            })
            
            //쿠폰 적용
            $("#coupon_choice").on("change",function(){
            	var coup_content = $("#coupon_choice option:selected").text();
            	var coup_disc = coup_content.split(" ");
            	$("#coup_price").children("a").remove();
            	
            	if(coup_disc[1] == null){
            		$("#coup_price").append("<a>0원</a>");
            		$(".resultPrice").children("a").text($("#price").children("a").text());
            	}
            	else{
            		$("#coup_price").append("<a>"+ coup_disc[1] +"원</a>")
	            	/* $("#coup_price").append("<a><input type='text' name='coup_disc' value='"+ coup_disc[1] +"'>원</a>") */
	            	/* var price1 = $("#price").children("a").text().split(",")[0];
            		var price2 = $("#price").children("a").text().split(",")[1]; */
            		var price = price1 + price2;
            		console.log(price);
	            	var total_price = parseInt(price) - parseInt($("#coup_price").children("a").text());
	            	$(".resultPrice").children("a").text(total_price.toLocaleString());   
	            	console.log(total_price);
	            	$("#pay_toal").val(total_price);
            	}
            })
        });
    </script>
	    
</html>