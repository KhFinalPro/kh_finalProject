<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calendar</title>
<link href='resources/css/main.css' rel='stylesheet'/>
<script src='resources/js/main.js'></script>
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.js" integrity="sha256-DrT5NfxfbHvMHux31Lkhxg42LY6of8TaYyK50jnxRnM=" crossorigin="anonymous"></script>

<script>
$(document).ready(function(){
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth'
      },
      initialDate: new Date,
      editable: true,
      navLinks: true, // can click day/week names to navigate views
      displayEventTime: false,
      dayMaxEvents: true, // allow "more" link when too many events
      events: function(info,successCallback,failureCallback){
          var events=[];
          console.log("나오니?");
		 $.ajax({
		    url:"selectOrderList.do",
		    dataType:"json",
		    success: function(data){
		       console.log("data" + data);
		       var orderList = data.orderList;
		       for(var i in orderList){  
                   events.push({
                      title: '주문내역 확인',
                      /* data.orderList[i].ordNum, */
                      date:data.orderList[i].ordDate,
                      id:data.orderList[i].ordNum,

		                
		                
		             })
		       };
		       
		       successCallback(events);
		       
		       },
		        error:function(request, status, errorData){
		            alert("error code: " + request.status + "\n"
		                  +"message: " + request.responseText
		                  +"error: " + errorData);
		       } 
		    })

		},
		//오더넘버를 클릭하면
		eventClick: function(info){
			//console.log("hi");
		showOrderDetail(info.event.id);
		
		
		
		calendar.getEvents();
		
		
		},
		loading: function(bool) {
		document.getElementById('loading').style.display =
		bool ? 'block' : 'none';
		}
		});
    
	    calendar.render();
	  });

</script>
<style>

  body {
    margin: 0;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #script-warning {
    display: none;
    background: #eee;
    border-bottom: 1px solid #ddd;
    padding: 0 10px;
    line-height: 40px;
    text-align: center;
    font-weight: bold;
    font-size: 12px;
    color: red;
  }

  #loading {
    display: none;
    position: absolute;
    top: 10px;
    right: 10px;
  }

  #calendar {
    max-width: 900px;
    margin: 40px auto;
    padding: 0 10px;
    margin-top:60px;
  }

  .con{
    position: absolute;
    top:100px;
    left:60px;
  }
     
  .fa-star{
     
    font-size:20px;
    top: 100px;
  }


</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>

<br>
<br>
<br>
<br>
  <div id='script-warning'>
   
  </div>

  <div id='loading'>loading...</div>

  <div id='calendar'></div>

<jsp:include page="../common/footer.jsp"/>


