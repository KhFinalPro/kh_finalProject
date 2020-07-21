<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
    <head>
        <title>비밀번호 찾기!</title>
        <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
        <style>
            body{
                margin:0;
                padding:0;
                font-family:sans-serif;
            }
            .loginbox{
                width:600px;
                height:420px;
                background: black;
                color:#fff;
                top:50%;
                left:50%;
                position:absolute;
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
            h1{
                margin:0;
                padding:0 0 20px;
                text-align: center;
                font-size: 22px;
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
        </style>
    </head>
    <body>
   <%--  <jsp:include page="../common/header.jsp"/> --%>
        <div class="loginbox">
            <img src="resources/images/avatar.png" class="avatar">
            <h1>비밀번호를 잊어버렸니?</h1>
            <form id="findPwd" method="post" action="findPwdView.do">
                <p>아이디를 써라!</p>
                <input type="text" name="" placeholder="아이디를 입력하여라">
                <p>이메일을 써라!</p>
                <input type="password" name="" placeholder="이메일을 입력하여라">
                <input type="submit" name="" value="비밀번호 보내주세요">
                <a href="findIdView.do">아이디를 까먹었니?</a><br>
                <a href="memberJoinView.do">치민이 처음이니?</a>
            </form>
        </div>
       <%-- <%@ include file="../common/footer.jsp"%> --%>
    </body>
</html>