<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	       <ol>
              <c:forEach var="rec" items="${list }">
              <li>${rec }</li>
              </c:forEach>
           </ol>
	       <ul>
              <c:forEach var="ingre" items="${ingredients }">
              <li>${ingre }</li>
              </c:forEach>
           </ul>
</body>
</html>