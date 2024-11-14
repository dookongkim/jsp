<%@page import="vo.SungVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.SungDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	SungDAO dao= SungDAO.getInstance();
	List <SungVO> list=dao.selectList();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function sj_update(no,name,kor,eng,mat) {
				
				let f=document.getElementById("ff");
				f.no.value=no;
			 	f.name.value=name;
				f.kor.value=kor;
				f.eng.value=eng;
				f.mat.value=mat; 
				
				f.action="updForm.jsp";
				f.method="post";
				f.submit();
			}
			
			function sj_delete(no){
				
				let f=document.getElementById("ff");
				f.no.value=no;
				
				f.action="deleteFin.jsp";
				f.submit();
			}
			
			
			
		</script>
	</head>
	<body>
		<form id='ff'>
			<input type="hidden" name="no">
			<input type="hidden" name="name">
			<input type="hidden" name="kor">
			<input type="hidden" name="eng">
			<input type="hidden" name="mat">
			
		<table border=1>
			<caption>학생정보</caption>
			
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>국어</th>
				<th>영어</th>
				<th>수학</th>
				<th>총점</th>
				<th>평균</th>
				<th>등수</th>
				<th colspan="2">비고</th>
				
			</tr>
			
			<%for(SungVO vo:list){ %>
			<tr>
				<td><%=vo.getNo() %></td>
				<td><%=vo.getName() %></td>
				<td><%=vo.getKor() %></td>
				<td><%=vo.getEng() %></td>
				<td><%=vo.getMat() %></td>
				<td><%=vo.getSum() %></td>
				<td><%=vo.getAvg() %></td>
				<td><%=vo.getRank() %></td>
				<td>
					<input type="button" value="수정" 
					onclick="sj_update('<%=vo.getNo()%>','<%=vo.getName()%>',
					'<%=vo.getKor()%>','<%=vo.getEng()%>','<%=vo.getMat()%>')">
				</td>
				
				<td>
					<input type="button" value="삭제" onclick="sj_delete(<%=vo.getNo()%>)">
				</td>
			</tr>
			<%} %>
			<tr>
				<td colspan="10" align='right'>
				<input type="button" value="추가" onclick="location.href='insertForm.jsp'">
				</td>
			</tr>
		</table>
		</form>
	</body>
</html>