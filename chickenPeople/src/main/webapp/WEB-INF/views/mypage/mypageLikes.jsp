<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
<title>Insert title here</title>
<style>

.wrapper1 .clickButtons ul li select{
    position: relative;
    width:100%;
    float:left; 
    /* margin-left: 50px; */
    margin-bottom: 7px;
    height:30px;

}

.content-table{
    /* position: absolute; */
    /* align-items: center; */
    width:60%;
    border-collapse: collapse;
    margin: 0 auto;
    /* margin:25px 0; */
    font-size:12px;
    min-width: 500px;
}

.content-table thead tr{

    border-top: 1px solid black;
    border-bottom: 1px solid black;
    text-align: center;
    font-weight: bold;
}

.content-table th,
.content-table td{
    padding:12px 15px;
    
}
.content-table tbody tr{
    border-bottom: 1px solid #dddddd;
    text-align: center;
}

.wrapper1 .clickButtons ul{
    display: inline;
    width:100%;
    float:right; 
    /* margin:0 auto; */
    margin-right: 370px;
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

.logo{
	width:50px;
	height:50px;
}

.like{
	width:13px;
	height:13px;
}


</style>
   
</head>
<body>

   <jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/sidebar.jsp"/>
   <br>
   <br>
   <br>
    <div class="main_container">
                <div class="item">
                    <div class="wrapper1">
                        <div class="clickButtons">
                            <ul>
                                
                                <li>
                                    <select id="selectType">
                                    <option value="lContent">찜한 글</option>
                                    <option value="lStore">찜한 매장</option>
                                    </select>
                                </li>
                            </ul>
                        </div>
                    </div>
                        <table class="content-table" id="likeContent">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>번호</th>
                                    <th>작성자</th>
                                    <th>제목</th>
                                    <th>내용</th>
                                    <th>작성날짜</th>
                                    <th>취소</th>
                                </tr>
                            </thead>
                            <tbody>
                         
                            </tbody>
                        </table>

                        <table class="content-table" id="likeStore"  style="display:none;" >
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>사진</th>
                                    <th>매장명</th>
                                    <th>평균 평점</th>
                                    <th>최소주문</th>
                                    <th>취소</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                           
                        
                            </tbody>
                        </table>
                        <br>
                        <br>
                        <br>
                        <br>
                        
                </div>

            </div>
            
            <script>
            //selectLikeList
            $( document ).ready(function() {
			    init();
			    
			     
	            $('#likeStore').on('click', 'img.like', function(){
	            	deleteStoreList(this);
            	});
	       		
	            $('#likeContent').on('click', 'img.like', function(){
	            	deleteWriteLike(this);
	            });
	            
	            $("#selectType").change(function(){
	                 var v = this.value;
	                 if(v=="lContent"){
	                     $("#likeContent").show();
	                     $("#likeStore").hide();
	                 }else if(v=="lStore"){
	                     $("#likeContent").hide();
	                     $("#likeStore").show();
	                 }
                  
               });
			});
            
            function init(){
            	searchData();
            }
            
            // 데이터 조회
            function searchData(){
            	var param = {
            			'type' : $("#selectType").val(),
            	}
            	
            	$.ajax({
            		type:'POST',
        			url:"selectLikeList.do",
        			data:param,
        			dataType:'JSON',
        			success:function(data){
        				
        				// 내가 찜한 매장 목록
        			 	var storeList = data.storeList;
        				
        				var storeAppendStr = '';
        				// 내가 찜한 매장 목록 개수만큼 반복문
        				for(var i=0; i<storeList.length; i++){
        					// 내가 찜한 매장 목록에 append할 문자열 생성
        					storeAppendStr += '<tr>' +
					                            '<td>' + (i+1) + '</td>' +
					                            '<td><img class="logo" src="resources/images/' + storeList[i].brandPic + '.png"></td>' +
					                            '<td>' + storeList[i].stoName + '</td>' + 
					                            '<td>' + storeList[i].dailyTReview + '</td>' + 
					                            '<td>' + storeList[i].ordLimit + '</td>' + 
					                            '<td><img class="like" name="storeLike" src="resources/images/blackHeart.png">' +
					                            	'<input type="hidden" value="' + storeList[i].storeNo + '" name="storeNo">' +
					                            '</td>' +
					                        '</tr>';
        				}
        				
        				$('#likeStore').find('tbody').empty();
        				$('#likeStore').find('tbody').append(storeAppendStr);
        				
        				
        				
        				/***************************************************************************************************/
        				
        			 	// 내가 찜한 글 목록
        			 	var writeList = data.writeList;
        		
        			 	var writeAppendStr = '';
        			 	// 내가 찜한 글 목록 개수만큼 반복문
        			 	for(var i=0; i<writeList.length; i++){
        			 		// 내가 찜한 글 목록에 append 할 내용 만들기 
        			 		writeAppendStr += '<tr>' +
					                            '<td></td>' +
					                            '<td>' + (i+1) + '</td>' +
					                            '<td>' + writeList[i].bWriter + '</td>' +
					                            '<td>' + writeList[i].bTitle + '</td>' +
					                            '<td>' + writeList[i].bCont + '</td>' + 
					                            '<td>' + writeList[i].bDate + '</td>' +
					                            '<th><img class="like" name="writeLike" src="resources/images/blackHeart.png">' +
					                            	'<input type="hidden" value="' + writeList[i].bNum + '" name="bNum">' +
					                            '</th>' +
					                        '</tr>';    
					                        
        			 	}
        			 	
        			 	$('#likeContent').find('tbody').empty();
        			 	$('#likeContent').find('tbody').append(writeAppendStr);
        			 	
        				
        			},error:function(request, status, errorData){
                        alert("error code: " + request.status + "\n"
                                +"message: " + request.responseText
                                +"error: " + errorData);
                    } 
        			
        		}) ;
        	
            }
            
            // 내가 찜한 글 삭제
            function deleteWriteLike(obj){
            	var param = {
            			'b_Num' : $(obj).parents('tr').find('input[name=bNum]').val(),
            	}
            	
            	if(!confirm('찜하기를 취소하시겠습니까?')){
            		return false;
            	}
            	
            	$.ajax({
        			url:"deleteBoard.do",
        			data:param,
        			dataType:'JSON',
        			success:function(data){
        			 	searchData();
        				
        			},error:function(request, status, errorData){
                        alert("error code: " + request.status + "\n"
                                +"message: " + request.responseText
                                +"error: " + errorData);
                    } 
        			
        		});
            }
            
            // 내가 찜한 매장 삭제
            function deleteStoreList(obj){
            	var param = {
            			'storeNo' : $(obj).parents('tr').find('input[name=storeNo]').val(),
            	}
            	console.log(param);
            	if(!confirm('찜하기를 취소하시겠습니까?')){
            		return false;
            	}
            	
            	$.ajax({
        			url:"deleteStore.do",
        			data:param,
        			dataType:'JSON',
        			success:function(data){
        			 	searchData();
        				
        			},error:function(request, status, errorData){
                        alert("error code: " + request.status + "\n"
                                +"message: " + request.responseText
                                +"error: " + errorData);
                    } 
        			
        		});
            }
            
            
            
          </script>
          
          
   
   
   
   
   <jsp:include page="../common/footer.jsp"/>
   
</body>
</html>
</body>
</html>