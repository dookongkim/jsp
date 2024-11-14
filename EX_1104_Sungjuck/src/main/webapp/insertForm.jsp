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
			function send(f){
				let name=f.name.value;
				if(name ===''){
					alert('이름을 입력하시오');
					return;
				}
				let kor=f.kor.value;
				let num_patt=/^[0-9]*$/;
				if( !num_patt.test(kor)){
					alert('점수는 정수로 입력하시오');
					return;
				}
				if(kor ===''){
					alert('점수를 입력하시오');
					return;
				}
				if(kor <0 || kor>100){
					alert('0~100 사이의 값을 입력하시오');
					return;
				}
				let eng=f.eng.value;
				let mat=f.mat.value;
				
				f.method="GET";
				f.action="insertFin.jsp";
				f.submit();
			}
		</script>
	</head>
	<body>
		<form>
		<table border=1>
			<caption>:::학생정보 수정:::</caption>
			<tr>
				<th>이름</th>
				<td>
					<input name="name">
				</td>
			</tr>
			<tr>
				<th>국어</th>
				<td>
					<input name="kor">
				</td>
			</tr>
			<tr>
				<th>영어</th>
				<td>
					<input name="eng">
				</td>
			</tr>
			<tr>
				<th>수학</th>
				<td>
					<input name="mat">
				</td>
			
				<td colspan="2" align="center">
				<input type="button" value="확인" onclick="send(this.form);">
				<input type="button" value="이전" onclick="location.href='sungjuck.jsp'">
				</td>
			</tr>
		</table>
		</form>
	</body>
</html>