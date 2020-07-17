<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
    <head>
        <title></title>
        <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
        <style>
            #memberInfo{
                width: 700px;
                margin: 0 auto;
            }
            #memberInfoTable{
                margin: 0;
                padding:0;
                width: 700px;
                border-top: 1px solid #444444;
                border-collapse: collapse;
            }
            .ltd {
                border-bottom: 1px solid #444444;
                padding: 10px;
            }
            #lab{
                background-color: #2ac1bc;
                color: black;
                text-align: center;
                padding: 10px;   
            }
            #inp{
               padding: 10px;
               padding-left: 110px;
               padding-right: 100px;
            }
            tr td input{
                border-radius: 5px;
                height: 30px;
                width: 280px;
            }
            #checkAll{
               zoom: 2.0;
            }
           div select{
              height: 30px;
              border-radius: 5px;
              width: 80px;
              float: left;
              margin-left: 3px ;
           }
           #h2{
               margin-left: 20px;
           }
           #h3{
               float: left;
               margin-left: 20px;
           }
           #hh5{
               float:right;
               margin-bottom: 0;
               color: lightgray;
           }
           #agr{
               
               margin-left: 20px;
           }
           .container {
                width: 500px;
                height: 200px;
                overflow: auto;
                border: 1px solid black;
                border-radius: 10px;
            }
            .container::-webkit-scrollbar {
                width: 10px;
            }
            .container::-webkit-scrollbar-thumb {
                background-color: white;
                border-radius: 10px;
                background-clip: padding-box;
                border: 2px solid transparent;
            }
            .container::-webkit-scrollbar-track {
                background-color: black;
                border-radius: 10px;
                box-shadow: inset 0px 0px 5px white;
            }
            input::-webkit-input-placeholder { 
                color: lightgray; 
            }
        </style>
    </head>
    <body>
        <form id="memberInfo"> 
        <h2 id="h2">회원정보</h2>
        <table id="memberInfoTable">
            <tr>
                <td id="lab" class="ltd">
                    <label>아이디</label>
                </td>
                <td id="inp" class="ltd">
                    <input type="text" id="userId" name="userId" required placeholder="#" readonly>
                </td>
            </tr>
            <tr>
                <td id="lab" class="ltd">
                    <label>비밀번호</label>
                </td>
                <td id="inp" class="ltd"> 
                    <input type="password" id="userPwd" name="userPwd" required placeholder="#" readonly>
                </td>
            </tr>
            <tr>
                <td id="lab" class="ltd">
                    <label>이름</label>
                </td>
                <td id="inp" class="ltd">
                    <input type="text" id="userName" name="userName" required placeholder="#" readonly>
                </td>
            </tr>
            <tr>
                <td id="lab" class="ltd">
                    <label>이메일</label>
                </td>
                <td id="inp" class="ltd">
                    <input type="email" id="email" name="email" readonly>
                </td>
            </tr>
            <tr>
                <td id="lab" class="ltd">
                    <label>휴대폰</label>
                </td>
                <td id="inp" class="ltd">
                    <input type="tel" id="phone" name="phone" required placeholder="#" readonly>
                </td>
            </tr>
            <tr>
                <td id="lab" class="ltd">
                <label>우편번호</label>
                </td>
                <td td id="inp" class="ltd">
                    <input type="text" id="address" name ="reference"placeholder="#" readonly>
                </td>
            </tr>
            <tr>
                <td id="lab" class="ltd">
                    <label>도로명 주소</label>
                </td>
                <td id="inp" class="ltd">
                    <input type="text" id="reference" name="reference" readonly>
                </td>
            </tr>
            <tr>
                <td id="lab" class="ltd">
                    <label>상세 주소</label>
                </td>
                <td id="inp" class="ltd">
                    <input type="text" id="reference" name="reference" readonly>
                </td>
            </tr>
        </table>
    </form>
    <br>
    <div style="text-align: center;">
        <input type="button" value="수정하기" id="modify" style="width: 90px; height: 40px; color: white; background: #2ac1bc; border-radius: 7px;" onclick="check();">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" value="탈퇴하기" id="withdrawal" style="width: 90px; height: 40px; color: white; background: #2ac1bc; border-radius: 7px;" onclick="check();">
    </div>

    </body>
</html>