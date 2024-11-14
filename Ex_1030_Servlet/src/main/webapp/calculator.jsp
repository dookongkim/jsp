<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send( f ){
				let num1=f.num1.value;
				let num2=f.num2.value;
				
			 	if(num1===''||num2===''){
					alert("숫자를 입력하세요");
					return;
				} 
				
			 	let num_pattern = /^[0-9]*$/;
			 	if(!num_pattern.test(num1)||!num_pattern.test(num2)){
			 		alert("숫자만 입력하세요");
			 		return;
			 	}
			 	
				f.action="calc.do";
				f.method="get";
				f.submit();
				
			}
		</script>
	</head>
	<body>
		<form>
			수1 : <input name="num1" placeholder="1번숫자 입력"><br>
			수2 : <input name="num2" placeholder="2번숫자 입력"><br>
			<input type="button" value="확인" onclick="send(this.form);">
		</form>
	</body>
</html>