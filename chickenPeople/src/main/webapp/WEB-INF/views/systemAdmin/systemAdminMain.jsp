<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 			#searchArea{background-color:white; width:100%; height:300px; }
            select { -webkit-appearance: none;  -moz-appearance: none; appearance: none; background: "lowerArrow.png" no-repeat 95% 50%; /* 화살표 모양의 이미지 */ }
            select { width: 200px; background-color:white; padding:7px 25px;  font-family: inherit; background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;  -webkit-appearance: none; -moz-appearance: none; appearance: none; border: 1px solid #999; border-radius: 0px; }
            select::-ms-expand { /* for IE 11 */ display: none; }
            .brand {padding:5px 25px;}
            .storeName {padding:7px 25px; width:400px;}
            .storeNameSearch {padding:5px 25px; width:100px;}
            table{width:100%; border-top:1px solid #444444; border-collapse: collapse;}
            th{border-bottom:2px solid #444444; padding:10px;}
            td{border-bottom:1px solid #444444; padding:10px;}
</style>
</head>
<body>
<jsp:include page="../common/systemAdminHeader.jsp"/>
<div id="searchArea">
            <h1 style="text-align:center; padding-top:30px;">점포관리</h1>
            <div style="text-align: center;">
                <select name="brandName">
                    <option value="" clase="brand" selected>-------선택-------</option>
                    <option value="" clase="brand">굽네</option>
                    <option value="" clase="brand">네네</option>
                    <option value="" clase="brand">BBQ</option>
                    <option value="" clase="brand">깐부</option>

                </select>
                <input type="text" class="storeName" placeholder="매장명을 입력해주세요 . . ">
                <button type="submit" class="storeNameSearch">검색</button>
            </div>
        </div>

        <div>
            <table>
                <thead>
                    <th>번호</th>
                    <th>브랜드명</th>
                    <th>점포명</th>
                    <th>대표명</th>
                    <th>연락처</th>
                    <th>입점날짜</th>
                    <th>입점 유무</th>
                    <th>변경</th>
                </thead>
                <tbody>
                    
                </tbody>

            </table>

        </div>

</body>
</html>