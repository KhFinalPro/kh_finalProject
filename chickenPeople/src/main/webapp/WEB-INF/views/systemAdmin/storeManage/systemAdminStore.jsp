<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 _ 점포관리</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<style>
 			#searchArea{ margin:0 auto; margin-top:130px; width:90%;}
            select { -webkit-appearance: none;  -moz-appearance: none; appearance: none; background: "lowerArrow.png" no-repeat 95% 50%; /* 화살표 모양의 이미지 */ }
            select { width: 200px; background-color:white; padding:7px 25px;  font-family: inherit; background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;  -webkit-appearance: none; -moz-appearance: none; appearance: none; border: 1px solid #999; border-radius: 0px; }
            select::-ms-expand { /* for IE 11 */ display: none; }
            .searchTable{  border-collapse: separate; border-spacing: 15px 25px;}
            .brand {padding:5px 25px;}
            .storeName {padding:7px 25px; width:400px;}
            .storeNameSearch {padding:5px 25px; width:100px;}
            .resultTable{width:90%; border-top:1px solid #444444; border-collapse: collapse; margin:0 auto;}
            .resultTable th{border-bottom:2px solid #444444; padding:10px;}
            .resultTable td{border-bottom:1px solid #444444; padding:10px;}
</style>
</head>
<body>
<jsp:include page="../../common/systemAdminHeader.jsp"/>
	<div class="wrapper">
		<div class="main_container">
			<div class="item">
				<div class="myAdminPage">
				 <div id="searchArea">
			            <p style="font-size:20px;">점포 관리
			            <br><hr><br>
			            <table class="searchTable">
			                <tr>
			                	<td><select name="brandName">
				                    <option value="" clase="brand" selected>-------선택-------</option>
				                    <option value="" clase="brand">굽네</option>
				                    <option value="" clase="brand">네네</option>
				                    <option value="" clase="brand">BBQ</option>
				                    <option value="" clase="brand">깐부</option>
				                </select></td>
				                <td><input type="text" class="storeName" placeholder="매장명을 입력해주세요 . . "></td>
			                	<td><button type="submit" class="storeNameSearch">검색</button></td>
							</tr>
							<tr>
								<td><b>입점 상태</b></td>
								<td>
									<label><input type="radio" name="status" value="Y"/> 계약 중</label>
									<label><input type="radio" name="status" value="N"/> 계약 만료</label>
									<label><input type="radio" name="status" value=""/> 입점 대기</label>
								</td>
							</tr>
			 			</table>
			 			<br><hr><br>
			        </div><!-- class searchArea end -->
			
			        <div>
			        	
			            <table class="resultTable">
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
			     </div>
			</div>
		</div>
	</div>
</body>
<script>
$(function(){
	$("#store").children().addClass('active');
})
</script>
</html>