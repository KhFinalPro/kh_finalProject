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
/******메뉴 리스트 *******/

.searchCate{
    height:30px;
}
.MenuTitle{
    margin-top:20px;
    margin-left:48px;
    font-size: 18px;
    font-weight: bold;
}

.searchBox{
    height:30px;
}

.wrapper1 .searchMenu{
    text-align: center;
}

.wrapper1 .searchMenu ul{
    display: inline;
    width:100%;
    margin-bottom: 7px;
    
    
}

.wrapper1 .searchMenu ul li{
    display: inline-block;
    margin:4px;
   
}

.wrapper1 .searchMenu ul li button{
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
.logo{
   width:50px;
   height:50px;
}
</style>

<body>
<jsp:include page="../common/adminSidebar.jsp"/>

	<div class="wrapper">
		<div class="main_container">
                <div class="item">
                    <div class="wrapper1">
                        <br>
                        
                        <div class="MenuTitle">메뉴리스트</div>
                        <br>
                        <br>
                        <br>
                        <br>
                        <div class="searchMenu">
                            <ul>
                                <li><input class="searchBox" id="searchName" type="search" placeholder="메뉴명을 검색해주세요"></li>
                                <li><button type="button" onclick="searchName()">조회</button></li>
                            </ul>
                        </div>
                        <br>
                        <br>
                  
                    </div>
                        <table class="content-table" id="menuTable">
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>브랜드</th>
                                    <th>사진</th>
                                    <th> 
                                    <select class="searchCate" id="searchCate">
                                        <option disabled>종류</option>
                                        <option value="치킨">치킨</option>
                                        <option value="사이드">사이드</option>
                                        <option value="음료">음료</option>
                                    </select>
                                    </th>
                                    <th>메뉴명</th>
                                    <th>메뉴가격</th>
                                    <th>메뉴설명</th>
                                </tr>
                            </thead>
                            <tbody>
                              
                            </tbody>
                        </table>
                </div>
            </div>
         </div>
</body>
<script>
$(function(){
	$(".menuBar").children().addClass('active');
})


//메뉴 데이터 조회
$(document).ready(function(){
	init();


});


$("#searchCate").change(function(){
var v = this.value;
console.log('종류'+v);

var param = {
        'category' : v,
  }





	$.ajax({
	type:'POST',
	url:'selectSearchCate.do',
	data:param,
	dataType:'json',
	success:function(data){
		var cateList = data.cateList;
		
		var cateListAppendStr = '';	
		//메뉴 목록 개수만큼 반복
		for(var i=0; i<cateList.length; i++){
			cateListAppendStr += '<tr>'+
								'<td>'+(i+1)+'</td>'+
								'<td>'+cateList[i].brandName+'</td>'+
								'<td><img class="logo" src="resources/menu/' + cateList[i].menuPic + '.jpg"></td>'+
								/*'<td>'+menuList[i].menuPic+'</td>'+ */
								'<td>'+cateList[i].catName+'</td>'+
								'<td>'+cateList[i].menuName+'</td>'+
								'<td>'+cateList[i].menuPrice+'</td>'+
								'<td>'+cateList[i].menuExp+'</td>'+
								'</tr>'
								
		}
		
		console.log(cateListAppendStr);
		$("#menuTable").find('tbody').empty();
		$("#menuTable").find('tbody').append(cateListAppendStr);
		
		
		},error:function(request, status, errorData){
            alert("error code: " + request.status + "\n"
                    +"message: " + request.responseText
                    +"error: " + errorData);
        } 
	})


}); 




function init(){
	searchData();
}


//데이터 조회

function searchData(){
	$.ajax({
		type:'GET',
		url:'selectMenuList.do',
		dataType:'json',
		success:function(data){
			
			var menuList = data.menuList;
			
			var menuListAppendStr = '';
			
			
			
			//메뉴 목록 개수만큼 반복
			for(var i=0; i<menuList.length; i++){
				menuListAppendStr += '<tr>'+
									'<td>'+(i+1)+'</td>'+
									'<td>'+menuList[i].brandName+'</td>'+
									'<td><img class="logo" src="resources/menu/' + menuList[i].menuPic + '.jpg"></td>'+
									/*'<td>'+menuList[i].menuPic+'</td>'+ */
									'<td>'+menuList[i].catName+'</td>'+
									'<td>'+menuList[i].menuName+'</td>'+
									'<td>'+menuList[i].menuPrice+'</td>'+
									'<td>'+menuList[i].menuExp+'</td>'+
									'</tr>'
									
			}
			$("#menuTable").find('tbody').empty();
			$("#menuTable").find('tbody').append(menuListAppendStr);
			
		},error:function(request, status, errorData){
            alert("error code: " + request.status + "\n"
                    +"message: " + request.responseText
                    +"error: " + errorData);
        } 
	})
}


//메뉴이름조회
function searchName(){
	
	var menuName = $("#searchName").val();
	console.log(menuName);
	
	var param = {'menuName':menuName}
	
	$.ajax({
		type:'POST',
		url:'selectNameList.do',
		data:param,
		dataType:'json',
		success:function(data){
			
			var nameList = data.nameList;
			
			var nameListAppendStr = '';
			
			for(var i=0; i<nameList.length; i++){
				nameListAppendStr += '<tr>'+
									'<td>'+(i+1)+'</td>'+
									'<td>'+nameList[i].brandName+'</td>'+
									'<td><img class="logo" src="resources/menu/' + nameList[i].menuPic + '.jpg"></td>'+
									/*'<td>'+menuList[i].menuPic+'</td>'+ */
									'<td>'+nameList[i].catName+'</td>'+
									'<td>'+nameList[i].menuName+'</td>'+
									'<td>'+nameList[i].menuPrice+'</td>'+
									'<td>'+nameList[i].menuExp+'</td>'+
									'</tr>'
									
			}
			
			console.log(nameListAppendStr);
			$("#menuTable").find('tbody').empty();
			$("#menuTable").find('tbody').append(nameListAppendStr);
			
			
		
		},error:function(request, status, errorData){
            alert("error code: " + request.status + "\n"
                    +"message: " + request.responseText
                    +"error: " + errorData);
        } 
	})
	
}









</script>
</html>