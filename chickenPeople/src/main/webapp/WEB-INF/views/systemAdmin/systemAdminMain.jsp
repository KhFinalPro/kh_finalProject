<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 _ 메인</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<style>
	.leftArea{background-color:yellow; width:30%; height:100%; float:left}
	.rightArea{background-color:red; width:100%; height:100%; }
	.top{background-color:orange; height:50%; }
	#bar_chart_div{width:80%; margin:0 auto;  margin-top:50px; margin-left:100px; z-index:1;}
	
</style>
</head>
<jsp:include page="../common/systemAdminHeader.jsp"/>
<body>
<div class="wrapper">
	<div class="main_container">
		<div class="item"> 
			<div class="leftArea">
			</div>

			<div class="rightArea">
				<div class="top">
					<div id="bar_chart_div" class="top"></div>
				</div>
				
				<div class="bot">
				</div>
			</div>
			
		</div>
	</div>
</div>
</body>
<script>
	google.charts.load('current', {'packages':['bar','corechart']});
 
    function schedulerSuccessAndFailChart() {
        var data = google.visualization.arrayToDataTable([
        		["",
        	    
        			"굽네","굽네"
        		 	
                ],
               ["이번 달 매출량",
						24,24
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

</html>