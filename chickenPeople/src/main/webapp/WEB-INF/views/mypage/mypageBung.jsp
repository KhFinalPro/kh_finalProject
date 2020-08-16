<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section{margin-top:150px;}
#main_section {margin: auto; width: 90%; clear: both; margin-top:100px;}

#main_section>.bungae_area {border-radius: 10px; display: inline-block; margin: 0; margin-bottom: 10px; width: 49.4%; height: 230px; border: 1px solid black;}

#main_section>.bungae_area:hover{border:1px solid #2ac1bc;}

#main_section>.bungae_area>.brand_logo {text-align:center; width: 30%; height: 180px; margin-left:30px}

#main_section>.bungae_area>.brand_logo>img {width: 100%; height: 100%;}

#main_section>.bungae_area>.first_line {float: left; height: 150px;}

#main_section>.bungae_area>.bungae_title { width: 60%; margin-left: 20px; margin-top: 15px; text-align: center;}

#main_section>.bungae_area>.brand_name {text-align: center; font-size: 30px; font-weight: 600; line-height: 50px; width: 31%; height: 50px; border-radius: 15px; color: white; background-color: #2ac1bc;margin-left: 20px;}

#main_section>.bungae_area>.status {width: 100px; margin-left: 20px; height: 50; line-height: 50px;}

#main_section>.bungae_area>.second_line {float: left;}
#create_bung_area{margin: auto; width: 90%; text-align: right;}
#create_bung_area>input{width: 200px; height: 50px; font-size:25px; font-weight:600; background-color:white; border:1px solid black;}

#tag_name{margin:0 auto; width:50%; font-size:40px; font-weight:600; text-align:center;}


#msg_area{text-align:center;}
#msg_area > img{width:20%; heigth:20%;}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	
	<section>
		<c:if test="${!empty bungList }">
			<div id="main_section">
				<br>
				<c:forEach var="b" items="${bungList }">
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
		</c:if>
		<c:if test="${!empty msg }">
			<div id="msg_area">
					<img src="resources/images/tung.png">
			</div>
		</c:if>
	</section>
	
	<jsp:include page="../common/footer.jsp"/>
</body>

<script>
	$(function() {
		
		$(".bungae_area").on("click", function() {
			$bung_num = $(this).children("#bung_num").val();
			location.href = "bungDetail.do?bung_num="+$bung_num + "&myPageStatus=y";
		})
		
		$("#create_bung_area").on("click",function(){
			location.href="bungCreatePageMove.do";
		})
	})
</script>
</html>