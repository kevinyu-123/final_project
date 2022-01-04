<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Montserrat&family=Outfit:wght@100&family=Playfair+Display+SC&display=swap"
	rel="stylesheet">

<style>
#poster {
	padding: 10px;
	margin-left: 20px;
	margin-top: 30px;
}
#poster a:hover {
	opacity: 70%;
}
.pagetitle {
	font-size: 30px;
	padding: 15px;
	margin-left: 100px;
}
#write input {
	font-family: 'Gothic A1', sans-serif;
	width: 100px;
	padding: 12px 20px;
	margin: 15px 0;
	box-sizing: border-box;
	border: 2px solid #ccc;
	border-radius: 10px;
	-webkit-transition: 0.1s;
	transition: 0.2s;
}
#write input:focus {
	border: 2px solid #555;
}
#write input:hover {
	font-weight: bold;
}
</style>

<script>
	function writeEvent() {
		location.href = "writeEvent";
	}
</script>
</head>
<body>
	<div class="w3-animate-opacity">
		<header>
			<c:import url="../default/header.jsp" />
		</header>

		<div class=" w3-animate-left"
			style="margin-top: 20px; margin-bottom: 20px; margin-left: 30px;">
			<span class="pagetitle"> <b>EVENT</b>
			</span>
		</div>

		<div style="display: flex; overflow-x: auto;">


			<c:forEach items="${eventList}" var="eventList">
				<div>
					<div id="poster">
					<a href="${contextPath }/eventDetail?img_url=${eventList.img_url}">
							
							
				<img src="${contextPath }/resources/img/event/${eventList.img_url}"
					style="width: 500px; height: 700px;">
					
						</a>
					</div>
				</div>
			</c:forEach>

		</div>
		<footer>
			<c:import url="../default/footer.jsp" />
		</footer>
















	</div>
</body>
</html>