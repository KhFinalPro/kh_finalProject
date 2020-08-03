<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		html, body {
		  height: 100%;
		}
		
		.wrap {
		  height: 100%;
		  display: flex;
		  align-items: center;
		  justify-content: center;
		}
		
		.button {
		  width: 140px;
		  height: 45px;
		  font-family: 'Roboto', sans-serif;
		  font-size: 11px;
		  text-transform: uppercase;
		  letter-spacing: 2.5px;
		  font-weight: 500;
		  color: #000;
		  background-color: #fff;
		  border: none;
		  border-radius: 45px;
		  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
		  transition: all 0.3s ease 0s;
		  cursor: pointer;
		  outline: none;
		  }
		
		.button:hover {
		  background-color: #2ac1bc;
		  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
		  color: #fff;
		  transform: translateY(-7px);
		}
		div{
		float:left;
		}
	</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<br><br><br><br><br>
	
	
	<br><br><br><br> 
		<p align ="center">
			<button class="button" onclick="goHome()">시작페이지로</button> &nbsp&nbsp
			<button class="button"  onclick="toBlist()">목록으로</button>
		</p>
	<script>
		function goHome(){
			location.href="home.do";
		}
		
		function toBlist(){
			location.href="boardList.do";
		}
	</script>
	<form action="bInsert.do" method="post" encType="multipart/form-data">
	<input type="text" name="bWriter" value="${loginUser.id }">
	<input type="text" name="bCate" value="레시피">
	
	<!--  enctype="Multipart/form-data"  파일 쓸때 사용-->
	
	<table align="center"width="40%" style='border-left:0;border-right:0;border-bottom:0;border-top:0' > 
	 <h1 align="center">맛잘알 작성하기</h1>
	 <br><br>
		
			<tr>
				<td>
					title:<input type="text" size="90" name="bTitle">
				</td>
			</tr>
					
			<tr align="center" colspan="2" >
				<td colspan="2"><h1>board contents</h1> </td>
				
			</tr>
		<!-- 
			<tr  colspan="2" style="margin-top:150px" >
					
				<td  colspan="2">
					<div >
						<div id="contentImgArea1">
								<img id="contentImg1" width="133" height="100">
						</div>
						<div id="contentImgArea2">
								<img id="contentImg2" width="133" height="100">
						</div>
						<div id="contentImgArea3">
								<img id="contentImg3" width="133" height="100">
						</div>
						<div id="contentImgArea4">
								<img id="contentImg4" width="133" height="100">
						</div>
						<div id="contentImgArea5">
								<img id="contentImg5" width="133" height="100">
						</div>
					</div>
					<textarea rows="20" cols="90" name="nCont">
					</textarea>
				</td>
			</tr> -->
		  <tr colspan="2">
				<td><button type="button" onclick="addContent()">내용추가</button></td>
			</tr>
		 </table>
		
			<!-- test -->
		<br>
			<div id ="bContents">
			</div>
			
		<br clear="both">
			<div>
				<button type="button" onclick="removeTable()">마지막꺼 삭제</button>
				<input type="submit" value="등록하기">&nbsp; 
				<a href="boardList.do"></a>
			</div>
				
				<input type="submit" class="button" value="등록" >		

		 </form>



<br><br><br><br><br><br><br>

	<script type="text/javascript">
			num = 0;
			function addContent(){
				$content =  "<table align='center' border='1' cellcpacing='0' id='t" + num + "'>"+
							"<tr>" +
								"<td colspan='2'>첨부파일</td>" +
							"</tr>" +
							"<tr>" +
								"<td colspan='2'>"+
									"<div id='i" + num + "' align='center' style='border:1px solid black;height:250px;width:400px' onclick='clickFile(this)'>"+
										"<img name='i" + num + "' style='height:250px;width:400px'>" +
									"</div>" +
							"</tr>" +
							"<tr>" +
								"<td colspan='2'><input type='file' class='i" + num + "' name='fileName' onchange='LoadImg(this, " + num + ")'></td>" +
							"</tr>" +
							"<tr>" +
								"<td colspan='2'>내용</td>" +
							"</tr>" +
							"<tr>" +
								"<td colspan='2'><textarea cols='50' rows='5' name='bContent'></textarea></td>" +
							"</tr>" +
							"</table>";
				$("#bContents").append($content);
				num++;
			}
			function clickFile(obj){
				var iden = "." + obj.id;
				$(iden).click();
			}
			function LoadImg(value, num) {
				var iden = "img[name=i" + num + "]";
				if (value.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
							$(iden).attr("src", e.target.result);
					}
					reader.readAsDataURL(value.files[0]);
				}
			}
			function removeTable(){
				var iden = "#t"+(--num);
				var table = $(iden);
				table.remove();
			}
	</script>
</body>
</html>