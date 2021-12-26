<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Montserrat&family=Outfit:wght@100&display=swap"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
#profile {
	font-family: 'Gothic A1', sans-serif;
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

#buttons {
	margin-top: 50px;
	margin-left: 540px;
}

#buttons2 {
	margin-top: 50px;
	margin-left: 450px;
}

#buttons img {
	width: 30px;
	height: 30px;
}

#buttons2 img {
	width: 30px;
	height: 30px;
}

button {
	background-color: #f4d19f;
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

.likes, .board, .reply, .account {
	font-size: 25px;
	width: 300px;
	height: 200px;
}

#navdiv {
	font-family: 'Montserrat', sans-serif;
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
	
}

#bigbox {
	height:100%;
}
</style>

</head>
<body>
	<header>
		<c:import url="../default/header.jsp" />
	</header>


	<div class="w3-animate-opacity">
		<div id="bigbox">
			<div id="profile">
				<img src="${contextPath }/resources/img/imgMain/user.png"><br>
				<span><b>${session_user }</b></span>
			</div>

			<div id="divv">
				<div id="navdiv">
					<ul>
						<li><a href="mypage"><strong style="font-size: 25px;">
									MY PAGE</strong></a></li>

						<li><a href="mylikes">MY LIKES</a></li>
						<li><a href="myboard">MY BOARD</a></li>
						<li><a href="myreply">MY REPLY</a></li>
						<li></li>
						<li><a href="newprofile">ACCOUNT SETTINGS</a></li>

					</ul>

				</div>

				<div id="buttons">
					<table>
						<tr>
							<td>
								<button class="likes" onclick="location.href='mylikes'">
									<img src="${contextPath }/resources/img/imgMain/heart.png"><br>MY
									LIKES
								</button>

							</td>
							<td>
								<button class="board" onclick="location.href='myboard'">
									<img src="${contextPath }/resources/img/imgMain/write.png"><br>MY
									BOARD
								</button>

							</td>
						</tr>
						<tr>
							<td>
								<button class="reply" onclick="location.href='myreply'">
									<img src="${contextPath }/resources/img/imgMain/review.png"><br>
									MY REPLY
								</button>

							</td>
							<td>
								<button class="account" onclick="location.href='newprofile'">
									<img src="${contextPath }/resources/img/imgMain/account.png"><br>
									ACCOUNT SETTINGS
								</button>

							</td>
						</tr>
					</table>

				</div>
				<c:if test="${session_user eq 'a123'}">
					<script>
						$('#buttons').css("display", "none")
						$('#navdiv').css("display","none")
					</script>
					<div id="buttons2" style="height:100%;">
						<table>
							<tr>
								<td>

									<button class="likes" onclick="location.href='writeNews'">
										<br>공지사항 등록
									</button>


								</td>
								<td>

									<button class="likes" onclick="location.href='writeEvent'">
										<br>이벤트 등록
									</button>


								</td>
								<td>

									<button class="likes" onclick="location.href='writeRecipe'">
										<br>레시피등록
									</button>


								</td>
								
								
								
								</tr>
								<tr>
								<td>

									<button class="likes" onclick="location.href='news'">
										<br>공지사항 목록
									</button>


								</td>
								<td>

									<button class="likes" onclick="location.href='event'">
										<br>이벤트 목록
									</button>


								</td>
						
						
								
								<td>

									<button class="likes" onclick="location.href='freeboard'">
										<br>자유게시판관리
									</button>


								</td>
							</tr>
						</table>

					</div>

				</c:if>

			</div>

		</div>
		<footer>
			<c:import url="../default/footer.jsp" />
		</footer>
	</div>
</body>
</html>