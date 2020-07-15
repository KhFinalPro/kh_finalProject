<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		 header{ position: fixed; top: 0px; left: 0px; width: 100%; margin: 0; padding: 0; z-index: 1;}
            #header{margin: auto; width: 100%; height: 100px; background-color: #2ac1bc;}
            #header>div{ display: inline-block;}

            #header_brandName{width: 15%; height: 100%; text-align: center; vertical-align: middle;}
            #header_brandName #brandName{margin: 0;}
            #header_brandName #brandName a{color: white; text-decoration: none;}
            #header_brandName #brandName a:hover{color: black;}

            #header_address{width: 74%; height: 100%; text-align: center; vertical-align: middle;}
            #header_address #address{width: 50%; height: 50px; border-radius: 20px;}


            #header_userArea{width: 10%; height: 80%;}
            #header_userArea ul {list-style-type: none; height: 40px; padding: 0; margin: 0;}
            #header_userArea ul li{float: left; position: relative; padding: 0; line-height: 50px;}
            #header_userArea ul li img{width: 50px; height: 50px; margin-top: 20px;}
            #header_userArea ul li ul{opacity: 0; position: absolute; left: 0; list-style-type: none; padding: 0; margin: 0;}
            #header_userArea ul li:hover ul{opacity: 1;}
            #header_userArea ul li ul li{float: none; position: static; height: 0px; line-height: 0; background: none; width: 100px;}
            #header_userArea ul li:hover ul li{width: 100px; height: 30px; line-height: 30px; padding:5px 0;}
            #header_userArea ul li ul li a{text-decoration: none; text-align: center; font-weight:600; font-size:25px; color:black; width: 100px;}
            #header_userArea ul li ul li a:hover{color:black;}

            #header_nav {height: 80px; margin: auto; width: 100%;}
            #header_nav ul{margin: 0 auto; padding: 0;}
            #header_nav ul li{margin: auto; width: 25%; list-style: none; color: white; background-color: #2ac1bc; float: left; line-height: 80px; vertical-align: middle; text-align: center;}
            
            #header_nav ul li a{margin: auto; width: 100%; text-decoration: none; color: white; display: block; width: 150px; font-size: 30px; font-weight: bold;}
            #header_nav ul li a:hover{color: black;}

            #modal{position: fixed; display: none; opacity: 0.5; left: 0; top: 0px; width: 100%; height: 100%; text-align: center; background-color: rgb(199, 197, 197); border: 1px solid black; z-index: 2;}
            #modal #search_cancel{margin-right: 0px; margin-left: 1300px; margin-top: 200px; width: 100px; height: 100px;}
            #modal #search_input{margin: auto; width: 50%; height: 50px; margin-top: 100px; border:2px solid black;}
           
        </style>
        <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<header>
<<<<<<< HEAD
	    <div id="header">
	        <div id="header_brandName">
	            <h1 id="brandName"><a href="home.do">치킨의민족</a></h1>
	        </div>
	        <div id="header_address">
	            <select name="address" id="address">
	                <option value="서울특별시 구로구 가마산로 231 보광아파트 6동 404호">서울특별시 구로구 가마산로 231 보광아파트 6동 404호</option>
	                <option value="서울특별시 구로구 가마산로 231 보광아파트 6동 404호">서울특별시 구로구 가마산로 231 보광아파트 5동 401호</option>
	            </select>
	        </div>
	        <div id="header_userArea">
	            <ul>
	                <li><a href="#">Join</a></li>
	                <li><a href="#">Login </a></li>
	                <li><a href="#">MyPage</a></li>
					<li><a href="storeOrder.do">store</a><li>
	                <li><a href="#">System</a>
	            </ul>
	        </div>
	        <br clear="both">
	    </div>
	
	    <div id="header_nav">
	        <ul>
	            <li>
	                <a href="#">딜리버리</a>
	            </li>
	            <li>
	                <a href="#">치킨번개</a>
	            </li>
	            <li>
	                <a href="board.do">맛잘알</a>
	            </li>
	            <li>
	                <a href="nlist.do">공지사항</a>
	            </li>
	        </ul>
	
	    </div>
	    <br clear="both">
	</header>
</body>
=======
            <div id="header">
                <div id="header_brandName">
                    <h1 id="brandName"><a href="#">치킨의민족</a></h1>
                </div>
                <div id="header_address">
                    <select name="address" id="address">
                        <option value="서울특별시 구로구 가마산로 231 보광아파트 6동 404호">서울특별시 구로구 가마산로 231 보광아파트 6동 404호</option>
                        <option value="서울특별시 구로구 가마산로 231 보광아파트 6동 404호">서울특별시 구로구 가마산로 231 보광아파트 5동 401호</option>
                    </select>
                </div>
                <div id="header_userArea">
                    <ul>
                        <li>
                            <img id="search" src="resources/images/search.png" alt="">
                        </li>
                        <li>
                            <img src="resources/images/user.png" alt="">
                            <ul>
                                <li><a href="#">Join</a></li>
                                <li><a href="#">Login </a></li>
                                <li><a href="#">MyPage</a></li>
                                <li><a href="#">Store</a></li>
                                <li><a href="#">System</a></li>
                            </ul>
                        </li>
                    </ul>
                    
                </div>
                <br clear="both">
            </div>

            <div id="header_nav">
                
                <ul>
                    <li>
                        <a href="#">딜리버리</a>
                    </li>
                    <li>
                        <a href="#">치킨번개</a>
                    </li>
                    <li>
                        <a href="#">맛잘알</a>
                    </li>
                    <li>
                        <a href="#">공지사항</a>
                    </li>
                </ul>

            </div>
            <br clear="both">
        </header>

        <div id="modal" >
            <!-- <input type="button" id="search_cancel" > -->
            <img id="search_cancel" src="resources/images/cancel.png" alt="">
            <form action="">
                <br clear="both">
                <input type="text" id="search_input" name="search_input">
            </form>
        </div>
       
        
    </body>

    <script>
        $(function(){
            $modal=$("#modal");
            
            $("#search").on("click",function(){
                // $("#modal").css('display','none');
                $("#modal").toggle(

                    function(){$modal.addClass('show')}, //클릭하면 show클래스 적용되서 보이기

                    function(){$modal.addClass('hide')} //한 번 더 클릭하면 hide클래스가 숨기기

                );
            })
            $("#search_cancel").on("click",function(){
                $modal.css('display','none');
            })
        })
    </script>
>>>>>>> refs/remotes/origin/master
</html>