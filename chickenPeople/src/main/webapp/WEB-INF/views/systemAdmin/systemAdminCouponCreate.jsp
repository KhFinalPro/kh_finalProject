<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 _ 쿠폰</title>
<style>
	.item {background: #fff; margin-bottom: 10px; padding: 15px; font-size: 14px; height: 873px; border-bottom-right-radius: 20px;justify-content: center; align-items: center; margin-top: -30px; }
	table{margin:0 auto; width:80%;}
	table .label{width:40%; text-align:right; font-size:25px; font-weight:600; color:#2e4ead;}
	table .input{padding-left:15px;}
	table input{width:50%; height:50px; font-size:25px;}
	#coup_area{margin:0 auto; width:90%; height:300px; text-align:center;}
	form{margin-top:50px;}
	#create_coup_area{position:fixed; top: 110px; right:50px; width:150px; height:50px;}
	/* #create_coup_btn{width: 100%; height:100%; font-size: 25px; font-weight:600; border:0px; color:#2e4ead;} */
	#create_coup_btn:hover{color:white; background-color:#2e4ead;}
	button{border:2px solid #2ac1bc; background-color:white; color:#2ac1bc; padding:5px; font-weight:bold}
	
	.couponHeader{margin:0 auto; width:90%; margin-top:50px;}
	
</style>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

</head>
<body>
<jsp:include page="../common/systemAdminHeader.jsp"/>
<div class="wrapper">
	<div class="main_container">
		<div class="item"> 
		<div class="couponHeader">
			<p style="font-size:20px;">쿠폰발행</p>
			<br><hr><br>
		</div><!-- couponHeader end -->
			<form action="couponCreate.do" method="post" enctype="multipart/form-data">
				<table>
					<tr>
						<td class="label">쿠폰 이름 : </td>
						<td class="input"><input type="text" name="coup_name" required></td>
					</tr>
					<tr>
						<td class="label">쿠폰 내용 : </td>
						<td class="input"><textarea name="coup_cont" cols="41" rows="5" required></textarea></td>
					</tr>
					<tr>
						<td class="label">할인 금액 : </td>
						<td class="input"><input type="number" name="coup_disc" min="0" step="100" style="text-align:right;" required></td>
					</tr>
					<tr>
						<td class="label">쿠폰 배너 : </td>
						<td class="input"><input type="file" id="file" name="uploadFile" required></td>
					</tr>
					<tr>
						<td class="label">유효기간(발급일로 몇일) : </td>
						<td class="input"><input type="number" name="coup_term" min="1" value="1" style="text-align:right;" required>일</td>
					</tr>
				</table>
			
				<br>
				
				
				<div id="coup_area">
					<img id="coupon_img">
					쿠폰 이미지 확인 (1000 * 300)
				</div>
				
				<div id="create_coup_area">
					<button type="submit" id="create_coup_btn">쿠폰 발행</button>
				</div>
				
			
			</form>
		</div>
	</div>
</div>
</body>
<script>
var sel_files = [];
$(function(){
	$("#coupon").children().addClass('active');
	
	
	$("#file").on("change",handleImgFileSelect);
	
	
})

function handleImgFileSelect(e){
	
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		sel_files.push(f);
		
		var reader = new FileReader();
		reader.onload = function(e){
			$("#coupon_img").attr('src', e.target.result);
			
		}
		reader.readAsDataURL(f);
	});
}
</script>
</html>