<!-- 주문내역 모달 -->
    <div id="modalOrderHistory" style="position: fixed; display:none; width: 100%; height: 100%; top: 0; left: 0; background-color: rgba(0, 0, 0, 0.7); z-index: 9999;">
        <div style="width: 450px; height: 600px; background-color: #fff; border-radius: 20px; position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%);">
            <a href="javascript: $('#modalOrderHistory').fadeOut(500);" style="width: 25px; height: 25px; position: absolute; top: 30px; right: 35px; display: block;">
                <img src="resources/images/close.png" style="width: 100%;"/></a>
            <div style="position: absolute; top:20px; left:40%;">
            <h2>주문내역</h2>
            </div>
            <div style="position: absolute; top:120px; left:50px;">
                <span>현재&nbsp;&nbsp;<span style="margin-top: 5px;" id="modal_sto_status"></span>입니다</span>
                <h2 style="margin-top: 5px;" id="modal_sto_name"></h2>
                <input type="hidden" id="hidden_sto_num" name="hidden_sto_num">
      
            </div>
            <div  style="position: absolute; top : 190px; left:14px;">
                <table id="orderDetailTable1" >
                    <tr>
                        <th style="width: 140px; height: 25px; font-weight:normal;">주문일시 :</th>
                        <td id="modal_order_date"></td>
                    </tr>
                    <tr >
                        <th style="width: 140px; height: 25px; font-weight:normal;">주문번호 :</th>
                        <td id="modal_order_num"></td>
                    </tr>
                </table>
            </div>
            <div style="position: absolute; top : 275px; left:10%;">
                <table id="orderDetailTable2" style="text-align: center; margin: auto 0;">
                    <thead>
                    <tr style="width: 140px; height: 25px; font-weight:normal; border-top:solid 1px black; border-bottom:solid 1px black">
                        <th style="width: 150px; height: 25px; ">메뉴</th>
                        <th style="width: 90px; height: 25px; ">수량</th>
                        <th style="width: 90px; height: 25px; ">가격</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
            <div style="position: absolute; top : 450px; left:22%;">
                <table id="orderDetailTable3">
                    <tr>
                        <th style="width: 140px; height: 25px; font-size: 17px; font-weight:bold;">총 주문금액 &nbsp;&nbsp;: </th>
                        <td id="modal_order_price" style="font-size: 18px; font-weight:bold"></td>
                    </tr>
                </table>
            </div>
           
            
            <button type="button" onclick="goReview()" id="goReviewBtn" style="position: absolute; bottom: 50px; left:38%; font-weight: bold; border: none; border-radius: 5px; width: 100px; height: 35px; font-size: 14px;">리뷰쓰기</button>
        </div>
     </div> 
     
     <!-- 리뷰쓰기 모달 -->
        <div id="modalReview" style="position: fixed; display:none; width: 100%; height: 100%; top: 0; left: 0; background-color: rgba(0, 0, 0, 0.7); z-index: 9999;">
        <div style="width: 450px; height: 600px; background-color: #fff; border-radius: 20px; position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%);">
            <a href="javascript: $('#modalReview').fadeOut(500);" style="width: 25px; height: 25px; position: absolute; top: 30px; right: 35px; display: block;">
                <img src="resources/images/close.png" style="width: 100%;"/></a>
            <div style="position: absolute; top:20px; left:32%;">
            <h2>리뷰 작성하기</h2>
            </div>
            <div class="con">
                <span style="font-size: 18px; font-weight: bold;">평점&nbsp;&nbsp;</span>
                <i class="fa fa-star" aria-hidden="true" id="s1" onclick="test1()"
                ></i>
                <i class="fa fa-star" aria-hidden="true" id="s2" onclick="test2()"
                ></i>
                <i class="fa fa-star" aria-hidden="true" id="s3" onclick="test3()"
                ></i>
                <i class="fa fa-star" aria-hidden="true" id="s4" onclick="test4()"
                ></i>
                <i class="fa fa-star" aria-hidden="true" id="s5" onclick="test5()"
                ></i>
            </div>
            <div id="review_content" style=" position: absolute; top:130px; left:60px;">
                <p style="font-size: 18px; font-weight: bold; margin-bottom: -10px;">리뷰 작성<p>
                <textarea id="textarea_review_content"style="width: 330px; height: 100px; border-radius: 10px; border: solid 2px black; required"></textarea>
            </div>  
            <div id="review_photo_area" style=" position: absolute; top:280px; left:60px;">
                <p style="font-size: 18px; font-weight: bold; margin-bottom: -10px;">사진 등록<p>
                <img id="review_photo" style="width:332px; height:150px; border-radius: 10px; border: solid black 2px;">
            	
            </div>  
           	
            <button onclick="reveiw_done_btn()" id="reveiw_done_btn" style="position: absolute; bottom: 50px; left:38%; font-weight: bold; border: none; border-radius: 5px; width: 100px; height: 35px; font-size: 14px;">등록하기</button> 
        	<div id="fileArea">
        		
        		<input type="file" id="uploadFile" name="uploadFile" onchange="LoadImg(this)" multiple>
        	
        	</div>
        </div>
     </div>
</body>




<!-- 별점 스크립트 -->


 <script type="text/javascript">


 
 		$(document).ready(function(){
          $("#s1").click(function(){
            $(".fa-star").css("color","black");
            $("#s1").css("color","yellow");
          });
          $("#s2").click(function(){
            $(".fa-star").css("color","black");
            $("#s1,#s2").css("color","yellow");
          });
          $("#s3").click(function(){
            $(".fa-star").css("color","black");
            $("#s1,#s2,#s3").css("color","yellow");
          });
          $("#s4").click(function(){
            $(".fa-star").css("color","black");
            $("#s1,#s2,#s3,#s4").css("color","yellow");
          });
          $("#s5").click(function(){
            $(".fa-star").css("color","black");
            $("#s1,#s2,#s3,#s4,#s5").css("color","yellow");
          });
        });

</script>

<!-- 리뷰사진 스크립트 -->
<script>
	$(function(){
		$("#fileArea").hide();
		$("#review_photo_area").click(function(){
			$("#uploadFile").click();
		})
	})
	function LoadImg(value){
		if(value.files && value.files[0]){


			var reader= new FileReader();
			reader.onload = function(e){ //파일 성공적으로 로딩됫나?
				console.log(e);
				console.log("사진변경");
				var src = $("#review_photo").attr("src",e.target.result);
				
				console.log(src);
				
				//console.log(imgs);
			}
			reader.readAsDataURL(value.files[0]);
		}
	}
	
	
	
</script>





