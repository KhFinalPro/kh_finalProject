<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		.wrapper{
		    width: 300px;
		    height: auto;
			border: 1px solid green;
		    overflow: scroll;
		}
		table{
			border:1px solid black;
		}
		#slider4{
		    white-space: nowrap;
		}
		.slide-img{
		    background: #ccc;
		    height: 100px;
		    display: inline-block;
		    width: 100px;
		}
</style>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
     
</head>
<style>
   	.button{
	  background:#2CBFB1;
	  color:#fff;
	  border:none;
	  position:relative;
	  height:50px;
	  font-size:1.2em;
	  padding:0 2em;
	  cursor:pointer;
	  transition:800ms ease all;
	  outline:none;
	}
	.button:hover{
	  background:#fff;
	  color:#2CBFB1;
	}
	.button:before,button:after{
	  content:'';
	  position:absolute;
	  top:0;
	  right:0;
	  height:2px;
	  width:0;
	  background: #2CBFB1;
	  transition:400ms ease all;
	}
	.button:after{
	  right:inherit;
	  top:inherit;
	  left:0;
	  bottom:0;
	}
	.button:hover:before,button:hover:after{
	  width:100%;
	  transition:800ms ease all;
	}
	
	 table {
	 	
	    border-collapse: collapse;
		  }
	  th, td {
	    
	    padding: 10px;
	  }
	/* 삭제버튼 */
	  	.dbutton{
	  background:#F2C2CB;
	  color:#fff;
	  border:none;
	  position:relative;
	  height:50px;
	  font-size:1.2em;
	  padding:0 2em;
	  cursor:pointer;
	  transition:800ms ease all;
	  outline:none;
	}
	.dbutton:hover{
	  background:#fff;
	  color:#F2C2CB;
	}
	.dbutton:before,button:after{
	  content:'';
	  position:absolute;
	  top:0;
	  right:0;
	  height:2px;
	  width:0;
	  background: #F2C2CB;
	  transition:400ms ease all;
	}
	.dbutton:after{
	  right:inherit;
	  top:inherit;
	  left:0;
	  bottom:0;
	}
	.dbutton:hover:before,button:hover:after{
	  width:100%;
	  transition:800ms ease all;
	}
	
	 table {
	 	
	    border-collapse: collapse;
		  }
	  th, td {
	    
	    padding: 10px;
	  }
 /* upbutton */	
	  .ubutton{
	  background:#F2C2CB;
	  color:#fff;
	  border:none;
	  position:relative;
	  height:50px;
	  font-size:1.2em;
	  padding:0 2em;
	  cursor:pointer;
	  transition:800ms ease all;
	  outline:none;
	}
	.ubutton:hover{
	  background:#fff;
	  color:#F2C2CB;
	}
	.ubutton:before,button:after{
	  content:'';
	  position:absolute;
	  top:0;
	  right:0;
	  height:2px;
	  width:0;
	  background: #F2C2CB;
	  transition:400ms ease all;
	}
	.ubutton:after{
	  right:inherit;
	  top:inherit;
	  left:0;
	  bottom:0;
	}
	.ubutton:hover:before,button:hover:after{
	  width:100%;
	  transition:800ms ease all;
	}
	
	 table {
	 	
	    border-collapse: collapse;
		  }
	  th, td {
	    
	    padding: 10px;
	  }
	
          textarea{
              width:100%;
            }
             
        .reply_reply {
                border: 2px solid #FF50CF;
            }
        .reply_modify {
                border: 2px solid #FFBB00;
            }
	  
	
            
            
</style>


