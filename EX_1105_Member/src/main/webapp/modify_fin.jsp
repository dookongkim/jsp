<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");

	String name=request.getParameter("name");
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String email=request.getParameter("email");
	String addr=request.getParameter("addr"); 
	
	int idx=Integer.parseInt(request.getParameter("idx"));
	
	
	MemberVO vo=new MemberVO();
	
	vo.setName(name);
	vo.setId(id);
	vo.setPwd(pwd);
	vo.setEmail(email);
	vo.setAddr(addr);
	vo.setIdx(idx);

	int res=MemberDAO.getInstance().update(vo);
	
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