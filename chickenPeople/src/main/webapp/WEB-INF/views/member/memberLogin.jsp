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
                color:  lightgray;
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
            
            
    </style>
</head>
<body>
<%@ include file="../common/header.jsp"%>
	<c:if test="${empty sessionScope.loginUser }">
	<form id="loginform" action="doLogin.do" method="post">
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
                
                <label style="float: right;">비밀번호찾기</label>
                <label style="float: right; text-decoration: none">아이디찾기 /&nbsp;</label>
                
            </div>
            <br>
            <hr>
            <br>
            <input type="button" id="memberJoin" value="회원가입">
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
<
</html>