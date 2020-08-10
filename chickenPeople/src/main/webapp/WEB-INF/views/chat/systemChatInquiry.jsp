<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
		<thead>
			<tr>
				<th>채팅방 번호</th>
				<th>접속자</th>			
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${totalRoomData }" >
				<tr>
					<c:url var="goChattingAdmin" value="goChattingAdmin">
						<c:param name="room_no" value="${list.chattingRoom_no}"/>
						<c:param name="client_name" value="${loginUser.name }"/>
					</c:url>
					<td><a>${list.chattingRoom_no}</a></td>
					<td><a href="${goChattingAdmin }">${list.client_name}</a></td> 
				</tr>			
			</c:forEach>
		</tbody>
	</table>
</body>
</html>