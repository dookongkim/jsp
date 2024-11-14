<%@page import="dao.SawonDAO"%>
<%@page import="vo.SawonVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int sabun=Integer.parseInt(request.getParameter("sabun"));
	SawonVO vo= SawonDAO.getInstance().selectOne(sabun);
	
	
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send(f){
				f.action="updateFin.jsp"
				f.submit();
				
			}
		</script>
	</head>
	
	<body>
		<form>	
		<table border=1>
			<caption>:::정보 수정:::</caption>
			<tr>
				<th>사번</th>
				<td><input name="sabun"> ></td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
				<input name="saname" value=<%=vo.getSaname() %>>
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input name="sagen" value=<%=vo.getSagen() %>></td>
			</tr>
			<tr>
				<th>부서번호</th>
				<td><input name="deptno" value=<%=vo.getDeptno() %>></td>
			</tr>
			<tr>
				<th>직급</th>
				<td><input name="sajob" value=<%=vo.getSajob() %>></td>
			</tr>
			<tr>
				<th>입사일</th>
				<td><input name="sahire" type="date" value=<%=vo.getSahire() %>></td>
			</tr>
			<tr>
				<th>매니저번호</th>
				<td><input name="samgr" value=<%=vo.getSamgr() %>></td>
			</tr>
			<tr>
				<th>연봉</th>
				<td><input name="sapay" value=<%=vo.getSapay() %>></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="확인" onclick="send(this.form)">
					<input type="button" value="뒤로" onclick="location.href='sawon.jsp'">
				</td>
			</tr>
		</table>
		</form>
	</body>
</html>