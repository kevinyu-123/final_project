<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About us</title>
<style>
#main {
	height: 600px;
}

#sub_top {
	padding: 20px;
	margin-left: 200px;
}

#body {
	display: flex;
}

#left_body {
	z-index: 999;
	width: 40%;
}

#right_body {
	width: 60%;
	background-image: url("");
}

#label {
	margin-top: 50px;
	padding: 10px;
	font-family: 'Gothic A1', sans-serif;
	text-align: center;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Montserrat&family=Outfit:wght@100&display=swap" rel="stylesheet">
 
</head>
<body>

	<div class="w3-animate-opacity">

		<header>
			<c:import url="../default/header.jsp" />
		</header>
		<div id="main">

			<!-- 	<div id="sub_top">
	<div class="w3-container  w3-animate-left">
				<span style="font-family:'Readex Pro', sans-serif;">ABOUT US</span>
			</div>
			</div>
		 -->
			<div id="body">

				<div id="left_body">

					<div class="w3-content w3-section">
						<img class="mySlides w3-animate-fading"
							src="${contextPath}/resources/img/imgMain/2.png"
							style="width: 100%; height: 450px;"> <img
							class="mySlides w3-animate-fading"
							src="${contextPath}/resources/img/imgMain/5.png"
							style="width: 100%; height: 450px;"> <img
							class="mySlides w3-animate-fading"
							src="${contextPath}/resources/img/imgMain/3.png"
							style="width: 100%; height: 450px;"> <img
							class="mySlides w3-animate-fading"
							src="${contextPath}/resources/img/imgMain/4.png"
							style="width: 100%; height: 450px;"> <img
							class="mySlides w3-animate-fading"
							src="${contextPath}/resources/img/imgMain/1.png"
							style="width: 100%; height: 450px;"> <img
							class="mySlides w3-animate-fading"
							src="${contextPath}/resources/img/imgMain/6.png"
							style="width: 100%; height: 450px;">
					</div>

				</div>

				<div id="right_body">
					<div id="label">
						<div class="w3-container  w3-animate-left ">
							<label style="font-size: 25pt;">안녕하세요, DiningLab 입니다.</label><br>
						</div>
						<p>
						<div class="w3-container  w3-animate-right"
							style="font-size: 12pt;">
							DiningLab은 세계 각지의 대표 음식을 소개하고, <br> 한국에서 다양한 나라의 현지음식을 경험해볼
							수 있도록 <br> 믿을만한 맛집을 소개하고 추천하는 서비스를 제공하고 있습니다.<br>

							<p>
								쉽게 접해보지 못했던 메뉴들부터 숨은맛집들까지! <br> 지금 바로 경험해보세요 :)
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
<script>
	var myIndex = 0;
	carousel();

	function carousel() {
		var i;
		var x = document.getElementsByClassName("mySlides");
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
		}
		myIndex++;
		if (myIndex > x.length) {
			myIndex = 1
		}
		x[myIndex - 1].style.display = "block";
		setTimeout(carousel, 7000);
	}
</script>

</html>














