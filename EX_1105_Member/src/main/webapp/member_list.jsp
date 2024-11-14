<%@page import="vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	MemberDAO dao=MemberDAO.getInstance();
	List<MemberVO> list= dao.selectList();
	
%>    


	<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function delMem(idx){
				if(confirm("정말 삭제하시겠습니까 ?")==false){
					return;
				}
				
				location.href="deleteFin.jsp?idx="+idx;
			}
			
			function modify(idx) {
				location.href="modify_form.jsp?idx="+idx;
			}
		</script>
		
	</head>
	<body>
		<form id="fff">
		<table border=1>
			<caption>:::회원목록:::</caption>
			<tr>
				<th>회원번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이메일</th>
				<th>주소</th>
				<th>비고</th>
			</tr>
			
			<%for(MemberVO vo:list){ %>
			<tr>
				<td><%=vo.getIdx() %></td>
				<td><%=vo.getName() %></td>
				<td><%=vo.getId() %></td>
				<td><%=vo.getPwd() %></td>
				<td><%=vo.getEmail() %></td>
				<td><%=vo.getAddr()%></td>
				<td colspan="2">
				<input type="button" value="삭제" onclick="delMem('<%=vo.getIdx()%>')">
				<input type="button" value="수정" onclick="modify('<%=vo.getIdx()%>')">
				</td>
			</tr>
			<%} %>
			
			<tr>
				<td colspan="7">
					<input type="button" value="추가" 
					onclick="location.href='insertForm.jsp'">
				</td>
			</tr>
		</table>
		</form>
	</body>
	</html>
	
	
	
	
	
	
	
	