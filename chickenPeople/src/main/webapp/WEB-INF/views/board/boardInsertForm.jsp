<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        #slider4{
            white-space: nowrap;
        }
        .slide-img{
            background: #ccc;
            height: 100px;
            display: inline-block;
            width: 100px;
        }
			
        .button {
            width: 140px;
            height: 45px;
            font-family: 'Roboto', sans-serif;
            font-size: 11px;
            text-transform: uppercase;
            letter-spacing: 2.5px;
            font-weight: 500;
            color: #000;
            background-color: #fff;
            border: none;
            border-radius: 45px;
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease 0s;
            cursor: pointer;
            outline: none;
        }
		
		.button:hover {
		  background-color: #2ac1bc;
		  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
		  color: #fff;
		  transform: translateY(-7px);
		} 
	
		#section{margin: 0 auto; width:80%; text-align: center; margin-top:150px;}
		#section h1{height: 100px; line-height: 100px; font-size:60px; box-shadow: 0px 5px 5px rgb(226, 226, 226); color: #735949;}
        #bContents{margin: 0 auto; width: 100%; text-align: center;}

        #titleDiv #title{font-size: 30px; margin-top: 10px;}
        #bTitle{height: 40px; font-size: 20px; width: 500px;}
        #bCate{height: 45px;}

        .btn{width:150px; height: 50px; font-size: 20px; font-weight:600; color:#2ac1bc; background-color: white; border-radius: 10px; border: 2px solid black;}
	</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>

	<!--  enctype="Multipart/form-data"  파일 쓸때 사용-->
	<div id="section">
        <h1 align="center">맛잘알 작성하기</h1>
        
        <form action="bInsert.do" method="post" enctype="multipart/form-data">
            <!-- <div class="wrapper" style="margin:auto">   
                <div id="slider4" class="text-center">
                    
                </div> 
            </div>  -->
            <br>

            <!-- 	<input type="text" name="bWriter" value="${loginUser.id }">
                <input type="text" name="bCate" value="레시피"> -->
            
            <div id="titleDiv">
            

                <a id="title">제목 : </a>
                <input type="text" id="bTitle" name="bTitle" size="60" required>


                
                <select name="bCate" id="bCate">
                    <option value="레시피">레시피</option>
                    <option value="꿀팁">꿀팁</option>
                </select>
                
                
            
            </div>
            <div id="bContents">
            </div>
            
            <br>
            <div align="center">
                <button type="button" class="btn" onclick="addContent()">내용추가</button>
                <button type="button" class="btn" onclick="removeTable()">마지막꺼 삭제</button>
                <input type="submit" class="btn" value="등록하기">&nbsp;
                <!-- <a href="blist.do">목록으로</a> -->
            </div>
        </form>
    </div>

	
</body>

<script>
	function goHome(){
		location.href="home.do";
	}
	
	function toBlist(){
		location.href="boardList.do";
	}
	
	// 포스팅을 추가할 때마다 증가 할 전역변수
	num = 0;
	// 포스팅 관련 table 태그를 id가 contentDiv인 div로 추가 
	function addContent(){
		$content =  
                    "<div id='j" + num + "' class='i" + num + "' style=' width:100%; margin-top:20px;' onclick='clickFile(this)'><p style='font-size:25px; color:#2CBFB1;'>클릭해서 이미지를 추가해주세요.</p><br>"+
                        // "<img name='i" + num + "' style='height:250px;width:80%;'>" +
                        "<img name='i" + num + "'>" +
                    "</div>" +
                    
                    "<input type='file' class='j" + num + "' name='fileName' onchange='LoadImg(this, " + num + ")'><br>" +

                    "<textarea class='i" + num + "' cols='130' rows='5' name='bContent' style='margin-top:20px;'>"+ num +"chapter</textarea>";
		$("#bContents").append($content);
		
	// 이미지 슬라이더인 id가 slider4인 div에 사진을 포함한 div를 추가
		// $imageContent = "<div class='i" + num + "' align='center' class='slide-img' style='background: #ccc; height: 100px;" +
	    // "display: inline-block; width: 100px;' >"+
		// "<img name='i" + num + "' style='height:100px;width:100px;background-size:cover;'>" +
		// "</div>";
		
		// $("#slider4").append($imageContent);
		
		// 포스팅 번호 증
        num++;
        console.log(num);
	}
	
	// div를 누르면 id와 같은 클래스명을 지니는 input file태그를 클릭 
	function clickFile(obj){
        var iden = "." + obj.id;
        console.log(iden);
        $(iden).click();
	}
	
	// input file태그가 변하면 같은 포스팅의 img 태그의 src를 바꿈으로써 이미지를 변환
	function LoadImg(value, num) {
		var iden = "img[name=i" + num + "]";
		if (value.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
					$(iden).attr("src", e.target.result);
			}
			reader.readAsDataURL(value.files[0]);
		}
	}
	
	// 마지막에 추가 된 포스팅 테이블을 없애고 전역변수 num을 줄임
	function removeTable(){
		var dimNum = --num;			// 내용 추가 후 num가 증가했으므로 마지막 미리보기 사진이나 내용 table은 num(전역변수)을 하나 줄임 
		
		var idenD = ".i"+(dimNum);	// id가 i+num인 div
        var jdenD = ".j"+(dimNum);
        var deleteDiv = $(idenD);
        var deleteFile = $(jdenD);
        console.log(deleteDiv);
        deleteDiv.remove();
        deleteFile.remove();
	}
</script>
</html>