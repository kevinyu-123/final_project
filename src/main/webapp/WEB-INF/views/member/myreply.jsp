<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>๋๊ธ ์กฐํ</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Montserrat&family=Outfit:wght@100&family=Playfair+Display+SC&display=swap"
	rel="stylesheet">
<style>
span {
	text-align: center;
	margin: auto;
	font-size: 30px;
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

#bigbox {
	height: 100%;
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

table {
	font-family: 'Gothic A1', sans-serif;
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

h2 {
	text-align: center;
}

#rowsPerPage, #pageCount {
	float: right;
}

#textbox {
	width: 100px;
	height: 20px;
	letter-spacing: -5px"
}

h2 {
	text-align: center;
}
.pagetitle {
	font-size: 30px;
	padding: 15px;
}

</style>
<script type="text/javascript">
	
</script>
</head>
<body>

	<div class="w3-animate-opacity">
		<header>
			<c:import url="../default/header.jsp" />
		</header>
		<div id="div">
			<div id="navdiv">
				<ul>
					<li><a href="mypage"><strong style="font-size: 25px;">
								MY PAGE</strong></a></li>

					<li><a href="likeList">MY LIKES</a></li>
					<li><a href="myboard">MY BOARD</a></li>
					<li><a href="myreply">MY REPLY</a></li>
					<li></li>
					<li><a href="newprofile">ACCOUNT SETTINGS</a></li>

				</ul>

			</div>

		</div>
		<div id="bigbox">
			<div id="left_box"></div>
			<div id="mid_box">
				<div class=" w3-animate-left" style="margin-bottom: 20px;">
					<span class="pagetitle"> <b>MY REPLY</b>
					</span>
					</div>
					<h6 style="	font-family: 'Gothic A1', sans-serif;">์ด ${fn:length(replyInfo)} ๊ฐ์ ๋๊ธ์ด ์กฐํ๋์์ต๋๋ค.</h6>
					<table border="1">
						<tr>
							
							<th width="70%;">๋๊ธ ๋ด์ฉ</th>
							<th>์์ฑ์ผ</th>
							
						</tr>
						<c:choose>
							<c:when test="${fn:length(replyInfo) != 0}">
							<c:forEach var="reply" items="${replyInfo}">
							
								<tr>
									<td><a href="${contextPath}/viewContent?board_no=${reply.post_group}">${reply.content}</a></td>
									<td>${reply.reg_time}</td>
									
								</tr>
								
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4" align="center">์กฐํ๋ ๋๊ธ์ด ์์ต๋๋ค.</td>
								</tr>
							</c:otherwise>
						</c:choose>
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