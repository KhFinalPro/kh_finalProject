<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
<title>Insert title here</title>
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
    text-align: center;
    font-weight: bold;
}

.content-table th,
.content-table td{
    padding:12px 15px;
    
}
.content-table tbody tr{
    border-bottom: 1px solid #dddddd;
    text-align: center;
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
                                
                                <li>
                                    <select id="selectType">
                                    <option value="lContent">찜한 글</option>
                                    <option value="lStore">찜한 매장</option>
                                    </select>
                                </li>
                            </ul>
                        </div>
                    </div>
                        <table class="content-table" id="likeContent">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>번호</th>
                                    <th>작성자</th>
                                    <th>제목</th>
                                    <th>내용</th>
                                    <th>작성날짜</th>
                                    <th>취소</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="wl" items="${writeList }">
                                <tr>
                                    <td></td>
                                    <td>${wl.bNum }</td>
                                    <td>${wl.bWriter }</td>
                                    <td>${wl.bTitle }</td>
                                    <td>${wl.bCont }</td>
                                    <td>${wl.bDate }</td>
                                    <th><i class="fas fa-heart"></i></th>
                                </tr>
                             </c:forEach>
                        
                            </tbody>
                        </table>

                        <table class="content-table" id="likeStore"  style="display:none;" >
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>개수</th>
                                    <th>사진</th>
                                    <th>매장명</th>
                                    <th>평균 평점</th>
                                    <th>최소주문</th>
                                    <th>취소</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="sl" items="${storelist }">
                                <tr>
                                    <th></th>
                                    <th>1</th>
                                    <td>${sl.brandPic }</td>
                                    <td>${sl.stoName }</td>
                                    <td>${sl.dailyTReview }</td>
                                    <td>${sl.ordLimit }</td>
                                    <th><i class="fas fa-heart"></i></th>
                                    <th></th>
                                </tr>
                            </c:forEach>
                        
                            </tbody>
                        </table>
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
                 if(v=="lContent"){
                     $("#likeContent").show();
                     $("#likeStore").hide();
                 }else if(v=="lStore"){
                     $("#likeContent").hide();
                     $("#likeStore").show();
                 }
                  
               });
            });
                  
          
          </script>
   
   
   
   
   <jsp:include page="../common/footer.jsp"/>
   
</body>
</html>
</body>
</html>