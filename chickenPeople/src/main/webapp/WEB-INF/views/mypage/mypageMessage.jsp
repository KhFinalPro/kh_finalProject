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

.wrapper1 .clickButtons ul li select{
    position: relative;
    width:100%;
    float:left; 
    /* margin-left: 50px; */
    margin-bottom: 7px;
    height:30px;

}

.content-table{
    /* position: absolute; */
    /* align-items: center; */
    width:60%;
    border-collapse: collapse;
    margin: 0 auto;
    /* margin:25px 0; */
    font-size:12px;
    min-width: 500px;
}

.content-table thead tr{

    border-top: 1px solid black;
    border-bottom: 1px solid black;
    text-align: left;
    font-weight: bold;
}

.content-table th,
.content-table td{
    padding:12px 15px;
    
}
.content-table tbody tr{
    border-bottom: 1px solid #dddddd;
}

.wrapper1 .clickButtons ul{
    display: inline;
    width:100%;
    float:right; 
    /* margin:0 auto; */
    margin-right: 370px;
    margin-bottom: 7px;
    
}

.wrapper1 .clickButtons ul li{
    display: inline-block;
    float:right; 
    margin:2px;
   
}

.wrapper1 .clickButtons ul li button{
    padding:5px;
    font-size: 12px;

}


</style>
   
</head>
<body>

   <jsp:include page="../common/header.jsp"/>
   <jsp:include page="../common/sidebar.jsp"/>
   <br>
   <br>
   <br>
   
   <div class="main_container">
                <div class="item">
                    <div class="wrapper1">
                      
                     
                        <div class="clickButtons">
                            <ul>
                                
                                <li><button id="mDelete" onclick="deleteMessageList()">삭제하기</button></li>
                                <li><button id="mAnswer">답변하기</button></li>
                                <li>
                                    <select  id="selectType">
                                    <option value="sM">보낸 쪽지함</option>
                                    <option value="rM">받은 쪽지함</option>
                                    </select>
                                </li>
                            </ul>
                        </div>
                    </div>
                        <table id="sendMessage" class="content-table">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>번호</th>
                                    <th>받는사람</th>
                                    <th>제목</th>
                                    <th>내용</th>
                                    <th>보낸날짜</th>
                                    <th>답장유무</th>
                                </tr>
                            </thead>
                            <tbody>
                           <%--  <c:forEach var="m" items="${list }">
                                <tr>
                                    
                                    <td><input type="checkbox"></td>
                                    <td>${m.msgNo }</td>
                                    <td>${m.sendId }</td>
                                    <td>${m.msgTitle }</td>
                                    <td>${m.msgContents }</td>
                                    <td>${m.sendDate }</td>
                                    <!-- 답장유무처리 -->
                                    <td>
                                       N
                                    </td>
                                </tr>
                        
                            </c:forEach> --%>
                            </tbody>
                        </table>

                        <table id="recieveMessage" class="content-table" style="display:none;"  >
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>번호</th>
                                    <th>보낸사람</th>
                                    <th>제목</th>
                                    <th>내용</th>
                                    <th>보낸날짜</th>
                                    <th>답장유무</th>
                                </tr>
                            </thead>
                            <tbody>
                           <%--  <c:forEach var="m" items="${list }">
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td>${m.msgNo }</td>
                                    <td>${m.sendId }</td>
                                    <td>${m.msgTitle }</td>
                                    <td>${m.msgContents }</td>
                                    <td>${m.sendDate }</td>
                                    <td>N</td>
                                </tr>
                             </c:forEach> --%>
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
      //selectMessageList
       $( document ).ready(function() {
             init();
             
              
             $('#mDelete').click(function(){
                //console.log(this);
                deleteMessageList();
               });
                               
               $("#selectType").change(function(){
                  var v = this.value;
                  if(v=="rM"){
                      $("#recieveMessage").show();
                      $("#sendMessage").hide();
                  }else if(v=="sM"){
                      $("#recieveMessage").hide();
                      $("#sendMessage").show();
                  }
                   
               });
         });
      
         
       function init(){
          searchData();
       }
       
       
       
       //데이터 조회
       function searchData(){
          var param = {
                'type' : $("#selectType").val(),
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
                                        '<td>' + sendMessageList[i].msgStatus + '</td>'+
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
                                       '<td><input type="checkbox"></td>' +
                                          '<td>' + (i+1) + '</td>' +
                                          '<td>' + receiveMessageList[i].sendId + '</td>' +
                                          '<td>' + receiveMessageList[i].msgTitle + '</td>' +
                                          '<td>' + receiveMessageList[i].msgContents + '</td>' +
                                          '<td>' + receiveMessageList[i].sendDate+ '</td>' +
                                          '<td>' + receiveMessageList[i].msgStatus+ '</td>' +
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
       
    
       
       
       //메세지 삭제
        function deleteMessageList(){
          
         
          var noArr = [];
          var test=$("#sendMessage").find('input[type=checkbox]:checked').parents('tr');
          
         
          if(!confirm('메세지를 삭제하시겠습니까?')){
             return false;
          }
          for(var i=0; i<test.length; i++){
          
             //console.log($(test[i]).find('input[name=msgNo]').val());
             var noObj = { 'msgNo' : $(test[i]).find('input[name=msgNo]').val() };
            
             noArr.push(noObj);
             }
         console.log(noArr);
 
                
           $.ajax({
              type:'POST',
              url:"deleteMessage.do",
              data: noArr,
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
       
       
      
      
      
  
            
    
    </script>
   
   
   <jsp:include page="../common/footer.jsp"/>
   
</body>
</html>
