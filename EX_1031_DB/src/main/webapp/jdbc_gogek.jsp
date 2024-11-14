<%@page import="java.util.ArrayList"%>
<%@page import="vo.GogekVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	InitialContext ic=new InitialContext();
	Context ctx=(Context)ic.lookup("java:comp/env");
	DataSource dataSource=(DataSource)ctx.lookup("jdbc/oracle_test");
	Connection conn=dataSource.getConnection();
	System.out.println("ON");
	
	String sql="SELECT * FROM gogek";
	PreparedStatement ps=conn.prepareStatement(sql);
	ResultSet rs=ps.executeQuery();
	
	List<GogekVO> gogek_list=new ArrayList<GogekVO>();
	while( rs.next() ){
		GogekVO vo=new GogekVO();
		
		vo.setGobun(rs.getInt("gobun"));
		vo.setGoname(rs.getString("goname"));
		vo.setGoaddr(rs.getString("goaddr"));
		vo.setGojumin(rs.getString("gojumin"));
		
		gogek_list.add(vo);
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
		<caption>호갱님들 목록</caption>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
				<th>주민번호</th>
			</tr>
			
			<%for(int i=0;i<gogek_list.size();i++){ %>
				<tr>
				<td><%=gogek_list.get(i).getGobun() %></td>
				<td><%=gogek_list.get(i).getGoname() %></td>
				<td><%=gogek_list.get(i).getGoaddr() %></td>
				<td><%=gogek_list.get(i).getGojumin() %></td>
				</tr>
			<%} %>
		</table>
	</body>
</html>





