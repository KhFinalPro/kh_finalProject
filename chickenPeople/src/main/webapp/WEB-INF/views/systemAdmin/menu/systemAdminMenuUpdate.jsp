<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
	.menuSearch { -webkit-appearance: none;  -moz-appearance: none; appearance: none; }
    .menuSearch { width: 400px; background-color:white; padding:7px 25px;  font-family: inherit;  -webkit-appearance: none; -moz-appearance: none; appearance: none; border: 1px solid #999; border-radius: 0px; }
	 select { -webkit-appearance: none;  -moz-appearance: none; appearance: none; background: "lowerArrow.png" no-repeat 95% 50%; /* 화살표 모양의 이미지 */ }
     select { width: 200px; background-color:white; padding:7px 25px;  font-family: inherit; background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;  -webkit-appearance: none; -moz-appearance: none; appearance: none; border: 1px solid #999; border-radius: 0px; }
     select::-ms-expand { /* for IE 11 */ display: none; }
    .menuHeader{margin:0 auto; width:90%; margin-top:30px;}
	.menuResultTable{margin:0 auto; width:90%;}
	.resultTable { width:100%; border-top:1px solid #444444; border-bottom:1px solid #444444;} 
	.resultTable td{/* text-align:center; */} .resultTable th,td{padding:3px;}
	.resultTable{font-size:20px;}
	.resultTable td .resultTable th{border-bottom:1px solid #444444; border-top:1px solid #444444; padding:10px;}
	
	button{border:1px solid rgb(46,78,173); background-color:white; color:rgb(46,78,173); padding:5px;}
	
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
</head>
<body>
<jsp:include page="../../common/systemAdminHeader.jsp"/>

<div class="wrapper">
	<div class="main_container">
		<div class="item">
			<br clear="both">
			<div class="menuHeader">
				<p style="font-size:20px;">메뉴 관리</p>
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
							<td>
								<label><input type="radio" name="status_s" value="N" checked/> 판매 중</label>
								<label><input type="radio" name="status_s" value="Y"/> 판매 종료</label>
							</td>
						</tr>
						<tr>
							<td colspan="4"><button type="submit">검색</button></td>
						</tr>
					</table>
				</form>
			</div><!-- menuHeader end -->
			<div class="menuResultTable">
				<br><hr><br>
				
				<form action="goUpdateMenuPage.do" method="post" enctype="Multipart/form-data">
					<table class="resultTable">
						<tr>
							<td rowspan="5">
								<div id="contentImgArea">
									<img id="contentImg" src="resources/menu/${menu.menu_Pic }.jpg" width="450px" height="450px">
									<input type="hidden" name="menu_Pic" value="${menu.menu_Pic }">
								</div>
							</td>
							<td><b>메뉴번호</b>&nbsp;<input type="text" name="menu_Num" class="menuSearch" value="${menu.menu_Num }" readonly></td>
							<td><b><input type="text" name="brand_Name" class="menuSearch" value="${menu.brand_Name }" readonly></b></td>
							<c:forEach var="check" items="${brandList }">
								<c:if test="${check.brand_name eq menu.brand_Name}">
									<input type="hidden" name="brand_Code" value="${check.brand_code }"/>
								</c:if>
							</c:forEach>
						</tr>
						<tr>
							<td colspan="2">
								<b>분류</b>
								&nbsp;
								<select id="category" class="category" name="cat_Code">
									<c:forEach var="c" items="${categoryList }">
										<option value="${c.cat_Code }">${c.cat_Name }</option> 
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td><b>메뉴 이름 </b>&nbsp;<input type="text" name="menu_Name" class="menuSearch" value="${menu.menu_Name }"></td>
							<td><b>메뉴 가격 </b>&nbsp;<input type="text" name="menu_Price" class="menuSearch" value="${menu.menu_Price }"> &nbsp;원</td>
						</tr>
						<tr>
							<td colspan="2"><b>메뉴 설명</b>
								<br>&nbsp;<textarea rows="5" name="menu_Exp" cols="100">${menu.menu_Exp }</textarea></td>
						</tr>
						<tr>
							<c:url var="delete" value="deleteMenu.do">
								<c:param name="menuNum" value="${menu.menu_Num }"/>
								<c:param name="menuYN" value="${menu.menu_Yn }"/>
							</c:url>
							<td colspan="2"><b>판매여부</b>&nbsp;
								<c:if test="${menu.menu_Yn eq 'Y'}"> <input type="hidden" name="menu_Yn" value="Y">판매중지 </c:if>
								<c:if test="${menu.menu_Yn eq 'N'}"> <input type="hidden" name="menu_Yn" value="N">판매중 </c:if>
							</td>
								
							<td>
								<input type="submit" id="update"><b>수정하기</b>&nbsp;
								<c:if test="${menu.menu_Yn eq'N' }">
									<button id="delete" onclick="location.href='${contextPath}/${delete}'"><b>판매취소</b></button>
								</c:if>
								<c:if test="${menu.menu_Yn eq'Y' }">
									<button id="delete" onclick="location.href='${contextPath}/${delete}'"><b>판매처리</b></button>
								</c:if>
							</td>
						</tr>
						
					</table>
					
				</form>
					<script>
						$(function(){
							$("#contentImgArea").click(function(){
								alert("이미지는 변경할 수 없습니다. 관리자에게 문의하세요");
							})
						})
						
					</script>
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