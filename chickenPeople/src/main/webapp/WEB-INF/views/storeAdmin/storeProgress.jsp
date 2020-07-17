<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장운영</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
<style>
		.welcomeTitle{
		    margin-top:20px;
		    margin-left:48px;
		    font-size: 18px;
		    font-weight: bold;
		}
		
		.welcomeTime{
		    float:right;
		    margin-right: 50px;
		   
		}
        .container{
            width:80%;
            margin-left: auto;
		    margin-right: auto;
        }
        
 
  		
        
        .progressbar li{
            list-style-type: none;
            float:left;
            width: 25%;
            position:relative;
            text-align: center;
            font-size: 13px;

        } 
        ul li #check{
            background:#ccc;
            color: #fff;
            width:20px;
            height:20px;
            border-radius: 50px;
            margin-top: 1px;
        
        
        }

       .progressbar li:before{
           
            line-height:30px; 
            
           
         
        }
        .main_container  .progressbar li:after{
            content:'';
            position:absolute;
            width: 100%;
            height:3px;
            background-color: #ddd;
            margin-top: -12px;
            left:0px;
            z-index: -1;  
            top:67px;
        }
   
        .progressbar li.active{
            color:#2e4ead;
        }

        .progressbar li:before{
            border-color: #2e4ead;
        }
        
		
        .welcomeTime{
        	border:none;
		    border-radius: 5px;
		    color:#fff; 
		    background-color:#7190ec;
		    width:240px;
		    padding:7px;
		    font-size:14px;
		    text-align:left;        	
        }
        
</style>
</head>
<body>
<jsp:include page="../common/adminSidebar.jsp"/>
   
   <div class="wrapper">
    <div class="main_container">
        <div class="item">
            <div class="wrapper1">
                <br>
                
                <div class="welcomeTitle">안녕하세요. 김다슬 사장님!</div>
                <br>
                <div class="welcomeTime">오늘 현재<br>2020-07-09 10:55a.m 수요일</div>
            </div>
            <br>
            <br>  
            <br>
            <br> 
            <br>
            <br>
            <br>
            <br>
            <br>

	    <div class="container">
	        <ul class="progressbar">
	            <li>
	                <i class="fas fa-door-open  fa-2x" style="color:  #2e4ead;"></i><br><br>
	                <i class="fas fa-check" id="check"></i><br><br>
	                <a href="#">장사시작</a>
	            </li>
	            <li>
	                <i class="fas fa-coins fa-2x" style="color:  #2e4ead;"></i><br><br>
	                <i class="fas fa-check" id="check"></i><br><br>
	                <a href="#">목표금액</a>
	            </li>
	            <li>
	                <i class="fas fa-list fa-2x" style="color:  #2e4ead;"></i><br><br>
	                <i class="fas fa-check" id="check"></i><br><br>
	                <a href="#">정산하기</a>
	            </li>
	            <li>
	                <i class="fas fa-door-closed fa-2x" style="color:  #2e4ead;"></i><br><br>
	                <i class="fas fa-check" id="check"></i><br><br>
	                <a href="#">마감하기</a>
	                
	            </li>
	        </ul>
	    </div>
	    </div>
	    </div>
	    </div>
</body>
<script>
$(function(){
	$(".storeBar").children().addClass('active');
})
</script>
</html>