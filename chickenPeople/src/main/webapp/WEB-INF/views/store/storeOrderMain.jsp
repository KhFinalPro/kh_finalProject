<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

        <style>
          
            #section{width:auto; height:1500px; background-color: white; display:block; }
          
            #footer {width: 100%;height: 100px; background-color: #2CBFB1; display:block;}

			body {font-family: Arial;}
			
			/* Style the tab */
			.tab {
			  overflow: hidden;
			  border: 1px solid #ccc;
			  background-color: #f1f1f1;
			}
			
			/* Style the buttons inside the tab */
			.tab button {
			  background-color: inherit;
			  float: left;
			  border: none;
			  outline: none;
			  cursor: pointer;
			  padding: 14px 16px;
			  transition: 0.3s;
			  font-size: 17px;
			}
			
			/* Change background color of buttons on hover */
			.tab button:hover {
			  background-color: #ddd;
			}
			
			/* Create an active/current tablink class */
			.tab button.active {
			  background-color: #ccc;
			}
			
			/* Style the tab content */
			.tabcontent {
			  display: none;
			  padding: 6px 12px;
			  border: 1px solid #ccc;
			  border-top: none;
			}
			
			<!-- 메뉴 카테고리-->
			.menu a{cursor:pointer;}
		    .menu .hide{display:none;}


			<!--좋아요 버튼 -->
	
        </style>
        <script>
			    /* window.onload=function(){
			        var test = document.getElementById( 'test' );
			        var imgLength = document.getElementsByClassName("imgLen");
			        test.style.width=imgLength.length*210;
			    }  */
			    $(function(){
			    	var imgLength = $(".imgLen");

			    	//이미지 크기 하나 가로길이 변수
					var imgWid = 100;
			    	imgLength.css("width",imgWid);
			    	
			    	//이미지 크기 하나 세로길이 변수
					var imgHi = 100;
			    	imgLength.css("height",imgHi);
			    	
			    	
			    	var test = $("#test");
			    	var len = imgLength.length*(imgWid+10);
			    	test.css("width",len);
			    })
			</script>
			
			<!-- 좋아요 버튼  -->
			<script>
		
			
			</script>
			
			<!-- 메뉴 카테고리 -->
			<script>
		    // html dom 이 다 로딩된 후 실행된다.
		    $(document).ready(function(){
		        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
		        $(".menu>a").click(function(){
		            var submenu = $(this).next("ul");
		 
		            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
		            if( submenu.is(":visible") ){
		                submenu.slideUp();
		            }else{
		                submenu.slideDown();
		            }
		        });
		    });
			</script>
    </head>
    <body>



  <jsp:include page="../common/header.jsp"/>
    <br><br><br>  <br><br><br>  <br><br><br>  <br><br><br>
  
    <div id= "section">
        <div style="width:60%;  margin:0 auto;">
   
            <div id="order" style="width:56%; height:auto;float:left;margin-left:15px; ">
            <!--  가게 간단한 정보  -->
                <div class="store" style="width:auto;height:250px;">
	                 <table border="1" width="500" height="200">
	                   <tr>
				            <td colspan="3" height="30" style="background:gray; color:white;">주문하기</td>          			         
				        </tr>
				        <tr>
				            <td colspan="3" height="30">가게상세</td>          			         
				        </tr><tr>
				            <td width="150">${storeList.get(0).brand_pic }</td>
				            <td>${storeList.get(0).sto_intro }</td>				        	
				        </tr>
				  		
				        <tr>
				            <td colspan="3" height="50">사장님 알림</td>
				        </tr>
	    			</table>
                </div>
                
                <div> <!-- 가게 정보 box1 -->
                <!-- 메뉴판  -->
                <h1>메뉴판</h1>
                <div class="noborder" style="overflow: auto; width: 500px; height: 130px;">
				    <div class="noborder" id="test" style="width:0px;"> 
				    	<c:forEach var="mainM" items="${storeList }">
				    		<c:if test="${mainM.cat_code == 1 && mainM.cat_code == 1}">
				    			<a href="#"><img src="resources/menu/${mainM.menu_pic }.jpg" class="imgLen" style="float: left; height: 50px; margin: 0 5px;" alt="image name"></a>	
				    		</c:if>
				    	</c:forEach>
				        
				        
				       
				    </div>
				</div>
		
                <!-- tabs 메뉴 클릭 -->
					<h2>메뉴상세</h2>
					<p>Click on the buttons inside the tabbed menu:</p>
					
					<div class="tab" style="width: 500px;">
					  <button class="tablinks" onclick="openCity(event, 'London')">여긴 메뉴판</button>
					  <button class="tablinks" onclick="openCity(event, 'Paris')">여긴 리뷰</button>
					  <button class="tablinks" onclick="openCity(event, 'Tokyo')">여긴 정보창</button>
					</div>
					
					<div id="London" class="tabcontent">
					  <h3>여긴 메뉴판</h3>
					  <p>London is the capital city of England.</p>
					  <p>여기에 메뉴판이랑 div 넣어서 적용해야한다아아~</p>
					  
					<ul>
			        <li class="menu">
			            <a>뼈치킨</a>
			            <ul class="hide">
			            	<c:forEach var="m1" items="${storeList }">
			            		<c:if test="${m1.cat_code == 1 }">
			                		<li>${m1.menu_name }</li>
			                	</c:if>
			                </c:forEach>
			            </ul>
			        </li>
			 
			        <li class="menu">
			            <a>순살치킨</a>
			            <ul class="hide">
			                <c:forEach var="m1" items="${storeList }">
			            		<c:if test="${m1.cat_code == 2 }">
			                		<li>${m1.menu_name }</li>
			                	</c:if>
			                </c:forEach>
			            </ul>
			        </li>
			         <li class="menu">
			            <a>새트메뉴</a>
			            <ul class="hide">
			                <c:forEach var="m1" items="${storeList }">
			            		<c:if test="${m1.cat_code == 3 }">
			                		<li>${m1.menu_name }</li>
			                	</c:if>
			                </c:forEach>
			            </ul>
			        </li>
			         <li class="menu">
			            <a>사이드메뉴</a>
			            <ul class="hide">
			                <c:forEach var="m1" items="${storeList }">
			            		<c:if test="${m1.cat_code == 4 }">
			                		<li>${m1.menu_name }</li>
			                	</c:if>
			                </c:forEach>
			            </ul>
			        </li>
			         <li class="menu">
			            <a>음료</a>
			            <ul class="hide">
			                <c:forEach var="m1" items="${storeList }">
			            		<c:if test="${m1.cat_code == 5 }">
			                		<li>${m1.menu_name }</li>
			                	</c:if>
			                </c:forEach>
			            </ul>
			        </li>
			          <li class="menu">
			            <a>소스</a>
			            <ul class="hide">
			                <c:forEach var="m1" items="${storeList }">
			            		<c:if test="${m1.cat_code == 6 }">
			                		<li>${m1.menu_name }</li>
			                	</c:if>
			                </c:forEach>
			            </ul>
			        </li>
			    </ul>
								  
				
					  
					</div>
					
					<div id="Paris" class="tabcontent">
					  <h3>여긴 리뷰</h3>
					  <p>Paris is the capital of France.</p> 
					  <p>여기는 리뷰이다!</p>
					    <br><br><br><br><br><br><br><br><br><br>
					  <br><br><br><br><br><br><br><br><br><br>
					</div>
					
					<div id="Tokyo" class="tabcontent">
					  <h3>여긴 정보창</h3>
					  <p>여기는 정보창이다아!</p>
					    <br><br><br><br><br><br><br><br><br><br>
					  <br><br><br><br><br><br><br><br><br><br>
					</div>
					
					<script>
					function openCity(evt, cityName) {
					  var i, tabcontent, tablinks;
					  tabcontent = document.getElementsByClassName("tabcontent");
					  for (i = 0; i < tabcontent.length; i++) {
					    tabcontent[i].style.display = "none";
					  }
					  tablinks = document.getElementsByClassName("tablinks");
					  for (i = 0; i < tablinks.length; i++) {
					    tablinks[i].className = tablinks[i].className.replace(" active", "");
					  }
					  document.getElementById(cityName).style.display = "block";
					  evt.currentTarget.className += " active";
					}
					</script>
					
					
  			 </div>
            </div> <!-- 가게 + 메뉴판-->

            <div id="orderCheck" style="width:39%;height:1000px;float:left; border:soild; margin-left:15px;"> <!--주문 확인 orderHistory-->
		        	<table border="1" width="350" height="300" >
		        	  <tr>		 
				            <td colspan="2"  height="30" style=" background:gray; color:white;">주문표</td>
			
				        </tr>
				        <tr>		 
				            <td colspan="2"  height="30">주문내역</td>
			
				        </tr>
				        
				        <tr>
				            <td  colspan="2" height="50">가게명</td>
	
				        </tr>
				        <tr>  
				            <td>주문정보</td>
				            <td>가격</td>
				        </tr>
				          <tr  height="70">  
				            <td>총 결제금액</td>
				            <td> 금액</td>
				        </tr>
   					 </table>
   					 <p><a href="#">이용약관</a>,<a href="#">개인정보 수집 동의</a>,<a href="#">개인정보 제 3자 제공</a>,<a href="#">전자금융거래 이용약관</a>
   					 	 만 14세 이상 이용자 내용 확인하였으며 결제에 동의합니다.</p>
   					 <br><br><br>
                     <button style="float:right; width:330px; height:70px; "><a href="order.do">주문하기</a></button>

            </div><!-- orderCheck end-->
            
        </div> 
    </div>
<br><br><br>
     <jsp:include page="../common/footer.jsp"/>
    

</body>
</html>