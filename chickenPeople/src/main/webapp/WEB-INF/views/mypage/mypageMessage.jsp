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
    width:80%;
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
    margin-right: 120px;
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

	<jsp:include page="../common/mypageHeader.jsp"/>
	<br>
	<br>
	<br>
	
	<div class="main_container">
                <div class="item">
                    <div class="wrapper1">
                      
                     
                        <div class="clickButtons">
                            <ul>
                                
                                <li><button id="mDelete">삭제하기</button></li>
                                <li><button id="mAnswer">답변하기</button></li>
                                <li>
                                    <select  id="selectType">
                                    <option value="rM">받은 쪽지함</option>
                                    <option value="sM">보낸 쪽지함</option>
                                    </select>
                                </li>
                            </ul>
                        </div>
                    </div>
                        <table id="sMessage" class="content-table">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>쪽지번호</th>
                                    <th>수신인</th>
                                    <th>제목</th>
                                    <th>내용</th>
                                    <th>보낸날짜</th>
                                    <th>답장유무</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="m" items="${list }">
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
                        
                            </c:forEach>
                            </tbody>
                        </table>

                        <table id="rMessage" class="content-table" style="display:none;"  >
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>쪽지번호</th>
                                    <th>발신인</th>
                                    <th>제목</th>
                                    <th>내용</th>
                                    <th>보낸날짜</th>
                                    <th>답장유무</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="m" items="${list }">
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td>${m.msgNo }</td>
                                    <td>${m.sendId }</td>
                                    <td>${m.msgTitle }</td>
                                    <td>${m.msgContents }</td>
                                    <td>${m.sendDate }</td>
                                    <td>N</td>
                                </tr>
                             </c:forEach>
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
      $(function(){
    	  $("#selectType").change(function(){
        	var v = this.value;
        	if(v=="rM"){
        		 $("#rMessage").show();
        		 $("#sMessage").hide();
        	}else if(v=="sM"){
        		 $("#rMessage").hide();
        		 $("#sMessage").show();
        	}
    		  
    	  });
      });
    		  
    
    </script>
	
	
	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>
</body>
</html>