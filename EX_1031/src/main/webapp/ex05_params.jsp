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
				let age=f.age.value;
				let tel=f.tel.value;
				
				let num_pattern = /^[0-9]*$/;
				
				 if( !num_pattern.test(age) ){
					alert("age 숫자입력");
					return;
				} 
				
				f.action="ex05_request.jsp";
				f.method="post";
				f.submit();
				
			}
		</script>
	</head>
	
	<body>
		<form>
			이름 : <input name="name"><br>
			나이 : <input name="age"><br>
			전화번호 : <input name="tel"><br>
			
			<input type="button" value="전송" onclick="send(this.form)">
		</form>		
	</body>
</html>