<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
<style>
.waitingMenuName{
		display: inline-block;
        vertical-align: middle;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
       	width: 260px;
}


.wrapper .main_container{

    width:94.8%;
    margin-top:70px;
    margin-left: 114px;
    padding:15px;
    transition: all 0.3s ease;
    overflow: hidden;
}

.wrapper .main_container .item{

   background: #fff; 
   margin-bottom: 10px; 
   padding: 15px; 
   font-size: 14px; 
   height: 873px; 
   border-bottom-right-radius: 20px;
   justify-content: center; 
   align-items: center; 
   margin-top: -30px;
   overflow-y: scroll;
   
} 
.item::-webkit-scrollbar {
	display:none;
}



/***********리뷰테이블**********/
.orderTitle{
    margin-top:20px;
    margin-left:48px;
    font-size: 18px;
    font-weight: bold;
}

.nowOrderStatus{
    float:right;
    margin-right: 50px;
   
}

.searchDate ul{
    text-align: center;
    
   
    
}

.content-table{
    /* position: absolute; */
    /* align-items: center; */
    width:90%;
    border-collapse: collapse;
    margin: 0 auto;
    /* margin:25px 0; */
    font-size:12px;
    min-width: 500px;
}

.content-table thead tr{

    border-top: 1px solid black;
    border-bottom: 1px solid black;
    text-align: left;
    font-weight: bold;
}

.content-table th,
.content-table td{
    padding:12px 15px;
    
}
.content-table tbody tr{
    border-bottom: 1px solid #dddddd;
}

.cal{
    height:33px;
    border-radius: 12px;
    border:0.5px solid rgba(160, 158, 158, 0.5);
    
}

.searchDate ul li{
    
    display: inline-block;
}

.wrapper1 .nowOrderStatus .nowOrderStatusBtn{
    border:solid;
    border-radius: 5px;
    color:#fff;
    background-color:#587be4; 
    width:180px;
    padding:5px;
    font-size:14px;
}

.wrapper1 .nowOrderStatus .totalReceiptBtn{
    border:none;
    border-radius: 5px;
    color:#21232b; 
    width:180px;
    padding:5px;
    font-size:14px;
}

.content-table .totalTd{
    border-top: 1.3px solid rgba(160, 158, 158, 0.5);
    border-bottom: 1.5px solid rgba(160, 158, 158, 0.5);
}

.content-table ul .totalOrder{
    margin-left:50px;
    font-size: 13px;
    font-weight: bold;
    float:left;
}

.content-table ul .totalPrice{
    margin-right:50px;
    font-size: 13px;
    font-weight: bold;
    float:right;
}

.wrapper1 .searchDate ul li button{
    padding:5px;
    font-size: 12px;

} 

#deliveryBtn{
	margin:5px;
	padding:5px;
	border:none;
	border-radius:2px;
}


#waitingOrderTable th{
	max-width:200px;
}

</style>
</head>
<body>

