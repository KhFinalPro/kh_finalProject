<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap');


*{
    margin:0;
    list-style:none;
    padding:0;
    text-decoration: none;
    box-sizing: border-box;
    font-family: 'Montserrat', sans-serif;
}

body{
    background:#e1ecf2;
    overflow: hidden;
}

.wrapper{
    margin:10px;
}

.wrapper .top_navbar{
    width:calc(100% - 20px);
    height:60px;
    display: flex;
    position: fixed;
    top:10px;
}

.wrapper .top_navbar .hamburger{
    width:70px;
    height:100%;
    background: #2e4ead;
    padding:15px 17px;
    border-top-left-radius: 20px;
    cursor:pointer;
}

.wrapper .top_navbar .hamburger div{
    width:35px;
    height:4px;
    background:#92a6e2;
    margin:5px 0;
    border-radius: 5px;
}

.wrapper .top_navbar .top_menu{
    width:calc(100% - 70px);
    background:#fff;
    height:100%;
    border-top-right-radius: 20px;
    display:flex;
    justify-content: space-between;
    align-items:center;
    padding:0 20px;
    box-shadow: 0 1px 1px rgba(0,0,0,0.1);  
}

.wrapper .top_navbar .top_menu .logo{
    color:#2e4ead;
    font-size:20px;
    font-weight:700;
    letter-spacing: 3px;
}
.wrapper .top_navbar .top_menu ul{
    display:flex;
}

.wrapper .top_navbar .top_menu ul li a{
    display:block;
    margin:0 10px;
    width:35px;
    height:35px;
    border:1px solid #2e4ead;
    text-align: center;
    border-radius:50%;
    color: #2e4ead;
}

.wrapper .top_navbar .top_menu ul li a i{
    margin-top: 10px;
}

.wrapper .top_navbar .top_menu ul li a:hover{
    background: #4360b5;
    color:#fff;
}

.wrapper .sidebar{
    position: fixed;
    top:70px;
    left:10px;
    background:#2e4ead;
    height:calc(100% - 80px);
    border-bottom-left-radius: 20px;
    transition: all 0.3s ease;
}

.wrapper .sidebar ul li a{
    display:block;
    padding:20px;
    position: relative;
    margin-bottom: 1px;
    color: #92a6e2;
    font-size: 14px;
    white-space:nowrap;
}

.wrapper .sidebar ul li a:before{
    content:"";
    position: absolute;
    top:0;
    left:0;
    width:3px;
    background:#92a6e2;
    display:none;
}

.wrapper .sidebar ul li a span.icon{
    margin-right:10px;
    display:inline-block;
}

.wrapper .sidebar ul li a span .title{
    display: inline-block;
}

.wrapper .sidebar ul li a:hover,
.wrapper .sidebar ul li a.active{
    background:#4360b5;
    color:#fff;
}

.wrapper .sidebar ul li a:hover:before,
.wrapper .sidebar ul li a.active:before{
    display: block;
}

/* .wrapper .main_container{

    width:calc(100% - 120px);

    margin-top:70px;
    margin-left: 130px;
    padding:15px;
    transition: all 0.3s ease;
    overflow: hidden;
} */

/* .wrapper .main_container .item{

    background:#fff;
    margin-bottom: 10px;
    padding:15px;
    font-size: 14px;
    height: 900px;
    border-bottom-right-radius: 20px;
    overflow-y: scroll;
   
} */

.wrapper.collapse .sidebar{
    width:70px;
}

.wrapper.collapse .sidebar ul li a{
    text-align:center;
}

/* .wrapper.collapse .sidebar ul li a span.icon{
    margin:0;
} */

.wrapper.collapse .sidebar ul li a span.title{
    display:none;
}

.wrapper.collapse .main_container{
    width:calc(100% - 70px);
    margin-left:70px;
}



</style>
</head>

<body>

    <script>
        $(document).ready(function(){
           $(".hamburger").click(function(){
              $(".wrapper").toggleClass("collapse");
           })
        });
    </script>
    
    <div class="wrapper">
        <div class="top_navbar">
            <div class="hamburger">
                <div></div>
                <div></div>
                <div></div>
            </div>
            <div class="top_menu">
                <div class="logo">Admin page</div>
                <ul>
                    <li><a href="home.do"><i class="fas fa-times"></i></i></a></li>
                </ul>
            </div>
        </div>
            <div class="sidebar">
                <ul>
                	<li class="InfoBar"><a href="storeInfo.do">
                        <span class="icon">
                            <i class="fas fas fa-user" aria-hidden="store"></i>
                        </span>
                        <span class="title">매장정보</span>
                    </a></li>
                    <li class="orderBar"><a href="storeOrder.do">
                        <span class="icon">
                            <i class="fas fa-clipboard-list" aria-hidden="true"></i></i>
                        </span>
                        <span class="title">주문확인</span>
                    </a></li>
                    <li class="salesBar"><a href="storeAdminMain.do">
                        <span class="icon">
                            <i class="fas fa-won-sign" aria-hidden="true"></i>
                        </span>
                        <span class="title">매출관리</span>
                    </a></li>
                    <li class="menuBar"><a href="storeMenu.do">
                        <span class="icon">
                            <i class="fas fa-drumstick-bite" aria-hidden="true"></i>
                        </span>
                        <span class="title">메뉴관리</span>
                    </a></li>
                    <li class="reviewBar"><a href="storeReview.do">
                        <span class="icon">
                            <i class="far fa-edit" aria-hidden="true"></i>
                        </span>
                        <span class="title">리뷰관리</span>
                    </a></li>
                    <li class="storeBar"><a href="storeProgress.do">
                        <span class="icon">
                            <i class="fas fa-store" aria-hidden="store"></i>
                        </span>
                        <span class="title">매장운영</span>
                    </a></li>
                </ul>
            </div>

    </div>
</body>
</html>