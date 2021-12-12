<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Outfit:wght@100&display=swap"
	rel="stylesheet">
<style>
#footer {
	margin: 0;
	display: flex;
	bottom: 0;
	
}

#box1 ul {
	margin-left: 500px; list-style : none;
	display: flex;
	list-style: none;
}

#box1 li {
	padding: 8px;
}

#box1 a {
	text-decoration: none;
}

#box2 ul {
	margin-right: 20px; list-style : none;
	display: flex;
	list-style: none;
}

#box2 li {
	padding: 8px;
}

#box2 a {
	text-decoration: none;
}
</style>
</head>

<body>
	<div id="footer" style="z-index: 10000;">
		<div id="box1" style="width: 80%;">
			<ul>
				<li><a href="#">About us</a>&nbsp;&nbsp;|</li>
				<li><a href="#">Site map</a>&nbsp;&nbsp;|</li>
				<li><a href="#">News</a>&nbsp;&nbsp;|</li>
				<li><a href="#">Event</a></li>
			</ul>
		</div>
		<div id="box2"
			style="width: 20%;">

			<ul>
				<li><a href="#"><img
						src="${contextPath }/resources/img/imgMain/facebook.png"></a></li>
				<li><a href="#"><img
						src="${contextPath }/resources/img/imgMain/instagram.png"></a></li>
				<li><a href="#"><img
						src="${contextPath }/resources/img/imgMain/twitter.png"></a></li>
				<li><a href="#"><img
						src="${contextPath }/resources/img/imgMain/github.png"></a></li>
			</ul>

		</div>
	</div>
</body>
</html>