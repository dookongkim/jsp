<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- JSP : java server page 
    	 내부적으로 연산능력을 갖는 html이다 -->
<%
	//스크립트릿( scriptlet ) : jsp에서, 자바코드를 사용하고자 할 때, 지정하는 영역
	String ip=request.getRemoteAddr(); 
	String name= "홍길동";

	
%>    
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<p>&lt;%@ 내용1234 %&gt; :jsp 의 헤더영역 - 페이지 incoding, import 문장들을 정의하기 위해 꼭 필요한 영역</p>
	
		<p>&lt;% 자바코드 %&gt; : 스크립트 릿 - jsp 에서 자바코드를 구현하기 위해 지정하는 영역</p>
		
		<p>&lt;%= 변수명 %&gt; : 스크립트 릿의 출력코드 - 스크립트 릿의 변수값을 출력하는 영역 </p>
		
		<p>&lt;%= 변수명; %&gt; : 출력코드 내부에 ; 을 포함할수 없다 </p>
		 
		<p><%=ip%> / <%=name %>님 ㅎㅇ</p>
	</body>
</html>