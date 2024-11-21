<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<link rel="stylesheet" href="css/comm_style.css">
		
		
		<script src="js/httpRequest.js"></script>
		
		<script>
			//보고있는 댓글의 페이지 번호를 저장할 변수
			let comm_page=1;
		
		
			//글에 들어오면, 원래 있던 댓글들을 보여주기
			window.onload=function(){
				comment_list( comm_page );
			}
		
			/* 댓글등록 메서드 */
			function send(f){
				
				let name=f.name.value;
				let content=f.content.value;
				let pwd=f.pwd.value;
				
				if(name===''){
					alert("이름 입력하세요");
					return;
				}
				if(content===''){
					alert("내용 입력하세요");
					return;
				}
				if(pwd===''){
					alert("비밀번호 입력하세요");
					return;
				}
				
				let url="comment_insert.do";
				let param="idx=${vo.idx}&name="+name+
				"&content="+encodeURIComponent(content)+
				"&pwd="+encodeURIComponent(pwd);
				
				sendRequest(url,param,comm_result,"post");
			}
			
			function comm_result(){
				if(xhr.readyState==4 && xhr.status==200){
					
					let data=xhr.responseText;
					let json=(new Function('return '+data)) ();
				
					if(json[0].result === 'yes'){
						//댓글목록 요청
						comment_list(comm_page);
						
					}else{
						alert("등록실패");
						return;
					}
					
				}
				
			}
			
			function comment_list( page ){
				
				comm_page=page;
				
				let url="comment_list.do";
				let param="idx=${vo.idx}&page="+page;
				sendRequest(url,param,comm_list_fn,'post');
				
			}
			
			function comm_list_fn(){
				if(xhr.readyState==4 && xhr.status==200){
					let data=xhr.responseText;
					let disp=document.getElementById("comment_disp");
					disp.innerHTML=data;
					
				}
				
			}
			
		
			function reply(){
				location.href='board_reply.jsp?idx=${param.idx}&page=${param.page}&search=${param.search}&search_text=${param.search_text}';
				
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
				
				let url='del.do?';
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
							
					location.href="list.do?page=${param.page}&search=${param.search}&search_text=${param.search_text}";
					
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
				location.href="upd.do?idx=${vo.idx}&page=${param.page}&search=${param.search}&search_text=${param.search_text}"
					
				
			}
			
			/* 댓글 삭제 */
			function del_comment(f){
				let pwd=f.pwd.value;
				let pwd2=f.pwd2.value;
				let c_idx=f.c_idx.value;
				
				if( pwd !== pwd2 ){
					alert("비밀번호가 틀립니다");
					return;
				}
				if(!confirm("삭제하시겠습니까?") ) {
					return;
				}
				
				
				let param="c_idx="+c_idx;
				let url="comment_del.do";
				sendRequest(url,param,comm_list_del,"post");
				
			}
			
			function comm_list_del(){
				if(xhr.readyState==4 && xhr.status==200){
					let data=xhr.responseText;
					let json= (new Function('return '+data)) ();
					
					if(json[0].result =='yes'){
						alert("삭제 성공");
						comment_list(comm_page);
					}else{
						alert("삭제 실패");
					}
				
				}
			}
		
			
		</script>
	</head>
	
	<body>
		<table width="501" border="1">
			
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
						<img src="img/btn_list.gif" onclick="location.href='list.do?page=${param.page}&search=${param.search}&search_text=${param.search_text }'">
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
			
			<div id=comment_form>
				<form>
					<table>
						<tr>
							<th>작성자</th>
							<td><input name="name"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<textarea name="content" rows="5" cols="30"></textarea>
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td>
								<input type="password" name="pwd">
								<input type="button" value="댓글등록" onclick="send(this.form);">
							</td>
						</tr>
					</table>				
				</form>
			</div>
			
			<div id="comment_disp">
				
			</div>
			
	</body>
</html>










