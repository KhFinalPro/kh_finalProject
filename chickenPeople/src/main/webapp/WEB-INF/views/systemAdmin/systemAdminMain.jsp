<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.chickenPeople.systemAdmin.model.vo.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ArrayList<BrandTotal> printBrandTotal = (ArrayList<BrandTotal>)request.getAttribute("printTotalList");
	ArrayList<SiteTotal> printSiteTotal = (ArrayList<SiteTotal>)request.getAttribute("printSiteTotalList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 _ 메인</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>


<style>
	#bar_chart_div{height:50%; width:100%; margin:0 auto; margin-top:30px;}
	.left-box {width: 50%;}
	.right-box { width: 50%;}
	.item {background: #fff; margin-bottom: 10px; padding: 15px; font-size: 14px; height: 873px; border-bottom-right-radius: 20px; display: flex; justify-content: center; align-items: center; margin-top: -30px; }
	.top_menu { width: calc(100% - 75px) !important;}
	#totalMember{ position:fixed; top:100px; left:200px; width:300px; height:150px; border:2px solid lightgray; border-radius:30px; }
	#totalReport{ position:fixed; top:100px; left:540px; width:300px; height:150px; border:2px solid lightgray; border-radius:30px; }
	#totalChatting{ position:fixed; top:100px; left:890px; width:300px; height:150px; border:2px solid lightgray; border-radius:30px; }
	#storeLikes{ position:fixed; top:100px; left:1240px; width:300px; height:150px; border:2px solid lightgray; border-radius:30px; }
	#nonamedarea{position:fixed; top:100px; left:1590px; width:300px; height:150px; border:2px solid lightgray; border-radius:30px;}
	tr{font-size:20px;}
	
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
	
</style>
</head>
<jsp:include page="../common/systemAdminHeader.jsp"/>
<body onload="printClock()">
<div class="wrapper">
	<div class="main_container">
		<div class="item"> 
			<div style="width:300px; height:10px; line-height:25px; color:#666;font-size:30px; text-align:center;" id="clock"></div>
			   	<!-- 전체 매출 -->
   				<div id="totalMember">
   				<i class="fas fa-wallet fa-2x" style="position:absolute; color:darkgray; top:36%; left:15%"></i>
   				<table style="position:absolute; top:30%; left:40%" >
   					<thead>
   						<tr>
   						<th>회원</th>
   						</tr>
   					</thead>
   					<tbody>
   						<tr>
   						<td><b>${totalMemberCount }</b>명</td>
   						</tr>
   					</tbody>
   				</table>
   				</div>
   				
   				<div id="totalReport">
   				<i class="fas fa-list-ol fa-2x" style="position:absolute; color:darkgray; top:36%; left:15%"></i>
   				<table style="position:absolute; top:30%; left:40%" >
   					<thead>
   						<tr>
   						<th>신고</th>
   						</tr>
   					</thead>
   					<tbody>
   						<tr>
   						<td><b>${reportCount }</b>건 접수 </td>
   						</tr>
   					</tbody>
   				</table>
   				</div>
   				
   				
   				<div id="totalChatting">
   				<i class="fas fa-star fa-2x" style="position:absolute; color:darkgray; top:36%; left:15%"></i>
   				<table style="position:absolute; top:30%; left:40%" >
   					<thead>
   						<tr>
   						<th>1:1 문의</th>
   						</tr>
   					</thead>
   					<tbody>
   						<tr>
   						<td><b>${chattingCount }</b>건 접수</td>
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
   						<th>입점신청</th>
   						</tr>
   					</thead>
   					<tbody>
   						<tr>
   						<td><b>${storeMemCount }</b>건</td>
   						</tr>
   					</tbody>
   				</table>
   				</div>
   				<!-- 찜 카운트 -->
   				<div id="nonamedarea">
   				<i class="fas fa-heart fa-2x" style="position:absolute; color:darkgray; top:36%; left:15%"></i>
   				<table style="position:absolute; top:30%; left:40%" >
   					<thead>
   						<tr>
   						<th></th>
   						</tr>
   					</thead>
   					<tbody>
   						<tr>
   						<td>4.8</td>
   						</tr>
   					</tbody>
   				</table>
   				</div>   				
   				
   				<canvas id="myChart1" height="350" width="600" ></canvas>
   			    <canvas id="myChart2" height="350" width="400" ></canvas>
   			    <canvas id="myChart3" height="320" width="350" ></canvas> 
   			    <canvas id="myChart4" height="350" width="600" ></canvas>
<!-- 			<div class='left-box'>
					<div id="Line_Controls_Chart">
   				          <div id="lineChartArea" style="height:450px;"></div>
				          <div id="controlsArea" style="height:150px"></div>
			        </div>
				</div>
				<div class='right-box'>
					<div id="bar_chart_div" style="height:40%"></div>
				</div> -->
			</div>			
		</div><!-- class item end -->
	</div><!-- class main_container end -->
</div><!-- class wrapper end -->

</body>
<script>
var chartDrowFun = {

	    chartDrow : function(){
	        var chartData = '';

	        //날짜형식 변경하고 싶으시면 이 부분 수정하세요.
	        var chartDateformat 	= 'yyyy-MM';
	        //라인차트의 라인 수
	        var chartLineCount    = 10;
	        //컨트롤러 바 차트의 라인 수
	        var controlLineCount	= 10;


	        function drawDashboard() {

	          var data = new google.visualization.DataTable();
	          //그래프에 표시할 컬럼 추가
	          data.addColumn('date' , '날짜');
	          data.addColumn('number'   , '사이트 총 수입');

	          //그래프에 표시할 데이터
	          var dataRow = [];

	          var man = new Array();
	          for(var i = 0; i < 12; i++){ //랜덤 데이터 생성
	             var total = 0;
	        	  <%for(SiteTotal st : printSiteTotal){%>
	        	  		var n = "<%=st.getPay_Date()%>"
	        	  		
	        	  		var m = n.substring(6,7)
	        	  		console.log("____"+m);
	        	  		if(i==m){
	        	  			total = <%=st.getPay_Total()%>
	      					
	        	  		}
	        	  	<%}%>
	        	  	  
		              
	        	  	  dataRow = [new Date('2020', i+1), total];
		              total=0;
	        	  	  data.addRow(dataRow);
		              

	            }

	            var chart = new google.visualization.ChartWrapper({
	              chartType   : 'LineChart',
	              containerId : 'lineChartArea', //라인 차트 생성할 영역
	              options     : {
	                              isStacked   : 'percent',
	                              focusTarget : 'category',
	                              height		  : 500,
	                              width			  : '100%',
	                              legend		  : { position: "top", textStyle: {fontSize: 13}},
	                              pointSize		: 5,
	                              tooltip		  : {textStyle : {fontSize:12}, showColorCode : true,trigger: 'both'},
	                              hAxis			  : {format: chartDateformat, gridlines:{count:chartLineCount,units: {
	                                                                  years : {format: ['yyyy']},
	                                                                  months: {format: ['MM']}
	                                                                },textStyle: {fontSize:12}},
	                vAxis			  : {minValue: 100,viewWindow:{min:0},gridlines:{count:-1},textStyle:{fontSize:12}},
	                animation		: {startup: true,duration: 1000,easing: 'in' },
	                annotations	: {pattern: chartDateformat,
	                                textStyle: {
	                                fontSize: 15,
	                                bold: true,
	                                italic: true,
	                                color: '#871b47',
	                                auraColor: '#d799ae',
	                                opacity: 0.8,
	                                pattern: chartDateformat
	                              }
	                            }
	              }
	              }
	            });

	            var control = new google.visualization.ControlWrapper({
	              controlType: 'ChartRangeFilter',
	              containerId: 'controlsArea',  //control bar를 생성할 영역
	              options: {
	                  ui:{
	                        chartType: 'LineChart',
	                        chartOptions: {
	                        chartArea: {'width': '60%','height' : 80},
	                          hAxis: {'baselineColor': 'none', format: chartDateformat, textStyle: {fontSize:12},
	                            gridlines:{count:controlLineCount,units: {
	                                  years : {format: ['yyyy']},
	                                  months: {format: ['MM']}}
	                            }}
	                        }
	                  },
	                    filterColumnIndex: 0
	                }
	            });

	            var date_formatter = new google.visualization.DateFormat({ pattern: chartDateformat});
	            date_formatter.format(data, 0);

	            var dashboard = new google.visualization.Dashboard(document.getElementById('Line_Controls_Chart'));
	            window.addEventListener('resize', function() { dashboard.draw(data); }, false); //화면 크기에 따라 그래프 크기 변경
	            dashboard.bind([control], [chart]);
	            dashboard.draw(data);

	        }
	          google.charts.setOnLoadCallback(drawDashboard);

	      }
	    }

	$(document).ready(function(){
	  google.charts.load('current', {'packages':['line','controls']});
	  chartDrowFun.chartDrow(); //chartDrow() 실행
	});

</script>
<script>
	var list = ""

	google.charts.load('current', {'packages':['bar','corechart']});
	
	function schedulerSuccessAndFailChart() {
        var data = google.visualization.arrayToDataTable([
        		["",
        	    
        			<%for(BrandTotal bt : printBrandTotal){
        				String brandCode = bt.getBrandCode();%>
        				
        				"<%=brandCode%>", {role:'annotation'},	
        			<%}%>
        		 	
                ],
               ["이번 달 매출량",
					 <%for(BrandTotal bt : printBrandTotal){
						 int total = bt.getPayTotal();%>
						 <%=total%>,<%=total%>,
					  <%}%>	 
					 
                ] //앞에있는 숫자가 마우스 오버시 나타나는 데이터, 뒤에 있는 숫자가 화면 로드시 바로 보여지는 데이터 
        ]);
 
       var barChartOption = {
               bars: 'vertical',
               height :700,
               width :'100%',
               legend: { position: "top" },
               isStacked: false,
               tooltip:{textStyle : {fontSize:12}, showColorCode : true},
               animation: { //차트가 뿌려질때 실행될 애니메이션 효과
                 startup: true,
                 duration: 1000,
                 easing: 'linear' },
               annotations: {
                   textStyle: {
                     fontSize: 15,
                     bold: true,
                     italic: true,
                     color: '#871b47',
                     auraColor: '#d799ae',
                     opacity: 0.8
                   }
              }
        };
       var chart = new google.visualization.ColumnChart(document.getElementById('bar_chart_div'));
 	  chart.draw(data, barChartOption);
    }
    google.charts.setOnLoadCallback(schedulerSuccessAndFailChart); 

</script>
<script>

	function printClock() {
	    
	    var clock = document.getElementById("clock");            // 출력할 장소 선택
	    var currentDate = new Date();                                     // 현재시간
	    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
	    var amPm = ''; // 초기값 AM
	    var currentHours = addZeros(currentDate.getHours(),2); 
	    var currentMinute = addZeros(currentDate.getMinutes() ,2);
	    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
	    
	    if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
	    	amPm = '';
	    	currentHours = addZeros(currentHours - 12,2);
	    }
	
	    if(currentSeconds >= 50){// 50초 이상일 때 색을 변환해 준다.
	       currentSeconds = '<span style="color:#de1951;">'+currentSeconds+'</span>'
	    }
	    clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:50px;'>"+ amPm+"</span>"; //날짜를 출력해 줌
	    
	    setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
	}
	
	function addZeros(num, digit) { // 자릿수 맞춰주기
		  var zero = '';
		  num = num.toString();
		  if (num.length < digit) {
		    for (i = 0; i < digit - num.length; i++) {
		      zero += '0';
		    }
		  }
		  return zero + num;
	}

</script>
<script> 


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