<body style="background:#e9ecef;">
  <jsp:include page="../common/header.jsp"/>
  <input type="text" id="board_id" name="board_id" value="이게뭘까?${boardView.id}" />
  <div  style=" width:70%;background:white; margin:0 auto;">
  <br><br><br>
	  
	  <div style="width:80%; height: 1500px; margin:0 auto; ">
		  <br>
		  <table align="center"  width="100%" border=1px;> 
		    <br><br>
	  <h1 align="center">${board.bNum} 맛잘알 게시판 상세보기</h1>
	    <br><br><br>
	    
	    		 <tr style="background:white" align="center">
	    		 
				  	<td>번호</td> <!-- 나중에 DB갔다온 후 $붙이기 -->
				  	<td>분류</td>
				  	<td width="45%">제목</td>
				  	
				  	<td width="15%">날짜</td>
				  	<td>조회수</td>
				  	<td>추천수</td>
				  	
				  </tr>
		    	 <tr style="background:#dee2e6">
				  	<th>${board.bNum}</th> <!-- 나중에 DB갔다온 후 $붙이기 -->
				  	<th>${board.bCate}</th>
				  	<th width="45%">${board.bTitle}</th>
				  	
				  	<th width="15%">${board.bDate}</th>
				  	<th>${board.bCount}</th>
				  	<th>${board.bHit}</th>
				  	
				  </tr>
					<tr>
						<td colspan="6"  align="right">작성자: ${board.bWriter}</td>
					</tr>
		  <!--  insert 완료후 작성 -->
	
		 
		 </table> 
		 <div id="contents" style="border:1px solid black">
		 	<div align="center" border="1px solid black">
			<label>삭제하기 위해 선택한 것 :</label><br>		
			<label>지울 파일 번호</label><input type="text" id="selectDelete" name="selectDelete">&nbsp;
			<label>지울 포스팅 번호</label><input type="text" id="selectNum"> 
			<label>지울 파일 이름</label><input type="text" id="selectRenameFileName">&nbsp;
			<br>
			<button type="button" onclick="insertTable()">내용 추가</button>					<!-- 기존의 게시글에 포스팅 추가 -->			
			<button type="button" onclick="removeTable()">추가내용 다시 삭제</button>			<!-- 추가한 포스팅만 삭제(기존 것은 삭제되지 않음) -->
			<button type="button" onclick="deleteTable()">기존 게시글 선택삭제</button>			<!-- 기존 게시글을 선택 했다면 삭제할 수 있음 -->
			<button type="button" onclick="rollbackTable()">전체 되돌리기</button>				<!-- 포스팅을 수정하기 이전 기존 모습으로 되돌림 -->
			
			
		</div>
		<div class="wrapper" style="margin:auto">   
			    <div id="slider4" class="text-center">
			    
			    <!-- 기존 포스팅의 이미지를 뿌려주는 슬라이드 -->
			    <c:set var="initNum" value="0"/>
			    <c:forEach var="p" items="${pList }">													    <!-- 기존 게시글의 포스팅 갯수만큼 돌아가는 forEach -->
				<c:set var="initNum" value="${initNum + 1 }"/>
			        <div id="i${initNum }" align="center" class="slide-img" style="background: #ccc; height: 100px; display: inline-block; width: 100px;" >
						<img name="i${initNum}" style="height:100px;width:100px;background-size:cover;" src="/chickenPeople/resources/buploadFiles/${p.upFileName }">
					</div>
				</c:forEach>
			        
			    </div>
		</div> 
	<script>
		// 지울려고 선택한 포스팅 ID
		selectFid = "";
		
		// 초기 게시판의 내용을 저장 할 전역 변수
		saveContents = "";
		
		// 초기 슬라이드의 내용을 저장 할 전역 변수
		saveSlide = "";
		
		// 선택한 테이블의 id를 저장 할 전역 변수
		iden = "";
		
		// 페이지가 로딩될 때 처음 하는 작업
		$(function(){
			// 포스팅 내용을 전역변수 saveContents에 저장
			saveContents = $("#wrapContents").html();
			
			// 슬라이드 내용을 전역변수 saveSlide에 저장
			saveSlide = $(".wrapper").html();
			
			// 게시판에서 적용 되어야 할 css를 다시 추가 된 테이블에 적용
			defaultCss();
		});
		
		// 다시 생성 된 table들 및 슬라이더에게 공통 이벤트 및 css 적용(처음 페이지가 켜질 때($(function(){}))나 전체 되돌리기 시에 실행 )
		function defaultCss(){
			$(".hoverC td").mouseenter(function(){
				$(this).parent().parent().css({"background":"darkgray", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().parent().css({"background":"white"});
			}).click(function(){
				// 포스팅의 DB상에서 식별자 컬럼값 저장 ---------------------------> 해당 포스팅을 Controller로 넘겨 DB에서 지우기 위함
				// DB에서 지울 포스팅의 DB상에서의 식별자인 FID
				selectFid = $(this).parent().parent().children().eq(1).children().children().eq(0).val();
				// 지울 포스팅의 식별자 FID를 input 태그에 저장
				$("#selectDelete").val(selectFid);
				
				// 포스팅 번호를 저장  ----------------------------------------> 해당 포스팅 번호에 해당하는 태그들을 화면에서 지우기 위함
				// 포스팅 번호
				var selectNum = $(this).parent().parent().children().eq(1).children().children().eq(2).val();
				// 지울 포스팅의 번호를 input 태그에 저장
				$("#selectNum").val(selectNum);				  // 선택한 table의 번호를 input hidden 태그에 저장
				
				iden = "#t"+$("#selectNum").val();			  // 선택 된 table의 id를 전역변수에 저장
				$("table").css("border","1px solid black");	  // table들의 기본 css를 적용
				$(iden).css("border","1px solid green");      // 선택 된 table의 테두리를 변경
				
				// 지울 파일명(rename) ---------------------------------------> 해당 파일을 서버에서 지우기 위함 
				var displayFileName = $(this).parent().parent().children().eq(1).children().children().eq(1).val();
				// 지울 파일명을 input 태그에 저장
				$("#selectRenameFileName").val(displayFileName);
			});
			
			// 슬라이더와 관련된 태그들에 다시 css를 적용
			$("#slider4").css({"white-space":"nowrap"});
			$(".slide-img").css({"background":"#ccc"},{"height":"100px"},{"display":"inline-block"},{"width":"100px"});
			
		}
		
		// 선택한 table(포스팅)을 지우기 위해 지울 포스팅을 input hidde 태그를 만들어서 등록
		function deleteTable(){
			var table = $(iden);	// 사용자가 선택한 테이블의 id를 통해 선택자로 찾아 변수에 저장
			table.remove();			// 선택한 테이블 삭제
			
			// 선택 된 포스팅과 파일명(rename)
			deleteFidValue = $("#selectDelete").val();												
			selectRenameFileName = $("#selectRenameFileName").val();							     // 선택 된 포스팅에 등록 되어 있는 기존의 rename 된 파일명을 가져
			
			//
			deleteInput1 = "<input type='text' name='deleteFid' value='"+deleteFidValue+"'>";        // 지울 포스팅을 value로 지니고 Controller로 넘겨주기 위한 input
			deleteInput2 = "<input type='text' name='deleteFile' value='"+selectRenameFileName+"'>"; // 지울 파일의 rename 된 파일명을 Controller로 넘겨주기 위한 input
			$("#wrapContents").append(deleteInput1);												 // 지울 포스팅의 FID를 지닌 태그를 기존 html에 추가
			$("#wrapContents").append(deleteInput2);												 // 지울 포스팅의 rename 된 파일을 지닌 태그를 기존 html에 추가
			
			
			// 슬라이더에 있는 기존 게시글 사진 div도 삭
			var selectedSlideDivNum = $("#selectNum").val();			// 내용 추가 후 num가 증가했으므로 지우기 전 마지막 미리보기 사진이나 내용 table은 postingNum을 하나 줄여야 
			
			var idenD = "#i"+(selectedSlideDivNum);	// id가 i+num인 div
			var deleteDiv = $(idenD);

			deleteDiv.remove();
			deleteTable.remove();
		}
		
		postingNum = ${fn:length(pList) } + 1; // 게시글 안의 포스팅 Number
		// 전역변수 postingNum를 활용하여 새로운 내용 table이 div(id : contentDiv)에 추가
		function insertTable(){			
			// 추가 된 내용 갯수를 지닐 input태그에 증가 된 수를 저장
			$("#addCount").val(parseInt($("#addCount").val())+1);
			
			// 추가 될 내용 table 태그(table과 내용은 postingNum 전역 변수를 활용)를 지닌 문자열 변수
			$content =  "<table align='center' border='1' cellcpacing='0' id='t" + postingNum + "'>"+
			"<tr>" +
				"<td colspan='2'>첨부파일</td>" +
			"</tr>" +
			"<tr>" +
				"<td colspan='2'>"+
					"<div id='i" + postingNum + "' align='center' style='border:1px solid black;height:250px;width:400px' onclick='clickFile(this)'>"+
						"<img name='i" + postingNum + "' style='height:250px;width:400px'>" +
					"</div>" +
				"</td>" +
			"</tr>" +
			"<tr>" +
				"<td colspan='2'><input type='file' class='i" + postingNum + "' name='newUploadFile' onchange='LoadImg(this, " + postingNum + ")'></td>" +
			"</tr>" +
			"<tr>" +
				"<td colspan='2'>내용</td>" +
			"</tr>" +
			"<tr>" +
				"<td colspan='2'><textarea cols='50' rows='5' name='newCon'></textarea></td>" +
			"</tr>" +
			"</table>";
			$("#contentDiv").append($content);
			
			
			// 이미지 슬라이더인 id가 slider4인 div에 사진을 포함한 div를 추가
			$imageContent = "<div id='i" + postingNum + "' align='center' class='slide-img' style='background: #ccc; height: 100px;" +
		    "display: inline-block; width: 100px;' >"+
			"<img name='i" + postingNum + "' style='height:100px;width:100px;background-size:cover;'>" +
			"</div>";
			
			$("#slider4").append($imageContent);
			
			// 다음번 내용 table의 번호를 위해 전역변수 postingNum 증가
			postingNum++;
		}
		
		// 추가한 테이블만 지움
		function removeTable(){
			// 추가 한 게시글 수 감소
			if($("#addCount").val() != "0"){	// 추가 한 테이블들은 다 지워 졌다면(-1은 되어선 안)
				$("#addCount").val(parseInt($("#addCount").val())-1);
				var dimNum = --postingNum;			// 내용 추가 후 num가 증가했으므로 지우기 전 마지막 미리보기 사진이나 내용 table은 postingNum을 하나 줄여야 
				
				var idenD = "#i"+(dimNum);	// id가 i+num인 div
				var idenT = "#t"+(dimNum);	// id가 t+num인 table
				var deleteDiv = $(idenD);
				var deleteTable = $(idenT);
				deleteDiv.remove();
				deleteTable.remove();
			}
		}
		
		// 기존 게시글의 내용으로 돌아감
		// 페이지가 로딩되며 초기 내용이 저장 된 saveContents로 내용을 리셋하며 다시 전역변수 postingNum(더 추가 할 table에서 쓰임)를 세팅
		function rollbackTable(){
			// 포스팅 내용 리셋
			$("#wrapContents").html("");
			$("#wrapContents").html(saveContents);
			
			// 슬라이드 내용 리셋
			$(".wrapper").html("");
			$(".wrapper").html(saveSlide);
			
			defaultCss();
			postingNum = ${fn:length(pList) } + 1;
		}
		

		
		
	</script>
	<form action="bupdate.do" method="post" enctype="multipart/form-data">	
	
		<input type="hidden" name="bId" value="${board.bNum }">										<!-- Controller로 게시글 번호를 넘길 input hidden 태그 -->
		<input type="hidden" id="addCount" name="addCount" value="0">							<!-- Controller로 추가한 테이블의 갯수를 넘길 input hidden 태그 -->
		
	
		<table align="center" cellpadding="10" cellspacing="5" border="1" width="500">
			<tr align="center" valign="middle">
				<th colspan="2">${board.bNum }번 글 상세보기</th>
			</tr>
			<tr>
				<td height="15" width="70">제목</td>
				<td><input type="text" name="bTitle" size="60" value="${board.bTitle }"></td>
			</tr>
		</table>
			<c:set var="num" value="0"/>															<!-- 게시글 안의 포스팅별 구분을 위한 번호 저장용 변수를 0으로 초기 -->
		<div id="wrapContents">
			<c:forEach var="p" items="${pList }">													    <!-- 기존 게시글의 포스팅 갯수만큼 돌아가는 forEach -->
				<c:set var="num" value="${num + 1 }"/>												    <!-- forEach가 돌며 포스팅 번호 저장용 변수 증 -->
				<table align="center" border = "1" cellcpacing="0" id="t${num }" class="hoverC">
					<tr>
						<td>${num }번째 포스팅</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="fId" value="${p.picNum }">						    <!-- 게시글 번호 -->
							<input type="text" name="remainFileName" value="${p.upFileName }">      <!-- 기존 게시글의 rename 된 파일명 -->
							<input type="text" name="checkNum" value="${num }">						    <!-- 포스팅 번호 -->
							<br>
							<input type="text" name="remainOriFileName" value="${p.oriFileName }"> <!-- 기존 게시글의 원본 파일명 -->
						</td>
					</tr>
					<tr>
						<td colspan="2">첨부파일</td> 
					</tr> 
					<tr> 
						<td colspan="2">
							<div id="i${num }" align="center" style="border:1px solid black;height:250px;width:400px" onclick="clickFile(this)">
								<img name="i${num }" src="/chickenPeople/resources/buploadFiles/${p.upFileName}" style="height:250px;width:400px"> 
							</div> 
						</td>
					</tr> 
					<tr>
						<td colspan="2">
						<a href="/chickenPeople/resources/buploadFiles/${p.upFileName}" 
							download="${p.oriFileName }">
							${p.oriFileName }
						</a>
						</td>
					</tr>
					<tr>
						<td colspan="2"><input type="file" class="i${num }" name="reUploadFile" onchange="LoadImg(this,${num })"></td>
					</tr>
					<tr> 
						<td colspan="2">내용</td> 
					</tr> 
					<tr> 
						<td colspan="2"><textarea cols="50" rows="5" name="bCon">${p.bContent }</textarea></td> 
					</tr>
				</table>
			</c:forEach>
			<div id="contentDiv">
			</div>
		</div>
		<div align="center">
				 
				<input type="submit" value="수정하기">&nbsp;
				<c:url var="bdelete" value="bdelete.do">
					<c:param name="bId" value="${board.bNum }"/>				
				</c:url>
				<input type="button" value="삭제하기" onclick="confirmDelete()">
				<a href="blist.do">목록으로</a>
		</div>
	</form>
	
	<script>
	
		// div 클릭시 해당하는 file input 태그 클릭
		function clickFile(obj){
			var iden = "." + obj.id;
			$(iden).click();
		}
		
		// 업로드 할 파일 클릭시 div에 file 미리 보기(num을 통해 이미지를 해당하는 img태그에 적용함)
		function LoadImg(value, num) {
				var iden = "img[name=i" + num + "]";
				if (value.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
							$(iden).attr("src", e.target.result);			// 같은 포스팅의 img 태그의 사진 변화
					}
					reader.readAsDataURL(value.files[0]);
				}
		}
		
		// 게시판 삭제를 확인하고 delete를 수행
		function confirmDelete(){
			var result = confirm("정말 삭제 하시겠습니까?");
			if(result){
				location.href='${bdelete}';	
			}
		}
	</script>
	</div>
		 <!-- 다중 사진 업로드 END -->
		 
		   <table border="1" width="100%" bordercolor="#46AA46">
                <tr>
                    <td width="500px">
                        이름: <input type="text" id="reply_writer" name="reply_writer" style="width:170px;" maxlength="10" placeholder="작성자"/>
                        패스워드: <input type="password" id="reply_password" name="reply_password" style="width:170px;" maxlength="10" placeholder="패스워드"/>
                        <button id="reply_save" name="reply_save">댓글 등록</button>
                    </td>
                </tr>
                <tr>
                    <td>
                        <textarea id="reply_content" name="reply_content" rows="4" cols="50" placeholder="댓글을 입력하세요."></textarea>
                    </td>
                </tr>
            </table>
            <table border="1"width="100%" id="reply_area">
                <tr reply_type="all"><!-- 뒤에 댓글 붙이기 쉽게 선언 -->
                    <td colspan="4"></td>
                </tr>
                <!-- 댓글이 들어갈 공간 -->
            </table>
      
     
		 <!-- 댓글 ajax -->
		

			 <br><br> <br><br> <br><br>
	 <div align="center">
			<c:if test="${loginUser.id eq board.bWriter }">
				  	<button class="ubutton" onclick ="UpBoard()">수정하기</button>
			 </c:if>
		  	<button class="button" onclick ="toBlist()" value="boardList.do" >목록</button> 
			 <c:if test="${loginUser.id eq board.bWriter }">
				  	<button class="dbutton" onclick ="DelBoard()">삭제하기</button>
			</c:if>
	</div>

		 <br><br> <br><br> <br><br>
		 <!-- 수정하기 -->
		<!--  <script>
		 	function UpBoard(){
		 		location.href="boardUpView.do?bNum=${board.bNum}";
		 	} 
		 </script> -->
		 
		 <!-- 삭제하기 -->
		 <script>
		 	/* function DelBoard(){
		 		location.href="ndelete.do?nNum=${notice.nNum}";
		 	} */
		 </script>
	
	
	
	
	

<!-- 목록으로~ -->
	<script>
		function toBlist (){
			location.href="boardList.do"; 
		}
	</script>
		  

		  
		  
	 </div> 
  </div>
   <br><br> <br><br> <br><br> <br><br> <br><br> <br><br> <br><br>

       <script type="text/javascript"> /*댓글, 대댓글*/
            $(document).ready(function(){
            	
            	var reply_count = 0; //원래 DB에 저장하고 저장 아이디 번호를 넘겨줘야 하는데 DB 없이 댓글 소스만 있어 DB 에서 아이디 증가하는것처럼 스크립트에서 순번을 생성
            	var status = false; //수정과 대댓글을 동시에 적용 못하도록
                 
                $("#list").click(function(){
                	alert("게시판 리스트로 이동");
                    //location.href = "/board/list";
                });
                 
                //댓글 저장
                $("#reply_save").click(function(){
                     
                    //널 검사
                    if($("#reply_writer").val().trim() == ""){
                        alert("이름을 입력하세요.");
                        $("#reply_writer").focus();
                        return false;
                    }
                     
                    if($("#reply_password").val().trim() == ""){
                        alert("패스워드를 입력하세요.");
                        $("#reply_password").focus();
                        return false;
                    }
                     
                    if($("#reply_content").val().trim() == ""){
                        alert("내용을 입력하세요.");
                        $("#reply_content").focus();
                        return false;
                    }
                     
                    var reply_content = $("#reply_content").val().replace("\n", "<br>"); //개행처리
                     
                    //값 셋팅
                    var objParams = {
                            board_id        : $("#board_id").val(),
                            parent_id       : "0",  
                            depth           : "0",
                            reply_writer    : $("#reply_writer").val(),
                            reply_password  : $("#reply_password").val(),
                            reply_content   : reply_content
                    };
                     
                    var reply_id;
                     
                    //ajax 호출 (여기에 댓글을 저장하는 로직을 개발)
                    /*
                    $.ajax({
                        url         :   "/board/reply/save",
                        dataType    :   "json",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :   "post",
                        async       :   false, //동기: false, 비동기: ture
                        data        :   objParams,
                        success     :   function(retVal){
 
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                            }else{
                                reply_id = retVal.reply_id;
                            }
                             
                        },
                        error       :   function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    */
                    
                    
                    reply_id = reply_count++;//DB에 저장했다 하고 순번을 생성
                    
                    var reply_area = $("#reply_area");
                     
                    var reply = 
                        '<tr reply_type="main">'+
                        '   <td width="820px">'+
                        reply_content+
                        '   </td>'+
                        '   <td width="100px">'+
                        $("#reply_writer").val()+
                        '   </td>'+
                        '   <td width="100px">'+
                        '       <input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="패스워드"/>'+
                        '   </td>'+
                        '   <td align="center">'+
                        '       <button name="reply_reply" reply_id = "'+reply_id+'">댓글</button>'+
                        '       <button name="reply_modify" r_type = "main" reply_id = "'+reply_id+'">수정</button>      '+
                        '       <button name="reply_del" reply_id = "'+reply_id+'">삭제</button>      '+
                        '   </td>'+
                        '</tr>';
                         
                     if($('#reply_area').contents().size()==0){
                         $('#reply_area').append(reply);
                     }else{
                         $('#reply_area tr:last').after(reply);
                     }
 
                    //댓글 초기화
                    $("#reply_writer").val("");
                    $("#reply_password").val("");
                    $("#reply_content").val("");
                     
                });
                 
                //댓글 삭제
                $(document).on("click","button[name='reply_del']", function(){
                     
                    var check = false;
                    var reply_id = $(this).attr("reply_id");
                    var reply_password = "reply_password_"+reply_id;
                     
                    if($("#"+reply_password).val().trim() == ""){
                        alert("패스워드을 입력하세요.");
                        $("#"+reply_password).focus();
                        return false;
                    }
                     
                    //패스워드와 아이디를 넘겨 삭제를 한다.
                    //값 셋팅
                    var objParams = {
                            reply_password  : $("#"+reply_password).val(),
                            reply_id        : reply_id
                    };
                     
                    //ajax 호출
                    /*
                    $.ajax({
                        url         :   "/board/reply/del",
                        dataType    :   "json",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :   "post",
                        async       :   false, //동기: false, 비동기: ture
                        data        :   objParams,
                        success     :   function(retVal){
 
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                            }else{
                                 
                                check = true;
                                                                 
                            }
                             
                        },
                        error       :   function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    */
                    
                    check = true;//삭제 되면 체크값을 true로 변경
                     
                    if(check){
                        //삭제하면서 하위 댓글도 삭제
                        var prevTr = $(this).parent().parent().next(); //댓글의 다음
                         
                        while(prevTr.attr("reply_type")=="sub"){//댓글의 다음이 sub면 계속 넘어감
                            prevTr = prevTr.next();
                            prevTr.prev().remove();
                        }
                         
                        //마지막 리플 처리
                        if(prevTr.attr("reply_type") == undefined){
                            prevTr = $(this).parent().parent();
                            prevTr.remove();
                        }
                         
                        $(this).parent().parent().remove(); 
                    }
                     
                });
                
                //댓글 수정 입력
                $(document).on("click","button[name='reply_modify']", function(){
                	
                    var check = false;
                    var reply_id = $(this).attr("reply_id");
                    var r_type = $(this).attr("r_type");
                    var reply_password = "reply_password_"+reply_id;
                     
                    if($("#"+reply_password).val().trim() == ""){
                        alert("패스워드을 입력하세요.");
                        $("#"+reply_password).focus();
                        return false;
                    }
                     
                    //패스워드와 아이디를 넘겨 패스워드 확인
                    //값 셋팅
                    var objParams = {
                            reply_password  : $("#"+reply_password).val(),
                            reply_id        : reply_id
                    };
                     
                    //ajax 호출
                    /*
                    $.ajax({
                        url         :   "/board/reply/check",
                        dataType    :   "json",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :   "post",
                        async       :   false, //동기: false, 비동기: ture
                        data        :   objParams,
                        success     :   function(retVal){
 
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                            }else{
                                 
                                check = true;
                                                                 
                            }
                             
                        },
                        error       :   function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    */
                    
                    check = true;//패스워드가 맞으면 체크값을 true로 변경
                    
                    if(status){
                		alert("수정과 대댓글은 동시에 불가합니다.");
                		return false;
                	}
                	
                	status = true;
                    
                    if(check){
                    	//자기 위에 댓글 수정창 입력하고 기존값을 채우고 자기 자신 삭제
                    	var txt_reply_content = $(this).parent().prev().prev().prev().html().trim(); //댓글내용 가져오기
                    	if(r_type=="sub"){
                    		txt_reply_content = txt_reply_content.replace("→ ","");//대댓글의 뎁스표시(화살표) 없애기
                    	}
                    	
                    	var txt_reply_writer = $(this).parent().prev().prev().html().trim(); //댓글작성자 가져오기
                    	
                    	//입력받는 창 등록
                        var replyEditor = 
                           '<tr id="reply_add" class="reply_modify">'+
                           '   <td width="820px">'+
                           '       <textarea name="reply_modify_content_'+reply_id+'" id="reply_modify_content_'+reply_id+'" rows="3" cols="50">'+txt_reply_content+'</textarea>'+ //기존 내용 넣기
                           '   </td>'+
                           '   <td width="100px">'+
                           '       <input type="text" name="reply_modify_writer_'+reply_id+'" id="reply_modify_writer_'+reply_id+'" style="width:100%;" maxlength="10" placeholder="작성자" value="'+txt_reply_writer+'"/>'+ //기존 작성자 넣기
                           '   </td>'+
                           '   <td width="100px">'+
                           '       <input type="password" name="reply_modify_password_'+reply_id+'" id="reply_modify_password_'+reply_id+'" style="width:100%;" maxlength="10" placeholder="패스워드"/>'+
                           '   </td>'+
                           '   <td align="center">'+
                           '       <button name="reply_modify_save" r_type = "'+r_type+'" reply_id="'+reply_id+'">등록</button>'+
                           '       <button name="reply_modify_cancel" r_type = "'+r_type+'" r_content = "'+txt_reply_content+'" r_writer = "'+txt_reply_writer+'" reply_id="'+reply_id+'">취소</button>'+
                           '   </td>'+
                           '</tr>';
                        var prevTr = $(this).parent().parent();
                       	//자기 위에 붙이기
                        prevTr.after(replyEditor);
                        
                        //자기 자신 삭제
                        $(this).parent().parent().remove(); 
                    }
                     
                });
                //댓글 수정 취소
                $(document).on("click","button[name='reply_modify_cancel']", function(){
                	//원래 데이터를 가져온다.
                	var r_type = $(this).attr("r_type");
                	var r_content = $(this).attr("r_content");
                	var r_writer = $(this).attr("r_writer");
                	var reply_id = $(this).attr("reply_id");
                	
                	var reply;
                	//자기 위에 기존 댓글 적고 
                	if(r_type=="main"){
                		reply = 
                            '<tr reply_type="main">'+
                            '   <td width="820px">'+
                            r_content+
                            '   </td>'+
                            '   <td width="100px">'+
                            r_writer+
                            '   </td>'+
                            '   <td width="100px">'+
                            '       <input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="패스워드"/>'+
                            '   </td>'+
                            '   <td align="center">'+
                            '       <button name="reply_reply" reply_id = "'+reply_id+'">댓글</button>'+
                            '       <button name="reply_modify" r_type = "main" reply_id = "'+reply_id+'">수정</button>      '+
                            '       <button name="reply_del" reply_id = "'+reply_id+'">삭제</button>      '+
                            '   </td>'+
                            '</tr>';
                	}else{
                		reply = 
                            '<tr reply_type="sub">'+
                            '   <td width="820px"> → '+
                            r_content+
                            '   </td>'+
                            '   <td width="100px">'+
                            r_writer+
                            '   </td>'+
                            '   <td width="100px">'+
                            '       <input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="패스워드"/>'+
                            '   </td>'+
                            '   <td align="center">'+
                            '       <button name="reply_modify" r_type = "sub" reply_id = "'+reply_id+'">수정</button>'+
                            '       <button name="reply_del" reply_id = "'+reply_id+'">삭제</button>'+
                            '   </td>'+
                            '</tr>';
                	}
                	
                	var prevTr = $(this).parent().parent();
                   	//자기 위에 붙이기
                    prevTr.after(reply);
                   	
                  	//자기 자신 삭제
                    $(this).parent().parent().remove(); 
                  	
                    status = false;
                	
                });
                
              	//댓글 수정 저장
                $(document).on("click","button[name='reply_modify_save']", function(){
                	
                	var reply_id = $(this).attr("reply_id");
                	
                	//널 체크
                    if($("#reply_modify_writer_"+reply_id).val().trim() == ""){
                        alert("이름을 입력하세요.");
                        $("#reply_modify_writer_"+reply_id).focus();
                        return false;
                    }
                     
                    if($("#reply_modify_password_"+reply_id).val().trim() == ""){
                        alert("패스워드를 입력하세요.");
                        $("#reply_modify_password_"+reply_id).focus();
                        return false;
                    }
                     
                    if($("#reply_modify_content_"+reply_id).val().trim() == ""){
                        alert("내용을 입력하세요.");
                        $("#reply_modify_content_"+reply_id).focus();
                        return false;
                    }
                	//DB에 업데이트 하고
                	//ajax 호출 (여기에 댓글을 저장하는 로직을 개발)
                	var reply_content = $("#reply_modify_content_"+reply_id).val().replace("\n", "<br>"); //개행처리
                    
                	var r_type = $(this).attr("r_type");
                	
                	var parent_id;
                	var depth;
                	if(r_type=="main"){
                		parent_id = "0";
                		depth = "0";
                	}else{
                		parent_id = $(this).attr("reply_id");
                		depth = "1";
                	}
                	
                    //값 셋팅
                    var objParams = {
                            board_id        : $("#board_id").val(),
                            parent_id       : parent_id, 
                            depth           : depth,
                            reply_writer    : $("#reply_modify_writer_"+reply_id).val(),
                            reply_password  : $("#reply_modify_password_"+reply_id).val(),
                            reply_content   : reply_content
                    };
                    /*
                    $.ajax({
                        url         :   "/board/reply/update",
                        dataType    :   "json",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :   "post",
                        async       :   false, //동기: false, 비동기: ture
                        data        :   objParams,
                        success     :   function(retVal){
 
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                            }else{
                                reply_id = retVal.reply_id;
                            }
                             
                        },
                        error       :   function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    */
                	//수정된댓글 내용을 적고
                    if(r_type=="main"){
                		reply = 
                            '<tr reply_type="main">'+
                            '   <td width="820px">'+
                            $("#reply_modify_content_"+reply_id).val()+
                            '   </td>'+
                            '   <td width="100px">'+
                            $("#reply_modify_writer_"+reply_id).val()+
                            '   </td>'+
                            '   <td width="100px">'+
                            '       <input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="패스워드"/>'+
                            '   </td>'+
                            '   <td align="center">'+
                            '       <button name="reply_reply" reply_id = "'+reply_id+'">댓글</button>'+
                            '       <button name="reply_modify" r_type = "main" reply_id = "'+reply_id+'">수정</button>      '+
                            '       <button name="reply_del" reply_id = "'+reply_id+'">삭제</button>      '+
                            '   </td>'+
                            '</tr>';
                	}else{
                		reply = 
                            '<tr reply_type="sub">'+
                            '   <td width="820px"> → '+
                            $("#reply_modify_content_"+reply_id).val()+
                            '   </td>'+
                            '   <td width="100px">'+
                            $("#reply_modify_writer_"+reply_id).val()+
                            '   </td>'+
                            '   <td width="100px">'+
                            '       <input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="패스워드"/>'+
                            '   </td>'+
                            '   <td align="center">'+
                            '       <button name="reply_modify" r_type = "sub" reply_id = "'+reply_id+'">수정</button>'+
                            '       <button name="reply_del" reply_id = "'+reply_id+'">삭제</button>'+
                            '   </td>'+
                            '</tr>';
                	}
                    
                    var prevTr = $(this).parent().parent();
                   	//자기 위에 붙이기
                    prevTr.after(reply);
                   	
                  	//자기 자신 삭제
                    $(this).parent().parent().remove(); 
                  	
                    status = false;
                	
                });
                 
                //대댓글 입력창
                $(document).on("click","button[name='reply_reply']",function(){ //동적 이벤트
                	
                	if(status){
                		alert("수정과 대댓글은 동시에 불가합니다.");
                		return false;
                	}
                	
                	status = true;
                     
                    $("#reply_add").remove();
                     
                    var reply_id = $(this).attr("reply_id");
                    var last_check = false;//마지막 tr 체크
                     
                    //입력받는 창 등록
                    var replyEditor = 
                       '<tr id="reply_add" class="reply_reply">'+
                       '   <td width="820px">'+
                       '       <textarea name="reply_reply_content" rows="3" cols="50"></textarea>'+
                       '   </td>'+
                       '   <td width="100px">'+
                       '       <input type="text" name="reply_reply_writer" style="width:100%;" maxlength="10" placeholder="작성자"/>'+
                       '   </td>'+
                       '   <td width="100px">'+
                       '       <input type="password" name="reply_reply_password" style="width:100%;" maxlength="10" placeholder="패스워드"/>'+
                       '   </td>'+
                       '   <td align="center">'+
                       '       <button name="reply_reply_save" reply_id="'+reply_id+'">등록</button>'+
                       '       <button name="reply_reply_cancel">취소</button>'+
                       '   </td>'+
                       '</tr>';
                         
                    var prevTr = $(this).parent().parent().next();
                     
                    //부모의 부모 다음이 sub이면 마지막 sub 뒤에 붙인다.
                    //마지막 리플 처리
                    if(prevTr.attr("reply_type") == undefined){
                        prevTr = $(this).parent().parent();
                    }else{
                        while(prevTr.attr("reply_type")=="sub"){//댓글의 다음이 sub면 계속 넘어감
                            prevTr = prevTr.next();
                        }
                         
                        if(prevTr.attr("reply_type") == undefined){//next뒤에 tr이 없다면 마지막이라는 표시를 해주자
                            last_check = true;
                        }else{
                            prevTr = prevTr.prev();
                        }
                         
                    }
                     
                    if(last_check){//마지막이라면 제일 마지막 tr 뒤에 댓글 입력을 붙인다.
                        $('#reply_area tr:last').after(replyEditor);    
                    }else{
                        prevTr.after(replyEditor);
                    }
                     
                });
                 
                //대댓글 등록
                $(document).on("click","button[name='reply_reply_save']",function(){
                                         
                    var reply_reply_writer = $("input[name='reply_reply_writer']");
                    var reply_reply_password = $("input[name='reply_reply_password']");
                    var reply_reply_content = $("textarea[name='reply_reply_content']");
                    var reply_reply_content_val = reply_reply_content.val().replace("\n", "<br>"); //개행처리
                     
                    //널 검사
                    if(reply_reply_writer.val().trim() == ""){
                        alert("이름을 입력하세요.");
                        reply_reply_writer.focus();
                        return false;
                    }
                     
                    if(reply_reply_password.val().trim() == ""){
                        alert("패스워드를 입력하세요.");
                        reply_reply_password.focus();
                        return false;
                    }
                     
                    if(reply_reply_content.val().trim() == ""){
                        alert("내용을 입력하세요.");
                        reply_reply_content.focus();
                        return false;
                    }
                     
                    //값 셋팅
                    var objParams = {
                            board_id        : $("#board_id").val(),
                            parent_id       : $(this).attr("reply_id"), 
                            depth           : "1",
                            reply_writer    : reply_reply_writer.val(),
                            reply_password  : reply_reply_password.val(),
                            reply_content   : reply_reply_content_val
                    };
                     
                    var reply_id;
                     
                    //ajax 호출
                    /*
                    $.ajax({
                        url         :   "/board/reply/save",
                        dataType    :   "json",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :   "post",
                        async       :   false, //동기: false, 비동기: ture
                        data        :   objParams,
                        success     :   function(retVal){
 
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                            }else{
                                reply_id = retVal.reply_id;
                            }
                             
                        },
                        error       :   function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    */
                    
                    reply_id = reply_count++;//DB에 저장했다 하고 순번을 생성
                     
                    var reply = 
                        '<tr reply_type="sub">'+
                        '   <td width="820px"> → '+
                        reply_reply_content_val+
                        '   </td>'+
                        '   <td width="100px">'+
                        reply_reply_writer.val()+
                        '   </td>'+
                        '   <td width="100px">'+
                        '       <input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="패스워드"/>'+
                        '   </td>'+
                        '   <td align="center">'+
                        '       <button name="reply_modify" r_type = "sub" reply_id = "'+reply_id+'">수정</button>'+
                        '       <button name="reply_del" reply_id = "'+reply_id+'">삭제</button>'+
                        '   </td>'+
                        '</tr>';
                         
                    var prevTr = $(this).parent().parent().prev();
                     
                    prevTr.after(reply);
                                         
                    $("#reply_add").remove();
                    
                    status = false;
                     
                });
                 
                //대댓글 입력창 취소
                $(document).on("click","button[name='reply_reply_cancel']",function(){
                    $("#reply_add").remove();
                    
                    status = false;
                });
                 
                //글수정
                $("#modify").click(function(){
                     
                    var password = $("input[name='password']");
                     
                    if(password.val().trim() == ""){
                        alert("패스워드를 입력하세요.");
                        password.focus();
                        return false;
                    }
                                         
                    //ajax로 패스워드 검수 후 수정 페이지로 포워딩
                    //값 셋팅
                    var objParams = {
                            id       : $("#board_id").val(),    
                            password : $("#password").val()
                    };
                                         
                    //ajax 호출
                   	alert("패스워드 체크하고 맞으면 수정페이지로 이동");
                    /*
                    $.ajax({
                        url         :   "/board/check",
                        dataType    :   "json",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :   "post",
                        async       :   false, //동기: false, 비동기: ture
                        data        :   objParams,
                        success     :   function(retVal){
 
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                            }else{
                                location.href = "/board/edit?id="+$("#board_id").val();
                            }
                             
                        },
                        error       :   function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    */
                     
                });
                 
                //글 삭제
                $("#delete").click(function(){
                     
                    var password = $("input[name='password']");
                     
                    if(password.val().trim() == ""){
                        alert("패스워드를 입력하세요.");
                        password.focus();
                        return false;
                    }
                     
                    //ajax로 패스워드 검수 후 수정 페이지로 포워딩
                    //값 셋팅
                    var objParams = {
                            id       : $("#board_id").val(),    
                            password : $("#password").val()
                    };
                    
                    alert("패스워드 체크하고 맞으면 게시글 삭제후 리스트 페이지 이동");
                    /*                 
                    //ajax 호출
                    $.ajax({
                        url         :   "/board/del",
                        dataType    :   "json",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :   "post",
                        async       :   false, //동기: false, 비동기: ture
                        data        :   objParams,
                        success     :   function(retVal){
 
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                            }else{
                                alert("삭제 되었습니다.");
                                location.href = "/board/list";
                            }
                             
                        },
                        error       :   function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    */
                     
                });
                 
            });
        </script>
      <%-- <jsp:include page="../common/footer.jsp"/> --%>
</body>
</html>