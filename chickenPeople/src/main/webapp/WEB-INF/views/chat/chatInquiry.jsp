<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 채팅방</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<style>
	html{overflow:hidden;}
	.siteLogo{font-size:24px; color:white; padding-top: 18px; padding-left: 14px;}
	.chatHeader{background-color:#2ac1bc; width:100%; height:70px; margin-top: -25px; margin-left: -8px;}
	.sendArea{position: fixed; bottom: 10px; width: 100%;}
	.inputText { width: 270px; background-color:white; padding:7px 25px;  font-family: inherit;  -webkit-appearance: none; -moz-appearance: none; appearance: none; border: 1px solid #999; border-radius: 0px; }
	button{border:1px solid black; background-color:white; color:black; padding:8px;}
	
	#chat{height:500px;overflow-y:scroll;overflow-x:hidden;}
	.scroll-test::-webkit-scrollbar { width: 6px; }
	.scroll-test::-webkit-scrollbar-track { background-color: transparent; }
	.scroll-test::-webkit-scrollbar-thumb { border-radius: 3px; background-color: gray; }
	.scroll-test::-webkit-scrollbar-button { width: 0; height: 0; }

  	  .chatImgBox {width: 30px; height: 30px; border-radius: 70%; overflow: hidden; }
	  .chatImg { width: 100%; height: 100%; object-fit: cover;}
  
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
        border:2px solid #2ac1bc;
        width:auto;
        display:inline-block;
        border-radius: 10px 10px 10px 10px;
	}
	.my-chat{
		text-align: right;
		background: #2ac1bc;
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
				<button id="sendBtn">send</button>
			</div>
		</form>
		
	
	</div>
	
	<script>
		var sock = new SockJS("<c:url value="/echo"/>");
		$(document).ready(function(){
			$("#sendBtn").attr("disabled",true);
				$("#message").on("keyup",function(){
					
					if($("#message").val().length>0){
						$("#sendBtn").attr('disabled',false)
						console.log("true");
					}else{
						$("#sendBtn").attr('disabled',true)
						console.log("false");
					}					
				})
			$("#chatForm").submit(function(event){

				event.preventDefault();
				sendMessage();
				$("#message").val('').focus();
				$("#sendBtn").attr("disabled",true);

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
			console.log(e.data);
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
				//$("#chat").append(sessionList);
				
			}
			if(strArray[0]=="msg"){
				room_no = strArray[1];
				sessionId = strArray[2];
				message = strArray[3];
				
				if(strArray[4]=="noImage"){
					time=date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
				}else{
					time=strArray[4];
				}
				if(strArray[5]=="null"){
					pic = "<img id='chatImg' src='resources/images/user1.png' width='30px' height='30px'>"
				}else{
					pic = "<img id='chatImg' src='resources/propic/"+strArray[5]+"' style='width:30px; height:30px'>"
				}
				
				if(room_no==currentChattingRoom){
					if(sessionId==currentUserSession){//상대방
 						printData = "<div class='my-chat-box'>"
// 								       +"<div class='chatImgBox'>"+pic+"</div>"
 								       +"<div class='chat my-chat'>"+message+"</div>"
 								       +"<div class='chat-info'>"+ time +"</div>"
 								   +"</div>";
						$("#chat").append(printData);

						$("#chat").stop().animate({scrollTop:$("#chat")[0].scrollHeight},1000);
					}else{
						printData = "<div class='chat-box'>"
			   						  +"<div class='chatImgBox' style='float:left; margin-right:10px;'>"+pic+"</div>"
			   						  +"<div style='float:left;'>"
									  +"<div>"+sessionId+"</div>"
									  +"<div class='chat'>"+message+"</div>"
									  +"<div class='chat-info'>"+ time +"</div>"
									  +"</div>"
								 +"</div><br clear='both'>";
						$("#chat").append(printData);
						$("#chat").stop().animate({scrollTop:$("#chat")[0].scrollHeight},1000);					

					}
				}else{
					$("#chat").append("상대방의 대화를 불러오지 못했습니다.");
				}
				
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