<!-- 주문 내역 디테일 -->
<script>
function showOrderDetail(id){
	console.log(id);
	
	var param = {'orderNo':id};
	
	$("#modalOrderHistory").fadeIn(500);
	
	$.ajax({
		type:'POST',
		url:"showOrderDetail.do",
		data:param,
		dataType:'JSON',
		success:function(data){
			 var orderDetailList =data.orderDetailList;
        	 var orderDetailListAppendStr = '';
			 var stoName='';
			 //매장번호
			 stoNum = orderDetailList[0].stoNum;
			 console.log('스토어번호'+stoNum);
			 $('input[name=hidden_sto_num]').attr('value',stoNum);
				 
			 
			 //매장이름	
        	 stoName	= orderDetailList[0].stoName;
        	 console.log('스토어네임'+stoName);
        	 $('#modal_sto_name').html(stoName);
        	 
			 
			 
			 //주문상태
		
			  ordStatus = orderDetailList[0].ordStatus;
			  console.log('스토어네임'+ordStatus);
	          $('#modal_sto_status').html(ordStatus);
			 
			/*  ordStatus = '<td>'+orderDetailList[0].ordStatus+'</td>';
        	 console.log(ordStatus);
        	 $("#orderDetailTable1").find('tr').find('td').empty();
        	 $("#orderDetailTable1").find('tr').find('#modal_order_status').append(ordStatus); */
        	 
        	 
        	 
        	 //주문일시
        	 ordDate = '<td>'+orderDetailList[0].ordDate+'</td>';
        	 console.log(ordDate);
        	 $("#orderDetailTable1").find('tr').find('td').empty();
        	 $("#orderDetailTable1").find('tr').find('#modal_order_date').append(ordDate);
        	 
        	 
        	 //주문번호
        	 ordNum = '<td>'+orderDetailList[0].ordNum+'</td>';
        	 console.log(ordNum);
        	 $("#orderDetailTable1").find('tr').find('#modal_order_num').append(ordNum);
        	 
        	 
        	 
        	 
        	 //메뉴, 수량, 가격 개수 만큼 반복문
        	 for(var i=0; i<orderDetailList.length;i++){
        		 orderDetailListAppendStr += '<tr>'+
        		 							'<td>' + orderDetailList[i].menuName + '</td>'+	
        		 							'<td>' + orderDetailList[i].mordNum + '</td>'+	
        		 							'<td>' + orderDetailList[i].menuPrice + '</td>'+	
        		 							'</tr>'
        	 }
        	 
        	 console.log(orderDetailListAppendStr);
        	 $("#orderDetailTable2").find('tbody').empty();
        	 $("#orderDetailTable2").find('tbody').append(orderDetailListAppendStr);
    
			 //총 주문금액
        	 ordPrice = '<td>'+orderDetailList[0].ordPrice+' 원'+'</td>';
			 $('#orderDetailTable3').find('tr').find('td').empty();
			 $('#orderDetailTable3').find('tr').find('#modal_order_price').append(ordPrice);
        	 
			 if(data.REV_CHECK > 0){
				 $('#goReviewBtn').attr('onclick', 'javascript: goReview(0)');
			 } else{
				 $('#goReviewBtn').attr('onclick', 'javascript: goReview(1)');	 
			 }
			 
			 
			},error:function(request, status, errorData){
            	alert("error code: " + request.status + "\n"
                    +"message: " + request.responseText
                    +"error: " + errorData);
        } 
	})

}

function goReview(type){
	
    var order_status = $("#modal_sto_status").text(); 	
	console.log(order_status);
    
	  
	
	if(type == 1){
		$("#modalOrderHistory").fadeOut(500);
		$("#modalReview").fadeIn(500);

		if(order_status=='배달완료'){
			$("#modalOrderHistory").fadeOut(500);
			$("#modalReview").fadeIn(500);	
		}else{
			alert('리뷰작성은 배달완료 이후 가능합니다.');
			$("#modalOrderHistory").css("display","none");
			$("#modalReview").css("display","none");
		}
	}else {
		alert('이미 리뷰를 작성했습니다');
		$("#modalOrderHistory").css("display","none");
		$("#modalReview").css("display","none");
	}
	
}



var rate;
	
function test1(){
	rate = 1; 
}
function test2(){
	rate = 2; 
}
function test3(){
	rate = 3; 
}
function test4(){
	rate = 4; 
}
function test5(){
	rate = 5; 
}




function reveiw_done_btn(){


	var order_status = $("#modal_sto_status").text(); 	
	var files = $("input[name=uploadFile]:file")[0].files; 				//파일은 어레이 형태라서 첫번째걸 보낸다.
	var order_num = $("#modal_order_num").text(); 						//주문번호													
	var textarea_review_content = $("#textarea_review_content").val();	//리뷰내용
	var sto_num = $("#hidden_sto_num").val();							//매장번호
	
	console.log('상태체크'+order_status);
	
	
	
	if(order_status=='배달완료'){
		
	var formData = new FormData();
	if(files.length > 0){
		formData.append('files',files[0]); //key,value 형태로 보내기!	
	} else {
		formData.append('files',null); // 파일이 존재하지 않을 때
	}
	
	formData.append('order_num',order_num);
	formData.append('rate',rate);	 //별점
	formData.append('textarea_review_content',textarea_review_content);
	formData.append('sto_num',sto_num);
	
	
 	$.ajax({
		url:"review_done.do",
		data:formData,
		dataType:'JSON',
		processData :false,
		contentType :false,
		type:'POST',
		success:function(data){
			location.reload();
			alert('리뷰가 성공적으로 등록되었습니다!');
		
			
			
		},error:function(request, status, errorData){
            	alert("error code: " + request.status + "\n"
                    +"message: " + request.responseText
                    +"error: " + errorData);
        } 
	}) 
	
	//리뷰등록하고 다시 모달창 켰을때 지난 사진 남기지 않기
	//$("#review_photo").attr("src","");
 	
	}else{
		alert('리뷰작성은 배달완료이후 가능합니다!');
	}
	
}
</script>

</html>
