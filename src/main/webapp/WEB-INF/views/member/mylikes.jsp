<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Montserrat&family=Outfit:wght@100&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="${contextPath }/resources/css/mylikes.css">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
#bigbox {
	height: 100%;
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

#flex {
	margin-left: 300px;
	margin-top: 50px;
	display: flex;
	position: relative;
}

.pagetitle {
	font-size: 30px;
	padding: 15px;
}

#bigbox {
	height: 650px;
	overflow: auto;
	display: flex;
}

#left_box {
	width: 20%;
}

#mid_box {
	width: 80%;
	padding-top: 10px;
}

#review_box {
	display: inline-block;
	height: 100%;
}

#like {
	display: inline-block;
}
</style>
<script type="text/javascript">
	/* Demo purposes only */
	$(".hover").mouseleave(function() {
		$(this).removeClass("hover");
	});
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

					<li><a href="mylikes">MY LIKES</a></li>
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
					<span class="pagetitle"> <b>MY LIKES</b>
					</span>
				</div>

				<div id="review_box" style="width: 90%; position: relative;">
					<c:forEach var="likes" items="${likes }">

						<div id="like">
							<!-- div시작 ...  -->
							<figure class="snip1132">
								<img src="${contextPath}/resources/img/imgMain/sam.png"
									alt="sample22" />
								<figcaption>
									<div class="heading">

										<span>${likes.restName }</span>
										<!-- 레스토랑이름 -->

									</div>
									<div class="caption">
										<p>${likes.restMenu }</p>
										<!--메뉴이름 -->
									</div>
								</figcaption>
								<a href="#"> </a>
								<!-- 해당레스토랑페이지 -->
							</figure>
						</div>
					</c:forEach>
					<div id="like">
						<!-- div시작 ...  -->
						<figure class="snip1132">
							<img src="${contextPath}/resources/img/imgMain/sam.png"
								alt="sample22" />
							<figcaption>
								<div class="heading">

									<span> restaurant name</span>
									<!-- 레스토랑이름 -->

								</div>
								<div class="caption">
									<p>food name</p>
									<!--메뉴이름 -->
								</div>
							</figcaption>
							<a href="#"> </a>
							<!-- 해당레스토랑페이지 -->
						</figure>
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