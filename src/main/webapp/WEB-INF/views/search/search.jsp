<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리검색</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Montserrat&family=Outfit:wght@100&display=swap"
	rel="stylesheet">

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<style>
body{
	font-family: 'Gothic A1', sans-serif;
}

.wrap {
	position: relative;
	justify-content: center;
	text-align: center;
	width: 940px;
	margin: auto;
	height: 100%;
}

.search {
	height: 60px;
	width: 800px;
	border-radius: 10px;
	background: #ffffff;
	margin: 20px auto 20px;
	background: #ffffff;
}

.search input {
	font-size: 16px;
	width: 700px;
	height: 60px;
	padding: 10px;
	margin-left: 50px;
	outline: none;
	border: 3px solid #ccc;
	border-radius: 30px;
	text-align: center;
	margin: auto;
}

.search .button {
	font-size: 14px;
	font-family: 'Gothic A1', sans-serif;
	box-sizing: border-box;
	border: 1px solid #ddd;
	border-radius: 25px;
	padding: 13px;
	-webkit-transition: 0.3s;
	transition: 0.3s;
	outline: none;
	margin-top: 10px;
	width: 120px;
	
}

.detail {
margin-left:13px;
margin-top: 10px;
}

#detail-btn {
	font-size: 14px;
	font-family: 'Gothic A1', sans-serif;
	box-sizing: border-box;
	border: 1px solid #ddd;
	border-radius: 25px;
	padding: 15px;
	-webkit-transition: 0.3s;
	transition: 0.3s;
	outline: none;
	margin-top: 10px;
	margin: auto;
}

input:hover {
	font-weight: bold;
}
.button:hover{
font-weight: bold;}
</style>


</head>
<body>
	<div class="w3-animate-opacity">
		<header>
			<c:import url="../default/header.jsp" />
		</header>
			<c:import url="../search/nav_bar.jsp"/>
		<div class="wrap" style="margin-top: 200px; height: 400px;">
			<div style="height: 70%;">
				<h1 style="font-family: 'Gothic A1', sans-serif;">아시아의 음식을 한눈에</h1>
				<h3 style="font-family: 'Gothic A1', sans-serif;">코시국에 여행을 할 수
					없다면 먹기라도 하자!</h3>
				<br>

				<form class="search" action="./search_result" method="get">
					<input type="text" name="keyword" placeholder="나라 이름, 음식 또는 지역 검색"
						value="${keyword }"> <br>
					<br>
					<div style="display: flex;">
					
					<div style="margin-left:275px;">
					<button class="button" type="submit" onclick="./search_result.jsp">검색</button>
					</div>
					<div class="detail">
					
					<input type="button" id="detail-btn"
						onclick="location.href='detail_search'"
						style="width: 120px; height: 50px;" value="상세 검색">
			
					
					</div>
					</div>
					</form>

			</div>
			
		</div>
		<footer>
			<c:import url="../default/footer.jsp" />
		</footer>
	</div>
</body>
</html>