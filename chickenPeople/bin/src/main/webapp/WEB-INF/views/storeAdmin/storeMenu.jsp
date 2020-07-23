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
</head>

<style>
/******메뉴 리스트 *******/

.searchCate{
    height:30px;
}
.MenuTitle{
    margin-top:20px;
    margin-left:48px;
    font-size: 18px;
    font-weight: bold;
}

.searchBox{
    height:30px;
}

.wrapper1 .searchMenu{
    text-align: center;
}

.wrapper1 .searchMenu ul{
    display: inline;
    width:100%;
    margin-bottom: 7px;
    
    
}

.wrapper1 .searchMenu ul li{
    display: inline-block;
    margin:4px;
   
}

.wrapper1 .searchMenu ul li button{
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

<body>
<jsp:include page="../common/adminSidebar.jsp"/>

	<div class="wrapper">
		<div class="main_container">
                <div class="item">
                    <div class="wrapper1">
                        <br>
                        
                        <div class="MenuTitle">메뉴리스트</div>
                        <br>
                        <br>
                        <br>
                        <br>
                        <div class="searchMenu">
                            <ul>
                                <li>
                                    <select class="searchCate">
                                        <option>종류</option>
                                        <option>치킨</option>
                                        <option>사이드</option>
                                        <option>음료</option>
                                    </select>
                                </li>
                                <li><input class="searchBox" type="search" value="메뉴명을 검색해주세요"></li>
                                <li><button type="submit">조회</button></li>
                            </ul>
                        </div>
                        <br>
                        <br>
                  
                        <!-- <div class="clickButtons">
                            <ul>
                                <li><button id="rDelete">삭제하기</button></li>
                                <li><button id="rModify">수정하기</button></li>
                                <li><button id="rAnswer">답변하기</button></li>
                            </ul>
                        </div> -->
                    </div>
                        <table class="content-table">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>메뉴ID</th>
                                    <th>종류</th>
                                    <th>메뉴명</th>
                                    <th>메뉴설명</th>
                                    <th>품절여부</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td>A123</td>
                                    <td>치킨</td>
                                    <td>허니콤보</td>
                                    <td>치즈맛, 중량 800g, 2019출시</td>
                                    <td>N</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td>A125</td>
                                    <td>치킨</td>
                                    <td>레드콤보</td>
                                    <td>불닭치즈맛, 중량 900g, 2020출시</td>
                                    <td>N</td>
                                </tr>
                                
                            </tbody>
                        </table>
                </div>
            </div>
         </div>
</body>
<script>
$(function(){
	$(".menuBar").children().addClass('active');
})
</script>
</html>