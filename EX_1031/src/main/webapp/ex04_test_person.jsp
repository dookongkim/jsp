<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.PersonVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	
	List<PersonVO> pList = new ArrayList<PersonVO>();
	

	PersonVO p1=new PersonVO();
	p1.setName("홍길동");
	p1.setAge(20);
	p1.setTel("010-1324-2323");
	
	PersonVO p2=new PersonVO();
	p2.setName("이길동");
	p2.setAge(25);
	p2.setTel("010-5421-2523");
	
	PersonVO p3=new PersonVO();
	p3.setName("김길동");
	p3.setAge(33);
	p3.setTel("010-1366-9873");
	
	pList.add(p1);
	pList.add(p2);
	pList.add(p3);
	
%>    

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<style>
			table{border-collapse: collapse;}
			td{text-align: center;}
		</style>
	</head>
	<body>
		<table border=1>
	     <caption>::: 개인정보목록 :::</caption>
			<thead>
			<tr>
				<th>이름</th>
				<th>나이</th>
				<th>전화번호</th>
			</tr>	
			</thead>
			
			<tbody>	
			
				<% for(int i=0; i<pList.size(); i++){
					PersonVO p=pList.get(i);
				%>
				<tr>
					<td> <%= p.getName() %> </td>
					<td> <%= p.getAge()  %> </td>
					<td> <%= p.getTel()  %> </td>
				</tr>
				<% } %>
			</tbody>
			
		</table>	
	</body>
</html>

