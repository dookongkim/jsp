<%@page import="dao.SungDAO"%>
<%@page import="vo.SungVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int no=Integer.parseInt(request.getParameter("no"));

	SungDAO dao= SungDAO.getInstance();
	int res=dao.delete(no);
	
	System.out.println("delete 결과 : "+res);
	response.sendRedirect("sungjuck.jsp");
	
%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	
	</body>
</html>