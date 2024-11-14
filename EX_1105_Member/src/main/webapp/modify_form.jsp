<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int idx=Integer.parseInt(request.getParameter("idx"));
	MemberVO vo=MemberDAO.getInstance().selectOne(idx);
	
	request.setAttribute("name",vo.getName());
	request.setAttribute("id",vo.getId());
%>    
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script>
			function send(f){
			
				//let idx=f.idx.value;
				
				f.method="POST";
				f.action="modify_fin.jsp";
				f.submit();
			}
			
		</script>
	</head>
	<body>
		<form>
		<table border=1>
			<caption>회원정보 수정</caption>
			<tr>
				<th>이름</th>
				<td><input name="name" value="${name}"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input name="id" value="${id}"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input name="pwd"  type="password" value=<%=vo.getPwd()  %>></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input name="email" value=<%=vo.getEmail() %>></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input name="addr" value=<%=vo.getAddr() %>></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="확인" onclick="send(this.form);">
					<input type="button" value="이전" onclick="location.href='member_list.jsp'">
				</td>
			</tr>
			
		</table>
			<input name="idx" type="hidden" value=<%=vo.getIdx() %> >
		</form>
	</body>
</html>