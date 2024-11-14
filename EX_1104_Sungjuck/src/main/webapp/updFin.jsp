<%@page import="dao.SungDAO"%>
<%@page import="vo.SungVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	int no=Integer.parseInt(request.getParameter("no"));
	String name=request.getParameter("name");
	int kor=Integer.parseInt(request.getParameter("kor"));
	int eng=Integer.parseInt(request.getParameter("eng"));
	int mat=Integer.parseInt(request.getParameter("mat"));
	
	//파라미터로 받은 정보들을 VO로 저장
	SungVO vo=new SungVO();
	vo.setNo(no);
	vo.setName(name);
	vo.setKor(kor);
	vo.setEng(eng);
	vo.setMat(mat);
	
	//VO를 DAO에 전달
	SungDAO dao= SungDAO.getInstance();
	int res=dao.update( vo );
	System.out.println("update 결과 : "+res);
	
	
	//수정이 완료되었으므로 화면을 student.jsp 로 전환
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