<jsp:include page="../common/adminSidebar.jsp"/>

		<div class="wrapper">
			<div class="main_container">
                <div class="item">
                    <div class="wrapper1">
                        <br>
                        
                        <div class="orderTitle">주문 리스트</div>
                        <br>
                        <div class="nowOrderStatus">
                            <button type="button" onclick="checkWaitingOrderList()" class="nowOrderStatusBtn" id="checkWaitingOrderList"><span id="nowOrderCount"></span></button>
                            <br>
                            <button type="button" onclick="showTotalRecieptList()" class="totalReceiptBtn" id="showTotalReciept">매출전표</button>
                        </div>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <div class="searchDate">
                            <ul>
                                <li><input type="date" class="cal" id="calendar"></li>&nbsp;-
                                <li><input type="date" class="cal" id="calendar2"></li>
                                &nbsp;&nbsp;
                           		<li><button type="button" onclick="chooseDate()" id="chooseDate">조회</button></li>
                            </ul>
                            
                        </div>
                        <br>
                        <br>
                                                                                                                                                
                    </div>
                        <table class="content-table" id="orderTable">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>주문번호</th>
                                    <th>주문메뉴</th>
                                    <th>주문일시</th>
                                    <th>주문자</th>
                                    <th>주문금액</th>
                                    <th>결제방법</th>
                                    <th>요청사항</th>
                                    <th>주문상태</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                          
                            </tbody>
                        </table>
                        <table class="content-table" id="summaryTable">
                            <td class="totalTd">
                                <ul>
                                    <li class="totalOrder">총 주문&nbsp; : <span id="orderCount"></span></li>
                                    <li class="totalPrice">전체금액 :&nbsp; <span id="orderTotalPrice"></span></li>
                                </ul>
                            </td>
                        </table>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                </div>
            </div>
          </div>
          
           <!-- 현재 접수중 모달 --> 
 <div id="waitingModal" style="position: fixed; display:none; width: 100%; height: 100%; top: 0; left: 0; background-color: rgba(0, 0, 0, 0.7); z-index: 9999;">
    <div style="width: 800px; height: 500px; background-color: #fff; border-radius: 20px; position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%);">
        <a href="javascript: $('#waitingModal').fadeOut(500);" style="width: 25px; height: 25px; position: absolute; top: 30px; right: 35px; display: block;">
            <img src="resources/images/close.png" style="width: 100%;"/></a>
        <div style="position: absolute; top : 40px; left:40px;">
        <h2>접수 대기내역</h2></div>
        <div style="position: absolute; top : 100px; /* left:70px; */">
       <table class="content-table" id="waitingOrderTable" style="width:100%">
           <thead>
              <tr>
              <th>주문번호</th>
              <th>주문메뉴</th>
              <th>주문일시</th>
              <th>결제방법</th>
              <th>주문상태</th>
              <th>접수처리</th>
              </tr>
           </thead>
           <tbody>
           </tbody>
       </table>
    </div>
    
    </div>
 </div>
 
 
 <!--! 주문전표 모달 -->
  <div id="totalRecieptModal" style="position: fixed; display:none; width: 100%; height: 100%; top: 0; left: 0; background-color: rgba(0, 0, 0, 0.7); z-index: 9999;">
    <div style="width: 450px; height: 450px; background-color: #fff; border-radius: 20px; position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%);">
        <a href="javascript: $('#totalRecieptModal').fadeOut(500);" style="width: 25px; height: 25px; position: absolute; top: 30px; right: 35px; display: block;">
            <img src="resources/images/close.png" style="width: 100%;"/></a>
        <div style="position: absolute; top : 40px; left:40px;">
        <h2>매출 현황</h2></div>
         <div  style="position: absolute; top : 110px; left:14px; margin-bottom:10px">
                <table id="orderSummaryTable1" >
                    <tr>
                        <th style="width: 140px; height: 25px; font-weight:normal;">매장명&nbsp;&nbsp;:</th>
                        <td id="modalStoName">역삼스타점</td>
                    </tr>
                    <tr >
                        <th style="width: 140px; height: 25px; font-weight:normal;">조회기간 :</th>
                        <td id="calendarDate"></td>
                    </tr>
                </table>
        </div>
          <div style="position: absolute; top : 200px; left:8%;">
                <table id="orderSummaryTable2" style="text-align: center; margin: auto 0;">
                    <thead>
                    <tr style="width: 140px; height: 25px; font-weight:normal; border-top:solid 1px black; border-bottom:solid 1px black">
                        <th style="width: 120px; height: 25px; ">월</th>
                        <th style="width: 120px; height: 25px; ">고객수</th>
                        <th style="width: 120px; height: 25px; ">매출금액</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
                 <table id="orderSummaryTable3" style="text-align: center; margin: auto 0;">
                    <thead>
                    <tr style="width: 140px; height: 25px; font-weight:normal; border-top:solid 1px black; border-bottom:solid 1px black">
                        <th style="width: 120px; height: 25px; ">합계</th>
                        <th style="width: 120px; height: 25px; ">200</th>
                        <th style="width: 120px; height: 25px; ">4000,000</th>
                    </tr>
                    </thead>
                </table>
            </div>
            <div  style="position: absolute; bottom : 50px; left:15%; margin-bottom:10px">
                <table id="orderSummaryTable4" >
                    <tr>
                        <th style="width: 110px; height: 25px;">출력일시&nbsp;&nbsp;:</th>
                        <th id="printDate">2020년 8월 12일</th>
                    </tr>
                </table>
        </div>
     
    </div>
    
    </div>
 </div>
