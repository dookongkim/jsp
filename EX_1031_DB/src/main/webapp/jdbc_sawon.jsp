<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.SawonVO"%>
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
	//
	Context ctx=(Context)ic.lookup("java:comp/env");
	
	DataSource dataSource=(DataSource)ctx.lookup("jdbc/oracle_test");
	
	Connection conn=dataSource.getConnection();
	
	String sql="SELECT * FROM sawon";
	
	PreparedStatement ps=conn.prepareStatement(sql);
	
	ResultSet rs=ps.executeQuery();
	
	List<SawonVO> sawon_list=new ArrayList<SawonVO>();
	while( rs.next() ){
		SawonVO vo=new SawonVO();
		
		vo.setSabun(rs.getInt("sabun"));
		vo.setSaname(rs.getString("saname"));
		vo.setSagen(rs.getString("sagen"));
		vo.setDeptno(rs.getInt("deptno"));
		vo.setSajob(rs.getString("sajob"));
		vo.setSahire(rs.getString("sahire"));
		vo.setSamgr(rs.getInt("samgr"));
		vo.setSapay(rs.getInt("sapay"));
		
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
		
		<style>
			#hire{ max-width: 85px; /* 최대 너비를 300픽셀로 설정 */
   				   overflow: hidden;
   				   white-space: nowrap; }
		</style>
	</head>
	
	<body>
		<table border=1>
		<caption>노예들 목록</caption>
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>성별</th>
				<th>부서번호</th>
				<th>직급</th>
				<th>입사일</th>
				<th>상사번호</th>
				<th>임금</th>
			</tr>
			
			<%for(int i=0;i<sawon_list.size();i++){ %>
				<tr>
				<td><%=sawon_list.get(i).getSabun() %></td>
				<td><%=sawon_list.get(i).getSaname() %></td>
				<td><%=sawon_list.get(i).getSagen() %></td>
				<td><%=sawon_list.get(i).getDeptno() %></td>
				<td><%=sawon_list.get(i).getSajob() %></td>
				<td id=hire><%=sawon_list.get(i).getSahire() %></td>
				<td><%=sawon_list.get(i).getSamgr() %></td>
				<td><%=sawon_list.get(i).getSapay() %></td>
				</tr>
			<%} %>
		</table>	
			
	</body>
</html>













