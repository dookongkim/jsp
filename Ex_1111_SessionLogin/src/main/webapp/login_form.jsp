<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script src="js/httpRequest.js"></script>
		
		<script>
			function send(f){
				let id=f.id.value;
				let pwd=f.pwd.value;
				
				if(id===""){
					alert("아이디를 입력해주세요");
					return;
				}
				if(pwd===""){
					alert("비밀번호를 입력해주세요");
					return;
				}
				let url="login_check.do";
				let param="id="+id+"&pwd="+encodeURIComponent(pwd);
				sendRequest(url,param,resultFn,"POST");
				
			}
			
			function resultFn () {
				if(xhr.readyState==4 && xhr.status ==200){
					let data=xhr.responseText.trim();
					let json=(new Function('return' +data))();
					
					if(json[0].param=='no_id'){
						alert("아이디가 존재하지 않습니다");
					}else if(json[0].param=="no_pwd"){
						alert("비밀번호가 틀립니다");
					}else{
						location.href="main_content.jsp";
					}
				}
			}
		</script>
	</head>
	
	<body>
		<form>
			<table border=1 align="center">
				<caption >:::로그인:::</caption>
				<tr>
					<th>아이디</th>
					<td><input name="id"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input name="pwd" type="password"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="로그인" onclick="send(this.form)">
					</td>
				</tr>		
			</table>
			
		</form>
		
	</body>
</html>