<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.chickenPeople.storeAdmin.dashboard.model.vo.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	ArrayList<Dashboard> topMenuList = (ArrayList<Dashboard>)request.getAttribute("topMenuList");
	ArrayList<Dashboard> topSideList = (ArrayList<Dashboard>)request.getAttribute("topSideList");
	ArrayList<Dashboard> monthlyTotalIncomeList = (ArrayList<Dashboard>)request.getAttribute("monthlyTotalIncomeList");
	ArrayList<Dashboard> vipCustoemrList = (ArrayList<Dashboard>)request.getAttribute("vipCustoemrList");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>


<style>


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
   font-size: 19x; 
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

.wrapper.collapse .sidebar{
    width:70px;
}

.wrapper.collapse .sidebar ul li a{
    text-align:center;
}

/* .wrapper.collapse .sidebar ul li a span.icon{
    margin:0;
} */

.wrapper.collapse .sidebar ul li a span.title{
    display:none;
}

.wrapper.collapse .main_container{
    width:calc(100% - 70px);
    margin-left:70px;
}


#myChart1{
position:fixed; 
top:580px; 
left:330px; 
}


#myChart2{ 
position:fixed; 
top:240px; 
left:300px; 
} 

#myChart3{ 
position:fixed; 
top:240px; 
left:750px; 
} 

#myChart4{ 
position:fixed; 
top:580px; 
left:1100px; 
} 


#vipCustomer{
position:fixed; 
top:250px; 
left:1200px; 
}

#vipCustomerTable{
position:absolute; 
padding:20px;
width:430px; 
height:200px; 
border-radius:30px; 
box-shadow: 1px 1px 89px rgba(1,1,1,0.125);
text-align: center;
}

#vipCustomerTable td{
line-height:40px;
border-bottom: 1px solid lightgray;
}

#totalIncome{
position:fixed; 
top:105px; 
left:180px;
width:270px;
height:90px;
border-radius:30px; 
box-shadow: 1px 1px 89px rgba(1,1,1,0.125);

/* background:#fff;*/
/* border:2px solid lightgray; */
}

#totalOrder{
position:fixed; 
top:105px; 
left:530px;
width:270px;
height:90px;
border-radius:30px;
box-shadow: 1px 1px 89px rgba(1,1,1,0.125);
/* border:2px solid lightgray; */
}



#averageReview{
position:fixed; 
top:105px; 
left:880px;
width:270px;
height:90px;
border-radius:30px;
box-shadow: 1px 1px 89px rgba(1,1,1,0.125);
/* border:2px solid lightgray; */
}

#storeLikes{
position:fixed; 
top:105px; 
left:1230px;
width:270px;
height:90px;
border-radius:30px;
box-shadow: 1px 1px 89px rgba(1,1,1,0.125);
/* border:2px solid lightgray; */
}

#totalChicken{
position:fixed; 
top:105px; 
left:1580px;
width:270px;
height:90px;
border-radius:30px;
box-shadow: 1px 1px 89px rgba(1,1,1,0.125);
/* border:2px solid lightgray; */
}





