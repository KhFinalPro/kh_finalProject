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
<style>
	html{overflow:hidden;}
	.siteLogo{font-size:24px; color:white; padding-top: 18px; padding-left: 14px;}
	.chatHeader{background-color:#2ac1bc; width:400px; height:70px; margin-top: -25px; margin-left: -8px;}
	.sendArea{position: fixed; bottom: 10px;; width: 100%;}
	.inputText { width: 270px; background-color:white; padding:7px 25px;  font-family: inherit;  -webkit-appearance: none; -moz-appearance: none; appearance: none; border: 1px solid #999; border-radius: 0px; }
	button{border:1px solid black; background-color:white; color:black; padding:8px;}
.arrow_box {
	position: relative;
	background: #382275;
}
.arrow_box:after {
	left: 100%;
	top: 50%;
	border: solid transparent;
	content: " ";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
	border-color: rgba(56, 34, 117, 0);
	border-left-color: #382275;
	border-width: 0px;
	margin-top: -0px;
}
	
</style>
</head>
<body>
	<div class="chatHeader">
		<p class="siteLogo"><b>치킨의 민족</b></p>
	</div>
	<div>
		<div id="chat"></div>
		<form id="chatForm">
			<input type="hidden" value="${client_Name }" id="clientName"/>
			<input type="hidden" value="${room_no }" id="roomNo"/>
			<div class="sendArea">
				<input class="inputText" type="text" id="message"/>
				<button>send</button>
			</div>
		</form>
		
	
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
					printData = "<div class='arrow_box'>["+sessionId+"]"+message+"<br></div><br><br>";
					$("#chat").append(printData);
				}else{
					printData = "<div class='arrow_box'>["+sessionId+"]"+message+"<br></div><br><br>";
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