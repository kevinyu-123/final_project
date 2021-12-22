<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>News</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Montserrat&family=Outfit:wght@100&family=Playfair+Display+SC&display=swap"
	rel="stylesheet">
<style>
.pagetitle {
	font-size: 30px;
	padding: 15px;
}

table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: center;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}

#bigbox {
	height: 650px;
	display: flex;
}

#left_box {
	width: 20%;
}

#mid_box {
	width: 60%;
	padding-top: 10px;
}

#right_box {
	width: 20%;
}
</style>
</head>
<body>
	<div class="w3-animate-opacity">
		<header>
			<c:import url="../default/header.jsp" />
		</header>


		<div id="bigbox">
			<div id="left_box"></div>

			<div id="mid_box">
				<div class=" w3-animate-left" style="margin-bottom: 20px;">
					<span class="pagetitle"> <b>공지사항</b>
					</span>
				</div>
				<table border="1">
					<tr>
						<th>제목</th>
						<th>작성일</th>
						<th>조회</th>
					</tr>

					<tr>
						<td></td>
						<td></td>
						<td></td>
					</tr>

				</table>

			</div>
			<div id="right_box"></div>
		</div>

		<footer>
			<c:import url="../default/footer.jsp" />
		</footer>
	</div>
</body>
</html>