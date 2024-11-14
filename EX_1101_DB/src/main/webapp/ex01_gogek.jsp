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
	String sabun=request.getParameter("sabun");
	String saname=request.getParameter("saname");
	String sajob=request.getParameter("sajob");

	InitialContext ic=new InitialContext();
	Context ctx=(Context)ic.lookup("java:comp/env");
	DataSource ds=(DataSource)ctx.lookup("jdbc/oracle_test");
	Connection conn=ds.getConnection();
	
	String sql="SELECT * FROM gogek WHERE godam="+sabun;
	PreparedStatement ps=conn.prepareStatement(sql);
	ResultSet rs=ps.executeQuery();
	
	List<GogekVO> gogek_list=new ArrayList<GogekVO>();
	
	while( rs.next() ){
		GogekVO vo=new GogekVO();
		
		vo.setGobun(rs.getInt("gobun"));
		vo.setGoname(rs.getString("goname"));
		vo.setGoaddr(rs.getString("goaddr"));
		
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
			<caption><%=saname+" "+sajob%>의 고객목록</caption>
			<tr>
				<th>고객번호</th>
				<th>고객명</th>
				<th>주소</th>
			</tr>
			
			<%for(GogekVO vo :gogek_list){ %>
			<tr>
				<td><%=vo.getGobun() %></td>
				<td><%=vo.getGoname() %></td>
				<td><%=vo.getGoaddr() %></td>
			</tr>
			<%} %>
			
		</table>
	
	</body>
</html>









