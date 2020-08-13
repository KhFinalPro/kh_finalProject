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
</head>

<style>


.wrapper .main_container{

    width:94.8%;
    margin-top:70px;
    margin-left: 114px;
    padding:15px;
    transition: all 0.3s ease;
    overflow: hidden;
}

.wrapper .main_container .item{

   background: #fff; 
   margin-bottom: 10px; 
   padding: 15px; 
   font-size: 14px; 
   height: 873px; 
   border-bottom-right-radius: 20px;
   justify-content: center; 
   align-items: center; 
   margin-top: -30px;
   overflow-y: scroll;
   
} 

.item::-webkit-scrollbar {
	display:none;
}

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
<body>
<jsp:include page="../common/adminSidebar.jsp"/>
   
   <div class="wrapper">
   		<div class="main_container">
   				<div class="item">
   				zz
   				</div>
   		</div>
   </div>
   
 



</body>
</html>