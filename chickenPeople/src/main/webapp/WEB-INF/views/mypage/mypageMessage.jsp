<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
<title>메세지</title>
<style>

.main_container{margin-top:100px;}
.wrapper1 .clickButtons ul li select{
    position: relative;
    width:120px;
    float:left; 
    /* margin-left: 50px; */
    margin-bottom: 7px;
    height:44px;
    font-size:15px;

}

.content-table{
    /* position: absolute; */
    /* align-items: center; */
    width:75%;
    border-collapse: collapse;
    margin: 0 auto;
    /* margin:25px 0; */
    font-size:15px;
   /*  min-width: 500px; */
}

.content-table thead tr{

    border-top: 1px solid black;
    border-bottom: 1px solid black;
    text-align: left;
    font-weight: bold;
    line-height:30px;
   
}

.content-table th,
.content-table td{
    padding:12px 15px;
    line-height:30px;
}
.content-table tbody tr{
    border-bottom: 1px solid #dddddd;
}

.wrapper1 .clickButtons ul{
    display: inline;
    width:100%;
	float:right;
    /* margin:0 auto; */
    margin-right: 230px;
    margin-bottom: 7px;
    
}

.wrapper1 .clickButtons ul li{
    display: inline-block;
    float:right; 
    margin:2px;

   
}

.wrapper1 .clickButtons ul li button{
    padding:10px;
    font-size: 15px;

}
/* .reply{
	width:80px;
	heigth:120px;
} */

</style>
   