</body>


<script>
$(function(){
	$(".orderBar").children().addClass('active');
})



$(document).ready(function(){
	init();
	
});

$(document).on('click','#deliveryBtn',function(){
	goDelivery(this);
});




$(document).on('click','#acceptOrder',function(){
	
	
	if(!confirm('주문 접수 확인하시겠습니까?')){
        return false;
     }
	ordNum = $(this).parents('tr').find('#ordNum').html();
	console.log('확인'+ordNum);
	
	acceptOrder(ordNum);
	
	
}); 




$(document).on('click','#cancelOrder',function(){
	if(!confirm('주문 접수 취소하시겠습니까?')){
        return false;
     }
	ordNum = $(this).parents('tr').find('#ordNum').html();
	console.log('확인'+ordNum);
	
	cancelOrder(ordNum);
	
	
}); 

function init(){
	searchDate();
}



var nowOrderCount='';

//데이터조회
function searchDate(){
	
	$.ajax({
		type:'GET',
		url:'getOrderList.do',
		dataType:'json',
		success:function(data){
			
			var orderList = data.orderList;
			var oderListAppendStr = '';
			console.log(orderList);
			
			//주문 목록 개수만큼 반복
			//메뉴 목록 개수만큼 반복
			
			var sum =0;
			for(var i=0; i<orderList.length; i++){
				oderListAppendStr += '<tr>'+
									'<td>'+(i+1)+'</td>'+
									'<td id="ordNum">'+orderList[i].ordNum+'</td>'+
									'<td>'+orderList[i].menuName+'</td>'+
									'<td>'+orderList[i].payDate+'</td>'+
									'<td>'+orderList[i].userId+'</td>'+
									'<td>'+orderList[i].payToal+'</td>'+
									'<td>'+orderList[i].payMethod+'</td>'+
									'<td>'+orderList[i].payMsg+'</td>'+
									'<td id="ordStatus">'+orderList[i].ordStatus+'</td>'+
									'<td>'+'<button type="button" id="deliveryBtn">'+'배송시작'+'</button>'+'</td>'
									'</tr>'
									
				sum += orderList[i].payToal;
			}
			$("#orderTable").find('tbody').empty();
			$("#orderTable").find('tbody').append(oderListAppendStr);
			
			
			$("#orderCount").empty();
			$("#orderCount").html("&nbsp"+orderList.length+"&nbsp"+"건");
			
			
		 	$("#orderTotalPrice").empty();
			$("#orderTotalPrice").html(sum);
			
	
			
			$("#nowOrderCount").html("현재"+"&nbsp"+data.WAITING_CHECK+"&nbsp"+"건 접수중");
		
		},error:function(request, status, errorData){
            alert("error code: " + request.status + "\n"
                    +"message: " + request.responseText
                    +"error: " + errorData);
        } 
	})
	
	
	
		
}


