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
             body{
                margin:0;
                padding:0;
                font-family:sans-serif;
            }
            .loginbox{
                margin-top:400px;
            	margin-bottom:-200px;
                width:600px;
                height:440px;
                background: black;
                color:#fff;
                top:50%;
                left:50%;
                position:relative;
                transform:translate(-50%, -50%);
                box-sizing: border-box;
                padding:70px 30px;
            }
            .avatar{
                width: 100px;
                height: 100px;
                border-radius: 50%;
                position:absolute;
                top:-50px;
                left: calc(50% - 50px);
            }
            #title{
                margin:0;
                padding:0 0 20px;
                text-align: center;
            }
              .loginbox p{
                margin:0;
                padding:0;
                font-weight:bold;
            }
             .loginbox input{
                width: 100%;
                margin-bottom: 20px;
            }
              #memberJoin{
                border-bottom: 1px solid #fff;
                background: transparent;
                outline: none;
                height: 40px;
                color: #fff;
                font-size: 16px;
            }
            .loginbox input[type="text"], input[type="password"]{
                border:none;
                border-bottom: 1px solid #fff;
                background: transparent;
                outline: none;
                height: 40px;
                color: #fff;
                font-size: 16px;
            }
            .loginbox input[type="submit"]{
                border: none;
                outline:none;
                height: 40px;
                background: #2ac1bc;
                color:#fff;
                font-size: 24px;
                border-radius: 20px;
                font-weight: bold;
            }
              .loginbox input[type="submit"]:hover{
                cursor: pointer;
                background: #ffc107;
                color:#000;
            }
             .loginbox a{
                text-decoration: none;
                font-size: 12px;
                line-height: 20px;
                color: darkgrey;
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
        <div class="loginbox">
            <img src="resources/images/avatar.png" class="avatar">
            <h1 id="title">치킨의민족 로그인</h1>
            <form id="loginform" method="post" action="doLoginView.do">
                <p>ID</p>
                <input type="text" name="id" placeholder="아이디를 입력하세요">
                <p>Password</p>
                <input type="password" name="pwd" placeholder="비밀번호를 입력하세요">
                <input type="submit" name="" value="로그인">
                <a href="memberJoinView.do">치킨의민족 회원가입</a><br>
                <a href="findIdView.do">아이디 찾기</a><br>
                <a href="findPwdView.do">비밀번호 찾기</a>
                
                  </form>
        </div>
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
    
    $("#home").on("click",function(){
        location.href="home.do";
    })
</script>

</html>