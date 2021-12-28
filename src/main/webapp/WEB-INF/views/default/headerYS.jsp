<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Cinzel&display=swap"
	rel="stylesheet">
	
<title>DiningLab</title>
<style>
#wrap {
	padding: 50px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}
#title span{
	font-size:24px;
	margin:auto;
	text-align: center;
	font-family: 'Cinzel', serif;
}

a {
	display: inlineS-block;
	max-width: 25%;
	float: right;
	height: 100%;
	min-width: 120px;
}

img {
	width: 30px;
	height: 30px;
}

.dropbtn {
	right: 20%;
	background-color: white;
	color: white;
	padding: 16px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: white;
	min-width: 120px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown:hover .dropdown-content {
	display: block;
}
</style>
</head>

<body>
	<div id="wrap">
	
		<div></div>

		<div id="title">
			<span>DININGLAB</span>
		</div>


		<div id="loginWrap">
<!--  
로그인 안되있을 때 회원가임창 register로 이동
<a href="register">
<img src="resources/image/loginIcon.png"></a>
-->


			
				<!-- 로그인 되어있을 시-->
				<div class="dropdown">
					<button class="dropbtn">
						<img src="resources/imgMain/loginIcon.png">
					</button>
					<div class="dropdown-content">
						<a href="#">MYPAGE</a> <a href="#"> MY LIKES</a> <a href="#">SIGN
							OUT</a>
					</div> 
				</div>
			</div>
		</div>
	</body>
</html>