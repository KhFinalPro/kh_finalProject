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
	.arrow_box_right {position: relative; background: #88b7d5; border: 3px solid #88b7d5; width:65%; margin-top:10px; height:40px; margin-left: 130px;}
	.arrow_box_right:after, .arrow_box:before { left: 100%; top: 50%; border: solid transparent; content: " "; height: 0; width: 0; position: absolute; pointer-events: none; }
	.arrow_box_right:after { border-color: rgba(136, 183, 213, 0); border-left-color: #88b7d5; border-width: 13px; margin-top: -13px;}
	.arrow_box_right:before { border-color: rgba(136, 183, 213, 0); border-left-color: #88b7d5; border-width: 13px; margin-top: -13px; }
	.arrow_box_left { position: relative; background: #88b7d5; border: 3px solid #88b7d5;width:65%; margin-top:10px; height:40px; }
	.arrow_box_left:after, .arrow_box:before { right: 100%; top: 50%; border: solid transparent; content: " "; height: 0; width: 0; position: absolute; pointer-events: none; }
	.arrow_box_left:after { border-color: rgba(136, 183, 213, 0);border-right-color: #88b7d5;border-width: 13px;margin-top: -13px;}
	.arrow_box_left:before { border-color: rgba(136, 183, 213, 0); border-right-color: #88b7d5; border-width: 9px; margin-top: -9px; }
</style>
</head>
<body>
	<div class="chatHeader">
		<p class="siteLogo"><b>치킨의 민족</b></p>
	</div>
	<div>
		<div id="chat"></div>
		<form id="chatForm">
			<input type="text" value="${client_id }" id="clientName"/>
			<input type="text" value="${room_no }" id="roomNo"/>
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
			console.log(data);
			console.log(currentUserSession);
			var printData = null;
			if(room_no==currentChattingRoom){
				if(sessionId==currentUserSession){
					printData = "<div class='arrow_box_right'>["+sessionId+"]"+message+"<br></div><br>";
					$("#chat").append(printData);
				}else{
					printData = "<div class='arrow_box_left'>["+sessionId+"]"+message+"<br></div><br>";
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