</style>
<body>
<jsp:include page="../common/adminSidebar.jsp"/>
   
   <div class="wrapper">
   		<div class="main_container">
   				<div class="item">
   				<!-- 전체 매출 -->
   				<div id="totalIncome">
   				<i class="fas fa-wallet fa-2x" style="position:absolute; color:darkgray; top:36%; left:15%"></i>
   				<table style="position:absolute; top:25%; left:40%" >
   					<thead>
   						<tr>
   						<th>전체 매출</th>
   						</tr>
   					</thead>
   					<tbody>
   						<tr>
   						<td>${totalIncome } 원</td>
   						</tr>
   					</tbody> 
   				</table>
   				</div>
   				
   				<!-- 총 주문수 -->
   				<div id="totalOrder">
   				<i class="fas fa-list-ol fa-2x" style="position:absolute; color:darkgray; top:36%; left:15%"></i>
   				<table style="position:absolute; top:25%; left:40%" >
   					<thead>
   						<tr>
   						<th>총 주문수</th>
   						</tr>
   					</thead>
   					<tbody>
   						<tr>
   						<td>${totalOrder } 건</td>
   						</tr>
   					</tbody>
   				</table>
   				</div>
   				
   				<!-- 리뷰평균 -->
   				<div id="averageReview">
   				<i class="fas fa-star fa-2x" style="position:absolute; color:darkgray; top:36%; left:15%"></i>
   				<table style="position:absolute; top:25%; left:40%" >
   					<thead>
   						<tr>
   						<th>리뷰 평균</th>
   						</tr>
   					</thead>
   					<tbody>
   						<tr>
   						<td>${ageRate } 점</td>
   						</tr>
   					</tbody>
   				</table>
   				</div>
   				
   				<!-- 찜 카운트 -->
   				<div id="storeLikes">
   				<i class="fas fa-heart fa-2x" style="position:absolute; color:darkgray; top:36%; left:15%"></i>
   				<table style="position:absolute; top:25%; left:40%" >
   					<thead>
   						<tr>
   						<th>매장 좋아요</th>
   						</tr>
   					</thead>
   					<tbody>
   						<tr>
   						<td>${stoLikes } likes</td>
   						</tr>
   					</tbody>
   				</table>
   				</div>
   				
   				
   				<!-- 누적치킨판매량 -->
   				<div id="totalChicken">
   				<i class="fas fa-drumstick-bite fa-2x" style="position:absolute; color:darkgray; top:36%; left:15%"></i>
   				<table style="position:absolute; top:25%; left:40%" >
   					<thead>
   						<tr>
   						<th>누적치킨판매</th>
   						</tr>
   					</thead>
   					<tbody>
   						<tr>
   						<td>${totalChicken }</td>
   						</tr>
   					</tbody>
   				</table>
   				</div>
   				
   				<div id="vipCustomer">
   				<table id="vipCustomerTable">
   					<thead>
   						<th>순위</th>
   						<th>주문횟수</th>
   						<th>단골고객 아이디</th>
   					</thead>
   					<tbody>
   						<c:forEach var="i" items="${vipCustoemrList }">
   						<tr>
   							<td>${i.rowNum }</td>
   							<td>${i.vipCount }</td>
   							<td>${i.vipName }</td>
   						</tr>
   						</c:forEach>
   					</tbody>
   				</table>
   				</div>
   				                
   				<!-- 시작하기 모달 -->
<!-- <div id="startModal" style="position: fixed; display:block; width: 100%; height: 100%; top: 0; left: 0; background-color: rgba(0, 0, 0, 0.75); z-index: 9999;">
  <div style="width: 380px; height: 300px; background-color: #fff; border-radius: 20px; position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%);">
  <a href="home.do;" style="width: 25px; height: 25px; position: absolute; top: 30px; right: 35px; display: block;">
 <img src="resources/images/close.png" style="width: 100%;"/></a> 
  <div style="position: absolute; top : 100px; left:80px;">
         <b style="font-size:20px;">장사를 시작하시겠습니까?</b>
  </div>
      <button type="button" onclick="start()" style="position:absolute; left:140px; background:#587be4; color:#fff; padding:10px; bottom:70px; border:none; border-radius:10px;"><b>확인</b></button>
      <button type="button" onclick="exit()" style="position:absolute; left:190px; background:#efefef; color:#21232b;  padding:10px; bottom:70px; border:none; border-radius:10px;"><b>취소</b></button>
  </div>
</div> 
     -->
   				
   				
   				<canvas id="myChart1" height="350" width="600" ></canvas>
   			    <canvas id="myChart2" height="350" width="400" ></canvas>
   			    <canvas id="myChart3" height="320" width="350" ></canvas> 
   			    <canvas id="myChart4" height="350" width="600" ></canvas>
   			    
   				</div>
   		</div>
   </div>
   


</body>




<script> 

/* $("#exit").click(function(){
	//alert('장사를 종료하시겠습니까?');
	$('#startModal').fadeIn(500);
	
}); */

/* function start(){
	
	
	$.ajax({
		type:'GET',
		url:'updateOpenStatusYes.do',
		dataType:'JSON',
		success:function(){
			alert('장사를 시작합니다!');
			$('#startModal').fadeOut(500);
			
			
		},error:function(request, status, errorData){
            alert("error code: " + request.status + "\n"
                    +"message: " + request.responseText
                    +"error: " + errorData);
        } 
	})
}


function exit(){

	$('#startModal').fadeOut(500);
	
}
 */




var customer=[]
var payDate=[]
var payTotal=[]

<c:forEach var= "monthlyTotalIncomeList" items="${monthlyTotalIncomeList}">
var customerList = "${monthlyTotalIncomeList.customer}"
var payDateList = "${monthlyTotalIncomeList.payDate}"
var payTotalList = "${monthlyTotalIncomeList.payTotal}"

customer.push(customerList);
payDate.push(payDateList);
payTotal.push(payTotalList);
</c:forEach>


