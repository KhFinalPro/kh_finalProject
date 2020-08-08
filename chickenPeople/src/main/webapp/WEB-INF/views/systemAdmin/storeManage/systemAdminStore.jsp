<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 _ 점포관리</title>
<!-- 끝! -->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
    .menuSearch { -webkit-appearance: none;  -moz-appearance: none; appearance: none; }
    .menuSearch { width: 400px; background-color:white; padding:7px 25px;  font-family: inherit;  -webkit-appearance: none; -moz-appearance: none; appearance: none; border: 1px solid #999; border-radius: 0px; }
	 select { -webkit-appearance: none;  -moz-appearance: none; appearance: none; background: "lowerArrow.png" no-repeat 95% 50%; /* 화살표 모양의 이미지 */ }
     select { width: 200px; background-color:white; padding:7px 25px;  font-family: inherit; background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;  -webkit-appearance: none; -moz-appearance: none; appearance: none; border: 1px solid #999; border-radius: 0px; }
     select::-ms-expand { /* for IE 11 */ display: none; }
    .menuHeader{margin:0 auto; width:90%; margin-top:30px;}
	.menuResultTable{margin:0 auto; width:90%;}
	.resultTable { width:100%; border-top:1px solid #444444; border-bottom:1px solid #444444; margin:0 auto;} .resultTable td{text-align:center;} .resultTable th,td{padding:7px;}
	.resultTable td .resultTable th{ height:30px; border-bottom:1px solid #444444; border-top:1px solid #444444; padding:10px;}
	.resultTable tr{height:40px;}
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
    
    a:link{text-decoration:none; color:#646464;}
    a:visited{text-decoration:none; color:#646464;}
    a:active{text-decoration:none; color:#646464;}
    a:hover{text-decoration:none; color:#646464;}
</style>
</head>
<body>
<jsp:include page="../../common/systemAdminHeader.jsp"/>
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
							<td colspan="4">
								<button type="submit">검색</button>
							</td>
						</tr>
					</table>
				</form>
			</div><!-- menuHeader end -->
			
			<div class="menuResultTable">
				<br><hr><br>
				
				<c:if test="${listCount ne 300 }">
					<p>게시글 검색 결과가 총 ${listCount }건 존재합니다.</p>
				</c:if>
				<table class="resultTable">
					<thead>
	                    <th>번호</th>
	                    <th>브랜드명</th>
	                    <th>점포명</th>
	                    <th>대표명</th>
	                    <th>연락처</th>
	                    <th>운영시간</th>
	                    <th>입점 유무</th>
			         </thead>
					<tbody>
						<c:forEach var="i" items="${storeList }">
 						 	<c:url var="storeDetail" value="systemAdminStoreDetail.do">
 						 		<c:param name="storeNum" value="${i.sto_num }"/>
 						 		<c:param name="page" value="${pi.currentPage }"/>
 						 		<c:param name="storeSearch" value="${searchStatus.searchName }"/>
 						 		<c:param name="brandCategory" value="${searchStatus.searchCategory}"/>
 						 		<c:param name="status_s" value="${searchStatus.searchStatus }"/>
 						 	</c:url>
							<tr>
								<c:url var="updateStore" value="updateStore.do">
									<c:param name="storeNum" value="${i.sto_num }"/>
								</c:url>
								<td class="storeNum">${i.sto_num }</td>
								<td><a style="cursor:hand">${i.brand_name }</a></td>
								<td><a href="${storeDetail }" style="cursor:hand">${i.sto_name }</a></td>
								<td><a style="cursor:hand">${i.ceo_name }</a></td>
								<td>${i.sto_tel }</td>
								<td>${i.deli_time }</td>
								<c:if test="${i.aprv_status eq 'Y' }">
									<td>계약 중</td>
								</c:if>
								<c:if test="${i.aprv_status eq 'N' }">
									<td><button onclick="location.href='${updateStore}'">승인처리</button></td>
								</c:if>
							</tr>					
					</c:forEach>					
					</tbody>
				</table><!-- class resultTable end -->
			</div><!-- class menuResultTable end -->
	                		

			<div class = "p-parents" style="margin:0 auto">
	            <div class="pppp">
	                    <c:if test="${pi.currentPage eq 1}">
		                    <a style = "color:#9c9c9c; " disabled>Previous</a>
	                    </c:if>
	                    <c:if test="${pi.currentPage gt 1}">
	                    	<c:url var="blistBack" value="systemAdminStore.do">
	                    		<c:param name="page" value="${pi.currentPage-1} "/>
	                    		<c:param name="storeSearch" value="${searchStatus.searchName }"/>
	                    		<c:param name="brandCategory" value="${searchStatus.searchCategory }"/>
	                    		<c:param name="status_s" value="${searchStatus.searchStatus }"/>
							</c:url>
	                        <a class="page-a" href="${blistBack }" style="color:#9c9c9c" >Previous</a>	
	                    </c:if>
	                    <ol>
	                    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
	                    	<c:if test="${p eq pi.currentPage }">
	           					<li class = "page-list1"><button disabled class = "page-cur" >${p }</button></li>		
	                    	</c:if>
	                    	<c:if test="${p ne pi.currentPage }">
	                    		<c:url var="blistCheck" value="systemAdminStore.do">
	                    			<c:param name="page" value="${p }"/>
	                    			<c:param name="storeSearch" value="${searchStatus.searchName }"/>
	                    			<c:param name="brandCategory" value="${searchStatus.searchCategory }"/>
	                    			<c:param name="status_s" value="${searchStatus.searchStatus }"/>
	                    		</c:url>
	                    		<li class = "page-list2"><button class="page-nocur" onclick="location.href='${blistCheck}'">${p }</button></li>
	                    	</c:if>
	                    </c:forEach>
	                    </ol>
	                    <c:if test="${pi.currentPage eq pi.maxPage }">
		                    <a style = "color:#9c9c9c"  disabled>Next</a>
	                    </c:if>
						<c:if test="${pi.currentPage lt pi.maxPage }">
							<c:url var="blistAfter" value="systemAdminStore.do">
								<c:param name="page" value="${pi.currentPage+1 }"/>
								<c:param name="storeSearch" value="${searchStatus.searchName }"/>
	                    		<c:param name="brandCategory" value="${searchStatus.searchCategory }"/>
	                    		<c:param name="status_s" value="${searchStatus.searchStatus }"/>
							</c:url>
							<a class="page-a" href="${blistAfter }" style = "color:#9c9c9c">Next</a>
						</c:if>
	           </div>
	        </div><!-- pagination class p-parents end -->
		</div><!-- class item end -->
	</div><!-- class main_container end -->
</div>
</body>
<script>

$(function(){
	$("#store").children().addClass('active');
})
</script>
</html>