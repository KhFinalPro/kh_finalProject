<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 _ 신고 페이지</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<style>
            #subnav{text-align:center;}
            div.vertical-line{ width: 5px; /* Line width */ background-color:#1abc9c; /* Line color */ height: 10px; /* Override in-line if you want specific height. */ display:inline-block; padding-top:10px; }
            td{ text-align:center;}
            th,td{padding:7px;}
            th{background-color:#adadad;}
            table { width: 100%; border-top: 1px solid #444444; border-collapse: collapse; }
            th, td { border-bottom: 1px solid #444444; padding: 10px; }
            #boardContent{margin:0 auto;}
            .p-parents { display: flex; flex-direction: column; justify-content: center; align-items: center; margin: 0 auto; }
            .pppp { display: flex; text-align: center; margin : 50px auto; background: rgb(255, 255, 255); height: 36px; border : 1px solid black; border-radius: 5px; justify-content: center; align-items: center; }
            .pppp > ol > li:first-child { border-left : 1px solid black; }
            .pppp > a { display: inline-flex; justify-content: center; align-items: center; padding: 7px 12px; font-size: 13px; font-weight: 500; color:#9c9c9c; text-decoration: none; }
            .pppp > ol { display: inline-flex; list-style: none; justify-content: center; align-items: center; }
            .pppp > ol > li { display: inline-flex; list-style: none; justify-content: center; align-items: center;  border-right: 1px solid; vertical-align: middle; list-style: none; width: 36px; height: 34px; text-decoration: none; }
            .page-list1 { background-color:#1abc9c; }
            .page-cur { font-size : 14px; background:none; color: white; padding : 0; border-style : none; }
            .page-nocur { font-size: 14px; background:none; color: #1abc9c; padding : 0; border-style : none; }
            .page-a:hover { color: black; text-decoration:none; }
            .replyReport:hover {color:#1abc9c;}
</style>
</head>
<body>
<jsp:include page="../common/systemAdminHeader.jsp"/>
	<div class="wrapper">
		<div class="main_container">
			<div class="item">
			
	        <div id="subnav">
	            <h3 style="display:inline-block;">게시글 신고</h3>&nbsp; 
	            <div  class="vertical-line"></div>&nbsp; 
	            <h3 class="replyReport"style="display:inline-block; color:gray" >댓글 신고</h3> 
	        </div>
	
	        <table id="boardContent">
	            <thead>
	                <th>게시글 번호</th>
	                <th>게시글 내용</th>
	                <th>신고 내용</th>
	                <th>신고일자</th>
	                <th>처리상태</th>
	            </thead>
	            <tbody>
	                <tr>
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                </tr> 
	                <tr>
	                    <td>1</td>
	                    <td>$5분내 바로 환급$토토리$ $안정보장수익보장$</td>
	                    <td>광고글 게시</td>
	                    <td>2020-07-03</td>
	                    <td>Y</td>
	                </tr>
	                <tr>
	                    <td>2</td>
	                    <td>Nㅔ이버\Dㅏ음웹툰 실시간 웹툰 bbam토kki</td>
	                    <td>광고글 게시</td>
	                    <td>2020-07-03</td>
	                    <td>Y</td>
	                </tr>
	                <tr>
	                    <td>3</td>
	                    <td>$5분내 바로 환급$토토리$ $안정보장수익보장$</td>
	                    <td>광고글 게시</td>
	                    <td>2020-07-03</td>
	                    <td>Y</td>
	                </tr>
	                <tr>
	                    <td>4</td>
	                    <td>$5분내 바로 환급$토토리$ $안정보장수익보장$</td>
	                    <td>광고글 게시</td>
	                    <td>2020-07-03</td>
	                    <td>Y</td>
	                </tr>
	                <tr>
	                    <td>5</td>
	                    <td>Nㅔ이버\Dㅏ음웹툰 실시간 웹툰 bbam토kki</td>
	                    <td>광고글 게시</td>
	                    <td>2020-07-03</td>
	                    <td><button id="deleteContent">삭제</button></td>
	                </tr>
	                <tr>
	                    <td>6</td>
	                    <td>$5분내 바로 환급$토토리$ $안정보장수익보장$</td>
	                    <td>광고글 게시</td>
	                    <td>2020-07-03</td>
	                    <td>Y</td>
	                </tr>
	                <tr>
	                    <td>7</td>
	                    <td>은밀한 동용상 속닥속닥 얼른들어왕 금방 펑한당</td>
	                    <td>음란물 게시</td>
	                    <td>2020-07-03</td>
	                    <td><button id="deleteContent">삭제</button></td>
	                </tr>
	                <tr>
	                    <td>8</td>
	                    <td>아까부터 물흐리던 색기 누구야 개짜증나게하네</td>
	                    <td>분란 조장</td>
	                    <td>2020-07-03</td>
	                    <td>Y</td>
	                </tr>
	                <tr>
	                    <td>9</td>
	                    <td>$5분내 바로 환급$토토리$ $안정보장수익보장$</td>
	                    <td>광고글 게시</td>
	                    <td>2020-07-03</td>
	                    <td><button id="deleteContent">삭제</button></td>
	                </tr>
	                <tr>
	                    <td>10</td>
	                    <td>Nㅔ이버\Dㅏ음웹툰 실시간 웹툰 bbam토kki</td>
	                    <td>광고글 게시</td>
	                    <td>2020-07-03</td>
	                    <td>Y</td>
	                </tr>
	                <tr>
	                    <td>11</td>
	                    <td>은밀한 동용상 속닥속닥 얼른들어왕 금방 펑한당</td>
	                    <td>음란물 게시</td>
	                    <td>2020-07-03</td>
	                    <td><button id="deleteContent">삭제</button></td>
	                </tr>
	                <tr>
	                    <td>12</td>
	                    <td>아까부터 물흐리던 색기 누구야 개짜증나게하네</td>
	                    <td>분란 조장</td>
	                    <td>2020-07-03</td>
	                    <td>Y</td>
	                </tr>
	            </tbody>
	
	        </table>
	        <div class = "p-parents" style="margin:0 auto">
	            <div class="pppp">
	                    <a style = "color:#9c9c9c; "  disabled>Previous</a>
	                    <ol>
	                      <li class = "page-list1"><button disabled class = "page-cur" >1</button></li>
	                      <li class = "page-list2" ><button class = "page-nocur">2</button></li>
	                    </ol>
	                    <a style = "color:#9c9c9c; "  disabled>Next</a>
	           </div>
	        </div>
			</div>
		</div>
	</div>
    </body>
    <script>
    $(function(){
		$("#report").children().addClass('active');
	})
    </script>
</html>