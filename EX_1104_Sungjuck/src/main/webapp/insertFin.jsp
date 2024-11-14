<%@page import="vo.SungVO"%>
<%@page import="dao.SungDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	String name=request.getParameter("name");
	int kor=Integer.parseInt(request.getParameter("kor"));
	int eng=Integer.parseInt(request.getParameter("eng"));
	int mat=Integer.parseInt(request.getParameter("mat"));
	
	
	SungVO vo=new SungVO();
	
	vo.setName(name);
	vo.setKor(kor);
	vo.setEng(eng);
	vo.setMat(mat);
	
	SungDAO dao= SungDAO.getInstance();
	int res=dao.insert( vo );
	System.out.println("insert 결과 : "+res);
	
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