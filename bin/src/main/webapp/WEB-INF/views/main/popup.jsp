
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이달의이벤트</title>
<script>
	function notPopup() {
		location.href = "cookieChk";
	}
</script>
</head>
<body>
	<div>
		<div>
			<img src="${contextPath }/resources/img/board/eventposter.jpeg"
				style="width: 100%; height: 100%;">
		</div>

		<div style="margin: auto; height: 20%; text-align: center;">
			<input type="checkbox" onclick="notPopup()">하루동안 열지 않기
		</div>
	</div>
</body>
</html>