function chooseDate(){
	
var start = $("#calendar").val();
var end = $("#calendar2").val();

console.log(start+end);

var param = {'start':start,'end':end};
	
	$.ajax({
		type:'POST',
		url:"selectChooseOrder.do",
		data:param,
		dataType:'JSON',
		success:function(data){
			var chooseOrder = data.chooseOrder;
			var chooseOrderAppendStr = '';
			console.log(chooseOrder);
			
			
			//선택날짜 주문개수만큼
			//메뉴개수만큼 반복
			
			var sum =0;
			for(var i=0; i<chooseOrder.length; i++){
				
				chooseOrderAppendStr += '<tr>'+
									'<td>'+(i+1)+'</td>'+
									'<td>'+chooseOrder[i].ordNum+'</td>'+
									'<td>'+chooseOrder[i].menuName+'</td>'+
									'<td>'+chooseOrder[i].payDate+'</td>'+
									'<td>'+chooseOrder[i].userId+'</td>'+
									'<td>'+chooseOrder[i].payToal+'</td>'+
									'<td>'+chooseOrder[i].ordStatus+'</td>'+
									'<td>'+chooseOrder[i].payMethod+'</td>'+
									'<td>'+chooseOrder[i].payMsg+'</td>'+
									'</tr>'
									
			 	sum += chooseOrder[i].payToal;
			}
			console.log(sum);
			$("#orderTable").find('tbody').empty();
			$("#orderTable").find('tbody').append(chooseOrderAppendStr);
			
			
			$("#orderCount").empty();
			$("#orderCount").html("&nbsp"+chooseOrder.length+"&nbsp"+"건");
			
			
		 	$("#orderTotalPrice").empty();
			$("#orderTotalPrice").html(sum);
			
		},error:function(request, status, errorData){
            alert("error code: " + request.status + "\n"
                    +"message: " + request.responseText
                    +"error: " + errorData);
        } 
	
	});

	
} 


function goDelivery(obj){
	
	var ordNum = $(obj).parents('tr').find("#ordNum").html();
	var ordStatus = $(obj).parents('tr').find("#ordStatus").html();
	
	console.log(ordNum);
	console.log(ordStatus);
	
	var param = {'ordNum':ordNum};
	
	//console.log('배송시작할거야'+ordStatus);
	
	
	if(ordStatus=='배달준비'){
		
	if(!confirm('배달을 시작하시겠습니까?')){
         return false;
      }
	 
	 $.ajax({
		 type:'POST',
		 url:"updateOrderStatus.do",
		 data:param,
		 dataType:'JSON',
		 success:function(data){
			 
			alert('배달이 시작되었습니다!');
			//$("#deliveryBtn").css('color','#fff').css('background-color','#587be4');
			location.reload();
		   
			
			
		 },error:function(request, status, errorData){
             alert("error code: " + request.status + "\n"
                     +"message: " + request.responseText
                     +"error: " + errorData);
         } 
	 })
	 
	}else if(ordStatus=='배달중'){
		
		if(!confirm('이미 시작된 배달입니다. 완료하시겠습니까?')){
	         return false;
	      }
		
		 $.ajax({
			 type:'POST',
			 url:"updateOrderStatusAgain.do",
			 data:param,
			 dataType:'JSON',
			 success:function(data){
				 
				location.reload();
				alert('배달이 완료되었습니다!');
				
				
			 },error:function(request, status, errorData){
	             alert("error code: " + request.status + "\n"
	                     +"message: " + request.responseText
	                     +"error: " + errorData);
	         } 
		 })
		
	}else{
		alert('배달완료된 상품입니다!');
	}
	
}





function checkWaitingOrderList(){
	 $("#waitingModal").fadeIn(500);
	 
	 $.ajax({
		 type:'GET',
		 url:"selectWaitingList.do",
		 dataType:'JSON',
		 success:function(data){
			 
			 var selectWaitingList = data.selectWaitingList;
			 var selectWaitingArr = '';
			 
			 
			 
			 
			 for(var i=0; i<selectWaitingList.length; i++){
				 selectWaitingArr += '<tr>'+
									'<td id="ordNum">'+selectWaitingList[i].ordNum+'</td>'+
									'<td class="waitingMenuName">'+selectWaitingList[i].menuName+'</td>'+
									'<td>'+selectWaitingList[i].payDate+'</td>'+
									'<td>'+selectWaitingList[i].payMethod+'</td>'+
									'<td>'+selectWaitingList[i].ordStatus+'</td>'+
									'<td>'+'<button type="button" id="acceptOrder">'+'확인'+'</button>'+'<button type="button" id="cancelOrder">'+'취소'+'</button>'+'</td>'+
									'</tr>'
			 }
			 
			 console.log(selectWaitingArr);
			 $("#waitingOrderTable").find('tbody').empty();
			 $("#waitingOrderTable").find('tbody').append(selectWaitingArr);
			 
			 
		 },error:function(request, status, errorData){
             alert("error code: " + request.status + "\n"
                     +"message: " + request.responseText
                     +"error: " + errorData);
         } 
	 })
	 
	 
	 
}


