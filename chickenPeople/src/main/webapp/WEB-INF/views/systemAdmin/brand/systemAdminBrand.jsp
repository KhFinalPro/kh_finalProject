<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 _ 브랜드</title>
<!-- 끝! -->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
	.item {background: #fff; margin-bottom: 10px; padding: 15px; font-size: 14px; height: 873px; border-bottom-right-radius: 20px; /* display: flex;  */justify-content: center; align-items: center; margin-top: -30px; }
	*{font-size:22px;}
    .menuSearch { -webkit-appearance: none;  -moz-appearance: none; appearance: none; }
    .menuSearch { width: 400px; background-color:white; padding:7px 25px;  font-family: inherit;  -webkit-appearance: none; -moz-appearance: none; appearance: none; border: 1px solid #999; border-radius: 0px; }
	 select { -webkit-appearance: none;  -moz-appearance: none; appearance: none; background: "lowerArrow.png" no-repeat 95% 50%; /* 화살표 모양의 이미지 */ }
     select { width: 200px; background-color:white; padding:7px 25px;  font-family: inherit; background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;  -webkit-appearance: none; -moz-appearance: none; appearance: none; border: 1px solid #999; border-radius: 0px; }
     select::-ms-expand { /* for IE 11 */ display: none; }
    .menuHeader{margin:0 auto; width:90%; margin-top:30px;}
	.menuResultTable{margin:0 auto; width:90%;}
	.resultTable { width:100%; border-top:1px solid #444444; border-bottom:1px solid #444444; margin:0 auto;} .resultTable td{text-align:center;} .resultTable th,td{padding:7px;}
	.resultTable td .resultTable th{border-bottom:1px solid #444444; border-top:1px solid #444444; padding:10px;}
	
	button{border:2px solid #2ac1bc; background-color:white; color:#2ac1bc; padding:5px; font-weight:bold}
	
	
    .p-parents { display: flex; flex-direction: column; justify-content: center; align-items: center; margin: 0 auto; }
    .pppp { display: flex; text-align: center; margin : 50px auto; background: rgb(255, 255, 255); height: 36px; border : 1px solid black; border-radius: 5px; justify-content: center; align-items: center; }
    .pppp > ol > li:first-child { border-left : 1px solid black; }
    .pppp > a { display: inline-flex; justify-content: center; align-items: center; padding: 7px 12px; font-size: 13px; font-weight: 500; color:#9c9c9c; text-decoration: none; }
    .pppp > ol { display: inline-flex; list-style: none; justify-content: center; align-items: center; }
    .pppp > ol > li { display: inline-flex; list-style: none; justify-content: center; align-items: center;  border-right: 1px solid; vertical-align: middle; list-style: none; width: 36px; height: 34px; text-decoration: none; }
    .page-list1 { background-color:#2ac1bc; }
    .page-cur { font-size : 14px; background:none; color: white; padding : 0; border-style : none; }
    .page-nocur { font-size: 14px; background:none; color: #2ac1bc; padding : 0; border-style : none; }
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
				<p style="font-size:30px;">브랜드 관리</p>
				<br><hr><br>
				<form action="systemAdminBrand.do" method="get">
					<table class="searchTable">
						<tr>
							<td><b>브랜드 검색</b></td>
							<c:if test="${empty searchStatus.searchName }">
								<td><input class="menuSearch" name="brandName" type="text" placeholder="브랜드명을 입력해주세요."></td>
							</c:if>
							<c:if test="${not empty searchStatus.searchName }">
								<td><input class="menuSearch" name="brandName" type="text" value="${searchStatus.searchName }"></td>
							</c:if>
							<td colspan="4"><button type="submit">검색</button></td>
						</tr>
						<tr>
							<td><b>상태</b></td>
							<td>
								<c:if test="${searchStatus.searchStatus eq '입점'}">
									<label><input type="radio" name="brandStatus" value="입점" checked/> 입점</label>&nbsp;
									<label><input type="radio" name="brandStatus" value="계약종료"/> 계약종료</label>&nbsp;
									<label><input type="radio" name="brandStatus" value="입점대기"/> 입점대기</label>
								</c:if>
								<c:if test="${searchStatus.searchStatus eq '계약종료'}">
									<label><input type="radio" name="brandStatus" value="입점"/> 입점</label>&nbsp;
									<label><input type="radio" name="brandStatus" value="계약종료" checked/> 계약종료</label>&nbsp;
									<label><input type="radio" name="brandStatus" value="입점대기"/> 입점대기</label>
								</c:if>
								<c:if test="${searchStatus.searchStatus eq '입점대기'}">
									<label><input type="radio" name="brandStatus" value="입점"/> 입점</label>&nbsp;
									<label><input type="radio" name="brandStatus" value="계약종료"/> 계약종료</label>&nbsp;
									<label><input type="radio" name="brandStatus" value="입점대기" checked/> 입점대기</label>
								</c:if>
							</td>
						</tr>
					</table>
				</form>
			</div><!-- menuHeader end -->
		
			<div class="menuResultTable">
				<br><hr><br>
				<table class="resultTable">
					<thead>
						<!-- <th>번호</th> -->
						<th>브랜드 코드명</th>
						<th></th>
						<th>브랜드 명</th>
						<th>입점 상태</th>
						<th>입점 매장 수</th>
					</thead>
					<tbody>
					
					<c:forEach var="i" items="${brandList }">
						<c:url var="goStore" value="systemAdminStore.do">
							<c:param name="storeSearch" value="" />
							<c:param name="brandCategory" value="${i.brand_name }"/>
							<c:param name="status_s" value="Y"/>
						</c:url>
						<tr>
							<td>${i.brand_code }</td>
							<td><img src="resources/images/${i.brand_pic }.png" width="40px" height="40px"></td>
							<td><a href="${goStore }">${i.brand_name }</a></td>
							<td>${searchStatus.searchStatus }</td>
							<td>${i.brand_count }</td>
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
	                    	<c:url var="blistBack" value="systemAdminBrand.do">
	                    		<c:param name="page" value="${pi.currentPage-1} "/>
	                    		<c:param name="brandName" value="${searchStatus.searchName }"/>
	                    		<c:param name="brandStatus" value="${searchStatus.searchStatus }"/>
	                    	</c:url>
	                        <a class="page-a" href="${blistBack }" style="color:#9c9c9c" >Previous</a>	
	                    </c:if>
	                    <ol>
	                    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
	                    	<c:if test="${p eq pi.currentPage }">
	           					<li class = "page-list1"><button disabled class = "page-cur" >${p }</button></li>		
	                    	</c:if>
	                    	<c:if test="${p ne pi.currentPage }">
	                    		<c:url var="blistCheck" value="systemAdminBrand.do">
	                    			<c:param name="page" value="${p }"/>
		                    		<c:param name="brandName" value="${searchStatus.searchName }"/>
		                    		<c:param name="brandStatus" value="${searchStatus.searchStatus }"/>
	                    		</c:url>
	                    		<li class = "page-list2"><button class="page-nocur" onclick="location.href='${blistCheck}'">${p }</button></li>
	                    	</c:if>
	                    </c:forEach>
	                    </ol>
	                    <c:if test="${pi.currentPage eq pi.maxPage }">
		                    <a style = "color:#9c9c9c"  disabled>Next</a>
	                    </c:if>
						<c:if test="${pi.currentPage lt pi.maxPage }">
							<c:url var="blistAfter" value="systemAdminBrand.do">
								<c:param name="page" value="${pi.currentPage+1 }"/>
								<c:param name="brandName" value="${searchStatus.searchName }"/>
	                    		<c:param name="brandStatus" value="${searchStatus.searchStatus }"/>
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
	$("#brand").children().addClass('active');
	
	
})
</script>
</html>