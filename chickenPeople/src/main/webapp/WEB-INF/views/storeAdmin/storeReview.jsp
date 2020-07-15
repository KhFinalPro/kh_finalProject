<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Store Review</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
<style>

/***********리뷰테이블**********/
.reviewTitle{
    margin-top:20px;
    margin-left:48px;
    font-size: 18px;
    font-weight: bold;

}

.wrapper1 .clickButtons ul{
    display: inline;
    width:100%;
    float:right; 
    /* margin:0 auto; */
    margin-right: 50px;
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


.content-table{
    /* position: absolute; */
    /* align-items: center; */
    width:90%;
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
</style>
</head>
<body> 
<jsp:include page="../common/adminSidebar.jsp"/>
			<div class="wrapper">
            <div class="main_container">
                <div class="item">
                    <div class="wrapper1">
                        <br>
                        
                        <div class="reviewTitle">리뷰 리스트</div>
                        <br>
                        <br>
                        <br>
                        <br>
                        <div class="clickButtons">
                            <ul>
                                <li><button id="rDelete">삭제하기</button></li>
                                <li><button id="rModify">답변수정</button></li>
                                <li><button id="rAnswer">답변하기</button></li>
                            </ul>
                        </div>
                    </div>
                        <table class="content-table">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>주문번호</th>
                                    <th>메뉴명</th>
                                    <th>주문금액</th>
                                    <th>주문일</th>
                                    <th>작성일</th>
                                    <th>평점</th>
                                    <th>내용</th>
                                    <th>답변처리</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td>A123</td>
                                    <td>허니콤보,콜라</td>
                                    <td>30,000</td>
                                    <td>2020.7.1</td>
                                    <td>2020.7.2</td>
                                    <td>4</td>
                                    <td>맛있는데 젓가락이 없어서 불편</td>
                                    <td>YES</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td>A123</td>
                                    <td>허니콤보,레드콤보,치즈볼,콜라</td>
                                    <td>56,000</td>
                                    <td>2020.7.3</td>
                                    <td>2020.7.5</td>
                                    <td>5</td>
                                    <td>완전 맛있어여 ㅋㄷ</td>
                                    <td>YES</td>
                                </tr>
                                
                                
                            </tbody>
                        </table>
                </div>

            </div>
            </div>


</body>
</html>