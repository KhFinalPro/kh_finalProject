<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <style>
            #coupon_area{margin: 0 auto; margin-top: 20px; width: 70%; text-align: center;}
            #coupon_area>h1{font-size:100px; margin-top: 200px; margin-bottom:200px;}
            #coupon_area_title{margin: 0; width: 100%; height: 50px; line-height: 50px; text-align: center; font-size: 40px; font-weight: 600;}
            /* #coupon_area .coupon{width: 1000px; height: 300px; margin-bottom: 10px; background-image: url("../workspace/images/coupon1.png");} */
            #coupon_area .coupon{width: 1000px; height: 100%; margin-bottom: 10px; margin-top:50px;}
            #coupon_area .coupon img{border-radius: 20px; transition: box-shadow 0.5s;}
            #coupon_area .coupon img:hover{border-radius: 20px; box-shadow: 7px 7px 7px #2ca494;}
            #coupon_area .coupon .create_date{margin: 0; margin-top: 10px; text-align: right; font-size: 20px; font-weight: 600; color: black;}
            #coupon_area .coupon ul{bottom: 10px;}
            #coupon_area .coupon .coup_term{text-align: right; margin-right: 10px; font-size: 20px; font-weight: 600; color: black;}
        </style>
        <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    </head>
    <body>
    <jsp:include page="../common/header.jsp"/> 
    <jsp:include page="../common/sidebar.jsp"/> 
    
        <section id="coupon_area">
			<c:if test="${!empty myCoupon}">
			<c:forEach var="c" items="${myCoupon}">
		            
		            <div class="coupon" >
		                
		                <p class="create_date">
		                    <b>발급일 : </b> ${c.coup_c_date}
		                </p>
		                <img src="resources/coupon/${c.coup_pic}" alt="">
		                
		            </div>
		    </c:forEach>
			</c:if>
 
 
			<c:if test="${!empty pastCoup }">
			<c:forEach var="c" items="${pastCoup }">
	            <div class="coupon" >
	                <p class="create_date">
	                    <b>발급일 : </b>${c.coup_c_date}
	                </p>
	                <img src="resources/coupon/${c.coup_pic }" alt="">
	            </div> 
	        </c:forEach>
            </c:if>
            
            <c:if test="${empty myCoupon && empty pastCoup }">
            	<h1>텅!</h1>
            </c:if>
            
        </section>

     <jsp:include page="../common/footer.jsp"/>
    </body>
    <script>
        $(function(){
            $(".coupon").on("click",function(){
                alert($(this).text());
            })
        })
    </script>
</html>