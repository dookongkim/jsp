<%@page import="org.apache.commons.collections.bag.SynchronizedSortedBag"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int idx=Integer.parseInt(request.getParameter("idx"));
	
	MemberDAO dao=MemberDAO.getInstance();
	int res=dao.delete(idx);
	
	System.out.println("결과 :" +res);
	response.sendRedirect("member_list.jsp");

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