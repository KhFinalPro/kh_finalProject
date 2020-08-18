<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	/* body, hmtl{background: #ecf0f1;} */
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
	  background:#2CBFB1;
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
	    width: 100%;
	    border-top: 1px solid #2CBFB1;
	    border-collapse: collapse;
		  }
	  th, td {
	    border-bottom: 1px solid #2CBFB1;
	    padding: 10px;
	  }
	  
	 
	#section{margin: 0 auto; width: 90%; margin-top:100px;}
	#section h1{height: 100px; line-height: 100px; font-size:60px; box-shadow: 0px 5px 5px rgb(226, 226, 226); color: #735949;}
	#boardList_area{height:700px;}
	#main_section .mja_area {border-radius: 10px; display: inline-block; background-color:white; margin: 0; margin-bottom: 10px; width: 49.4%; height: 230px; border: 1px solid #735949;}
    #main_section .mja_area:hover{border:1px solid #2ac1bc; cursor:pointer;}
    #main_section .mja_area>.mja_logo {text-align:center; width: 30%; height: 90%; margin-left:30px;}
    #main_section .mja_area>.mja_logo>img {width: 100%; height: 100%;}
    #main_section .mja_area>.first_line {float: left; height: 90%;margin-top: 10px;}
    #main_section .mja_area>.mja_title {width: 60%; margin-left: 20px; margin-top: 15px; text-align: center;}
	
	#btn_area{margin: auto; width: 90%; text-align: right;}
	#btn_area .wbutton{width: 200px; height: 50px; font-size:25px; font-weight:600; background-color:white; border:1px solid black; border-radius: 15px;}
	#btn_area .wbutton:hover{color: #735949;; border: 1px solid #735949; cursor:pointer;}
	
	  /* 페이징 처리 */
	.p-parents { display: flex; flex-direction: column; justify-content: center; align-items: center; margin: 0 auto; }
    .pppp { display: flex; text-align: center; margin : 50px auto; background: rgb(255, 255, 255); height: 36px; border : 1px solid black; border-radius: 5px; justify-content: center; align-items: center; }
    .pppp > ol > li:first-child { border-left : 1px solid black; }
    .pppp > a { display: inline-flex; justify-content: center; align-items: center; padding: 7px 12px; font-size: 13px; font-weight: 500; color:#9c9c9c; text-decoration: none; }
    .pppp > ol { display: inline-flex; list-style: none; justify-content: center; align-items: center; padding:0px;}
    .pppp > ol > li { display: inline-flex; list-style: none; justify-content: center; align-items: center;  border-right: 1px solid; vertical-align: middle; list-style: none; width: 36px; height: 34px; text-decoration: none; }
    .page-list1 { background-color:#1AAB8A; }
    .page-cur {width:100%; height:100%; font-size : 14px; background:none; color: white; padding : 0; border-style : none; }
    .page-nocur {width:100%; height:100%; font-size: 14px; background:none; color: rgb(46,78,178); padding : 0; border-style : none; }
    .page-a:hover { color: black; text-decoration:none; }
    
</style>

<body>
	<jsp:include page="../common/header.jsp"/>
  	<br clear="both">
	<div id="section">

		<div id="main_section">
		  

		<!-- <h1 align="center">맛잘알 리뷰</h1> -->

		  
		  	<c:if test="${empty loginUser }">
			 	회원가입이 필요한 서비스 입니다.
			</c:if>
			<div id="btn_area">
				<c:if test ="${!empty loginUser }">
		  			<button class="wbutton" onclick ="bWrite()">글쓰기</button>
			  	</c:if>			  
			</div> <!-- [bWrite/goHome]button end-->
			<br clear="both">  
		
			<div id="boardList_area">
				<c:forEach var="b" items="${boardList }">
					<c:if test="${b.bStatus =='Y' }">
						<div class="mja_area" style="background-color:lightgray;">
		                <input type="hidden" id="bNum" name="bNum" value="${b.bNum }"/> <!--게시판 번호-->
		                <div class="mja_logo first_line">
		                    <img src="resources/buploadFiles/${b.bThumbnail }" alt="logo">  <!--썸네일-->
		                </div>
		                <div class="first_line mja_title">
		                    <h2 style="color: #735949;">${b.bTitle }(삭제된 게시물)</h2>
		                    <h3>조회수 : ${b.bCount }</h3>
		                    <h3>추천수 : ${b.bHit }</h3>
		                    <h3 style="font-size:15px; font-weight:400;">등록 날짜 : ${b.bDate }</h3>
		                </div>
		                <br clear="both">
		            </div>
					</c:if>
					<c:if test="${b.bStatus =='N' }">
						<div class="mja_area">
		                <input type="hidden" id="bNum" name="bNum" value="${b.bNum }"/> <!--게시판 번호-->
		                <div class="mja_logo first_line">
		                    <img src="resources/buploadFiles/${b.bThumbnail }" alt="logo">  <!--썸네일-->
		                </div>
		                <div class="first_line mja_title">
		                    <h2 style="color: #735949;">${b.bTitle }</h2>
		                    <h3>조회수 : ${b.bCount }</h3>
		                    <h3>추천수 : ${b.bHit }</h3>
		                    <h3 style="font-size:15px; font-weight:400;">등록 날짜 : ${b.bDate }</h3>
		                </div>
		                <br clear="both">
		            </div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
    <jsp:include page="../common/footer.jsp"/>
</body>
<script>
	function goHome(){
		location.href="home.do";
	}
	
	function bWrite(){
		location.href="bInsertView.do"
	}

	$(function() {
		$(".mja_area").on("click",function(){
			var bNum = $(this).children("#bNum").val();
			location.href="bdetail.do?bNum="+bNum+"&mypageStatus=${mypageStatus}";
		})
		
	
	});
</script>
</html>