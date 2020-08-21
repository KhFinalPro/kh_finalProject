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
 	.menuSearch { -webkit-appearance: none;  -moz-appearance: none; appearance: none; }
    .menuSearch { width: 400px; background-color:white; padding:7px 25px;  font-family: inherit;  -webkit-appearance: none; -moz-appearance: none; appearance: none; border: 1px solid #999; border-radius: 0px; }
	 select { -webkit-appearance: none;  -moz-appearance: none; appearance: none; background: "lowerArrow.png" no-repeat 95% 50%; /* 화살표 모양의 이미지 */ }
     select { width: 400px; background-color:white; padding:7px 25px;  font-family: inherit; background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;  -webkit-appearance: none; -moz-appearance: none; appearance: none; border: 1px solid #999; border-radius: 0px; }
     select::-ms-expand { /* for IE 11 */ display: none; }
    .menuHeader{margin:0 auto; width:90%; margin-top:30px;}
	.menuResultTable{margin:0 auto; width:90%;}
	.resultTable { width:100%; border-top:1px solid #444444; border-bottom:1px solid #444444; margin:0 auto;} .resultTable td{text-align:center;} .resultTable th,td{padding:7px;}
	.resultTable td .resultTable th{border-bottom:1px solid #444444; border-top:1px solid #444444; padding:10px;}
	
	button{border:1px solid #2ac1bc; background-color:white; color:#2ac1bc; padding:5px;}
	
	
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
    
</style>
</head>
<body>
<jsp:include page="../common/systemAdminHeader.jsp"/>
	<div class="wrapper">
		<div class="main_container">
			<div class="item">
				<br clear="both">
			<div class="menuHeader">
				<p style="font-size:20px;">신고 관리</p>
				<br><hr><br>
				<form action="systemAdminReport.do" method="get">
					<table class="searchTable">
						<tr>
							<td><b>아이디 검색</b></td>
							<c:if test="${empty searchStatus.searchName }">
								<td><input class="menuSearch" name="searchId" type="text" placeholder="아이디를 입력해주세요."></td>
							</c:if>
							<c:if test="${not empty searchStatus.searchName }">
								<td><input class="menuSearch" name="searchId" type="text" value="${searchStatus.searchName }"></td>
							</c:if>
						</tr>
						<tr>
							<td><b>신고사유 검색</b></td>
							<td>
								<select id="rptCategory" class="menuCategory" name="rptCategory">
									<option value="total">전체</option>
									<c:forEach var="m" items="${rCategory}">
										<c:if test="${searchStatus.searchCategory eq m.rpt_Content }">
											<option value="${m.rpt_Content }" selected>${m.rpt_Content }</option>
										</c:if>
										<c:if test="${searchStatus.searchCategory ne m.rpt_Content }">
											<option value="${m.rpt_Content }">${m.rpt_Content }</option>
										</c:if>																
									</c:forEach>
									
								</select>
							</td>
							<td><b>처리 상태</b></td>
							<td>
								<c:if test="${searchStatus.searchStatus eq 'N' }">
									<label><input type="radio" name="status_s" value="Y" />처리 완료</label>&nbsp;
									<label><input type="radio" name="status_s" value="N" checked/>미처리</label>&nbsp;
								</c:if>
								<c:if test="${searchStatus.searchStatus eq 'Y' }">
									<label><input type="radio" name="status_s" value="Y" checked/>처리 완료</label>&nbsp;
									<label><input type="radio" name="status_s" value="N"/>미처리</label>&nbsp;
								</c:if>
								
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
				<table class="resultTable">
					<thead>
						<th>번호</th>
						<th>게시글 구분</th>
						<th>게시글 번호</th>
						<th>신고사유</th>
						<th>신고 내용</th>
						<th>신고 일</th>
						<th>회원 아이디</th>
						<th>처리상태</th>
					</thead>
					<tbody>
						<c:forEach var="i" items="${reportList }">
							<tr>
								<input type="hidden" value="${i.br_Code }"/>
								<input type="hidden" value="${i.rpt_Code }"/>
							
								<td class="reportNum">${i.rpt_Num }</td>
								<td>${i.br_Content }</td>
								<td>${i.br_Num }</td>
								<td>${i.rpt_Content }</td>
								<td>${i.content }</td>
								<td>${i.rpt_Date }</td>
								<td>${i.user_Id }</td>
								<c:if test="${i.rpt_Status eq 'Y' }">
									<td>처리</td>								
								</c:if>
								<c:url var="updateReport" value="reportStatusUpdate.do">
								<!-- 값을 가지고 뒤로 넘어가는 거 생각해보기 ***************************************** -->
									<c:param name="br_code" value="${i.br_Code }"/>
									<c:param name="br_num" value="${i.br_Num }"/>
									<c:param name="rpt_num" value="${i.rpt_Num }"/>
								</c:url>
								<c:if test="${i.rpt_Status eq 'N' }">
									<td><button onclick="location.href='${updateReport}'">삭제</button></td>
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
	                    	<c:url var="blistBack" value="systemAdminReport.do">
	                    		<c:param name="page" value="${pi.currentPage-1} "/>
	                    		<c:param name="rptCategory" value="${searchStatus.searchCategory }"/>
	                    		<c:param name="searchId" value="${searchStatus.searchName }"/>
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
	                    		<c:url var="blistCheck" value="systemAdminReport.do">
	                    			<c:param name="page" value="${p }"/>
	                    			<c:param name="rptCategory" value="${searchStatus.searchCategory }"/>
		                    		<c:param name="searchId" value="${searchStatus.searchName }"/>
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
							<c:url var="blistAfter" value="systemAdminReport.do">
								<c:param name="page" value="${pi.currentPage+1 }"/>
								<c:param name="rptCategory" value="${searchStatus.searchCategory }"/>
	                    		<c:param name="searchId" value="${searchStatus.searchName }"/>
	                    		<c:param name="status_s" value="${searchStatus.searchStatus }"/>
							</c:url>
							<a class="page-a" href="${blistAfter }" style = "color:#9c9c9c">Next</a>
						</c:if>
	           </div>
	        </div><!-- pagination class p-parents end --> 
	       
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