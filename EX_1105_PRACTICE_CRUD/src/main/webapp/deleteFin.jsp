<%@page import="dao.SawonDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int sabun=Integer.parseInt(request.getParameter("sabun"));
	SawonDAO dao=SawonDAO.getInstance();
	dao.delete(sabun);
	
	response.sendRedirect("sawon.jsp");
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