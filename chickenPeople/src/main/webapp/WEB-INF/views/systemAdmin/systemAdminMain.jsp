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
	#normalMember{ position:fixed; top:100px; left:220px; width:300px; height:150px; /* border:2px solid lightgray; */ border-radius:30px; box-shadow: 1px 1px 50px rgba(1,1,1,0.125); }
	#storeMember{ position:fixed; top:100px; left:540px; width:300px; height:150px; /* border:2px solid lightgray; */ border-radius:30px; box-shadow: 1px 1px 50px rgba(1,1,1,0.125);}
	#totalChatting{ position:fixed; top:100px; left:860px; width:300px; height:150px; /* border:2px solid lightgray;  */border-radius:30px; box-shadow: 1px 1px 50px rgba(1,1,1,0.125);}
	#totalReport{position:fixed; top:100px; left:1180px; width:300px; height:150px; /* border:2px solid lightgray; */ border-radius:30px;box-shadow: 1px 1px 50px rgba(1,1,1,0.125);}
	#insertStore{ position:fixed; top:100px; left:1500px; width:300px; height:150px; /* border:2px solid lightgray; */ border-radius:30px; box-shadow: 1px 1px 50px rgba(1,1,1,0.125);}
	tr{font-size:20px;}
	
	#myChart1{ position:fixed; top:300px; left:200px; }
	#myChart2{ position:fixed; top:540px; left:700px; } 
	#myChart3{ position:fixed; top:280px; left:700px; } 
	#myChart4{ position:fixed; top:580px; left:1100px; } 
	
</style>
</head>
<jsp:include page="../common/systemAdminHeader.jsp"/>
<div class="wrapper">
	<div class="main_container">
		<div class="item"> 
			<div style="width:300px; height:10px; line-height:25px; color:#666;font-size:30px; text-align:center;" id="clock"></div>
			   	<!-- 전체 매출 -->
   				<div id="normalMember">
   				<i class="fas fa-wallet fa-2x" style="position:absolute; color:darkgray; top:36%; left:15%"></i>
   				<table style="position:absolute; top:30%; left:40%" >
   					<thead>
   						<tr>
   						<th>소비자</th>
   						</tr>
   					</thead>
   					<tbody>
   						<tr>
   						<td><b>${totalMemberCount }</b>명</td>
   						</tr>
   					</tbody>
   				</table>
   				</div>
   				
   				<div id="totalReport" onclick="location.href='systemAdminReport.do?rptCategory=total&searchId=&status_s=N'">
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
   				
   				
   				<div id="totalChatting" onclick="location.href='systemAdminChat.do?userId=no&chat_status=N'">
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
   				
   				<div id="insertStore" onclick="location.href='systemAdminStore.do?storeSearch=&brandCategory=total&status_s=N'">
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
   				<div id="storeMember">
   				<i class="fas fa-heart fa-2x" style="position:absolute; color:darkgray; top:36%; left:15%"></i>
   				<table style="position:absolute; top:30%; left:40%" >
   					<thead>
   						<tr>
   						<th>판매자</th>
   						</tr>
   					</thead>
   					<tbody>
   						<tr>
   						<td><b>${storeMemberCount }</b>명</td>
   						</tr>
   					</tbody>
   				</table>
   				</div>   				
   				
   				<canvas id="myChart1" height="600" width="400" ></canvas>
   			    <canvas id="myChart2" height="400" width="1150" ></canvas>
	   			<canvas id="myChart3" height="300" width="1150" ></canvas> 
<!--   			    <canvas id="myChart4" height="350" width="600" ></canvas>
 			<div class='left-box'>
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
$(function(){
	$("#main").children().addClass('active');
	
	
})


var brandCodeList = []
var printTotalList = []



<c:forEach var="t" items="${printTotalList}">
	var total = "${t.payTotal}"
	brandCodeList.push("${t.brandCode}")
	printTotalList.push(total.toLocaleString());
</c:forEach>


//월별매출
var ctx = document.getElementById('myChart1'); 
var myChart = new Chart(ctx, { 
type: 'bar', 

data: { 
	//그래프에 표시할 컬럼
	labels: brandCodeList, 
	datasets: [{ 
		label: '브랜드 별 매출 통계', 
		//그래프에 표시할 값
		data: printTotalList, 
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






var storeNameList= []
var storeTotalCount= []
<c:forEach var= "t" items="${storeTotalList}">
	count = "${t.total_price}";
	storeNameList.push("${t.sto_name}");
	storeTotalCount.push(count.toLocaleString());
</c:forEach>


/* var length = menuCount.length;
var menuCount2 = menuCount.substring(0,length-1);
console.log('문자열 자르기'+menuCount2);
 */

var ctx = document.getElementById('myChart2'); 
var myChart = new Chart(ctx, { 
	type: 'bar', 
	
	data: { 
		labels: storeNameList, 
		datasets: [{ 
			label: '지점 별 매출 현황', 
			data: storeTotalCount, 
			backgroundColor: [ 'rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)', 'rgba(255, 159, 64, 0.2)' ], 
			borderColor: [ 'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)', 'rgba(255, 159, 64, 1)' ], 
			borderWidth: 1 
		}] 
	}, 
	
	options: { 
		responsive: false,
		title:{
			display:true,
			text:'',
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


var month=[] ;
var totalIncome=[];
var total;

for(var i=0; i<12;i++){
		
	
	total = 0;
	<c:forEach var= "t" items="${citeTotalList}">
		var temp = "${t.pay_Date}";
		var split = temp.split("-");
		var month1 = split[1]
		if(month1 == i){
			total = "${t.pay_Total}"
			//month.push("${t.pay_Date}");
		}
	</c:forEach>
	totalIncome.push(total.toLocaleString());
	month.push("2020-"+(i));
	
}

var ctx = document.getElementById('myChart3'); 
var myChart = new Chart(ctx, { 
	type: 'line', 
	
	data: { 
		labels: month, 
		datasets: [{ 
			label:'월 별 전체 매출 통계',
			data: totalIncome, 
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