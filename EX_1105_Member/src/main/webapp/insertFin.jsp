<%@page import="java.util.List"%>
<%@page import="dao.MemberDAO"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	
	//POST 타입으로 넘어온 데이터 인코딩
	request.setCharacterEncoding("UTF-8");

	String name=request.getParameter("name");
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String email=request.getParameter("email");
	String addr=request.getParameter("addr");
	
	MemberVO vo=new MemberVO();
	
	vo.setName(name);
	vo.setId(id);
	vo.setPwd(pwd);
	vo.setEmail(email);
	vo.setAddr(addr);
	
	MemberDAO dao=MemberDAO.getInstance();
	dao.insert(vo);
	
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