<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <title>게시판</title>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
            	
            	var reply_count = 0; //원래 DB에 저장하고 저장 아이디 번호를 넘겨줘야 하는데 DB 없이 댓글 소스만 있어 DB 에서 아이디 증가하는것처럼 스크립트에서 순번을 생성
            	var status = false; //수정과 대댓글을 동시에 적용 못하도록
                 
                $("#list").click(function(){
                	alert("게시판 리스트로 이동");
                    //location.href = "/board/list";
                });
                 
                //댓글 저장
                $("#reply_save").click(function(){
                     
                    //널 검사
                    if($("#reply_writer").val().trim() == ""){
                        alert("이름을 입력하세요.");
                        $("#reply_writer").focus();
                        return false;
                    }
                     
                    if($("#reply_password").val().trim() == ""){
                        alert("패스워드를 입력하세요.");
                        $("#reply_password").focus();
                        return false;
                    }
                     
                    if($("#reply_content").val().trim() == ""){
                        alert("내용을 입력하세요.");
                        $("#reply_content").focus();
                        return false;
                    }
                     
                    var reply_content = $("#reply_content").val().replace("\n", "<br>"); //개행처리
                     
                    //값 셋팅
                    var objParams = {
                            board_id        : $("#board_id").val(),
                            parent_id       : "0",  
                            depth           : "0",
                            reply_writer    : $("#reply_writer").val(),
                            reply_password  : $("#reply_password").val(),
                            reply_content   : reply_content
                    };
                     
                    var reply_id;
                     
                    //ajax 호출 (여기에 댓글을 저장하는 로직을 개발)
                    /*
                    $.ajax({
                        url         :   "/board/reply/save",
                        dataType    :   "json",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :   "post",
                        async       :   false, //동기: false, 비동기: ture
                        data        :   objParams,
                        success     :   function(retVal){
 
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                            }else{
                                reply_id = retVal.reply_id;
                            }
                             
                        },
                        error       :   function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    */
                    
                    
                    reply_id = reply_count++;//DB에 저장했다 하고 순번을 생성
                    
                    var reply_area = $("#reply_area");
                     
                    var reply = 
                        '<tr reply_type="main">'+
                        '   <td width="820px">'+
                        reply_content+
                        '   </td>'+
                        '   <td width="100px">'+
                        $("#reply_writer").val()+
                        '   </td>'+
                        '   <td width="100px">'+
                        '       <input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="패스워드"/>'+
                        '   </td>'+
                        '   <td align="center">'+
                        '       <button name="reply_reply" reply_id = "'+reply_id+'">댓글</button>'+
                        '       <button name="reply_modify" r_type = "main" reply_id = "'+reply_id+'">수정</button>      '+
                        '       <button name="reply_del" reply_id = "'+reply_id+'">삭제</button>      '+
                        '   </td>'+
                        '</tr>';
                         
                     if($('#reply_area').contents().size()==0){
                         $('#reply_area').append(reply);
                     }else{
                         $('#reply_area tr:last').after(reply);
                     }
 
                    //댓글 초기화
                    $("#reply_writer").val("");
                    $("#reply_password").val("");
                    $("#reply_content").val("");
                     
                });
                 
                //댓글 삭제
                $(document).on("click","button[name='reply_del']", function(){
                     
                    var check = false;
                    var reply_id = $(this).attr("reply_id");
                    var reply_password = "reply_password_"+reply_id;
                     
                    if($("#"+reply_password).val().trim() == ""){
                        alert("패스워드을 입력하세요.");
                        $("#"+reply_password).focus();
                        return false;
                    }
                     
                    //패스워드와 아이디를 넘겨 삭제를 한다.
                    //값 셋팅
                    var objParams = {
                            reply_password  : $("#"+reply_password).val(),
                            reply_id        : reply_id
                    };
                     
                    //ajax 호출
                    /*
                    $.ajax({
                        url         :   "/board/reply/del",
                        dataType    :   "json",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :   "post",
                        async       :   false, //동기: false, 비동기: ture
                        data        :   objParams,
                        success     :   function(retVal){
 
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                            }else{
                                 
                                check = true;
                                                                 
                            }
                             
                        },
                        error       :   function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    */
                    
                    check = true;//삭제 되면 체크값을 true로 변경
                     
                    if(check){
                        //삭제하면서 하위 댓글도 삭제
                        var prevTr = $(this).parent().parent().next(); //댓글의 다음
                         
                        while(prevTr.attr("reply_type")=="sub"){//댓글의 다음이 sub면 계속 넘어감
                            prevTr = prevTr.next();
                            prevTr.prev().remove();
                        }
                         
                        //마지막 리플 처리
                        if(prevTr.attr("reply_type") == undefined){
                            prevTr = $(this).parent().parent();
                            prevTr.remove();
                        }
                         
                        $(this).parent().parent().remove(); 
                    }
                     
                });
                
                //댓글 수정 입력
                $(document).on("click","button[name='reply_modify']", function(){
                	
                    var check = false;
                    var reply_id = $(this).attr("reply_id");
                    var r_type = $(this).attr("r_type");
                    var reply_password = "reply_password_"+reply_id;
                     
                    if($("#"+reply_password).val().trim() == ""){
                        alert("패스워드을 입력하세요.");
                        $("#"+reply_password).focus();
                        return false;
                    }
                     
                    //패스워드와 아이디를 넘겨 패스워드 확인
                    //값 셋팅
                    var objParams = {
                            reply_password  : $("#"+reply_password).val(),
                            reply_id        : reply_id
                    };
                     
                    //ajax 호출
                    /*
                    $.ajax({
                        url         :   "/board/reply/check",
                        dataType    :   "json",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :   "post",
                        async       :   false, //동기: false, 비동기: ture
                        data        :   objParams,
                        success     :   function(retVal){
 
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                            }else{
                                 
                                check = true;
                                                                 
                            }
                             
                        },
                        error       :   function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    */
                    
                    check = true;//패스워드가 맞으면 체크값을 true로 변경
                    
                    if(status){
                		alert("수정과 대댓글은 동시에 불가합니다.");
                		return false;
                	}
                	
                	status = true;
                    
                    if(check){
                    	//자기 위에 댓글 수정창 입력하고 기존값을 채우고 자기 자신 삭제
                    	var txt_reply_content = $(this).parent().prev().prev().prev().html().trim(); //댓글내용 가져오기
                    	if(r_type=="sub"){
                    		txt_reply_content = txt_reply_content.replace("→ ","");//대댓글의 뎁스표시(화살표) 없애기
                    	}
                    	
                    	var txt_reply_writer = $(this).parent().prev().prev().html().trim(); //댓글작성자 가져오기
                    	
                    	//입력받는 창 등록
                        var replyEditor = 
                           '<tr id="reply_add" class="reply_modify">'+
                           '   <td width="820px">'+
                           '       <textarea name="reply_modify_content_'+reply_id+'" id="reply_modify_content_'+reply_id+'" rows="3" cols="50">'+txt_reply_content+'</textarea>'+ //기존 내용 넣기
                           '   </td>'+
                           '   <td width="100px">'+
                           '       <input type="text" name="reply_modify_writer_'+reply_id+'" id="reply_modify_writer_'+reply_id+'" style="width:100%;" maxlength="10" placeholder="작성자" value="'+txt_reply_writer+'"/>'+ //기존 작성자 넣기
                           '   </td>'+
                           '   <td width="100px">'+
                           '       <input type="password" name="reply_modify_password_'+reply_id+'" id="reply_modify_password_'+reply_id+'" style="width:100%;" maxlength="10" placeholder="패스워드"/>'+
                           '   </td>'+
                           '   <td align="center">'+
                           '       <button name="reply_modify_save" r_type = "'+r_type+'" reply_id="'+reply_id+'">등록</button>'+
                           '       <button name="reply_modify_cancel" r_type = "'+r_type+'" r_content = "'+txt_reply_content+'" r_writer = "'+txt_reply_writer+'" reply_id="'+reply_id+'">취소</button>'+
                           '   </td>'+
                           '</tr>';
                        var prevTr = $(this).parent().parent();
                       	//자기 위에 붙이기
                        prevTr.after(replyEditor);
                        
                        //자기 자신 삭제
                        $(this).parent().parent().remove(); 
                    }
                     
                });
                //댓글 수정 취소
                $(document).on("click","button[name='reply_modify_cancel']", function(){
                	//원래 데이터를 가져온다.
                	var r_type = $(this).attr("r_type");
                	var r_content = $(this).attr("r_content");
                	var r_writer = $(this).attr("r_writer");
                	var reply_id = $(this).attr("reply_id");
                	
                	var reply;
                	//자기 위에 기존 댓글 적고 
                	if(r_type=="main"){
                		reply = 
                            '<tr reply_type="main">'+
                            '   <td width="820px">'+
                            r_content+
                            '   </td>'+
                            '   <td width="100px">'+
                            r_writer+
                            '   </td>'+
                            '   <td width="100px">'+
                            '       <input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="패스워드"/>'+
                            '   </td>'+
                            '   <td align="center">'+
                            '       <button name="reply_reply" reply_id = "'+reply_id+'">댓글</button>'+
                            '       <button name="reply_modify" r_type = "main" reply_id = "'+reply_id+'">수정</button>      '+
                            '       <button name="reply_del" reply_id = "'+reply_id+'">삭제</button>      '+
                            '   </td>'+
                            '</tr>';
                	}else{
                		reply = 
                            '<tr reply_type="sub">'+
                            '   <td width="820px"> → '+
                            r_content+
                            '   </td>'+
                            '   <td width="100px">'+
                            r_writer+
                            '   </td>'+
                            '   <td width="100px">'+
                            '       <input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="패스워드"/>'+
                            '   </td>'+
                            '   <td align="center">'+
                            '       <button name="reply_modify" r_type = "sub" reply_id = "'+reply_id+'">수정</button>'+
                            '       <button name="reply_del" reply_id = "'+reply_id+'">삭제</button>'+
                            '   </td>'+
                            '</tr>';
                	}
                	
                	var prevTr = $(this).parent().parent();
                   	//자기 위에 붙이기
                    prevTr.after(reply);
                   	
                  	//자기 자신 삭제
                    $(this).parent().parent().remove(); 
                  	
                    status = false;
                	
                });
                
              	//댓글 수정 저장
                $(document).on("click","button[name='reply_modify_save']", function(){
                	
                	var reply_id = $(this).attr("reply_id");
                	
                	//널 체크
                    if($("#reply_modify_writer_"+reply_id).val().trim() == ""){
                        alert("이름을 입력하세요.");
                        $("#reply_modify_writer_"+reply_id).focus();
                        return false;
                    }
                     
                    if($("#reply_modify_password_"+reply_id).val().trim() == ""){
                        alert("패스워드를 입력하세요.");
                        $("#reply_modify_password_"+reply_id).focus();
                        return false;
                    }
                     
                    if($("#reply_modify_content_"+reply_id).val().trim() == ""){
                        alert("내용을 입력하세요.");
                        $("#reply_modify_content_"+reply_id).focus();
                        return false;
                    }
                	//DB에 업데이트 하고
                	//ajax 호출 (여기에 댓글을 저장하는 로직을 개발)
                	var reply_content = $("#reply_modify_content_"+reply_id).val().replace("\n", "<br>"); //개행처리
                    
                	var r_type = $(this).attr("r_type");
                	
                	var parent_id;
                	var depth;
                	if(r_type=="main"){
                		parent_id = "0";
                		depth = "0";
                	}else{
                		parent_id = $(this).attr("reply_id");
                		depth = "1";
                	}
                	
                    //값 셋팅
                    var objParams = {
                            board_id        : $("#board_id").val(),
                            parent_id       : parent_id, 
                            depth           : depth,
                            reply_writer    : $("#reply_modify_writer_"+reply_id).val(),
                            reply_password  : $("#reply_modify_password_"+reply_id).val(),
                            reply_content   : reply_content
                    };
                    /*
                    $.ajax({
                        url         :   "/board/reply/update",
                        dataType    :   "json",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :   "post",
                        async       :   false, //동기: false, 비동기: ture
                        data        :   objParams,
                        success     :   function(retVal){
 
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                            }else{
                                reply_id = retVal.reply_id;
                            }
                             
                        },
                        error       :   function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    */
                	//수정된댓글 내용을 적고
                    if(r_type=="main"){
                		reply = 
                            '<tr reply_type="main">'+
                            '   <td width="820px">'+
                            $("#reply_modify_content_"+reply_id).val()+
                            '   </td>'+
                            '   <td width="100px">'+
                            $("#reply_modify_writer_"+reply_id).val()+
                            '   </td>'+
                            '   <td width="100px">'+
                            '       <input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="패스워드"/>'+
                            '   </td>'+
                            '   <td align="center">'+
                            '       <button name="reply_reply" reply_id = "'+reply_id+'">댓글</button>'+
                            '       <button name="reply_modify" r_type = "main" reply_id = "'+reply_id+'">수정</button>      '+
                            '       <button name="reply_del" reply_id = "'+reply_id+'">삭제</button>      '+
                            '   </td>'+
                            '</tr>';
                	}else{
                		reply = 
                            '<tr reply_type="sub">'+
                            '   <td width="820px"> → '+
                            $("#reply_modify_content_"+reply_id).val()+
                            '   </td>'+
                            '   <td width="100px">'+
                            $("#reply_modify_writer_"+reply_id).val()+
                            '   </td>'+
                            '   <td width="100px">'+
                            '       <input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="패스워드"/>'+
                            '   </td>'+
                            '   <td align="center">'+
                            '       <button name="reply_modify" r_type = "sub" reply_id = "'+reply_id+'">수정</button>'+
                            '       <button name="reply_del" reply_id = "'+reply_id+'">삭제</button>'+
                            '   </td>'+
                            '</tr>';
                	}
                    
                    var prevTr = $(this).parent().parent();
                   	//자기 위에 붙이기
                    prevTr.after(reply);
                   	
                  	//자기 자신 삭제
                    $(this).parent().parent().remove(); 
                  	
                    status = false;
                	
                });
                 
                //대댓글 입력창
                $(document).on("click","button[name='reply_reply']",function(){ //동적 이벤트
                	
                	if(status){
                		alert("수정과 대댓글은 동시에 불가합니다.");
                		return false;
                	}
                	
                	status = true;
                     
                    $("#reply_add").remove();
                     
                    var reply_id = $(this).attr("reply_id");
                    var last_check = false;//마지막 tr 체크
                     
                    //입력받는 창 등록
                    var replyEditor = 
                       '<tr id="reply_add" class="reply_reply">'+
                       '   <td width="820px">'+
                       '       <textarea name="reply_reply_content" rows="3" cols="50"></textarea>'+
                       '   </td>'+
                       '   <td width="100px">'+
                       '       <input type="text" name="reply_reply_writer" style="width:100%;" maxlength="10" placeholder="작성자"/>'+
                       '   </td>'+
                       '   <td width="100px">'+
                       '       <input type="password" name="reply_reply_password" style="width:100%;" maxlength="10" placeholder="패스워드"/>'+
                       '   </td>'+
                       '   <td align="center">'+
                       '       <button name="reply_reply_save" reply_id="'+reply_id+'">등록</button>'+
                       '       <button name="reply_reply_cancel">취소</button>'+
                       '   </td>'+
                       '</tr>';
                         
                    var prevTr = $(this).parent().parent().next();
                     
                    //부모의 부모 다음이 sub이면 마지막 sub 뒤에 붙인다.
                    //마지막 리플 처리
                    if(prevTr.attr("reply_type") == undefined){
                        prevTr = $(this).parent().parent();
                    }else{
                        while(prevTr.attr("reply_type")=="sub"){//댓글의 다음이 sub면 계속 넘어감
                            prevTr = prevTr.next();
                        }
                         
                        if(prevTr.attr("reply_type") == undefined){//next뒤에 tr이 없다면 마지막이라는 표시를 해주자
                            last_check = true;
                        }else{
                            prevTr = prevTr.prev();
                        }
                         
                    }
                     
                    if(last_check){//마지막이라면 제일 마지막 tr 뒤에 댓글 입력을 붙인다.
                        $('#reply_area tr:last').after(replyEditor);    
                    }else{
                        prevTr.after(replyEditor);
                    }
                     
                });
                 
                //대댓글 등록
                $(document).on("click","button[name='reply_reply_save']",function(){
                                         
                    var reply_reply_writer = $("input[name='reply_reply_writer']");
                    var reply_reply_password = $("input[name='reply_reply_password']");
                    var reply_reply_content = $("textarea[name='reply_reply_content']");
                    var reply_reply_content_val = reply_reply_content.val().replace("\n", "<br>"); //개행처리
                     
                    //널 검사
                    if(reply_reply_writer.val().trim() == ""){
                        alert("이름을 입력하세요.");
                        reply_reply_writer.focus();
                        return false;
                    }
                     
                    if(reply_reply_password.val().trim() == ""){
                        alert("패스워드를 입력하세요.");
                        reply_reply_password.focus();
                        return false;
                    }
                     
                    if(reply_reply_content.val().trim() == ""){
                        alert("내용을 입력하세요.");
                        reply_reply_content.focus();
                        return false;
                    }
                     
                    //값 셋팅
                    var objParams = {
                            board_id        : $("#board_id").val(),
                            parent_id       : $(this).attr("reply_id"), 
                            depth           : "1",
                            reply_writer    : reply_reply_writer.val(),
                            reply_password  : reply_reply_password.val(),
                            reply_content   : reply_reply_content_val
                    };
                     
                    var reply_id;
                     
                    //ajax 호출
                    /*
                    $.ajax({
                        url         :   "/board/reply/save",
                        dataType    :   "json",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :   "post",
                        async       :   false, //동기: false, 비동기: ture
                        data        :   objParams,
                        success     :   function(retVal){
 
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                            }else{
                                reply_id = retVal.reply_id;
                            }
                             
                        },
                        error       :   function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    */
                    
                    reply_id = reply_count++;//DB에 저장했다 하고 순번을 생성
                     
                    var reply = 
                        '<tr reply_type="sub">'+
                        '   <td width="820px"> → '+
                        reply_reply_content_val+
                        '   </td>'+
                        '   <td width="100px">'+
                        reply_reply_writer.val()+
                        '   </td>'+
                        '   <td width="100px">'+
                        '       <input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="패스워드"/>'+
                        '   </td>'+
                        '   <td align="center">'+
                        '       <button name="reply_modify" r_type = "sub" reply_id = "'+reply_id+'">수정</button>'+
                        '       <button name="reply_del" reply_id = "'+reply_id+'">삭제</button>'+
                        '   </td>'+
                        '</tr>';
                         
                    var prevTr = $(this).parent().parent().prev();
                     
                    prevTr.after(reply);
                                         
                    $("#reply_add").remove();
                    
                    status = false;
                     
                });
                 
                //대댓글 입력창 취소
                $(document).on("click","button[name='reply_reply_cancel']",function(){
                    $("#reply_add").remove();
                    
                    status = false;
                });
                 
                //글수정
                $("#modify").click(function(){
                     
                    var password = $("input[name='password']");
                     
                    if(password.val().trim() == ""){
                        alert("패스워드를 입력하세요.");
                        password.focus();
                        return false;
                    }
                                         
                    //ajax로 패스워드 검수 후 수정 페이지로 포워딩
                    //값 셋팅
                    var objParams = {
                            id       : $("#board_id").val(),    
                            password : $("#password").val()
                    };
                                         
                    //ajax 호출
                   	alert("패스워드 체크하고 맞으면 수정페이지로 이동");
                    /*
                    $.ajax({
                        url         :   "/board/check",
                        dataType    :   "json",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :   "post",
                        async       :   false, //동기: false, 비동기: ture
                        data        :   objParams,
                        success     :   function(retVal){
 
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                            }else{
                                location.href = "/board/edit?id="+$("#board_id").val();
                            }
                             
                        },
                        error       :   function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    */
                     
                });
                 
                //글 삭제
                $("#delete").click(function(){
                     
                    var password = $("input[name='password']");
                     
                    if(password.val().trim() == ""){
                        alert("패스워드를 입력하세요.");
                        password.focus();
                        return false;
                    }
                     
                    //ajax로 패스워드 검수 후 수정 페이지로 포워딩
                    //값 셋팅
                    var objParams = {
                            id       : $("#board_id").val(),    
                            password : $("#password").val()
                    };
                    
                    alert("패스워드 체크하고 맞으면 게시글 삭제후 리스트 페이지 이동");
                    /*                 
                    //ajax 호출
                    $.ajax({
                        url         :   "/board/del",
                        dataType    :   "json",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :   "post",
                        async       :   false, //동기: false, 비동기: ture
                        data        :   objParams,
                        success     :   function(retVal){
 
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                            }else{
                                alert("삭제 되었습니다.");
                                location.href = "/board/list";
                            }
                             
                        },
                        error       :   function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    */
                     
                });
                 
            });
        </script>
