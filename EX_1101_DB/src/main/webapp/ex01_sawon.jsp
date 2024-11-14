<%@page import="vo.SawonVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
	int deptno=Integer.parseInt(request.getParameter("deptno"));
	
	InitialContext ic=new InitialContext();
	Context ctx=(Context)ic.lookup("java:comp/env");
	DataSource ds=(DataSource)ctx.lookup("jdbc/oracle_test");
	Connection conn=ds.getConnection();
	
	String sql="SELECT * FROM sawon WHERE deptno="+deptno;
	
	PreparedStatement ps=conn.prepareStatement(sql);
	ResultSet rs=ps.executeQuery();
	
	List<SawonVO> sawon_list=new ArrayList<SawonVO>();
	
	while( rs.next() ){
		SawonVO vo= new SawonVO();
		
		vo.setDeptno(rs.getInt("deptno"));
		vo.setSabun(rs.getInt("sabun"));
		vo.setSaname(rs.getString("saname"));
		vo.setSajob(rs.getString("sajob"));
		
		sawon_list.add(vo);
	}
	
	rs.close();
	ps.close();
	conn.close();
%>   

    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
	</head>
	
	<body>
		<table border=1>
			<caption><%=deptno%>번 부서 사원목록</caption>
			<tr>
				<th>부서번호</th>
				<th>사번</th>
				<th>이름</th>
				<th>직급</th>
			</tr>
			
			<% for(SawonVO vo : sawon_list) {%>
			<tr>
				<td><%= vo.getDeptno() %></td>
				<td><%= vo.getSabun() %></td>
				<td><a href="ex01_gogek.jsp?sabun=<%=vo.getSabun()%>&saname=<%=vo.getSaname()%>&sajob=<%=vo.getSajob()%> " > 
				<%= vo.getSaname() %></a></td>
				<td><%= vo.getSajob() %></td>
			</tr>
			<% } %>
		</table>
	</body>
</html>










