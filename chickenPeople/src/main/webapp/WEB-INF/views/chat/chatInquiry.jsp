<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>

</head>
<body>
<h1>실시간 QnA 채팅중입니다. ${client_Name } ${room_no }</h1>
	<div style="backgroundColor">
		<form id="chatForm">
			<input type="text" id="message"/>
			<input type="hidden" value="${client_Name }" id="clientName"/>
			<input type="hidden" value="${room_no }" id="roomNo"/>
			<button>send</button>
		</form>
		
		<div id="chat"></div>
	
	</div>
	
	<script>
		var sock = new SockJS("<c:url value="/echo"/>");
		
		$(document).ready(function(){
			$("#chatForm").submit(function(event){
				event.preventDefault();
				sendMessage();
				$("#message").val('').focus();
			});
		});
		
		function sendMessage(){
			var msgData = {
					client_name : $("#clientName").val(),
					room_no : $("#roomNo").val(),
					msg : $("#message").val()
			};
			var jsonData = JSON.stringify(msgData);
			sock.send(jsonData);
		}
		
		sock.onmessage = function(e){
			var data = e.data;
			var sessionId = null;
			var message = null;
			var room_no = null;
			
			var strArray = data.split("|");
			
			var currentUserSession = $("#clientName").val();
			var currentChattingRoom = $("#roomNo").val();
			
			room_no = strArray[0];
			sessionId = strArray[1];
			message = strArray[2];
			console.log(strArray);
			var printData = null;
			if(room_no==currentChattingRoom){
				if(sessionId==currentUserSession){
					printData = "["+sessionId+"]"+message+"<br>";
					$("#chat").append(printData);
				}else{
					printData = "["+sessionId+"]"+message+"<br>";
					$("#chat").append(printData);	
				}
			}else{
				$("#chat").append("상대방의 대화를 불러오지 못했습니다.");
			}			
		}
		
		sock.onclose = function(){
			var removeClient = "님이 퇴장하셨습니다.<br>";
			$("#chat").append(removeClient);
		}
		
	</script>
</body>
</html>