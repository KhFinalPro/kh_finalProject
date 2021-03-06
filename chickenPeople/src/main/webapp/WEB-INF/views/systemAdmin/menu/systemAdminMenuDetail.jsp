<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<style>
	.item {background: #fff; margin-bottom: 10px; padding: 15px; font-size: 14px; height: 873px; border-bottom-right-radius: 20px;justify-content: center; align-items: center; margin-top: -30px; }

	*{font-size:22px;}

	.menuSearch { -webkit-appearance: none;  -moz-appearance: none; appearance: none; }
    .menuSearch { width: 400px; background-color:white; padding:7px 25px;  font-family: inherit;  -webkit-appearance: none; -moz-appearance: none; appearance: none; border: 1px solid #999; border-radius: 0px; }
	 select { -webkit-appearance: none;  -moz-appearance: none; appearance: none; background: "lowerArrow.png" no-repeat 95% 50%; /* 화살표 모양의 이미지 */ }
     select { width: 200px; background-color:white; padding:7px 25px;  font-family: inherit; background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;  -webkit-appearance: none; -moz-appearance: none; appearance: none; border: 1px solid #999; border-radius: 0px; }
     select::-ms-expand { /* for IE 11 */ display: none; }
    .menuHeader{margin:0 auto; width:90%; margin-top:30px;}
	.menuResultTable{margin:0 auto; width:90%;}

	.resultTable { width:100%;} 
	.resultTable td{/* text-align:center; */} .resultTable th,td{padding:3px;}
	.resultTable{font-size:20px;}
	.resultTable td .resultTable th{/* border-bottom:1px solid #444444;  */border-top:1px solid #444444; padding:10px;}
	
	button{border:2px solid #2ac1bc; background-color:white; color:#2ac1bc; padding:5px; font-weight:bold}
	
	.p-parents { display: flex; flex-direction: column; justify-content: center; align-items: center; margin: 0 auto; }
    .pppp { display: flex; text-align: center; margin : 50px auto; background: rgb(255, 255, 255); height: 36px; border : 1px solid black; border-radius: 5px; justify-content: center; align-items: center; }
    .pppp > ol > li:first-child { border-left : 1px solid black; }
    .pppp > a { display: inline-flex; justify-content: center; align-items: center; padding: 7px 12px; font-size: 13px; font-weight: 500; color:#9c9c9c; text-decoration: none; }
    .pppp > ol { display: inline-flex; list-style: none; justify-content: center; align-items: center; }
    .pppp > ol > li { display: inline-flex; list-style: none; justify-content: center; align-items: center;  border-right: 1px solid; vertical-align: middle; list-style: none; width: 36px; height: 34px; text-decoration: none; }
    .page-list1 { background-color:rgb(46,78,178); }
    .page-cur { font-size : 14px; background:none; color: white; padding : 0; border-style : none; }
    .page-nocur { font-size: 14px; background:none; color: rgb(46,78,178); padding : 0; border-style : none; }
    .page-a:hover { color: black; text-decoration:none; }
    
</style>
<body>
<jsp:include page="../../common/systemAdminHeader.jsp"/>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>

<div class="wrapper">
	<div class="main_container">
		<div class="item">
			<br clear="both">
			<div class="menuHeader">
				<p style="font-size:30px;">메뉴 관리</p>
				<br><hr><br>
				<form action="systemAdminMenu.do" method="get">
					<table class="searchTable">
						<tr>
							<td><b>메뉴 검색</b></td>
							<c:if test="${empty searchStatus.searchName}">
								<td><input class="menuSearch" name="menuName" type="text" placeholder="메뉴명을 입력해주세요."></td>
							</c:if>
							<c:if test="${not empty searchStatus.searchName }">
								<td><input class="menuSearch" name="menuName" type="text" value="${searchStatus.searchName}"></td>
							</c:if>
							<td colspan="4"><button type="submit">검색</button></td>
						
						</tr>
						<tr>
							<td><b>브랜드 검색</b></td>
							<td>
								<select id="menuCategory" class="menuCategory" name="menuCategory">
									<option value="total">전체</option>
									<c:forEach var="m" items="${brandList}">
										<c:if test="${searchStatus.searchCategory eq m.brand_name }">
											<option value="${m.brand_name }" selected>${m.brand_name }</option>
										</c:if>
										<c:if test="${searchStatus.searchCategory ne m.brand_name }">
											<option value="${m.brand_name }">${m.brand_name }</option>
										</c:if>
									</c:forEach>
								</select>
							</td>
							<td><b>판매 상태</b></td>
							<c:if test="${searchStatus.searchStatus eq 'N' }">
									<td>
										<label><input type="radio" name="status_s" value="N" checked/> 판매 중</label>
										<label><input type="radio" name="status_s" value="Y"/> 판매 종료</label>
										
									</td>
								</c:if>
								<c:if test="${searchStatus.searchStatus eq 'Y' }">
									<td>
										<label><input type="radio" name="status_s" value="N" /> 판매 중</label>
										<label><input type="radio" name="status_s" value="Y" checked/> 판매 종료</label>
									</td>
								</c:if>
						</tr>
						
					</table>
				</form>
			</div><!-- menuHeader end -->
			<c:url var="goMenuInsert" value="menuInsert.do"></c:url>
			
			<div class="menuResultTable">
				<br><hr><br>
				<div style="text-align:right;">
					<button onclick="location.href='${goMenuInsert}'">메뉴 등록</button>
				</div>
				
				<table class="resultTable">
					<tr>
						<td rowspan="5"><img src="resources/menu/${menu.menu_Pic }.jpg" width="450px" height="450px"></td>
						<td><b>메뉴번호</b>&nbsp;${menu.menu_Num }</td>
						<td><b>${menu.brand_Name }</b></td>
					</tr>
					<tr>
						<td colspan="2"><b>분류</b>&nbsp;${menu.cat_Name}</td>
					</tr>
					<tr>
						<td><b>메뉴 이름 </b>&nbsp;${menu.menu_Name }</td>
						<td><b>메뉴 가격 </b>&nbsp;${menu.menu_Price } &nbsp;원</td>
					</tr>
					<tr>
						<td colspan="2"><b>메뉴 설명</b><br>&nbsp;${menu.menu_Exp }</td>
					</tr>
					<tr>
						<c:url var="delete" value="deleteMenu.do">
							<c:param name="menuNum" value="${menu.menu_Num }"/>
							<c:param name="menuYN" value="${menu.menu_Yn }"/>
						</c:url>
						<c:url var="update" value="goUpdateMenu.do">
							<c:param name="menuNum" value="${menu.menu_Num }"/>
						</c:url>
						<td colspan="2"><b>판매여부</b>&nbsp;
							<c:if test="${menu.menu_Yn eq 'Y'}"> 판매중지 </c:if>
							<c:if test="${menu.menu_Yn eq 'N'}"> 판매중 </c:if>
						</td>
						<td>
							<button id="update" onclick="location.href='${contextPath}/${update}'"><b>수정하기</b></button>&nbsp;
							<c:if test="${menu.menu_Yn eq'N' }">
								<button id="delete" onclick="location.href='${contextPath}/${delete}'"><b>판매취소</b></button>
							</c:if>
							<c:if test="${menu.menu_Yn eq'Y' }">
								<button id="delete" onclick="location.href='${contextPath}/${delete}'"><b>판매처리</b></button>
							</c:if>
						</td>
					</tr>
					
				</table>
			</div>
		</div><!-- class item end -->
	</div><!-- class main_container end -->
</div><!-- class wrapper end-->
<script>
$(function(){
	$("#menu").children().addClass('active');
})
</script> 
</body>
</html>