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


<style>
	#bar_chart_div{height:50%; width:100%; margin:0 auto; margin-top:30px;}
	.left-box {background: red;
    width: 50%;}
	.right-box {
    width: 50%;}
	
	
	.item {
		    background: #fff;
    margin-bottom: 10px;
    padding: 15px;
    font-size: 14px;
    height: 873px;
    border-bottom-right-radius: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
        margin-top: -30px;

	}
	
	.top_menu {
		width: calc(100% - 75px) !important;
	}
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
				<div id="Line_Controls_Chart">
				      <!-- 라인 차트 생성할 영역 -->
				          <div id="lineChartArea" style="height:450px;"></div>
				      <!-- 컨트롤바를 생성할 영역 -->
				          <div id="controlsArea" style="height:150px"></div>
		        </div>
			</div>
			<div class='right-box'>
					<div id="bar_chart_div" style="height:40%"></div>
				</div>
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
	          data.addColumn('number'   , '매출');
	  

	          //그래프에 표시할 데이터
	          var dataRow = [];

	          var man = new Array();
	          for(var i = 1; i <= 12; i++){ //랜덤 데이터 생성
	             var total = 0;
	        	  <%for(SiteTotal st : printSiteTotal){%>
	        	  		var n = "<%=st.getPay_Date()%>"
	        	  		
	        	  		var m = n.substring(6,7)
	        	  		console.log("____"+m);
	        	  		if(i==m){
	        	  			total = <%=st.getPay_Total()%>
	      
	        	  		}
	        	  	<%}%>
	        	  	  
		              
	        	  	  dataRow = [new Date('2020', i), total];
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

    window.onload = function(){
    	alert("그래프 위치 평형으로 맞춰놓긴 했는데 높이가 잘 안줄여져서 더이상 어떤 데이터를 담기 힘들다");
    }
</script>

</html>