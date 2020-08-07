<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section{margin-top: 200px;}
#main_section {margin: auto;clear: both;}

#main_section>.bungae_area {border-radius: 10px; display: inline-block; margin: 0; margin-bottom: 10px; width: 49.4%; height: 230px; border: 2px solid black;}

#main_section>.bungae_area:hover{border:2px solid #2ac1bc; cursor:pointer;}

#main_section>.bungae_area>.brand_logo {text-align:center; width: 30%; height: 180px; margin-left:30px;}

#main_section>.bungae_area>.brand_logo>img {width: 100%; height: 100%;}

#main_section>.bungae_area>.first_line {float: left; height: 150px;}

#main_section>.bungae_area>.bungae_title {width: 60%; margin-left: 20px; margin-top: 15px; text-align: center;}

#main_section>.bungae_area>.brand_name {text-align: center; font-size: 30px; font-weight: 600; line-height: 50px; width: 31%; height: 50px; border-radius: 15px; color: white; background-color: #2ac1bc; margin-left: 20px;}

#main_section>.bungae_area>.status {width: 100px; margin-left: 20px; height: 50; line-height: 50px;}

#main_section>.bungae_area>.second_line {float: left;}
#month_selc{width:70px; height:25px; margin-right:20px;}
#create_bung_area{margin: auto; width: 90%; text-align: right;}
#create_bung_area>input{width: 200px; height: 50px; font-size:25px; font-weight:600; background-color:white; border:2px solid black; border-radius: 15px;}
#create_bung_area>input:hover{color: #735949;; border: 2px solid #735949; cursor:pointer;}

#tag_name{margin:0 auto; width:50%; font-size:40px; font-weight:600; text-align:center;}
#msg_area{text-align:center;}
#msg_area > img{width:20%; heigth:20%;}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<br clear="both">
	
	<section>
		<c:if test="${tagName != null}">
			<h2 id="tag_name">#${tagName.tag_name }</h2>
		</c:if>
		
		<div id="main_section">
			<c:if test="${!empty sessionScope.loginUser }">
				<div id="create_bung_area">
					<select id="month_selc">
						<c:forEach var="i" begin="1" end="12" step="1">
							<c:if test="${i < 10 }">
								<option value="0${i }">${i }월</option>
							</c:if>
							<c:if test="${i > 9 }">
								<option value="${i }">${i }월</option>
							</c:if>
						</c:forEach>
					</select>
					<input type="button" id="create_bung" value="번개 개설하기"/>	
				</div>
			</c:if>
			<c:if test="${empty sessionScope.loginUser }">
				<div id="create_bung_area">
					<select id="month_selc">
						<c:forEach var="i" begin="1" end="12" step="1">
							<c:if test="${i < 10 }">
								<option value="0${i }">${i }월</option>
							</c:if>
							<c:if test="${i > 9 }">
								<option value="${i }">${i }월</option>
							</c:if>
						</c:forEach>
					</select>
					<p>번개 개설은 로그인시 이용할 수 있습니다.</p>	
				</div>
			</c:if>
			<br>
			<c:if test="${msg != null }">
				<div id="msg_area">
					<img src="resources/images/tung.png">
				</div>
			</c:if>
			<c:forEach var="b" items="${list }">
				<div class="bungae_area">
					<input type="hidden" id="bung_num" name="bung_num" value="${b.bung_num }"/>
					<div class="brand_logo first_line">
						<img src="resources/images/${b.bung_img }.png" alt="logo">
					</div>
					<div class="first_line bungae_title">
						<h2>${b.bung_title }</h2>
						<h3>${b.bung_addr }</h3>
						<h3>${b.bung_date }</h3>
						<h4>${b.bung_p_no }명까지</h4>	
					</div>
					<br clear="both">
					<div class="brand_name second_line ">${b.bung_brd }</div>
					<div class="status second_line">${b.bung_status }</div>
				</div>
			</c:forEach>
	
	
		</div>
	</section>
	<%@ include file="../common/footer.jsp"%>
</body>

<script>
	$(function() {
		
		$(".bungae_area").on("click", function() {
			$bung_num = $(this).children("#bung_num").val();
			location.href = "bungDetail.do?bung_num="+$bung_num;
		})
		
		$("#create_bung").on("click",function(){
			location.href="bungCreatePageMove.do";
		})
		
		$("#month_selc").on("change",function(){
			$month = $("#month_selc").val();
			location.href="bungSearch.do?month="+$month;
		})
	})
</script>
</html>