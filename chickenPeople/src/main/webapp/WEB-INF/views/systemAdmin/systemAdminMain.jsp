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
	#bar_chart_div{height:50%; width:100%; margin:0 auto; margin-top:30px;}
	.left-box {background: red; float: left; width: 30%; height:100%}
	.right-box { background: blue; float: right; width:70%; height:100%}
	.right-top{background:yellow;  height:50%}
</style>
</head>
<jsp:include page="../common/systemAdminHeader.jsp"/>
<body>
<div class="wrapper">
	<div class="main_container">
		<div class="item"> 
			<div class='left-box'></div>
			<div class='right-box'>
				<div class="right-top">
					<div id="bar_chart_div"></div>
				</div>
				<div class="right-bot">
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
        	    
        			"굽네","네네",
        			"교촌","깐부"
        		 	
                ],
               ["이번 달 매출량",
						24,14,
						134,33
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