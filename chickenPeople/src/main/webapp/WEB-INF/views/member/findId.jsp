<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
    <head>
        <title>아이디 찾기!</title>
        <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
        <style>
            body{
                margin:0;
                padding:0;
                /* font-family:sans-serif; */
            }
            .loginbox{
                margin-top:500px;
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
            .loginbox h1{
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
   <jsp:include page="../common/header.jsp"/>
        <div class="loginbox">
            <img src="resources/images/avatar.png" class="avatar">
            <h1>아이디 찾기</h1>
            <form id="findId" method="get" action="findId.do">
                <p>Name</p>
                <input type="text" name="name" placeholder="이름을 입력하세요">
                <p>E-mail</p>
                <input type="text" name="email" placeholder="이메일을 입력하세요">
                <input type="submit"  value="이메일로 전송">
                <a href="loginView.do">치킨의민족 로그인</a><br>
                <a href="findPwdView.do">비밀번호 찾기</a><br>
                <a href="memberJoinView.do">치킨의민족 회원가입</a>
            </form>
        </div>
       <jsp:include page="../common/footer.jsp"/>
    </body>
</html>