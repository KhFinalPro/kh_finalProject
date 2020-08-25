<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 _ 점포관리</title>
<!-- 다스리언니가 가져가기로해씀 -->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<style>
    .inputText {background-color:white; padding:7px 25px;  font-family: inherit;  -webkit-appearance: none; -moz-appearance: none; appearance: none; border: 1px solid #999; border-radius: 0px; }
	*{font-size:22px;}

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
	.resultTable tr{height:70px;}
	.resultTable td .resultTable th{border-bottom:1px solid #444444; border-top:1px solid #444444; padding:10px;}
	
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
				<p style="font-size:30px;">점포 관리</p>
				<br><hr><br>
				<form action="systemAdminStore.do" method="get">
					<table class="searchTable">
						<tr>
							<td><b>입점매장 검색</b></td>
							<c:if test="${empty searchStatus.searchName}">
								<td><input class="menuSearch" name="storeSearch" type="text" placeholder="매장명을 입력해주세요."></td>
							</c:if>
							<c:if test="${not empty searchStatus.searchName }">
								<td><input class="menuSearch" name="storeSearch" type="text" value="${searchStatus.searchName}"></td>
							</c:if>
						</tr>
						<tr>
							<td><b>브랜드 검색</b></td>
							<td>
								<select id="brandCategory" class="brandCategory" name="brandCategory">
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
								<c:if test="${searchStatus.searchStatus eq 'Y' }">
								
									<td><b>판매 상태</b></td>
									<td>
										<label><input type="radio" name="status_s" value="Y" checked/> 계약 중</label>
										<label><input type="radio" name="status_s" value="N"/> 계약 대기</label>		
									</td>
								</c:if>
								<c:if test="${searchStatus.searchStatus eq 'N' }">
								
									<td><b>판매 상태</b></td>
									<td>
										<label><input type="radio" name="status_s" value="Y"/> 계약 중</label>
										<label><input type="radio" name="status_s" value="N" checked/> 계약 대기</label>		
									</td>
								</c:if>
						</tr>
						<tr>
							<td colspan="4"><button type="submit">검색</button></td>
						</tr>
					</table>
				</form>
			</div><!-- menuHeader end -->
			
			<div class="menuResultTable">
				<br><hr><br>
			<form action="storeUpdate.do" method="get">
				<div style="text-align:right;">
					<button type="submit"><b>수정완료</b></button>
				</div>
				<br>
				
				<table class="resultTable" >
					<tr style="height:100px;">
						<td colspan="1"><b>${store.sto_name }</b>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="hidden" name="sto_name" value="${store.sto_name }">
							<c:if test="${store.open_yn eq 'Y' }">
								<button style="color:green; background-color:#A9F5A9; font-size:15px;"  ><b>영업중</b></button>
								<input type="hidden" name="open_yn" value="${store.open_yn }"/>
							</c:if>
							<c:if test="${store.open_yn eq 'N' }">
								<button style="color:red; background-color:#F5A9A9; font-size:15px;"><b>영업 종료</b></button>
							<input type="hidden" name="open_yn" value="${store.open_yn }"/>	
							</c:if>
						</td>
						<td>
							<b>매장번호</b>&nbsp;&nbsp;&nbsp;${store.sto_num }
							<input type="hidden" name="sto_num" value="${store.sto_num }"/>
						</td>
					</tr>
					<tr>
						<td><b>대표명</b>&nbsp;${store.ceo_name }&nbsp;사장님</td>
						<input type="hidden" name="ceo_name" value="${store.ceo_name }"/>
						<td colspan="2"><b>Tel)</b>&nbsp; ${store.sto_tel}</td>
						<input type="hidden" name="sto_tel" value="${store.sto_tel }"/>
					</tr>
					<tr>
						<td><b>주소 </b>&nbsp;${store.sto_addr }</td>
						<input type="hidden" name="sto_addr" value="${store.sto_addr }"/>
						<td>
							<b>배달 가능 시간</b>&nbsp;
							<input type="time" class="inputText" style="width:150px;" value="${store.deli_time }">&nbsp;~&nbsp;<input type="time"  style="width:150px;" class="inputText"/>
							<c:if test="${store.delivery eq 'Y' }"> 배달가능 </c:if>
							<c:if test="${store.delivery eq 'N' }"> 배달불가 </c:if>
							<input type="hidden" name="delivery" value="${store.delivery }">
						</td>
					</tr>
					<tr>
						<td colspan="1">
							<b>매장 소개</b><br>&nbsp;
							<br>
							<textarea cols="55" rows="5" name="sto_intro">${store.sto_intro }</textarea>
						</td>
						<td>
							<b>최소 주문금액 </b>&nbsp;
							<input type="number" style="width:200px;"class="inputText" name="ord_limit"value="${store.ord_limit }" step="1000"/> &nbsp;원</td>
						</td>
					</tr>
					<tr>
					</tr>
			
				</table>
			</form>
				<script>
					$(function(){
						$("#ceoName").on("click",function(){
							alert("대표 명 수정 시 입점신청이 다시 필요합니다.<br>관리자에게 연락주세요.");
						})
					})
				</script>
			</div>
		</div><!-- class item end -->
	</div><!-- class main_container end -->
</div><!-- class wrapper end-->
<script>
$(function(){
	$("#store").children().addClass('active');
})
</script> 
</body>
</html>