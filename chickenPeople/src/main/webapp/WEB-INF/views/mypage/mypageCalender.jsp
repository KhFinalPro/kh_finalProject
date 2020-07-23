<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href='resources/css/coreMain.css' rel='stylesheet' />
<link href='resources/css/daygridMain.css' rel='stylesheet' />
<script src='resources/js/coreMain.js'></script>
<script src='resources/js/interactionMain.js'></script>
<script src='resources/js/daygridMain.js'></script>
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid' ],
      defaultDate: '2020-05-12',
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: [
       
        {
          title: 'Click for Google',
          url: 'http://google.com/',
          start: '2020-05-28'
        }
      ]
    });

    calendar.render();
  });

</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 600px;
    margin-left: 100px;
  }
  

</style>
</head>
<body>
	   <jsp:include page="../common/header.jsp"/>
		<jsp:include page="../common/sidebar.jsp"/>
		
		<br>
		<br>
		<br>
		
  <div id='calendar'></div>
  <div id="review">리뷰를 쓸것이다</div>
  
     <jsp:include page="../common/footer.jsp"/>

</body>
</html>
    