<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
%>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send( f ){
				let name=f.name.value;
				let id=f.id.value;
				if( name === ''){
					alert("이름을 입력하세요");
					f.name.focus();
					return;
				}
				if( id === ''){
					alert('아이디를 입력하세요');
					f.id.focus();
				}
				f.method="POST";
				f.action="insertFin.jsp";
				f.submit();
				
			}
		</script>
	</head>
	<body>
		<form>
		<table border=1>
			<caption>회원 추가</caption>
			<tr>
				<th>이름</th>
				<td><input name="name"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input name="id"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input name="pwd" type="password"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input name="email"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input name="addr"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="확인" onclick="send(this.form);">
					<input type="button" value="이전" onclick="location.href='member_list.jsp'">
				</td>
			</tr>
			
		</table>
		</form>
	</body>
</html>