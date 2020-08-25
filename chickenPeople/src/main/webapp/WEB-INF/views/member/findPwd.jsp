<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
    <head>
        <title>비밀번호 찾기!</title>
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
                background: white;
                color:darkgray;
                top:50%;
                left:50%;
                position:relative;
                transform:translate(-50%, -50%);
                box-sizing: border-box;
                padding:70px 30px;
                border: 2px solid lightgray;
    			border-radius: 20px;
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
            #submit_box{
            	margin:auto;
            	width:50%;
            	text-align:center;
            }
             .loginbox input{
                width: 100%;
                margin-bottom: 20px;
    			width: 100%;
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
                border-bottom: 1px solid lightgray;
                background: transparent;
                outline: none;
                height: 40px;
                color: black;
                font-size: 16px;
                box-shadow: 0px 0px;
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
            width:120px; height:60px; background-color:#735949; border:0px; font-size:20px; color:black; font-weight:600; border-radius:10px;
            }
     		#showMsg #home{
     		margin-right:150px;
     		}
        </style>
    </head>
    <body>
   <jsp:include page="../common/header.jsp"/>
        <div class="loginbox">
            <img src="resources/images/avatar1.png" class="avatar">
            <h1 id="title">비밀번호 찾기</h1>
            <form id="findPwd" method="get" action="findPwd.do">
                <p>ID</p>
                <input type="text" name="id" placeholder="아이디를 입력하세요">
                <p>E-mail</p>
                <input type="text" name="email" placeholder="이메일을 입력하세요">
                <div id="submit_box">
                	<input type="submit" value="이메일로 전송">
                </div>
                <a href="loginView.do">치킨의민족 로그인</a><br>
                <a href="findIdView.do">아이디 찾기</a><br>
                <a href="memberJoinView.do">치킨의민족 회원가입</a>
            </form>
        </div>
       <jsp:include page="../common/footer.jsp"/>
    </body>
</html>