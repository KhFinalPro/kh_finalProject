<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		/* *{margin:0; padding:0; list-style:none;}
      	a{text-decoration:none; color:#666;} */
      	
		header{ position: fixed; top: 0px; left: 0px; width: 100%; margin: 0; padding: 0; z-index: 100;}
		#header{margin: auto; width: 100%; height: 70px; background-color: white; border-bottom: 2px solid #2ac1bc; padding-top:20px;}
		#header>div{ display: inline-block;}
		
		#header_brandName{width: 15%; height: 90%; text-align: center; vertical-align: middle;}
		#header_brandName #brandName{margin: 0;}
		#header_brandName #brandName a{color: #735949; text-decoration: none;}
		#header_brandName #brandName a:hover{color: black; cursor:pointer;}
		
		#header_address{width: 65%; height: 100%; text-align: center; vertical-align: middle;}
		#header_address #address{width: 50%; height: 50px; border-radius: 20px;}
		header{ position: fixed; top: 0px; left: 0px; width: 100%; margin: 0; padding: 0; z-index: 6; }
		#header{margin: auto; width: 100%; height: 70px; background-color: white; border-bottom: 2px solid #2ac1bc;  padding-top:20px;}
		/* #header>div{ display: inline-block;} */
		#header>div{float:left;}
		
		#header_brandName{width: 15%; height: 90%; text-align: center; vertical-align: middle; }
		#header_brandName #brandName{margin: 0;}
		#header_brandName #brandName a{color: #735949; text-decoration: none; color:#2ac1bc;}
		/* #header_brandName #brandName a:hover{color: black; cursor:pointer;} */
		
		#header_address{width: 65%; height: 100%; text-align: center; vertical-align: middle;}
		#header_address #address{width: 50%; height: 50px; border-radius: 15px; border:2px solid #2ac1bc; font-size:20px; text-align:center;}

		#header_nav{width: 19%;}
		#header_nav>ul{margin:0px;}
		#header_nav>ul>li{float:left; list-style:none;}
		#header_nav>ul>li>a{}
		#header_nav>ul>li>a>img{width:50px; height: 50px;margin-left:15px;}
		
		#delivery:hover{cursor:pointer;}
		
		#modal{position: fixed; display: none; opacity: 0.9; left: 0; top: 0px; width: 100%; height: 100%; text-align: center; background-color: rgb(199, 197, 197); border: 1px solid black; z-index: 2;}
		#modal #search_cancel{margin-right: 0px; margin-left: 1800px; margin-top: 200px; width: 70px; height: 70px;}
		#modal #search_input{margin: auto; width: 50%; height: 60px; margin-top: 100px; border:2px solid black;}
		#modal #submit{height: 60px; width: 100px; opacity: 1; font-size: 15px; font-weight: 600; border:2px solid black;}
		#modal #search_category{height: 60px;}
		
		#message{position:fixed; top:300px; right:10px; width:50px; height:50px; z-index:99;}
		#message:hover{cursor:pointer;}
	</style>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>
</head>

	<body>
		<header>

            <div id="header">
                <div id="header_brandName">
                   	<h1 id="brandName"><a href="home.do">치킨의민족</a></h1>
                </div>
                <div id="header_address">
                    <select name="address" id="address">
                    	<c:if test="${!empty sessionScope.loginUser }">
	                    	<option value="">주소를 선택해주세요.</option>
                    		<c:forEach var="addr" items="${sessionScope.address }">
		                        <option value="${addr.lat } ${addr.lng}">${addr.address }</option>
                        	</c:forEach>
                        </c:if>
                        <c:if test="${empty sessionScope.loginUser }">
	                    	<option value="">로그인시 이용가능합니다.</option>
                        </c:if>
                    </select>
                </div>
                <div id="header_nav">
                	<ul>
                		<li>
                			<a href="deliverView.do"><img src="resources/images/hDelivery.png"></a>                			
                		</li>
                		<li>
                			<a href="bungList.do"><img src="resources/images/hBung.png"></a>                			
                		</li>
                		<li>
                			<a href="boardList.do"><img src="resources/images/mat.png"></a>
                		</li>
                		<li>
                			<c:if test="${!empty sessionScope.loginUser }">
	                			<a href="calender.do"><img src="resources/images/hMypage.png"></a>                			
                			</c:if>
                		</li>
                	</ul>
                </div>
                <br clear="both">
            </div>

           
            <br clear="both">
        </header>

	
       <c:if test="${empty msg}">
	       <div id="modal" style="display: none">

	           <img id="search_cancel" src="resources/images/cancel.png" alt="">
	           <form action="homeSearch.do" id="form" method="get">
					
	               <br clear="both">
	               
	               <select name="search_category" id="search_category">
					<option value="brand">브랜드</option>
					<option value="store">매장</option>
	               </select>
	               <input type="text" id="search_input" name="search_input" placeholder="치킨 매장(브랜드)만 검색해주세요.">
	               <button type="button" id="submit">검색</button>
	           </form>
	       </div>
       </c:if>
       
       <c:if test="${!empty sessionScope.loginUser}">
			<img id="message" src="resources/images/chatting.png" alt="">
       </c:if>
    </body>

    <script>
	    function deliver(){
           location.href="deliverView.do?latlng=" + $("#address option:selected").val() + "&address=" + $("#address option:selected").text();
	    }
        $(function(){
        	
        	$latlng = $("#address option:selected").val()
            $modal=$("#modal");
            
        	//검색버튼
        	$("#submit").on("click",function(){
        		/* alert("asd");
				$("#form").append("<input type='hidden' name='latlng' value='"+ $("#address option:selected").val() +"'");
				$("#form").append("<input type='hidden' name='address' value='"+ $("#address option:selected").text() +"'");
				 */
				$("#form").submit();
        	})
        	
            
            
         
            
            //계연이 채팅 연결
            $("#message").on("click",function(){
            	var loginUser="<c:out value='${loginUser.id}'/>";
        		window.open("chatting.do?loginUserName="+loginUser,"","width=400, height=600","menubar=1","status=0");
				
            })
            
            $("#noneLogin").on("click",function(){
            	alert("로그인시 이용가능합니다")
            })
            
            $("#address").on("change",function(){
            	location.href="deliveryList.do?latlng=" + $("#address option:selected").val() + "&address=" + $("#address option:selected").text();
            })
        })
    </script>
    <script>
    	
    </script>

</html>