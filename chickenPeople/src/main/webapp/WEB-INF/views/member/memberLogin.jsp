<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
        <style>
            
            #h2{
                text-align: center;
            }
            #logintable{
                width: 600px;
                /* text-align: center; */
            }
           .p{
				    vertical-align: middle;
            }
            a{
                text-decoration:none;
                color: black;
            }
            input::-webkit-input-placeholder { 
                color: lightgray; 
            }
            #div1{
                padding: 20px; 
                font-size: 25px; 
                background: lightgray; 
                margin: 0 auto; 
                text-align: center;
            }
            .log1{
                height: 30px;
                width: 400px; 
                border-radius: 8px;
            }
            #btn{
                height: 100px; 
                width: 180px; 
                color: white; 
                font-size: 25px; 
                border-radius: 8px; 
                background: #2ac1bc;
                font-weight: bold;
                border:none;
            }
            #check1{
                float: left;
            }
            
            #idsave{
                color: lightgray;
                float:left
            }
            
            #memberJoin{
                background: #2ac1bc; 
                color: white; 
                width: 600px; 
                text-align: center; 
                height: 80px; 
                border-radius: 8px; 
                font-size: 30px;
                font-weight: bold;
            }
            
            
            #loginform{
				width: 600px;
				margin: 0 auto;
				margin-top: 200px;
				/* border: 1px solid black; */
				text-align: center;
            }
            #memberJoin{
            	border:none;
            }
            
            #showMsg{
            position:fixed; top:200px; left:35%; width: 30%; height: 200px; z-index:100; border:3px solid black; background-color:white; text-align:center; border-radius:10px;
            }
            #showMsg .msg{font-size:30px; font-weight:600; margin-top:15px;}
            #showMsg img{
            width:30px; height:30px; margin-left:95%;
            }
            #showMsg input{
            width:120px; height:60px; background-color:#735949; border:0px; font-size:20px; color:white; font-weight:600; border-radius:10px;
            }
     		#showMsg #home{
     		margin-right:150px;
     		}
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
	<c:if test="${!empty msg }">
		<div id="showMsg">
			<img src="resources/images/close.png" id="cancel">
			<p class="msg">${msg }</p>
			<input type="button" id="home" value="홈으로">
			<input type="button" id="join" value="회원가입">
		</div>
	</c:if>
	<c:if test="${empty sessionScope.loginUser }">
	<form id="loginform" action="doLoginView.do" method="post">
            <h1 id="h2">회원 로그인</h1>
            <hr>
            <br>
            <table id="logintable">
                <tr class="p">
                    <td class = "p">
                        <input type="text" class="log1" name="id" id="id" placeholder="아이디를 입력해주세요">
                    </td>
                    <td rowspan="2">
                        <input type="submit" id="btn" value="LOGIN">
                    </td>
                    
                </tr>
                <tr>
                    <td>
                        <input type="password" class="log1" name="pwd" id="pwd" placeholder="비밀번호를 입력해주세요">
                    </td>
                </tr>
            </table>
            <div>
                <input type="checkbox" id="check1">
                <label id="idsave">아이디 저장</label>
                
                <a href="findPwdView.do" style="float: right;">비밀번호찾기 </a>
                <a href="findIdView.do" style="float: right; text-decoration: none">아이디찾기/&nbsp; </a>
                
            </div>
            <br>
            <hr>
            <br>
            <input type="button" id="memberJoin" value="회원가입" onclick="location.href='memberJoinView.do'">
            
            <br>
            <br>
            <hr>
            <br>
            <div style="text-align: center;">
            	<label style="color:lightgray;">노력은 가상하나</label><br>
                <label style="color:lightgray;">시작도 전에 포기</label>
                <br>
                <br>
                <br>
                <br>
                <label style="color:lightgray;">카카오 아이디 로그인</label>
                	
            </div>

        </form>
        </c:if>
	<%@ include file="../common/footer.jsp"%>
</body>

<script>

	$("#cancel").on("click",function(){
	    $("#showMsg").css('display','none');
	})
	
	$("#join").on("click",function(){
        location.href="memberJoinView.do";
    })
</script>

</html>