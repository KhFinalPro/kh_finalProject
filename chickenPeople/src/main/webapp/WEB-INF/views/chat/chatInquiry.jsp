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
	.chatHeader{background-color:#F7E600; width:400px; height:70px; margin-top: -25px; margin-left: -8px;}
	.sendArea{position: fixed; bottom: 10px;; width: 100%;}
	.inputText { width: 270px; background-color:white; padding:7px 25px;  font-family: inherit;  -webkit-appearance: none; -moz-appearance: none; appearance: none; border: 1px solid #999; border-radius: 0px; }
	button{border:1px solid black; background-color:white; color:black; padding:8px;}
	.arrow_box_right {position: relative; background: #88b7d5; border: 3px solid #88b7d5; width:65%; margin-top:10px; height:40px; margin-left: 115px;}
	.arrow_box_right:after, .arrow_box:before { left: 100%; top: 50%; border: solid transparent; content: " "; height: 0; width: 0; position: absolute; pointer-events: none; }
	.arrow_box_right:after { border-color: rgba(136, 183, 213, 0); border-left-color: #88b7d5; border-width: 13px; margin-top: -13px;}
	.arrow_box_right:before { border-color: rgba(136, 183, 213, 0); border-left-color: #88b7d5; border-width: 13px; margin-top: -13px; }
	.arrow_box_left { position: relative; background: #88b7d5; border: 3px solid #88b7d5;width:65%; margin-top:10px; height:40px; }
	.arrow_box_left:after, .arrow_box:before { right: 100%; top: 50%; border: solid transparent; content: " "; height: 0; width: 0; position: absolute; pointer-events: none; }
	.arrow_box_left:after { border-color: rgba(136, 183, 213, 0);border-right-color: #88b7d5;border-width: 13px;margin-top: -13px;}
	.arrow_box_left:before { border-color: rgba(136, 183, 213, 0); border-right-color: #88b7d5; border-width: 9px; margin-top: -9px; }
	
	#chat{height:500px;overflow-y:scroll;overflow-x:hidden;}
	.scroll-test::-webkit-scrollbar { width: 6px; }
	.scroll-test::-webkit-scrollbar-track { background-color: transparent; }
	.scroll-test::-webkit-scrollbar-thumb { border-radius: 3px; background-color: gray; }
	.scroll-test::-webkit-scrollbar-button { width: 0; height: 0; }

	.chat-box{
		text-align:left;
	}
	.chat{
		font-size: 20px;
		color:black;
		margin: 5px;
		min-height: 20px;
		padding: 5px;
		min-width: 50px;
		text-align: left;
        height:auto;
        word-break : break-all;
        background: #ffffff;
        border:2px solid #F7E600;
        width:auto;
        display:inline-block;
        border-radius: 10px 10px 10px 10px;
	}
	.my-chat{
		text-align: right;
		background: #F7E600;
		border-radius: 10px 10px 10px 10px;
	}
	.my-chat-box{
		margin-top:20px;
		text-align: right;
	}
	.chat-info{
		color:#556677;
		font-size: 10px;
		padding: 5px;
		padding-top: 0px;

	}
	
</style>
</head>
<body>
	<div class="chatHeader">
		<p class="siteLogo"><b>치킨의 민족</b></p>
	</div>
	<div>
		<div id="chat" class="scroll-test"></div>
		<form id="chatForm">
			<input type="hidden" value="${client_id }" id="clientName"/>
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
		
		sock.onopen = function(){
			

		};
		
		
		function sendMessage(){
			var msgData = {
					client_name : $("#clientName").val(),
					room_no : $("#roomNo").val(),
					msg : $("#message").val()
			};
			var jsonData = JSON.stringify(msgData);
			console.log(jsonData);
			sock.send(jsonData);
		}
		
		sock.onmessage = function(e){
			var data = e.data;
			var sessionId = null;
			var message = null;
			var room_no = null;
			
			var strArray = data.split("|");
			var date = new Date();
			var currentUserSession = $("#clientName").val();
			var currentChattingRoom = $("#roomNo").val();
			
			var sessionList ="";
			var printData = null;
			
			if(strArray[0]=="member"){
				printData="<div>";
				printData+="<div>";
				printData+="<strong>"+strArray[1]+"님이 입장하셨습니다.</strong>";
				printData+="</div>";
				printData+="</div>";
				console.log(data)
				sessionList+=printData
				$("#chat").append(sessionList);
				
			}
			if(strArray[0]=="msg"){
				room_no = strArray[1];
				sessionId = strArray[2];
				message = strArray[3];
				
				if(strArray[4]==null){
					time=date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
				}else{
					time=strArray[4];
				}
				
				if(room_no==currentChattingRoom){
					if(sessionId==currentUserSession){
						printData = "<div class='my-chat-box'><div class='chat my-chat'>"+message+"</div><div class='chat-info'>"+ time +"</div></div>";
						$("#chat").append(printData);
						$("#chat").stop().animate({scrollTop:$("#chat")[0].scrollHeight},1000);
					}else{
						printData = "<div class='chat-box'><div class='chat'>"+message+"</div><div class='chat-info'>"+ time +"</div></div>";
						$("#chat").append(printData);
						$("#chat").stop().animate({scrollTop:$("#chat")[0].scrollHeight},1000);					
					}
				}else{
					$("#chat").append("상대방의 대화를 불러오지 못했습니다.");
				}
				
			}
			if(strArray[0]=="leaveRoom"){
				room_no = strArray[1];
				sessionId = strArray[2];
				
				printData="<div>";
				printData+="<div>";
				printData+="<strong>"+strArray[1]+"님이 입장하셨습니다.</strong>";
				printData+="</div>";
				printData+="</div>";
				console.log(data)
				sessionList+=printData
				$("#chat").append(sessionList);
			}

		}
		
 		sock.onclose = function(){
			var msgData = {
					client_name:$("#clientName").val(),
					room_no:$("#roomNo").val(),
					msg:"퇴장"
			}
			var jsonData = JSON.stringify(msgData);
			console.log(jsonData);
			sock.send(jsonData);
			
		} 
		
	</script>
</body>
</html>