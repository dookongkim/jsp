<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.PersonVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Map<String,String> map =new HashMap<String,String>();
	map.put("user","test11");
	map.put("pwd","1234");
	map.put("email","aa@naver.com");
	map.put("addr","서울특별시");
	
	//map 을 requestScope에 저장
	request.setAttribute("my_map", map);
	
	PersonVO p1=new PersonVO();
	p1.setName("일길동");
	p1.setEmail("aa@k.com");
	p1.setAge(30);
	
	PersonVO p2=new PersonVO();
	p2.setName("이길동");
	p2.setEmail("two@k.com");
	p2.setAge(24);
	
	request.setAttribute("person",p1);
	
	List <PersonVO> list=new ArrayList<PersonVO>();
	list.add(p1);
	list.add(p2);
	
	request.setAttribute("list",list);
	
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%=map.get("user") %> <br>
		user :${ requestScope.my_map.user} <br>
		pwd : ${my_map.get("pwd") }<br>
		email : ${my_map['email'] }<br>
		addr : ${my_map.addr }<br>
		
		<hr>
		이름 : ${ person.getName() }<br>
		이메일 : ${ person['email'] }<br>
		나이 : ${ person.age }<br>
		
		<hr>
		
		이름1 : ${list[0].name} <br>
		이메일1 : ${list[0].email }<br>
		나이1 : ${list[0].age }<br>
		
		이름2 : ${list[1].name} <br>
		이메일2 : ${list[1].email }<br>
		나이2 : ${list[1].age }<br>
		
		
		
		
	</body>
</html>