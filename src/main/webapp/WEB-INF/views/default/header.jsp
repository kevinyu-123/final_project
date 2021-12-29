<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DiningLab</title>
<link rel="stylesheet" href="${contextPath }/resources/css/mainPage.css">
<link rel="stylesheet" href="${contextPath }/resources/css/nicepage.css"
	media="screen">
<link rel="stylesheet" href="${contextPath }/resources/css/Home1.css"
	media="screen">
<script class="u-script" type="text/javascript"
	src="${contextPath }/resources/js/jquery.js" defer=""></script>
<script class="u-script" type="text/javascript"
	src="${contextPath }/resources/js/nicepage.js" defer=""></script>
<meta name="generator" content="Nicepage 4.2.6, nicepage.com">
<link id="u-theme-google-font" rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
<link id="u-page-google-font" rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@100;200&family=Montserrat:wght@300&family=Outfit:wght@100&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="${contextPath }/resources/css/default/header.css">
<script src="https://c	ode.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<style>
</style>
<body>
	<div id="wrap">
		<div style="margin-left: 40px;">
			<a href="${contextPath}/map/mapmain"><img
				src="${contextPath }/resources/img/imgMain/h2.gif"
				style="width: 100px; height: 100px;"></a>
		</div>

		<span><a href="${contextPath }/main"
			style="text-decoration: none;"><b>DININGLAB</b></a></span>

		<div id="loginWrap">
			<c:choose>
				<c:when test="${session_user == null }">
					<div class="dropdown">
						<a class="dropbtn" href="${contextPath }/naverlogin"> <img
							src="${contextPath}/resources/img/imgMain/account.png"
							style="margin-top: 15px;">

						</a>

					</div>
				</c:when>
				<c:otherwise>
				<c:choose>
				<c:when test="${session_user eq '운영진' }">
				<div class="dropdown">
						<a class="dropbtn" href="${contextPath }/mypage"> <img
							src="${contextPath}/resources/img/imgMain/home.png"
							style="margin-top: 15px;">
						</a>
				
							<div class="dropdown-content">
							<a class="a" href="${contextPath }/mypage">MYPAGE</a> 
							<a class="a" href="${contextPath }/logout">SIGN OUT</a>
						</div>

					</div>
				</c:when>
				<c:otherwise>
				<!-- 로그인 되어있을 시-->
					<div class="dropdown">
						<a class="dropbtn" href="${contextPath }/mypage"> <img
							src="${contextPath}/resources/img/imgMain/home.png"
							style="margin-top: 15px;">
						</a>
				
							<div class="dropdown-content">
							<a class="a" href="${contextPath }/mypage">MYPAGE</a> 
							<a class="a" href="${contextPath }/mylikes">MY LIKES</a> 
							<a class="a" href="${contextPath }/logout">SIGN OUT</a>
						</div>

					</div>
				</c:otherwise>
				</c:choose>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>