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
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>

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
   font-size: 20px; 
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
top:500px; 
left:600px; 
}


#myChart2{ 
position:fixed; 
top:500px; 
left:160px; 
} 

/* #myChart3{ 
position:fixed; 
top:500px; 
left:700px; 
}  */

#myChart4{ 
position:fixed; 
top:500px; 
left:1200px; 
} 


#totalncome{
position:fixed; 
top:100px; 
left:180px;
width:300px;
height:150px;
border:2px solid lightgray;
border-radius:30px;

}

#totalOrder{
position:fixed; 
top:100px; 
left:530px;
width:300px;
height:150px;
border:2px solid lightgray;
border-radius:30px;
}



#averageReview{
position:fixed; 
top:100px; 
left:880px;
width:300px;
height:150px;
border:2px solid lightgray;
border-radius:30px;
}

#storeLikes{
position:fixed; 
top:100px; 
left:1230px;
width:300px;
height:150px;
border:2px solid lightgray;
border-radius:30px;
}

#last{
position:fixed; 
top:100px; 
left:1580px;
width:300px;
height:150px;
border:2px solid lightgray;
border-radius:30px;
}



</style>
<body>
<jsp:include page="../common/adminSidebar.jsp"/>
   
   <div class="wrapper">
   		<div class="main_container">
   				<div class="item">
   				<!-- 전체 매출 -->
   				<div id="totalncome">
   				<i class="fas fa-wallet fa-2x" style="position:absolute; color:darkgray; top:36%; left:15%"></i>
   				<table style="position:absolute; top:30%; left:40%" >
   					<thead>
   						<tr>
   						<th>전체 매출</th>
   						</tr>
   					</thead>
   					<tbody>
   						<tr>
   						<td>1,000,000원</td>
   						</tr>
   					</tbody>
   				</table>
   				</div>
   				
   				<!-- 총 주문수 -->
   				<div id="totalOrder">
   				<i class="fas fa-list-ol fa-2x" style="position:absolute; color:darkgray; top:36%; left:15%"></i>
   				<table style="position:absolute; top:30%; left:40%" >
   					<thead>
   						<tr>
   						<th>총 주문수</th>
   						</tr>
   					</thead>
   					<tbody>
   						<tr>
   						<td>105 건</td>
   						</tr>
   					</tbody>
   				</table>
   				</div>
   				
   				<!-- 리뷰평균 -->
   				<div id="averageReview">
   				<i class="fas fa-star fa-2x" style="position:absolute; color:darkgray; top:36%; left:15%"></i>
   				<table style="position:absolute; top:30%; left:40%" >
   					<thead>
   						<tr>
   						<th>리뷰 평균</th>
   						</tr>
   					</thead>
   					<tbody>
   						<tr>
   						<td>4.8</td>
   						</tr>
   					</tbody>
   				</table>
   				</div>
   				
   				<!-- 찜 카운트 -->
   				<div id="storeLikes">
   				<i class="fas fa-heart fa-2x" style="position:absolute; color:darkgray; top:36%; left:15%"></i>
   				<table style="position:absolute; top:30%; left:40%" >
   					<thead>
   						<tr>
   						<th>매장 좋아요</th>
   						</tr>
   					</thead>
   					<tbody>
   						<tr>
   						<td>34 likes</td>
   						</tr>
   					</tbody>
   				</table>
   				</div>
   				
   				
   				<!-- ?? -->
   				<div id="last">
   				<i class="fas fa-heart fa-2x" style="position:absolute; color:darkgray; top:36%; left:15%"></i>
   				<table style="position:absolute; top:30%; left:40%" >
   					<thead>
   						<tr>
   						<th>무엇을하지?</th>
   						</tr>
   					</thead>
   					<tbody>
   						<tr>
   						<td>ㅎㅎ</td>
   						</tr>
   					</tbody>
   				</table>
   				</div>
   				
   				
   				
   				<canvas id="myChart1" height="400" width="600" ></canvas>
   			    <canvas id="myChart2" height="400" width="400" ></canvas>
   			    <%-- <canvas id="myChart3" height="400" width="400" ></canvas> --%>
   			    <canvas id="myChart4" height="400" width="600" ></canvas>
   				</div>
   		</div>
   </div>
   


</body>


<script> 
//라인그래프
var ctx = document.getElementById('myChart1'); 
var myChart = new Chart(ctx, { 
	type: 'line', 
	
	data: { 
		labels: ['June', 'July', 'August'], 
		datasets: [{ 
			label: '매출추이', 
			data: [200,1000,50000], 
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


var ctx = document.getElementById('myChart2'); 
var myChart = new Chart(ctx, { 
	type: 'doughnut', 
	
	data: { 
		labels: ['황금올리브', '바사삭', '비비큐'], 
		datasets: [{ 
			label: '인기 메인메뉴', 
			data: [300,200,500], 
			backgroundColor: [ 'rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)', 'rgba(255, 159, 64, 0.2)' ], 
			borderColor: [ 'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)', 'rgba(255, 159, 64, 1)' ], 
			borderWidth: 1 
		}] 
	}, 
	
	options: { 
		responsive: false,
		legend:{
			labels:{
				fontSize:15,
				fontStyle:'bold'
			}
		},
	/* 	scales: { 
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
		} */
	
	} 
	
});
/* var ctx = document.getElementById('myChart3'); 
var myChart = new Chart(ctx, { 
	type: 'doughnut', 
	
	data: { 
		labels: ['황금올리브', '바사삭', '비비큐'], 
		datasets: [{ 
			label: '인기 메인메뉴', 
			data: [300,200,500], 
			backgroundColor: [ 'rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)', 'rgba(255, 159, 64, 0.2)' ], 
			borderColor: [ 'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)', 'rgba(255, 159, 64, 1)' ], 
			borderWidth: 1 
		}] 
	}, 
	
	options: { 
		responsive: false,
		legend:{
			labels:{
				fontSize:15,
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
	
}); */


var ctx = document.getElementById('myChart4'); 
var myChart = new Chart(ctx, { 
	type: 'horizontalBar', 
	
	data: { 
		labels: ['June', 'July', 'August'], 
		datasets: [{ 
			label: '주문건수', 
			data: [300,100,200], 
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












	</script>


</html>