//대기 주문 확인
function acceptOrder(ordNum){
	var ordNum = ordNum;
	var param = {'ordNum':ordNum};
	console.log(ordNum);
	
	 $.ajax({
		 type:'POST',
		 url:'updateOrderStatusAccept.do',
		 data:param,
		 dataType:'JSON',
		 success:function(data){
			 $("#waitingModal").fadeOut(500);
			 alert('성공적으로 접수확인 되었습니다!');
			 searchDate();
			 //location.reload();
			 
		 },error:function(request, status, errorData){
             alert("error code: " + request.status + "\n"
                     +"message: " + request.responseText
                     +"error: " + errorData);
         } 
		 
	 })
}


//대기 주문 취소
function cancelOrder(ordNum){

	var ordNum = ordNum;
	var param = {'ordNum':ordNum};
	console.log('취소'+ordNum);
	
	 $.ajax({
		 type:'POST',
		 url:'updateOrderStatusCancel.do',
		 data:param,
		 dataType:'JSON',
		 success:function(data){
			 $("#waitingModal").fadeOut(500);
			 alert('주문 취소되었습니다.');
			 searchDate();
			 //location.reload();
			 
		 },error:function(request, status, errorData){
             alert("error code: " + request.status + "\n"
                     +"message: " + request.responseText
                     +"error: " + errorData);
         } 
		 
	 })
	
	
}

//주문전표
function showTotalRecieptList(){

	

	
	
	
var start = $("#calendar").val();
var end = $("#calendar2").val();

var param = {'start':start,'end':end};


if(start&&end != null){
$("#totalRecieptModal").fadeIn(500);
	
$.ajax({
	type:'POST',
	url:'chooseDateTotalReciept.do',
	data:param,
	dataType:'JSON',
	success:function(data){
		
		var chooseDateTotalReciept = data.chooseDateTotalReciept;
		var chooseDateTotalRecieptArr='';
		var summaryArr='';
		var customerSum=0;
		var payTotalSum=0;
		
		
		for(var i=0; i<chooseDateTotalReciept.length; i++){
			chooseDateTotalRecieptArr += '<tr>'+
										'<td>'+chooseDateTotalReciept[i].payDate+'</td>'+
										'<td>'+chooseDateTotalReciept[i].customer+'</td>'+
										'<td>'+chooseDateTotalReciept[i].payTotal+'</td>'+
										'</tr>';
										
			customerSum +=chooseDateTotalReciept[i].customer;
			payTotalSum +=chooseDateTotalReciept[i].payTotal;
		}
		
		//console.log('요약'+customerSum+payTotalSum);
		
		
		//최종 요약 summary
		summaryArr = '<tr>'+
					'<th style="width: 120px; height: 25px; ">'+"합계"+'</th>'+
					'<th style="width: 120px; height: 25px; ">'+customerSum+'</th>'+
					'<th style="width: 120px; height: 25px; ">'+payTotalSum+'</th>'+
					'</tr>';

		 $("#calendarDate").empty();
		 $("#calendarDate").append(start+"&nbsp;&nbsp;-&nbsp;&nbsp;"+end);
		
		 $("#orderSummaryTable2").find('tbody').empty();
		 $("#orderSummaryTable2").find('tbody').append(chooseDateTotalRecieptArr);
		 
		 $("#orderSummaryTable3").find('thead').empty();
		 $("#orderSummaryTable3").find('thead').append(summaryArr);
		 
		 $("#printDate").empty();
		 $("#printDate").append(data.today); 
		 
		/*  $("#modalStoName").empty();
		 $("#modalStoName").append(data.stoName);
		 
		 */
		
		
		
	},error:function(request, status, errorData){
        alert("error code: " + request.status + "\n"
                +"message: " + request.responseText
                +"error: " + errorData);
    } 
})
}else{
	alert('조회하실 날짜를 먼저 선택해주세요!');
}
}








</script>
</html>