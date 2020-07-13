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
    </head>
    <body>


  <jsp:include page="../common/header.jsp"/>
    <br><br><br><br><br><br><br><br><br><br><br><br>
    <div id= "section">
        <div style="width:60%;height:1500px;  margin:0 auto; border:1px solid black;position:relative;">
   
            <div id="order" style="width:58%; height:auto; float:left; margin-left:10px;">
            <!--  가게 간단한 정보  -->
            
                <div class="store" style="width:auto;height:300px; ">
	                 <table border="1" width="500" height="200">
	                   <tr>
				            <td colspan="2" height="30" style="background:gray; color:white;">결제하기</td>          			         
				        </tr>
				        <tr>
				            <td colspan="2" height="30" style="background:gray; color:white;">배달 정보</td>  
				        </tr>
				        <tr>
				            <td colspan="2" height="30">주소</td>  
				        </tr>
				        	        <tr>
				            <td colspan="2" height="30">휴대폰번호</td>  
				        </tr>
				        <tr>
				            <td width="150" style="background:gray; color:white;">주문시 요청사항</td>
				        </tr>
				         <tr>
				         	<td><textarea id="content" name="content" rows="4" cols="65" maxlength="200" placeholder="코로나 예방을 위해 비대면 배달을 권장 드립니다.                                 여기서 결제 선택 후, '문 앞 배달'을 요청사항에 적어주세요." ></textarea>
				         	<br>
							 <span id="counter" style="float:right;">###</span>
				         	</td>

				         </tr>
				        <tr>
				            <td colspan="2" height="50"  style="background:gray; color:white;">결제수단 선택</td>
				        </tr>
				         <tr>
				            <td height="50">온라인결제</td>
				        </tr>
				         <tr>
				            <td colspan="2" height="50">현장결제</td>
				        </tr>
				         <tr>
				            <td colspan="2" height="50" style="background:gray; color:white;">할인방법 선택</td>
				        </tr>
				         <tr>
				            <td height="50" colspan="2">쿠폰</td>
				            
				        </tr>
	    			</table>
	    			
                </div>
                	
                <div> <!-- 가게 정보 box1 -->
                <!-- 메뉴판  -->
              
		
                <!-- tabs 메뉴 클릭 -->
					
  			 </div>
  			 
            </div> <!-- 가게 + 메뉴판-->

			
            <div id="orderCheck" style="width:39%;height:1000px;margin-right:0; border:soild; margin-left:15px;float:left;"> <!--주문 확인 orderHistory-->
	            <div style="position:fixed"  style="white-space:nowrap;">
            
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
   					 <p><a href="#">이용약관</a>,<a href="#">개인정보 수집 동의</a>,<a href="#">개인정보 제3자 제공</a>,<br>
   					 <a href="#">전자금융거래 이용약관</a>만 14세 이상 이용자 내용 <br>
   					 확인하였으며 결제에 동의합니다.</p>
   					 
   					 	
            <button style="width:330px; height:70px; "><a href="#">결제하기</a></button>
   					
            	</div>
            </div><!-- orderCheck end-->
        </div> 
         
        
    </div>
    
<br><br><br>

<!-- script [주문시 요청사항 글자수 카운트]-->

	<script>
	$(function() {
	      $('#content').keyup(function (e){
	          var content = $(this).val();
	          $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
	          $('#counter').html(content.length + '/200');
	      });
	      $('#content').keyup();
	});
	</script>
     <jsp:include page="../common/footer.jsp"/>
    </body>
</html>