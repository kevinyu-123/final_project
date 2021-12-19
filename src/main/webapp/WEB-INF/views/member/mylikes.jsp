<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>likes</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Outfit:wght@100&display=swap"
	rel="stylesheet">
<style>
* {
	font-family: 'Outfit', sans-serif;
}


#bigbox{
height:100%;
}

#profile {
	text-align: center;
	padding: 20px;
	margin: auto;
}

#profile img {
	width: 50px;
	height: 50px;
}

span {
	text-align: center;
	margin: auto;
	font-size: 30px;
}

#navdiv {
	position: fixed;
	text-align: center;
	list-style-type: none;
}

#navdiv ul {
	margin: 0;
	padding: 0;
	width: 200px;
}

#navdiv ul li {
	list-style-type: none;
}

#navdiv li a {
	font-size: 20px;
	display: block;
	padding: 8px 10px;
	text-decoration: none;
}

#navdiv li:hover {
	background-color: rgba(223, 209, 204);
}

#flex {
	margin-left: 300px;
	margin-top: 50px;
	display: flex;
	position: relative;
}

.pagetitle {
	font-size: 40px;
	padding: 15px;
}
#bigbox {
	height: 650px;
	display: flex;
	overflow: auto;
}
#left_box{
	width: 20%;
}
#mid_box {
	width: 80%;
	padding-top: 10px;
	
}
#re_left{
	width: 50%;
	background-color:#FFF7F7;
	border-radius:20%;
	position: relative;
	height: 310px;
	margin-top: 30px;
	z-index: 1;
}
#re_right{
	width: 50%;
	position: absolute;
	z-index: 50;
	top: -15px;
	
	}
#r{
	width: 350px;
	height: 350px;
	margin-top: 20px;
	margin-left: 50px;	
	border-radius: 65%;
	opacity: 0.9;
}
#r:hover {
	opacity: 1;
}
</style>
</head>
<body>
		<div class="w3-animate-opacity">
		<header>
			<c:import url="../default/header.jsp" />
		</header>
			<div id="div">
				<div id="navdiv">
					<ul>
						<li><a href="mypage"><strong style="font-size: 25px;">My Page</strong></a></li>
						<li><a href="${contextPath}/mylikes">My Likes</a></li>
						<li><a href="${contextPath}/myboard">My Board</a></li>
						<li><a href="${contextPath}/myreply">> My Reply</a></li>
						<li><a href="${contextPath}/newprofile">Account Settings</a></li>
					</ul>
				</div>
				</div>
				<div id="bigbox">
				<div id="left_box"></div>
				<div id="mid_box">
					<div class=" w3-animate-left" style="margin-bottom: 20px;">
						<span class="pagetitle"> <b>MY LIKES</b>
						</span>
					</div>
				<div id="review_box" style="height: 400px; width: 90%; display: flex; position: relative;">
				<div id ="left" style="width: 50%; ">
				<div id="re_left">haha</div>
				<div id="re_right">
					<img id="r" src="${contextPath}/resources/img/imgMain/sam.png">
				</div>
				</div>
				<div id="right" style="width: 50%;">
					<div id="re_left"">haha</div>
					<div id="re_right">
						<img id="r" src="${contextPath}/resources/img/imgMain/no.png">
					</div>	
				</div>
				</div>
				<div id="review_box" style="height: 400px; width: 90%; display: flex;position: relative;">
				<div id ="left" style="width: 50%; ">
				<div id="re_left">haha</div>
				<div id="re_right">
					<img id="r" src="${contextPath}/resources/img/imgMain/1.png">
				</div>
				</div>
				<div id="right" style="width: 50%;">
					<div id="re_left"">haha</div>
					<div id="re_right">
						<img id="r" src="${contextPath}/resources/img/imgMain/2.png">
					</div>	
				</div>
				</div>
				</div>			
			</div>
		<footer>
			<c:import url="../default/footer.jsp" />
		</footer>
</div>
</body>
</html>