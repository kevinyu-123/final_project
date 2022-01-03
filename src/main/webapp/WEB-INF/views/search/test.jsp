<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<br>
	<c:if test="${viewAll.size() == 0 }">
		no data
	</c:if>
	<c:forEach items="${viewAll }" var="dto">
		<p>name : ${dto.foodName }</p>
		<p>comment : ${dto.foodComment }</p>
		<p>nation : ${dto.nation }</p>
		<br><hr>
	</c:forEach>
</body>
</html>