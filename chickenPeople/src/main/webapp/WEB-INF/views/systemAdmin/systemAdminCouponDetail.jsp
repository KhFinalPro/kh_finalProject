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
	table .label{width:40%; text-align:right; font-size:25px; font-weight:600; color:#000;}
	table .input{padding-left:15px;}
	table input{width:50%; height:50px; font-size:25px;}
	#coup_area{margin:0 auto; width:80%; height:300px; text-align:center;}
	form{}
	#create_coup_area{position:fixed; top: 200px; right:130px; width:200px; height:50px;}
	#create_coup_btn{width: 100%; height:100%; font-size: 25px; font-weight:600; border:0px; color:#2ac1bc; }
	
	#create_coup_btn:hover{color:white; background-color:#2ac1bc;}
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
			<form action="couponUpdate.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="coup_serial" value="${coupon.coup_serial }">
				<table>
					<tr>
						<td class="label">쿠폰 이름 : </td>
						<td class="input"><input type="text" name="coup_name" value="${coupon.coup_name }" required></td>
					</tr>
					<tr>
						<td class="label">쿠폰 내용 : </td>
						<td class="input"><textarea name="coup_cont" cols="41" rows="5">${coupon.coup_cont }</textarea></td>
					</tr>
					<tr>
						<td class="label">할인 금액 : </td>
						<td class="input"><input type="number" min="0" step="100" value="${coupon.coup_disc }" required style="text-align:right;"></td>
					</tr>
					<tr>
						<td class="label">쿠폰 배너 : </td>
						<td class="input"><input type="file" id="file" name="uploadFile" required></td>
					</tr>
					<tr>
						<td class="label">유효기간(발급일로 몇일) : </td>
						<td class="input"><input type="number" name="coup_term" min="1" value="${coupon.coup_term }" required style="text-align:right;">일</td>
					</tr>
				</table>
			
				<br>
				
				
				<div id="coup_area">
					<img src="resources/coupon/${coupon.coup_pic }" alt=""/>
				</div>
				
				<div id="create_coup_area">
					<input type="submit" id="create_coup_btn" value="쿠폰 수정하기"><br> 
					<!-- <input type="button" class="coup_delete_btn" id="create_coup_btn" value="쿠폰 삭제하기">  -->
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
	+42
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