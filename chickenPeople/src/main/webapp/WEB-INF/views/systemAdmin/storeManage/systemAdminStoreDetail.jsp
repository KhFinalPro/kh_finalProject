<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 _ 점포 관리</title>
<!-- 끝! -->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" /> 
</head>
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
	.resultTable tr{height:70px;}
	.resultTable td .resultTable th{border-bottom:1px solid #444444; border-top:1px solid #444444; padding:10px;}
	#back{margin:0 auto}
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
<body>
<jsp:include page="../../common/systemAdminHeader.jsp"/>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>

<div class="wrapper">
	<div class="main_container">
		<div class="item">
			<br clear="both">
			<div class="menuHeader">
				<p style="font-size:20px;">점포 관리</p>
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
							<td colspan="2">
								<button type="submit">검색</button>
							</td>
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
							
						</tr>
					</table>
				</form>
			</div><!-- menuHeader end -->
			<c:url var="goStoreUpdate" value="storeUpdatePage.do">
				<c:param name="storeNum" value="${store.sto_num }"/>
				<c:param name="storeSearch" value="${searchStatus.searchName }"/>
				<c:param name="brandCategory" value="${searchStatus.searchCategory }"/>
				<c:param name="status_s" value="${searchStatus.searchStatus }"/>
				<c:param name="page" value="${pi.currentPage }"/>
			</c:url>
			<c:url var="storeStatusUpdate" value="storeStatusUpdate.do">
				<c:param name="storeNum" value="${store.sto_num }"/>
				<c:param name="storeSearch" value="${searchStatus.searchName }"/>
				<c:param name="brandCategory" value="${searchStatus.searchCategory }"/>
				<c:param name="status_s" value="${searchStatus.searchStatus }"/>
				<c:param name="page" value="${pi.currentPage }"/>
			</c:url>
			<div class="menuResultTable">
				<br><hr><br>
				<div style="text-align:right;">
					<button id="back" onclick="history.back(-1)"><b>목록</b></button>
					&nbsp;<a href="#giveId" rel="modal:open"><b>승인처리</b></a>
					&nbsp;<button onclick="location.href='${goStoreUpdate}'"><b>정보 수정</b></button><!-- update는 후순위로 이동!! -->
				</div>

				<br>
				<table class="resultTable" >
					<tr style="height:100px;">
						<td colspan="1"><b>${store.sto_name }</b>&nbsp;&nbsp;&nbsp;&nbsp;
							<c:if test="${store.open_yn eq 'Y' }">
								<button style="color:green; background-color:#A9F5A9; font-size:15px;"  ><b>영업중</b></button>
							</c:if>
							<c:if test="${store.open_yn eq 'N' }">
								<button style="color:red; background-color:#F5A9A9; font-size:15px;"><b>영업 종료</b></button>
							</c:if>
						</td>
						<td><b>매장번호</b>&nbsp;&nbsp;&nbsp;${store.sto_num }</td>
					</tr>
					<tr>
						<td><b>대표명</b>&nbsp;${store.ceo_name }&nbsp;사장님</td>
						<td colspan="2"><b>Tel)</b>&nbsp; ${store.sto_tel}</td>
					</tr>
					<tr>
						<td><b>주소 </b>&nbsp;${store.sto_addr }</td>
						<td>
							<b>배달 가능 시간</b>&nbsp;${store.deli_time }&nbsp;
							<c:if test="${store.delivery eq 'Y' }"> 배달가능 </c:if>
							<c:if test="${store.delivery eq 'N' }"> 배달불가 </c:if>
						</td>
					</tr>
					<tr>
						<td colspan="1"><b>매장 소개</b><br>&nbsp;${store.sto_intro }</td>
						<td>
							<b>최소 주문금액 </b>&nbsp;${store.ord_limit } &nbsp;원</td>
					</tr>
					<tr>
					</tr>
			
				</table>
			</div>
		</div><!-- class item end -->
	</div><!-- class main_container end -->
</div><!-- class wrapper end-->
<script>
$(function(){
	$("#store").children().addClass('active');
})
</script>

 <!-- 쪽지 확인하기 모달 --> 
 <div id="msgModal" style="position: fixed; display:none; width: 100%; height: 100%; top: 0; left: 0; background-color: rgba(0, 0, 0, 0.7); z-index: 9999;">
    <div style="width: 400px; height: 500px; background-color: #fff; border-radius: 20px; position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%);">
        <a href="javascript: $('#msgModal').fadeOut(500);" style="width: 25px; height: 25px; position: absolute; top: 30px; right: 35px; display: block;">
            <img src="resources/images/close.png" style="width: 100%;"/></a>
        <div style="position: absolute; top : 50px; left:35px;">
        <table id="receiveMessageModalTable">
            <tr>
                <th style="width: 100px; height: 40px;" >보낸 사람</th>
                <td id="modal_sendId"></td>
            </tr>
            <tr >
                <th style="width: 100px; height: 40px;" >보낸 시각</th>
                <td id="modal_sendDate"></td>
            </tr>
            <tr >
                <th style="width: 100px; height: 40px;" >Title</th>
                <td id="modal_msgTitle"></td>
            </tr>
        </table>
    </div>
    <div style="position: absolute; top : 172px; left:12px;">
        <ul style="list-style: none;">
            <li style="margin-bottom: 12px;"><b>Message</b></li>
            <textarea style="width:300px; height:200px; border:2px solid; border-radius: 13px;" id="modal_msgContent">

            </textarea>
        </ul>
        <button type="button" onclick="wantToReply()" style="position:absolute; left:155px; bottom:-30px; border-radius:10px; padding:5px"><b>답장하기</b></button>
    	
    
    </div>
    </div>
 </div> 
</body>
</html>