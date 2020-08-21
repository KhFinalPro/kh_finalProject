<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Store Review</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
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



/*********페이지네이션***********/
	.p-parents { display: flex; flex-direction: column; justify-content: center; align-items: center; margin: 0 auto; }
    .pppp { display: flex; text-align: center; margin : 50px auto; background: rgb(255, 255, 255); height: 36px; border : 1px solid black; border-radius: 5px; justify-content: center; align-items: center; }
    .pppp > ol > li:first-child { border-left : 1px solid black; }
    .pppp > a { display: inline-flex; justify-content: center; align-items: center; padding: 7px 12px; font-size: 13px; font-weight: 500; color:#9c9c9c; text-decoration: none; }
    .pppp > ol { display: inline-flex; list-style: none; justify-content: center; align-items: center; }
    .pppp > ol > li { display: inline-flex; list-style: none; justify-content: center; align-items: center;  border-right: 1px solid; vertical-align: middle; list-style: none; width: 36px; height: 34px; text-decoration: none; }
    .page-list1 { background-color:rgb(46,78,178); }
    .page-cur { font-size : 14px; background:none; color: white; padding : 0; border-style : none; }
    .page-nocur { font-size: 14px; background:none; color: rgb(46,78,178); padding : 0; border-style : none; }
    .page-a:hover { color: black; text-decoration:none; }
    
    a:link{text-decoration:none; color:#646464;}
    a:visited{text-decoration:none; color:#646464;}
    a:active{text-decoration:none; color:#646464;}
    a:hover{text-decoration:none; color:#646464;}

/***********리뷰테이블**********/
.reviewTitle{
    margin-top:20px;
    margin-left:48px;
    font-size: 18px;
    font-weight: bold;

}

.wrapper1 .clickButtons ul{
    display: inline;
    width:100%;
    float:right; 
    /* margin:0 auto; */
    margin-right: 100px;
    margin-bottom: 7px;
    
}

.wrapper1 .clickButtons ul li{
    display: inline-block;
    float:right; 
    margin:2px;
   
}

.wrapper1 .clickButtons ul li button{
    padding:5px;
    font-size: 12px;

}


.content-table{
    /* position: absolute; */
    /* align-items: center; */
    width:90%;
    border-collapse: collapse;
    margin: 0 auto;
    /* margin:25px 0; */
    font-size:12px;
    min-width: 500px;
}

.content-table thead tr{

    border-top: 1px solid black;
    border-bottom: 1px solid black;
    text-align: left;
    font-weight: bold;
}

.content-table th,
.content-table td{
    padding:12px 15px;
    
}
.content-table tbody tr{
    border-bottom: 1px solid #dddddd;
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
                        
                        <div class="reviewTitle">리뷰 리스트</div>
                        <br>
                        <br>
                        <br>
                        <br>
                        <div class="clickButtons">
                            <ul>
                                <li><button id="rDelete">삭제하기</button></li>
                            </ul>
                        </div>
                    </div>
                        <table class="content-table" id="reviewTable">
                            <thead>
                                <tr>
                                	<th></th>
                                    <th style="width:120px">주문번호</th>
                                    <th style="width:400px">메뉴명</th>
                                    <th>주문금액</th>
                                    <th>평점</th>
                                    <th style="width:300px">내용</th>
                                    <th style="width:180px">주문일</th>
                                    <th style="width:180px">작성일</th>
                                    <th>답변처리</th>
                                    <!-- <th></th> -->
                                </tr>
                            </thead>
                            <tbody>
                            
                            </tbody>
                        </table>
                          <div class = "p-parents" style="margin:0 auto">
	            <div class="pppp">
	            <!-- 요기 내용 ajax로 만들어보기 -->
		                    <c:if test="${pi.currentPage eq 1}">
			                    <a style = "color:#9c9c9c; " disabled>Previous</a>
		                    </c:if>
		                    <c:if test="${pi.currentPage gt 1}">
		                    	<c:url var="blistBack" value="storeReview.do">
		                    		<c:param name="page" value="${pi.currentPage-1} "/>
								</c:url>
		                        <a class="page-a" href="${blistBack }" style="color:#9c9c9c" >Previous</a>	
		                    </c:if>
		                    <ol>
		                    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
		                    	<c:if test="${p eq pi.currentPage }">
		           					<li class = "page-list1"><button disabled class = "page-cur" >${p }</button></li>		
		                    	</c:if>
		                    	<c:if test="${p ne pi.currentPage }">
		                    		<c:url var="blistCheck" value="storeReview.do">
		                    			<c:param name="page" value="${p }"/>
		                    		</c:url>
		                    		<li class = "page-list2"><button class="page-nocur" onclick="location.href='${blistCheck}'">${p }</button></li>
		                    	</c:if>
		                    </c:forEach>
		                    </ol>
		                    <c:if test="${pi.currentPage eq pi.maxPage }">
			                    <a style = "color:#9c9c9c"  disabled>Next</a>
		                    </c:if>
							<c:if test="${pi.currentPage lt pi.maxPage }">
								<c:url var="blistAfter" value="storeReview.do">
									<c:param name="page" value="${pi.currentPage+1 }"/>
								</c:url>
								<a class="page-a" href="${blistAfter }" style = "color:#9c9c9c">Next</a>
							</c:if>
	           </div>
	        </div><!-- pagination class p-parents end -->
                        
                        
                </div>

            </div>
            </div>
            
            
          
            
            
            
            
             <!-- 쪽지 답장하기 모달 -->
<div id="replyReviewModal" style="position: fixed; display:none; width: 100%; height: 100%; top: 0; left: 0; background-color: rgba(0, 0, 0, 0.7); z-index: 9999;">
  <div style="width: 400px; height: 350px; background-color: #fff; border-radius: 20px; position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%);">
      <a href="javascript: $('#replyReviewModal').fadeOut(500);" style="width: 25px; height: 25px; position: absolute; top: 30px; right: 35px; display: block;">
          <img src="resources/images/close.png" style="width: 100%;"/></a>
  <div style="position: absolute; top : 40px; left:50px;">
      <ul style="list-style: none;">
          <li style="margin-bottom: 10px;  font-size:20px;"><b>고객님께 답장하기</b></li>
          <textarea id="modal_reply_review" style="width:300px; height:200px; border:2px solid; border-radius: 13px;"></textarea>
      </ul>
      <button type="button" onclick="replyReview()" style="position:absolute; left:120px; bottom:-40px; border-radius:10px; padding:5px"><b>보내기</b></button>
  </div>
  </div>
</div> 


</body>
<script>

$(function(){
	$(".reviewBar").children().addClass('active');
})




//리뷰 데이터 조회
$(document).ready(function(){
	 init();

	console.log('ddddddddddd');
	
});

$(document).on('click','#goReplyReview',function(){
	//$("#replyReviewModal").fadeIn(500);
	wantReplyReview(this);
});


$('#rDelete').click(function(){
	deleteReviewList();
});


function init(){
    searchData();
    //pi();
 }
 
 
/*  function pi(){
	 $.ajax({
		 type:"GET",
		 url:"pagination.do",
		 dataType:"json",
		 success:function(data){
			 console.log("페이지네이션 :" + data.pi);
			 
		 },error:function(request, status, errorData){
	            alert("error code: " + request.status + "\n"
	                    +"message: " + request.responseText
	                    +"error: " + errorData);
	        } 
	 })
	 
 }
 
 */
 //데이터 조회
function searchData(){
	
	$.ajax({
		type:'GET',
		url:'selectReviewList.do',
		dataType:'json',
		success:function(data){
			
			//리뷰리스트 목록
			var reviewMenu = data.reviewMenu;
			
			var reviewMenuArr = '';
			

			//리뷰개수 만큼 반복문
			for(var i=0; i<reviewMenu.length; i++){
				
				reviewMenuArr += '<tr>'+
								'<td><input type="checkbox" name="check"></td>'+
								'<td>'+reviewMenu[i].ordNum+'</td>'+
								'<td>'+reviewMenu[i].menuName+'</td>'+
								'<td>'+reviewMenu[i].ordPrice+'</td>'+
								'<td>'+reviewMenu[i].revRate+'</td>'+
								'<td>'+reviewMenu[i].revCont+'</td>'+
								'<td>'+reviewMenu[i].ordDate+'</td>'+
								'<td>'+reviewMenu[i].revDate+'</td>'+
								/* '<td class="replyYN">'+'N'+'</td>'+ */
								'<td>' + '<button type="button" id="goReplyReview">'+'답장하기'+'</button>'+'</td>' +
								'<input type="hidden" value="' + reviewMenu[i].revNum + '" name="revNum">' + 
								'<input type="hidden" value="' + reviewMenu[i].revRe + '" name="revRe">' + 
								'</tr>'
							
			}
			
			console.log(reviewMenuArr);
			$("#reviewTable").find('tbody').empty();
			$("#reviewTable").find('tbody').append(reviewMenuArr);
			
			
		},error:function(request, status, errorData){
            alert("error code: " + request.status + "\n"
                    +"message: " + request.responseText
                    +"error: " + errorData);
        } 
      
	})

	}

 
 
 
var revNum;
var revRe; 
 function wantReplyReview(obj){
	
	 revNum = $(obj).parents('tr').find('input[name=revNum]').val();
	 revRe = $(obj).parents('tr').find('input[name=revRe]').val().trim();
	 console.log('리뷰답변'+revRe.length);
	 console.log('리뷰넘버'+revNum);
	
	 if(revRe=='null'){ 					//ajax는 toString으로 넘기기때문에 문자열로바뀜.
		 $("#replyReviewModal").fadeIn(500);	 	
	 }else{
		 alert('이미 리뷰 답변을 하셨습니다!');
	 } 
	 
	 
 }

 
 
 //리뷰 답장하기
 function replyReview(){
	 
	 
	
	 
	 var modal_reply_review = $("#modal_reply_review").val();
	 console.log(modal_reply_review);
	 console.log("받은후 "+revNum);
	 
	 var param = {'revNum' : revNum, 'revReCont' : modal_reply_review};
	 console.log('에이작스 보내기전'+param);
	 
	 $.ajax({
		type:'POST',
		url:"updateReviewRe.do",
		data:param,
		dataType:'JSON',
		success:function(data){
			alert('정상적으로 답변처리 되었습니다!');
			$("#replyReviewModal").fadeOut(500);
			location.reload();
			//$("#modal_reply_review").text("");
			
		},error:function(request, status, errorData){
            alert("error code: " + request.status + "\n"
                    +"message: " + request.responseText
                    +"error: " + errorData);
        } 
	 });
	
	 
	 
	 
 }


 function deleteReviewList(){
	
	var noArr = [];
	var test = $("#reviewTable").find('input[type=checkbox]:checked').parents('tr');
	
	console.log('test'+test);
	
	if(!confirm('리뷰를 삭제하시겠습니까?')){
		return false;
	}
	
	for(var i=0; i<test.length; i++){
		var noObj = $(test[i]).find('input[name=revNum]').val();
		
		noArr.push(noObj);
	}
	console.log(noArr);
	
	$.ajax({
		type:'POST',
		url:"deleteReview.do",
		traditional:true,
		data:{noArr:noArr},
		dataType:'JSON',
		success:function(data){
			alert('성공적으로 삭제되었습니다!');
			searchData();
			
		},error:function(request, status, errorData){
            alert("error code: " + request.status + "\n"
                    +"message: " + request.responseText
                    +"error: " + errorData);
        } 
		
	})
	
}
 
</script>
</html>