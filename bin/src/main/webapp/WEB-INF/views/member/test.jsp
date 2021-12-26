<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>likes</title>
<body>
<form action="likeList">
	${session_user }
	<input type="text" id="session_id" name="session_id"
		value="${session_user}" style="display: none;" />
		<input type="submit" value="dd">
</form>
</body>
</html>