</head>
<style>
   	.button{
	  background:#2CBFB1;
	  color:#fff;
	  border:none;
	  position:relative;
	  height:50px;
	  font-size:1.2em;
	  padding:0 2em;
	  cursor:pointer;
	  transition:800ms ease all;
	  outline:none;
	}
	.button:hover{
	  background:#fff;
	  color:#2CBFB1;
	}
	.button:before,button:after{
	  content:'';
	  position:absolute;
	  top:0;
	  right:0;
	  height:2px;
	  width:0;
	  background: #2CBFB1;
	  transition:400ms ease all;
	}
	.button:after{
	  right:inherit;
	  top:inherit;
	  left:0;
	  bottom:0;
	}
	.button:hover:before,button:hover:after{
	  width:100%;
	  transition:800ms ease all;
	}
	
	 table {
	 	
	    border-collapse: collapse;
		  }
	  th, td {
	    
	    padding: 10px;
	  }
	/* 삭제버튼 */
	  	.dbutton{
	  background:#F2C2CB;
	  color:#fff;
	  border:none;
	  position:relative;
	  height:50px;
	  font-size:1.2em;
	  padding:0 2em;
	  cursor:pointer;
	  transition:800ms ease all;
	  outline:none;
	}
	.dbutton:hover{
	  background:#fff;
	  color:#F2C2CB;
	}
	.dbutton:before,button:after{
	  content:'';
	  position:absolute;
	  top:0;
	  right:0;
	  height:2px;
	  width:0;
	  background: #F2C2CB;
	  transition:400ms ease all;
	}
	.dbutton:after{
	  right:inherit;
	  top:inherit;
	  left:0;
	  bottom:0;
	}
	.dbutton:hover:before,button:hover:after{
	  width:100%;
	  transition:800ms ease all;
	}
	
	 table {
	 	
	    border-collapse: collapse;
		  }
	  th, td {
	    
	    padding: 10px;
	  }
 /* upbutton */	
	  .ubutton{
	  background:#F2C2CB;
	  color:#fff;
	  border:none;
	  position:relative;
	  height:50px;
	  font-size:1.2em;
	  padding:0 2em;
	  cursor:pointer;
	  transition:800ms ease all;
	  outline:none;
	}
	.ubutton:hover{
	  background:#fff;
	  color:#F2C2CB;
	}
	.ubutton:before,button:after{
	  content:'';
	  position:absolute;
	  top:0;
	  right:0;
	  height:2px;
	  width:0;
	  background: #F2C2CB;
	  transition:400ms ease all;
	}
	.ubutton:after{
	  right:inherit;
	  top:inherit;
	  left:0;
	  bottom:0;
	}
	.ubutton:hover:before,button:hover:after{
	  width:100%;
	  transition:800ms ease all;
	}
	
	 table {
	 	
	    border-collapse: collapse;
		  }
	  th, td {
	    
	    padding: 10px;
	  }
	
	  
	
          textarea{
              width:100%;
            }
             
        .reply_reply {
                border: 2px solid #FF50CF;
            }
        .reply_modify {
                border: 2px solid #FFBB00;
            }
            
            
