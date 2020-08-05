<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.chickenPeople.systemAdmin.model.vo.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ArrayList<BrandTotal> printBrandTotal = (ArrayList<BrandTotal>)request.getAttribute("printTotalList");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 _ 메인</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<style>
	#bar_chart_div{height:50%; width:100%; margin:0 auto; margin-top:30px;}
	.left-box {background: red; float: left; width: 50%; height:100%}
	.right-box { background: blue; float: right; width:50%; height:100%}
	.right-top{background:yellow;  height:50%}
</style>
</head>
<jsp:include page="../common/systemAdminHeader.jsp"/>
<body>
<div class="wrapper">
	<div class="main_container">
		<div class="item"> 
			<c:forEach var="i" items="${printTotalList}">
				<input type="hidden" name="${i.brandCode }" value="${i.payTotal}"/>
			</c:forEach>
			<div class='left-box'>
				<div id="bar_chart_div1"></div>
			</div>
			<div class='right-box'>
				<div class="right-top">
					<div id="bar_chart_div"></div>
				</div>
				<div class="right-bot">
				</div>
			</div>			
		</div><!-- class item end -->
	</div><!-- class main_container end -->
</div><!-- class wrapper end -->

</body>
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
       var chart = new google.visualization.ColumnChart(document.getElementById('bar_chart_div1'));
 	  chart.draw(data, barChartOption);
    }
    google.charts.setOnLoadCallback(schedulerSuccessAndFailChart); 

</script>

</html>