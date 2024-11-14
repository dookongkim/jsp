<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<c:if test="${search_name == null}">검색된 결과가 없습니다</c:if>
		<br>
		<c:if test="${search_name != null}">
		${search_name.saname}님 검색결과 <br>
		사번 : ${ search_name.sabun }<br>
		이름 : ${ search_name.saname }<br>
		성별 : ${ search_name.sagen }<br>
		부서번호 : ${ search_name.deptno }<br>
		직책 : ${ search_name.sajob }<br>
		입사일 :${fn:split(search_name.sahire,' ')[0]}<br>
		상사번호 : ${ search_name.samgr }<br>
		연봉 : ${ search_name.sapay }<br>
		</c:if>
</body>
</html>