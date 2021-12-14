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
	position: relative;
	padding: 50px;
	display: flex;
}

span {
	font-size: 30px;
	font-family: 'Cinzel', serif;
	margin: auto;
}

#header_a {
	display: inlineS-block;
	max-width: 25%;
	position: absolute;
	top: 55px;
	right: 50px;
}

#footer_a {
	display: inlineS-block;
	max-width: 25%;
	height: 100%;
	align-content: space-between;
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
	display: inline-block;
}

.dropdown-content {
	z-index: -1;
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

.a:hover {
	background-color: rgba(223, 209, 204);
}
</style>

</head>

<body>
	<div id="wrap">
		<span><a href="${contextPath }/main"
			style="text-decoration: none">DININGLAB</a></span>
		<div id="loginWrap">

			<c:choose>
				<c:when test="${session_user == null }">
					<a id="header_a" href="${contextPath }/login"> <img
						src="${contextPath}/resources/img/imgMain/loginIcon.png">
					</a>
				</c:when>
				<c:otherwise>
					<!-- 로그인 되어있을 시-->
					<div class="dropdown">
						<button class="dropbtn">
							<img src="${contextPath}/resources/img/imgMain/home.png">
						</button>
						<div class="dropdown-content">
							<a class="a" href="${contextPath }/mypage">MYPAGE</a> <a class="a" href="${contextPath }/mylikes">
								MY LIKES</a> <a class="a" href="${contextPath }/logout">SIGN OUT</a>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>


</body>
</html>