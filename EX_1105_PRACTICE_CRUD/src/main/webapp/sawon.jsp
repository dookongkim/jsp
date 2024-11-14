<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.SawonVO"%>
<%@page import="dao.SawonDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SawonDAO dao=SawonDAO.getInstance();
	List<SawonVO> list= dao.selectList();
%>   
    
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
			<script>
				function updForm(sabun){
					
					location.href="updateForm.jsp?sabun="+sabun;
				}
				function delForm(sabun){
					location.href="deleteFin.jsp?sabun="+sabun;
					
				}
			</script>
	</head>
	<body>
		<table border=1>
			<caption>사원목록</caption>
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>성별</th>
				<th>부서번호</th>
				<th>직급</th>
				<th>입사일</th>
				<th>상사번호</th>
				<th>연봉</th>
				<th>비고</th>
			</tr>
			<%for(SawonVO vo:list){ %>
			<tr>
				<td><%=vo.getSabun() %></td>
				<td><%=vo.getSaname() %></td>
				<td><%=vo.getSagen() %></td>
				<td><%=vo.getDeptno() %></td>
				<td><%=vo.getSajob() %></td>
				<td><%=vo.getSahire() %></td>
				<td><%=vo.getSamgr() %></td>
				<td><%=vo.getSapay() %>만원</td>
				<td colspan="2">
					<input type="button" value="수정" onclick="updForm('<%=vo.getSabun()%>')">
					<input type="button" value="삭제" onclick="delForm('<%=vo.getSabun()%>')">
				</td>
			</tr>
			<%} %>
		</table>
			<input type="button" value="추가" onclick="location.href='insertForm.jsp'">
	</body>
</html>