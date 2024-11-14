<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
	</head>
	
	<body>
		<jsp:include page="check_login.jsp"/>
		여기는 로그인이 됐을때만 접근 가능함	<br>
		${sessionScope.user.name}님 ㅎㅇ<br>
		<input type="button" value="로그아웃" onclick="location.href='logout.do'">
	</body>
</html> 