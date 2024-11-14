<%@page import="vo.GogekVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.GogekDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	GogekDAO dao=GogekDAO.getInstance();
	List <GogekVO> gogek_list=dao.selectList();
%>    
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<table border=1>
			<caption>고객목록</caption>
			
			<tr>
				<th>고객번호</th>
				<th>고객이름</th>
				<th>주소</th>
				<th>주민번호</th>
				<th>담당자 번호</th>
			</tr>
			
			<%for(GogekVO vo:gogek_list){ %>
			<tr>
				<td> <%=vo.getGobun() %></td>
				<td> <%=vo.getGoname() %></td>
				<td> <%=vo.getGoaddr() %></td>
				<td> <%=vo.getGojumin() %></td>
				<td> <%=vo.getGodam() %></td>
			</tr>
			<%} %>
		</table>
	</body>
</html>