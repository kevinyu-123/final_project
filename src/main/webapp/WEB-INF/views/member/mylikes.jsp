<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
height:100%;}

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
</style>
</head>
<body>
	<div class="w3-animate-opacity">
		<header>
			<c:import url="../default/header.jsp" />
		</header>
		<div id="bigbox">
			<div class="w3-center w3-animate-top" style="margin-bottom: 20px;">
				<span class="pagetitle"> <b>My Likes</b>
				</span>
			</div>
			<div id="profile">
				<img src="${contextPath }/resources/img/imgMain/user.png"><br> <span><b>user_name</b></span>
			</div>
			<div>
				<div>
					<ul id="navdiv">
						<li><a href="mypage"><strong style="font-size: 25px;">My
									Page</strong></a></li>

						<li><a href="mylikes"><b>> My Likes</b></a></li>
						<li><a href="myboard">My Board</a></li>
						<li><a href="myreply">My Reply</a></li>
						<li></li>
						<li><a href="newprofile">Account Settings</a></li>

					</ul>

				</div>


				<div id="flex">

					<div class="img_box">
						<img src="${contextPath }/resources/img/imgMain/8.png"
							style="width: 320px; height: 270px; margin-left: 16px; margin-right: 15px; padding: 10px;">
					</div>

					<div class="right_box" style="padding: 10px;">
						<div class="좋아요한음식점">음식점</div>
						<div class="나라">대한민국</div>
						<div>음식 의 간단한 설명 ~~</div>
					</div>

				</div>
				<div id=" " style="padding: 30px;"></div>
				<div id="flex">

					<div class="img_box">
						<img src="${contextPath }/resources/img/imgMain/8.png"
							style="width: 320px; height: 270px; margin-left: 16px; margin-right: 15px; padding: 10px;">
					</div>

					<div class="right_box" style="padding: 10px;">
						<div class="좋아요한음식점">음식점</div>
						<div class="나라">대한민국</div>
						<div>음식 의 간단한 설명 ~~</div>
					</div>

				</div>
				<div id=" " style="padding: 30px;"></div>
				<div id="flex">

					<div class="img_box">
						<img src="${contextPath }/resources/img/imgMain/8.png"
							style="width: 320px; height: 270px; margin-left: 16px; margin-right: 15px; padding: 10px;">
					</div>

					<div class="right_box" style="padding: 10px;">
						<div class="좋아요한음식점">음식점</div>
						<div class="나라">대한민국</div>
						<div>음식 의 간단한 설명 ~~</div>
					</div>

				</div>
				<div id=" " style="padding: 30px;"></div>
				<div id="flex">

					<div class="img_box">
						<img src="${contextPath }/resources/img/imgMain/8.png"
							style="width: 320px; height: 270px; margin-left: 16px; margin-right: 15px; padding: 10px;">
					</div>

					<div class="right_box" style="padding: 10px;">
						<div class="좋아요한음식점">음식점</div>
						<div class="나라">대한민국</div>
						<div>음식 의 간단한 설명 ~~</div>
					</div>

				</div>
				<div id=" " style="padding: 30px;"></div>
				<div id="flex">

					<div class="img_box">
						<img src="${contextPath }/resources/img/imgMain/8.png"
							style="width: 320px; height: 270px; margin-left: 16px; margin-right: 15px; padding: 10px;">
					</div>

					<div class="right_box" style="padding: 10px;">
						<div class="좋아요한음식점">음식점</div>
						<div class="나라">대한민국</div>
						<div>음식 의 간단한 설명 ~~</div>
					</div>

				</div>
				<div id=" " style="padding: 30px;"></div>
				<div id="flex">

					<div class="img_box">
						<img src="${contextPath }/resources/img/imgMain/8.png"
							style="width: 320px; height: 270px; margin-left: 16px; margin-right: 15px; padding: 10px;">
					</div>

					<div class="right_box" style="padding: 10px;">
						<div class="좋아요한음식점">음식점</div>
						<div class="나라">대한민국</div>
						<div>음식 의 간단한 설명 ~~</div>
					</div>

				</div>
				<div id=" " style="padding: 30px;"></div>

			</div>
		</div>
	</div>
	
	<footer>
		<c:import url="../default/footer.jsp" />
	</footer>
	
</body>
</html>