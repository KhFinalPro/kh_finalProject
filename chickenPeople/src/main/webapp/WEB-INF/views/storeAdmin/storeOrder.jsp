<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
<style>
/***********리뷰테이블**********/
.orderTitle{
    margin-top:20px;
    margin-left:48px;
    font-size: 18px;
    font-weight: bold;
}

.nowOrderStatus{
    float:right;
    margin-right: 50px;
   
}

.searchDate ul{
    text-align: center;
    
   
    
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

.cal{
    height:33px;
    border-radius: 12px;
    border:0.5px solid rgba(160, 158, 158, 0.5);
    
}

.searchDate ul li{
    
    display: inline-block;
}

.wrapper1 .nowOrderStatus .nowOrderStatusBtn{
    border:solid;
    border-radius: 5px;
    color:#fff;
    background-color:#587be4; 
    width:180px;
    padding:5px;
    font-size:14px;
}

.wrapper1 .nowOrderStatus .totalReceiptBtn{
    border:none;
    border-radius: 5px;
    color:#21232b; 
    width:180px;
    padding:5px;
    font-size:14px;
}

.content-table .totalTd{
    border-top: 1.3px solid rgba(160, 158, 158, 0.5);
    border-bottom: 1.5px solid rgba(160, 158, 158, 0.5);
}

.content-table ul .totalOrder{
    margin-left:50px;
    font-size: 13px;
    font-weight: bold;
    float:left;
}

.content-table ul .totalPrice{
    margin-right:50px;
    font-size: 13px;
    font-weight: bold;
    float:right;
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
                        
                        <div class="orderTitle">주문 리스트</div>
                        <br>
                        <div class="nowOrderStatus">
                            <button class="nowOrderStatusBtn">현재 7개 접수중</button>
                            <br>
                            <button class="totalReceiptBtn">매출전표</button>
                        </div>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <div class="searchDate">
                            <ul>
                                <span class="searchTerm">
                                <li><a href="#"><span>어제 |</span></a></li>
                                <li><a href="#"><span>오늘 |</span></a></li>
                                <li><a href="#"><span>일주일 |</span></a></li>
                                <li><a href="#"><span>한달</span></a></li>
                                </span>
                                &nbsp;
                                <li><input type="month" class="cal"></li>
                          
                            </ul>
                            
                        </div>
                        <br>
                        <br>
                                                                                                                                                
                    </div>
                        <table class="content-table">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>주문번호</th>
                                    <th>주문일시</th>
                                    <th>주문상품</th>
                                    <th>주문금액</th>
                                    <th>주문상태</th>
                                    <th>결제방법</th>
                                    <th>요청사항</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td>A90</td>
                                    <td>2020.7.4 18:00</td>
                                    <td>허니콤보1,콜라1,핫소스1</td>
                                    <td>32,000</td>
                                    <td>배달준비</td>
                                    <td>카드결제</td>
                                    <td>젓가락 많이 주세요</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td>A89</td>
                                    <td>2020.7.2 22:00</td>
                                    <td>레드콤보1,콜라1,핫소스1</td>
                                    <td>32,000</td>
                                    <td>배달완료</td>
                                    <td>현장결제</td>
                                    <td>조금 맵게 해주세요</td>
                                </tr>
                                
                                
                            </tbody>
                        </table>
                        <table class="content-table">
                            <td class="totalTd">
                                <ul>
                                    <li class="totalOrder">오늘 총 주문&nbsp;: 40 건</li>
                                    <li class="totalPrice">전체금액 :&nbsp; 1,230,300 원</li>
                                </ul>
                            </td>
                        </table>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                </div>
            </div>
          </div>
</body>
</html>