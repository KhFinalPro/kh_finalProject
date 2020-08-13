<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 등록</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<style>
	.menuSearch { -webkit-appearance: none;  -moz-appearance: none; appearance: none; }
    .menuSearch { width: 400px; background-color:white; padding:7px 25px;  font-family: inherit;  -webkit-appearance: none; -moz-appearance: none; appearance: none; border: 1px solid #999; border-radius: 0px; }
	 select { -webkit-appearance: none;  -moz-appearance: none; appearance: none; background: "lowerArrow.png" no-repeat 95% 50%; /* 화살표 모양의 이미지 */ }
     select { width: 400px; background-color:white; padding:7px 25px;  font-family: inherit; background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;  -webkit-appearance: none; -moz-appearance: none; appearance: none; border: 1px solid #999; border-radius: 0px; }
     select::-ms-expand { /* for IE 11 */ display: none; }
    .menuHeader{margin:0 auto; width:90%; margin-top:30px;}
	.menuResultTable{margin:0 auto; width:90%;}
	.resultTable { width:100%; border-top:1px solid #444444; border-bottom:1px solid #444444;} 
	.resultTable td{/* text-align:center; */} .resultTable th,td{padding:3px;}
	.resultTable{font-size:20px;}
	.resultTable td .resultTable th{border-bottom:1px solid #444444; border-top:1px solid #444444; padding:10px; width:545px; height:50px;}
	
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
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>

<div class="wrapper">
	<div class="main_container">
		<div class="item">
			<br clear="both">
			<div class="menuHeader">
				<p style="font-size:20px;">메뉴 등록</p>
				
			</div><!-- menuHeader end -->
			<div class="menuResultTable">
			<br><br><br>
				
				<br>
				<form action="menuInsertData.do" method="post" enctype="multipart/form-data">
				<table class="resultTable">
					<tr>
						<td rowspan="6">
							<div id="contentImgArea">
								<img id="contentImg" src="" onerror="this.src='resources/images/noneImage.png'" width="450px" height="450px">
							</div>
						</td>
						<td><b>브랜드 명</b></td>
						<td>
							<select id="brandCategory" class="brandCategory" name="brand_Code">
								<c:forEach var="m" items="${brandList}">
									<option value="${m.brand_code }">${m.brand_name }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					
					<tr>
						
						<td><b>분류</b>&nbsp;</td>
						<td>
							<select id="category" class="category" name="cat_Code">
								<c:forEach var="c" items="${categoryList }">
									<option value="${c.cat_Code }">${c.cat_Name }</option> 
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td><b>메뉴 이름 </b></td>
						<td><input name="menu_Name" class="menuSearch" type="text" placeholder="메뉴 이름을 입력해주세요"></td>
					</tr>
					<tr>
						<td><b>메뉴 가격 </b></td>
						<td><input name="menu_Price" class="menuSearch" type="text" placeholder="가격을 입력해주세요"> &nbsp;원</td>
					</tr>
					<tr>
						<td><b>메뉴 설명</b></td>
						<td><textarea name="menu_Exp" cols="63" rows="6"></textarea></td>
					</tr>
					<tr>	
						<td colspan="2">
							<button id="insert" type="submit"><b>판매처리</b></button>
							
						</td>
					</tr>
				</table>
				<div id="fileArea">
					<input type="file" id="thumbnailImg" name="thumbnailImg" onchange="LoadImg(this)">
				</div>
					</form>
				<script>
					$(function(){
						$("#fileArea").hide();
						$("#contentImgArea").click(function(){
							$("#thumbnailImg").click();
						})
					})
					function LoadImg(value){
						if(value.files && value.files[0]){
				   			var reader = new FileReader();
							reader.onload = function(e){
								console.log("사진변경");
								$("#contentImg").attr("src",e.target.result);
								console.log("성공");
							}
							reader.readAsDataURL(value.files[0]);
						}
					}
				</script>
				</form>
			</div><!-- class menuInsertArea end -->
		</div><!-- class item end -->
	</div><!--class main container end -->
</div><!-- class Wrapper end -->

</body>
<script>
$(function(){
	$("#menu").children().addClass('active');
})

</script>
</html>