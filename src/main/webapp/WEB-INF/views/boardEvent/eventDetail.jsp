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
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Montserrat&family=Outfit:wght@100&family=Playfair+Display+SC&display=swap"
	rel="stylesheet">
<style>

</style>
</head>
<body>

	<div class="w3-animate-opacity">
		<header>
			<c:import url="../default/header.jsp" />
		</header>

		<div class="w3-center">

			<div style="padding: 20px;">
			
				<!-- ${board.title} -->
				<h2>EVENT TITLE</h2>
				<!-- ${board.img} -->
				<img src="${contextPath }/resources/img/board/eventposter.jpeg"
					style="width: 800px; height: 1200px;">
					
				<div style="font-family: 'Gothic A1', sans-serif; font-size: 20px;">
			<div style="padding:40px;">
			
					<h3>~ 이달의 이벤트 ~</h3>
					<br> 
					<br>
					<!-- board.content -->
					<span> =====내용==== <br>
					
						이벤트 기간 : <br>
						2021-12-01 ~<br>
						 2021-12-31 <br>
					</span>
					</div>

				</div>
				<div style="margin-top: 50px;">
					<a href="event"
						style="text-decoration: none; font-size: 15pt; color: gray;">
						목록으로
						가기 </a>
				</div>
			</div>

		</div>
		<footer>
			<c:import url="../default/footer.jsp" />
		</footer>


	</div>


</body>
</html>