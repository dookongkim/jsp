<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	
		<script>
			function search(){
				let search_name=document.getElementById("search_name").value;
				
				if(search_name){
					window.location.href="sawon_search.do?saname="+search_name;
				}else{
					alert("검색할 이름을 입력해주세요");
				}
				
			}
			
			
		</script>
	</head>
	<body>
	
		<table border="1">
			<caption>:::사원목록:::
			<input id="search_name">
			<input type="button" value="검색" onclick="search()">
	
			
			</caption>
			
			<tr>
				<th>사번</th>
				<th>사원이름</th>
				<th>성별</th>
				<th>입사일</th>
				<th>비고</th>

			</tr>
			<c:forEach var="vo" items="${list}">
				<tr>
					<td>${vo.sabun }</td>
					<td>${vo.saname }</td>
					<td>${vo.sagen }</td>
					<td>${fn:split(vo.sahire,' ')[0]}</td>
					<td colspan="3">
					<input type="button" value="상세보기" onclick="location.href='sawon_detail.do?sabun=${vo.sabun}'">
					<input type="button" value="삭제" onclick="location.href='delete_sawon.do?sabun=${vo.sabun}'">
					<input type="button" value="수정" onclick="location.href='update_sawon.do?'">
					</td>
				</tr>
			</c:forEach>
			
			<tr>
				<td colspan="5"><input type="button" value="사원등록" onclick="location.href='sawon_insert_form.jsp'"></td>
			</tr>
		</table>
		
	</body>
</html>