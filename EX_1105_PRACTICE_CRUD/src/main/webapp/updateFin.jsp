<%@page import="dao.SawonDAO"%>
<%@page import="vo.SawonVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	
	int sabun=Integer.parseInt(request.getParameter("sabun"));
	String saname=request.getParameter("saname");
	String sagen=request.getParameter("sagen");
	int deptno=Integer.parseInt(request.getParameter("deptno"));
	String sajob=request.getParameter("sajob");
	String sahire=request.getParameter("sahire");
	int samgr=Integer.parseInt(request.getParameter("samgr"));
	int sapay=Integer.parseInt(request.getParameter("sapay"));
	
	SawonVO vo=new SawonVO();
	vo.setSabun(sabun);
	vo.setSaname(saname);
	vo.setSagen(sagen);
	vo.setDeptno(deptno);
	vo.setSajob(sajob);
	vo.setSahire(sahire);
	vo.setSamgr(samgr);
	vo.setSapay(sapay);
	
	SawonDAO dao=SawonDAO.getInstance();
	dao.update(vo); 
	
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