</style>


<body style="background:#e9ecef;">
  <jsp:include page="../common/header.jsp"/>
  <input type="hidden" id="board_id" name="board_id" value="${boardView.id}" />
  <div  style=" width:70%;background:white; margin:0 auto;">
  <br><br><br>
	  
	  <div style="width:80%; height: 1500px; margin:0 auto; ">
		  <br>
		  <table align="center"  width="100%" border=1px;> 
		    <br><br>
	  <h1 align="center">${board.bNum} 맛잘알 게시판 상세보기</h1>
	    <br><br><br>
	    
	    		 <tr style="background:white" align="center">
	    		 
				  	<td>번호</td> <!-- 나중에 DB갔다온 후 $붙이기 -->
				  	<td>분류</td>
				  	<td width="45%">제목</td>
				  	
				  	<td width="15%">날짜</td>
				  	<td>조회수</td>
				  	<td>추천수</td>
				  	
				  </tr>
		    	 <tr style="background:#dee2e6">
				  	<th>${board.bNum}</th> <!-- 나중에 DB갔다온 후 $붙이기 -->
				  	<th>${board.bCate}</th>
				  	<th width="45%">${board.bTitle}</th>
				  	
				  	<th width="15%">${board.bDate}</th>
				  	<th>${board.bCount}</th>
				  	<th>${board.bHit}</th>
				  	
				  </tr>
					<tr>
						<td colspan="6"  align="right">작성자: ${board.bWriter}</td>
					</tr>
				  <tr>
				 	<td colspan="6" >
				 	${board.bCont }
				 	<br><br><br><br><br><br><br>
				 	<br><br><br><br><br><br><br><br>
				 	<br><br><br><br><br><br><br><br>
				 	</td>
				 </tr>
		  <!--  insert 완료후 작성 -->
	
		 
		 </table>
		   <table border="1" width="100%" bordercolor="#46AA46">
                <tr>
                    <td width="500px">
                        이름: <input type="text" id="reply_writer" name="reply_writer" style="width:170px;" maxlength="10" placeholder="작성자"/>
                        패스워드: <input type="password" id="reply_password" name="reply_password" style="width:170px;" maxlength="10" placeholder="패스워드"/>
                        <button id="reply_save" name="reply_save">댓글 등록</button>
                    </td>
                </tr>
                <tr>
                    <td>
                        <textarea id="reply_content" name="reply_content" rows="4" cols="50" placeholder="댓글을 입력하세요."></textarea>
                    </td>
                </tr>
            </table>
            <table border="1"width="100%" id="reply_area">
                <tr reply_type="all"><!-- 뒤에 댓글 붙이기 쉽게 선언 -->
                    <td colspan="4"></td>
                </tr>
                <!-- 댓글이 들어갈 공간 -->
            </table>
      
     
		 <!-- 댓글 ajax -->
		

			 <br><br> <br><br> <br><br>
	 <div align="center">
			<c:if test="${loginUser.id eq board.bWriter }">
				  	<button class="ubutton" onclick ="UpBoard()">수정하기</button>
			 </c:if>
		  	<button class="button" onclick ="toBlist()" value="boardList.do" >목록</button> 
			 <c:if test="${loginUser.id eq board.bWriter }">
				  	<button class="dbutton" onclick ="DelBoard()">삭제하기</button>
			</c:if>
	</div>

		 <br><br> <br><br> <br><br>
		 <!-- 수정하기 -->
		<!--  <script>
		 	function UpBoard(){
		 		location.href="boardUpView.do?bNum=${board.bNum}";
		 	} 
		 </script> -->
		 
		 <!-- 삭제하기 -->
		 <script>
		 	/* function DelBoard(){
		 		location.href="ndelete.do?nNum=${notice.nNum}";
		 	} */
		 </script>
	
	
	
	
	

<!-- 목록으로~ -->
	<script>
		function toBlist (){
			location.href="boardList.do"; 
		}
	</script>
		  

		  
		  
	 </div> 
  </div>
   <br><br> <br><br> <br><br> <br><br> <br><br> <br><br> <br><br>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>