</head>
<body>

   <jsp:include page="../common/header.jsp"/>
   
   <br>
   <br>
   <br>
   
   <div class="main_container">
                <div class="item">
                    <div class="wrapper1">
                      
                     
                        <div class="clickButtons">
                            <ul>
                                
                                <li><button type="button" id="mDelete">삭제하기</button></li>
                                <!-- <li><button id="mAnswer">답변하기</button></li> -->
                                <li>
                                    <select  id="selectType">
                                    <option value="sM">보낸 쪽지함</option>
                                    <option value="rM">받은 쪽지함</option>
                                    </select>
                                </li>
                            </ul>
                        </div>
                    </div>
                        
                        <table id="recieveMessage" class="content-table" style="display:none;"  >
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>번호</th>
                                    <th>보낸사람</th>
                                    <th>제목</th>
                                    <th>내용</th>
                                    <th>보낸날짜</th>
                                    <th>쪽지확인</th>
                                </tr>
                            </thead>
                            <tbody>
                          
                            </tbody>
                        </table>
                        <table id="sendMessage" class="content-table">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>번호</th>
                                    <th>받는사람</th>
                                    <th>제목</th>
                                    <th>내용</th>
                                    <th>보낸날짜</th>
                                    <!-- <th>답장유무</th> -->
                                </tr>
                            </thead>
                            <tbody>
    
                            </tbody>
                        </table>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                </div>

            </div>
            
            
            
            
            
      <script>
      
      //에이작스함수 전역변수에 선언
      var modal_reply_sendId;
    
   
      
      
      //selectMessageList
       $( document ).ready(function() {
             init();
             
           
                               
               $("#selectType").change(function(){
                  var v = this.value;
                  if(v=="sM"){
                      $("#sendMessage").show();
                      $("#recieveMessage").hide();
                  }else if(v=="rM"){
                      $("#sendMessage").hide();
                      $("#recieveMessage").show();
                      
                  }
                   
               });
               
               $('#mDelete').click(function(){
              	 if($("#sendMessage").css("display") != "none"){       
                     deleteMessageList();
              	 }else if($("#recieveMessage").css("display") != "none"){
              		 deleteRcvMessageList();
              	 }
               });
               
             /*   
               $('#checkMessage').click(function(){
            	  checkMessage(this); 
               }); */
                   
         });
      
      
       
        $(document).on('click','#checkMessage',function(){
     	  checkMessage(this); 
     	  
        }); 
       
   
       
       function init(){
          searchData();
       }
       
       
       
       //데이터 조회
       function searchData(){
          var param = {
                'type' : $("#selectType").val(),
                 /* //console.log("테이블 값 조회"+ $("#selectType").val()); */
          }
          
          $.ajax({
             type:'POST',
             url:"selectMessageList.do",
             data:param,
             dataType:'JSON',
             success:function(data){
                
                //발신 메세지 목록
                var sendMessageList = data.sendMessageList;
                
                var sendMessageAppendStr = '';
                
                //발신 목록 개수만큼 반복문
                for(var i=0; i<sendMessageList.length; i++){
                   //내 발신메세지 목록 append할 문자열 생성
                  /*  onclick="deleteMessageList(this)" */
                   sendMessageAppendStr += '<tr>' +
                                        '<td><input type="checkbox" name="check"></td>' +
                                        '<td>' + (i+1) + '</td>' +
                                        '<td>' + sendMessageList[i].rcvId + '</td>'+
                                        '<td>' + sendMessageList[i].msgTitle + '</td>'+
                                        '<td>' + sendMessageList[i].msgContents + '</td>'+
                                        '<td>' + sendMessageList[i].sendDate + '</td>'+
                                  /*       '<td>' + sendMessageList[i].msgStatus + '</td>'+ */
                                        '<input type="hidden" value="' + sendMessageList[i].msgNo + '" name="msgNo">' + 
                                        '</tr>'
                }
                
                $("#sendMessage").find('tbody').empty();
                $("#sendMessage").find('tbody').append(sendMessageAppendStr);
                
                /***************************************************************************************************/
                
                //수신 메세지 목록
                var receiveMessageList =data.receiveMessageList;
                
                var receiveMessageAppendStr = '';
                
                //수신 목록 개수 만큼 반복문
                for(var i=0; i<receiveMessageList.length; i++){
                   //내 수신메세지 목록  append할 문자열 생성
                   receiveMessageAppendStr += '<tr>' +
                                       '<td><input type="checkbox" name="check"></td>' +
                                          '<td>' + (i+1) + '</td>' +
                                          '<td id="modal_sendId" value="">' + receiveMessageList[i].sendId + '</td>' +
                                          '<td>' + receiveMessageList[i].msgTitle + '</td>' +
                                          '<td>' + receiveMessageList[i].msgContents + '</td>' +
                                          '<td>' + receiveMessageList[i].sendDate+ '</td>' +
                                          '<td>' + '<button type="button" id="checkMessage">'+'답장하기'+'</button>'+'</td>' +
                                          '<input type="hidden" value="' + receiveMessageList[i].msgStatus + '" name="msgStatus">' + 
                                          '<input type="hidden" value="' + receiveMessageList[i].msgNo + '" name="msgNo">' + 
                                          '</tr>'
                          
                }
                $("#recieveMessage").find('tbody').empty();
                $("#recieveMessage").find('tbody').append(receiveMessageAppendStr);
            
             },error:function(request, status, errorData){
                   alert("error code: " + request.status + "\n"
                           +"message: " + request.responseText
                           +"error: " + errorData);
               } 
                
          });
          
          
       }
       
    
       
    
       //보낸메세지 삭제
        function deleteMessageList(){
          
         
          var noArr = [];
          var test = $("#sendMessage").find('input[type=checkbox]:checked').parents('tr');
          //var test = $(obj).find('input[type=checkbox]:checked').parents('tr');
          console.log('testttttttttttt:'+test);
          
       
          if(!confirm('메세지를 삭제하시겠습니까?')){
             return false;
          }
          
          for(var i=0; i<test.length; i++){
          
             //console.log($(test[i]).find('input[name=msgNo]').val());
             var noObj = $(test[i]).find('input[name=msgNo]').val();
            
             noArr.push(noObj);
             }
             console.log(noArr);
 
                
           $.ajax({
              type:'POST',
              url:"deleteMessage.do",
              traditional : true,
              data: {noArr:noArr},
              dataType:'JSON',
              success:function(data){
                 searchData();
              },error:function(request, status, errorData){
                    alert("error code: " + request.status + "\n"
                            +"message: " + request.responseText
                            +"error: " + errorData);
                } 
              
              
           })
           
           
       } 
       
       
       function deleteRcvMessageList(){
    	   var noArr = [];
           var test = $("#recieveMessage").find('input[type=checkbox]:checked').parents('tr');
      
           
        
           if(!confirm('메세지를 삭제하시겠습니까?')){
              return false;
           }
           
           for(var i=0; i<test.length; i++){
           
              var noObj = $(test[i]).find('input[name=msgNo]').val();
              console.log(noObj);
              noArr.push(noObj);
              }
              console.log(noArr);
  
                 
            $.ajax({
               type:'POST',
               url:"deleteRcvMessage.do",
               traditional : true,
               data: {noArr:noArr},
               dataType:'JSON',
               success:function(data){
                  searchData();
               },error:function(request, status, errorData){
                     alert("error code: " + request.status + "\n"
                             +"message: " + request.responseText
                             +"error: " + errorData);
                 } 
               
               
            })
       }
       
       
       
     
     function checkMessage(obj){
    	 
    	 var param =  {
    			 'msgNo' : $(obj).parents('tr').find('input[name=msgNo]').val(),
    	 }
    	 
    	 var status = {
    			 'msgStatus' : $(obj).parents('tr').find('input[name=msgStatus]').val(),
    	 }
    
    	
    	 
    	 
    	 
    	
    	 $.ajax({
    		 type:'POST',
             url:"receiveMessageDetail.do",
             data:param,
             dataType:'JSON',
             success:function(data){
            	 var receiveMessageDetail =data.receiveMessageDetail;
            	 var receiveMessageDetailAppendStr = '';
            	 
            	 for(var i=0; i<receiveMessageDetail.length; i++){      
            	 receiveMessageDetailAppendStr = '<tr>'+
												'<td>' + receiveMessageDetail[i].sendId + '</td>' +
												'</tr>';
				
				//에이작스에서 함수하나로 값넘김 (sendId)							
				ajaxdata(receiveMessageDetail[i].sendId);
				
				
            	 }
												
				$("#receiveMessageModalTable").find('tr').find('td').empty();
				modal_sendId=$("#receiveMessageModalTable").find('tr').find('#modal_sendId').append(receiveMessageDetailAppendStr);
		
            	 
				
				for(var i=0; i<receiveMessageDetail.length; i++){      
	            	 receiveMessageDetailAppendStr = '<tr>'+
													'<td>' + receiveMessageDetail[i].sendDate + '</td>' +
													'</tr>';
	            	 }
													
				$("#receiveMessageModalTable").find('tr').find('#modal_sendDate').append(receiveMessageDetailAppendStr);
            	 
				
				for(var i=0; i<receiveMessageDetail.length; i++){      
	            	 receiveMessageDetailAppendStr = '<tr>'+
													'<td>' + receiveMessageDetail[i].msgTitle + '</td>' +
													'</tr>';
	            	 }
													
				$("#receiveMessageModalTable").find('tr').find('#modal_msgTitle').append(receiveMessageDetailAppendStr);
            
				
					
				
				for(var i=0; i<receiveMessageDetail.length; i++){      
	            	 receiveMessageDetailAppendStr = receiveMessageDetail[i].msgContents;

	            	 }
				
				
				
				$('textarea').empty();
				$('#modal_msgContent').val(receiveMessageDetailAppendStr);
            	 
                
             },error:function(request, status, errorData){
                    alert("error code: " + request.status + "\n"
                            +"message: " + request.responseText
                            +"error: " + errorData);
                } 
             
          });
    	 
    	 
    	 
    	 
    	 $("#msgModal").fadeIn(500);
    	 
    	 
    	 
       } 
     
     
     function ajaxdata(data){
     	 modal_reply_sendId =data;
     	
     	
     	}
     
     function wantToReply(){
    	 
    	
    	 $("#msgModal").fadeOut(500);
    	 $("#msgReplyModal").fadeIn(500);
    	 
     }
     
     
     function replyMessage(){
    	 
    	 //에이작스로 선언한 것 가져오기
         console.log("값 :" + modal_reply_sendId);
    	 
    	
   		 
    	 var modal_reply_title = $("#modal_reply_title").val();
    	 var modal_reply_content =  $("#modal_reply_content").val();
    	 
    	 console.log(modal_reply_sendId+'타이틀'+modal_reply_title+'내용'+modal_reply_content);
    	 
    	 
    	 var param = {'modal_reply_sendId':modal_reply_sendId, 'modal_reply_title':modal_reply_title,'modal_reply_content':modal_reply_content};
    	 console.log('에이작스보내기전'+param);
    	 
    	// $("#msgReplyModal").fadeOut(500);
    	 
    	 $.ajax({
    		 
    		 type:'POST',
             url:"insertMessageDetail.do",
             data:param,
             dataType:'JSON',
             success:function(data){
            	 //searchData();
            	 $("#msgReplyModal").fadeOut(500);
            	 location.reload();
            	 
             },error:function(request, status, errorData){
                 alert("error code: " + request.status + "\n"
                         +"message: " + request.responseText
                         +"error: " + errorData);
             } 
    		 
    	 })
    	 
    	 
    	 
    	 
     }
       
       
       

    </script>
   
   
   <jsp:include page="../common/footer.jsp"/>
   
   
 <!-- 쪽지 확인하기 모달 --> 
 <div id="msgModal" style="position: fixed; display:none; width: 100%; height: 100%; top: 0; left: 0; background-color: rgba(0, 0, 0, 0.7); z-index: 9999;">
    <div style="width: 400px; height: 500px; background-color: #fff; border-radius: 20px; position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%);">
        <a href="javascript: $('#msgModal').fadeOut(500);" style="width: 25px; height: 25px; position: absolute; top: 30px; right: 35px; display: block;">
            <img src="resources/images/close.png" style="width: 100%;"/></a>
        <div style="position: absolute; top : 50px; left:35px;">
        <table id="receiveMessageModalTable">
            <tr>
                <th style="width: 100px; height: 40px;" >보낸 사람</th>
                <td id="modal_sendId"></td>
            </tr>
            <tr >
                <th style="width: 100px; height: 40px;" >보낸 시각</th>
                <td id="modal_sendDate"></td>
            </tr>
            <tr >
                <th style="width: 100px; height: 40px;" >Title</th>
                <td id="modal_msgTitle"></td>
            </tr>
        </table>
    </div>
    <div style="position: absolute; top : 172px; left:12px;">
        <ul style="list-style: none;">
            <li style="margin-bottom: 12px;"><b>Message</b></li>
            <textarea style="width:300px; height:200px; border:2px solid; border-radius: 13px;" id="modal_msgContent">

            </textarea>
        </ul>
        <button type="button" onclick="wantToReply()" style="position:absolute; left:155px; bottom:-30px; border-radius:10px; padding:5px"><b>답장하기</b></button>
    	
    
    </div>
    </div>
 </div>
 
 <!-- 쪽지 답장하기 모달 -->
  <div id="msgReplyModal" style="position: fixed; display:none; width: 100%; height: 100%; top: 0; left: 0; background-color: rgba(0, 0, 0, 0.7); z-index: 9999;">
    <div style="width: 400px; height: 500px; background-color: #fff; border-radius: 20px; position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%);">
        <a href="javascript: $('#msgReplyModal').fadeOut(500);" style="width: 25px; height: 25px; position: absolute; top: 30px; right: 35px; display: block;">
            <img src="resources/images/close.png" style="width: 100%;"/></a>
        <div style="position: absolute; top : 53px; left:35px;">
        <table id="replyMessage">
            <tr >
                <th style="width: 100px; height: 50px; font-size:22px;">Title</th>
                <td><input id="modal_reply_title" type="text" style="border:2px solid; border-radius:6px; height:20px;"></td>
            </tr>
        </table>
    </div>
    <div style="position: absolute; top : 100px; left:12px;">
        <ul style="list-style: none;">
            <li style="margin-bottom: 12px;  font-size:20px;"><b>Message</b></li>
            <textarea id="modal_reply_content" style="width:300px; height:260px; border:2px solid; border-radius: 13px;">

            </textarea>
        </ul>
        <button type="button" onclick="replyMessage()" style="position:absolute; left:155px; bottom:-30px; border-radius:10px; padding:5px"><b>보내기</b></button>
    	
    
    </div>
    </div>
 </div> 
   
   
   
   
   
</body>
</html>
