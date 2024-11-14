<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script src="js/httpRequest.js"></script>
		
		<script>
		function update(f){
			let url="member_update.do";
			let param="idx="+f.idx.value+"&id="+f.id.value+"&pwd="+encodeURIComponent(f.pwd.value)+
			"&name="+f.name.value+"&email="+encodeURIComponent(f.email.value)+"&addr="+f.addr.value;
			//encodeURIComponent : !,#,@ 등 특수문자가 들어가 있을 때, 파라미터 전달에 문제가 생기지 않게 인코딩 해줌
			
			
			sendRequest(url,param,updFn,"POST");
			
		}
		
		function updFn(){
			if(xhr.readyState ==4 && xhr.status==200){
																																
				let data=xhr.responseText;
				
				let data_json=(new Function('return '+data ))();
				
				if(data_json[0].param==='yes'){
					alert('수정 성공');
					location.href="member_list.do";
				}else{
					alert('수정 실패');
					return;
				}
				
			}
			
		}
			
		</script>
		
	</head>
	<body>
		<form>
			<input name="idx" type="hidden" value="${vo.idx }">
			
			<table border="1">
				<caption>::: 회원정보수정 :::</caption>
				<tr>
					<th>아이디</th>
					<td><input name="id" value="${vo.id }"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input name="pwd" type="password" value="${vo.pwd }"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input name="name" value="${vo.name }"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input name="email" value="${vo.email }"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input name="addr" value="${vo.addr }"></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="정보수정" onclick="update(this.form);">
						<input type="button" value="취소" onclick="history.back();">
					</td>
				</tr>
			</table>
		</form>	
	</body>
</html>