//월별매출
var ctx = document.getElementById('myChart1'); 
var myChart = new Chart(ctx, { 
type: 'bar', 

data: { 
	//그래프에 표시할 컬럼
	labels: payDate, 
	datasets: [{ 
		label: '매출추이', 
		//그래프에 표시할 값
		data: payTotal, 
		backgroundColor: [ 'rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)', 'rgba(255, 159, 64, 0.2)' ], 
		borderColor: [ 'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)', 'rgba(255, 159, 64, 1)' ], 
		borderWidth: 1 
	}] 
}, 

options: { 
	responsive: false,
	legend:{
		labels:{
			fontSize:20,
			fontStyle:'bold'
		}
	},
	scales: { 
		yAxes: [{ 
			ticks: { 
				beginAtZero: true,
				fontSize:12
				}
		}],
		xAxes: [{
			ticks: {
				fontSize:18,
			}
		}]
	}

} 

});





//인기메인메뉴
var menuCount= []
var menuName= []
<c:forEach var= "topMenuList" items="${topMenuList}">
	var mC = "${topMenuList.menuCount}"
	var mN = "${topMenuList.menuName}"
	menuCount.push(mC);
	menuName.push(mN);
</c:forEach>


/* var length = menuCount.length;
var menuCount2 = menuCount.substring(0,length-1);
console.log('문자열 자르기'+menuCount2);
 */

var ctx = document.getElementById('myChart2'); 
var myChart = new Chart(ctx, { 
	type: 'doughnut', 
	
	data: { 
		labels: menuName, 
		datasets: [{ 
			label: '인기 메인메뉴', 
			data: menuCount, 
			backgroundColor: [ 'rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)', 'rgba(255, 159, 64, 0.2)' ], 
			borderColor: [ 'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)', 'rgba(255, 159, 64, 1)' ], 
			borderWidth: 1 
		}] 
	}, 
	
	options: { 
		responsive: false,
		title:{
			display:true,
			text:'인기 메인메뉴 TOP3',
			position:'top',
			fontSize:20
		},
		legend:{
			display:true,
			position:'bottom',
			labels:{
				fontSize:15,
				fontStyle:'bold'
			}
		}
		/* tooltips: {
	            enabled: false
	    },
	    plugins: {
            datalabels: {
                color: '#111',
                textAlign: 'center',
                font: {
                    lineHeight: 1.6
                },
                formatter: function(value, ctx) {
                    return ctx.chart.data.labels[ctx.dataIndex] + '\n' + value + '%';
                }
            }
        }  */
	
	} 
	
});



//월별 주문건수
var ctx = document.getElementById('myChart4'); 
var myChart = new Chart(ctx, { 
	type: 'line', 
	
	data: { 
		labels: payDate, 
		datasets: [{ 
			label: '주문건수', 
			data: customer, 
			backgroundColor: [ 'rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)', 'rgba(255, 159, 64, 0.2)' ], 
			borderColor: [ 'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)', 'rgba(255, 159, 64, 1)' ], 
			borderWidth: 1 
		}] 
	}, 
	
	options: { 
		responsive: false,
		legend:{
			labels:{
				fontSize:20,
				fontStyle:'bold'
			}
		},
	scales: { 
			yAxes: [{ 
				ticks: { 
					beginAtZero: true,
					fontSize:12
					}
			}],
			xAxes: [{
				ticks: {
					beginAtZero: true,
					fontSize:18,
				}
			}]
		} 
	
	} 
	
});


var sideCount= []
var sideName= []
<c:forEach var= "topSideList" items="${topSideList}">
	var sC = "${topSideList.menuCount}"
	var sN = "${topSideList.menuName}"
	sideCount.push(sC);
	sideName.push(sN);
</c:forEach>
var ctx = document.getElementById('myChart3'); 
var myChart = new Chart(ctx, { 
	type: 'doughnut', 
	
	data: { 
		labels: sideName, 
		datasets: [{ 
			label: '인기 메인메뉴', 
			data: sideCount, 
			backgroundColor: [ 'rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)', 'rgba(255, 159, 64, 0.2)' ], 
			borderColor: [ 'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)', 'rgba(255, 159, 64, 1)' ], 
			borderWidth: 1 
		}] 
	}, 
	
	options: { 
		responsive: false,
		title:{
			display:true,
			text:'인기 사이드메뉴 TOP3',
			position:'top',
			fontSize:20
		},
		legend:{
			display:true,
			position:'bottom',
			labels:{
				fontSize:13,
				fontStyle:'bold'
			}
		}
		/* tooltips: {
	            enabled: false
	    },
	    plugins: {
            datalabels: {
                color: '#111',
                textAlign: 'center',
                font: {
                    lineHeight: 1.6
                },
                formatter: function(value, ctx) {
                    return ctx.chart.data.labels[ctx.dataIndex] + '\n' + value + '%';
                }
            }
        }  */
	
	} 
	
});



	</script>



</html>