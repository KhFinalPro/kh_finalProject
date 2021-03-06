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
        <div class="loginbox">
            <img src="avatar.png" class="avatar">
            <h1>아이디를 잊어버렸니?</h1>
            <form>
                <p>이름을 써라!</p>
                <input type="text" name="" placeholder="이름을 입력하여라">
                <p>이메일을 써라!</p>
                <input type="password" name="" placeholder="이메일을 입력하여라">
                <input type="submit" name="" value="아이디 보내주세요">
                <a href="#">비밀번호를 까먹었니?</a><br>
                <a href="#">치민이 처음이니?</a>
            </form>
        </div>
    </body>
</html>