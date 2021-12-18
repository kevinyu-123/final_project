<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DiningLab</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@100;200&family=Montserrat:wght@300&family=Outfit:wght@100&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
#wrap {
	position: relative;

	display: flex;
}

#wrap span {
	font-family: 'Cinzel', serif;
	font-size: 30px;
margin:auto;
}

#wrap img {
	width: 30px;
	height: 30px;
}

#wrap .dropbtn {
	right: 20%;
	background-color: white;
	color: white;
	padding: 16px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

#wrap .dropdown {
	display: inline-block;
}

#wrap .dropdown-content {
	font-family: 'Montserrat', sans-serif;
	z-index: -1;
	display: none;
	position: absolute;
	background-color: white;
	min-width: 120px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

#wrap .dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

#wrap .dropdown:hover .dropdown-content {
	display: block;
}

#wrap .a:hover {
	background-color: rgba(223, 209, 204);
}
#loginWrap{
margin-top: 17px;
margin-right:10px;

}
</style>

</head>

<body>
	<div id="wrap">
		<div>
			<img src="${contextPath }/resources/img/imgMain/h2.gif"
				style="width: 100px; height: 100px;">
		</div>

		<span><a href="${contextPath }/main"
			style="text-decoration: none;"><b>DININGLAB</b></a></span>

		<div id="loginWrap">
			<c:choose>
				<c:when test="${session_user == null }">
					<div class="dropdown">
						<a class="dropbtn" href="${contextPath }/naverlogin"> <img
							src="${contextPath}/resources/img/imgMain/account.png"
							style="margin-top:12px;">
							
						</a>

					</div>
				</c:when>
				<c:otherwise>
					<!-- 로그인 되어있을 시-->
					<div class="dropdown">
						<button class="dropbtn">
							<img src="${contextPath}/resources/img/imgMain/home.png">
						</button>
						<div class="dropdown-content">
							<a class="a" href="${contextPath }/mypage">MYPAGE</a> <a
								class="a" href="${contextPath }/mylikes">MY LIKES</a> <a
								class="a" href="${contextPath }/logout">SIGN OUT</a>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>


</body>
</html>