<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Outfit:wght@100&display=swap"
	rel="stylesheet">
<meta charset="UTF-8">
<title>mypage</title>
<style>
* {
	font-family: 'Outfit', sans-serif;
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

#buttons table {
	width: 800px;
	margin-left: 300px;
}

button {
	background-color: rgba(223, 209, 204);
	border: none;
	padding: 30px 30px;
	display: inline-block;
	opacity: 70%;
	margin: 4px 2px;
	cursor: pointer;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
}

button:hover {
	box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0
		rgba(0, 0, 0, 0.19);
}

.likes, .board, .reply {
	font-size: 25px;
	width: 300px;
	height: 200px;
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

#bigbox {
	height: 600px;
}
</style>

</head>

<body>

	<div class="w3-animate-opacity">
		<header>
			<c:import url="../default/header.jsp" />
		</header>
		<div id="bigbox">
			<div id="profile">
				<img src="${contextPath }/resources/img/imgMain/user.png"><br>
				<span><b>user_name</b></span>
			</div>
			<div>
				<div>
					<ul id="navdiv">
						<li><a href="mypage"><strong style="font-size: 25px;">My
									Page</strong></a></li>

						<li><a href="mylikes">My Likes</a></li>
						<li><a href="myboard">My Board</a></li>
						<li><a href="myreply">My Reply</a></li>
						<li></li>
						<li><a href="newprofile">Account Settings</a></li>

					</ul>

				</div>

				<div id="buttons">
					<table>
						<tr>
							<td>
								<button class="likes" onclick="location.href='mylikes'">
									<img src="${contextPath }/resources/img/imgMain/heart.png"><br>My
									likes
								</button>
							</td>
							<td>
								<button class="board" onclick="location.href='myboard'">
									<img src="${contextPath }/resources/img/imgMain/write.png"><br>My
									board
								</button>
							</td>
							<td>
								<button class="reply" onclick="location.href='myreply'">
									<img src="${contextPath }/resources/img/imgMain/review.png"><br>My
									reply
								</button>
							</td>
						</tr>
					</table>

				</div>
			</div>

		</div>
		<footer>
			<c:import url="../default/footer.jsp" />
		</footer>
	</div>
</body>
</html>