<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 _ 브랜드</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
      select { -webkit-appearance: none;  -moz-appearance: none; appearance: none; background: "lowerArrow.png" no-repeat 95% 50%; /* 화살표 모양의 이미지 */ }
      select { width: 200px; background-color:white; padding:7px 25px;  font-family: inherit; background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;  -webkit-appearance: none; -moz-appearance: none; appearance: none; border: 1px solid #999; border-radius: 0px; }
      select::-ms-expand { /* for IE 11 */ display: none; }
      .searchTable {  border-collapse: separate; border-spacing: 15px 25px;}
      .brandHeader{margin:0 auto; width:90%; margin-top:130px;}
      .brandResultTable{margin:0 auto; width:90%;}
      table {width:90%;}
      .resultTable{margin:0 auto;}
     

</style>
</head>
<body>
<jsp:include page="../common/systemAdminHeader.jsp"/>
<div class="wrapper">
	<div class="main_container">
		<div class="item"> 
			<div class="brandHeader">
				<p style="font-size:20px;">브랜드 관리</p>
				<br><hr><br>
				<table class="searchTable">
					<tr>
						<td><b>브랜드 검색</b></td>
						<td>
							<select name="searchBrand">
			                    <option value="" clase="brand" selected>전체</option>
			                    <option value="" clase="brand">브랜드 명</option>
			                    <option value="" clase="brand"></option>
			                    <option value="" clase="brand"></option>
			                    <option value="" clase="brand"></option>
			                </select>
						</td>
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
			</div><!-- class brandHeader End -->
			<div class="brandResultTable">
			<br><hr><br>
			<p>검색 결과 입니다 </p>
				<table class="resultTable">
					<thead>
						<th>번호</th>
						<th>브랜드 명</th>
						<th>입점 점포수</th>
						<th></th>
					</thead>
					<tbody>
						
					</tbody>
				</table>
				
			</div>
		</div>
	</div>
</div>

</body>
<script>
	$(function(){
		$("#brand").children().addClass('active');
	})
</script>
</html>