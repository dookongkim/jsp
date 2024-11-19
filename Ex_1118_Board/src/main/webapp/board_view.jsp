<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script src="js/httpRequest.js"></script>
		
		<script>
			function reply(){
				location.href='board_reply.jsp?idx=${param.idx}';
				
			}
			
			
			function del(){
				let c_pwd=document.getElementById("c_pwd").value;
				
				if('${vo.pwd}' != c_pwd){
					alert('비밀번호 불일치');
					return;
				}
				
				if( !confirm('삭제 하시겠습니까?')){
					return;
				}
				
				let url='del.do';
				let param="idx=${vo.idx}";
				
				sendRequest(url,param,resultFn,"post");
				
			}
			
			function resultFn(){
				if(xhr.readyState==4 && xhr.status==200){
					let data=xhr.responseText;
					let json= (new Function('return '+data)) ();
					
					if(json[0].result ==='succ'){
						alert("삭제 성공");
					}else{
						alert("삭제 실패");
					}
							
					location.href="list.do";
					
				}
			}
			
			function upd(){
				let c_pwd=document.getElementById("c_pwd").value;
				
				if('${vo.pwd}' != c_pwd){
					alert('비밀번호 불일치');
					return;
				}
				
				if( !confirm('수정 하시겠습니까?')){
					return;
				}
				location.href="upd.do?idx=${vo.idx}"
				let url='upd.do';
				let param="idx=${vo.idx}";
				
				sendRequest(url,param,updFn,"post");
				
			}
		
			
		</script>
	</head>
	
	<body>
		<table width="700" border="1">
			
				<tr>
					<th width="120">제목</th>
					<td>${vo.subject }</td>
				</tr>
				
				<tr>
					<th width="120">작성자</th>
					<td>${vo.name }</td>
				</tr>
				
				<tr>
					<th width="120">내용</th>
						<td>
							<pre>${vo.content }</pre>
						</td>
				</tr>
				<tr>
					<th width="120">아이피</th>
					<td>${vo.ip }</td>
				</tr>
				<tr>
					<th width="120">작성일</th>
					<td>${vo.regdate }</td>
				</tr>
				<tr>
					<th width="120">조회수</th>
					<td>${vo.readhit }</td>
				</tr>
			
				<tr>
					<th>비밀번호</th>	
					<td colspan="1">
						<input type="password" id="c_pwd">
					</td>
				</tr>
			
			
				<tr>
					<td colspan="2" align="right">
						<!--목록으로 돌아가기  -->
						<img src="img/btn_list.gif" onclick="location.href='list.do'">
						<c:if test="${vo.depth eq 0 }">
							<!--답변  -->
							<img src="img/btn_reply.gif" onclick="reply()">
						</c:if>
						<!--수정  -->
						<img src="img/btn_modify.gif" onclick="upd()">
						<!--삭제  -->
						<img src="img/btn_delete.gif" onclick="del()">
					</td>
				</tr>
				
					
				
				
			</table>
	
	</body>
</html>