<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<title>Site Map</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Montserrat&family=Outfit:wght@100&display=swap"
	rel="stylesheet">


<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
#bigbox {
	font-family: 'Gothic A1', sans-serif;
	height: 700px;
	display: flex;
	overflow: auto;
	opacity:80%;
	z-index:-1;
}

#left_box {
	width: 20%;
}

#mid_box {
	display: flex;
	padding-top: 10px;
}

#left {
	width: 300px;
	height: 250px;
	padding: 20px;
}

#right {
	width: 300px;
	height: 250px;
	padding: 20px;
}

#mid {
	width: 300px;
	height: 100%;
	padding: 20px;
}
</style>

<body>
	<div class="w3-animate-opacity">
		<header>
			<c:import url="../default/header.jsp" />
		</header>

		<div id="bigbox">
			<div id="left_box"></div>
			<div id="mid_box">
				<div id="left">
					<div id="acco">
						<div class=" w3-bar-block w3-center">
							<a href="#" class="w3-bar-item w3-button"
								style="font-size: 20pt;"><b>나라</b></a>
							<div class="w3-bar-item w3-button" onclick="myAccFunc()">
								countries<i class="fa fa-caret-down"></i>
							</div>
							<div id="demoAcc" class="w3-hide w3-white w3-card-4">
								<a href="${contextPath }/nation?nation=korea" class="w3-bar-item w3-button">대한민국</a> 
								<a href="${contextPath }/nation?nation=singapore" class="w3-bar-item w3-button">싱가폴</a> 
								<a href="${contextPath }/nation?nation=taiwan" class="w3-bar-item w3-button">대만</a> 
								<a href="${contextPath }/nation?nation=mongol" class="w3-bar-item w3-button">몽골</a> 
								<a href="${contextPath }/nation?nation=japan" class="w3-bar-item w3-button">일본</a> 
								<a href="${contextPath }/nation?nation=philliphine" class="w3-bar-item w3-button">필리핀</a> 
								<a href="${contextPath }/nation?nation=vietnam" class="w3-bar-item w3-button">베트남</a> 
								 <a href="${contextPath }/nation?nation=laos" class="w3-bar-item w3-button">라오스</a>
								 <a href="${contextPath }/nation?nation=hongkong" class="w3-bar-item w3-button">홍콩</a>
								 <a href="${contextPath }/nation?nation=thailand" class="w3-bar-item w3-button">태국</a>
							</div>
						</div>
					</div>
				</div>
				<div id="mid">
					<div>
						<div class=" w3-bar-block w3-center">
							<a href="#" class="w3-bar-item w3-button"
								style="font-size: 20pt;"><b>지역</b></a>
							<div class="w3-bar-item w3-button" onclick="myAccFunc2()">
								음식점위치<i class="fa fa-caret-down"></i>
							</div>
							<div id="demoAcc2" class="w3-hide w3-white w3-card-4">
								<a href="${contextPath }" class="w3-bar-item w3-button">서울</a> 
								<a href="#" class="w3-bar-item w3-button">대전</a> 
								<a href="#" class="w3-bar-item w3-button">대구</a> 
								<a href="#" class="w3-bar-item w3-button">부산</a> 
								<a href="#" class="w3-bar-item w3-button">광주</a>
								 <a href="#" class="w3-bar-item w3-button">울산</a>
								 <a href="#" class="w3-bar-item w3-button">기타</a>
							</div>

						</div>
					</div>
				</div>
				<div id="right">
					<div>
						<div class=" w3-bar-block w3-center">
							<a href="#" class="w3-bar-item  w3-button"
								style="font-size: 20pt;"><b>종류</b></a>

							<div class="w3-bar-item w3-button " onclick="myAccFunc3()">
								메인종류 <i class="fa fa-caret-down"></i>
							</div>
							<div id="demoAcc3" class="w3-hide w3-white w3-card-4">
								<a href="#" class="w3-bar-item w3-button">밥요리</a> <a href="#"
									class="w3-bar-item w3-button">면요리</a> <a href="#"
									class="w3-bar-item w3-button">음료및디저트</a> <a href="#"
									class="w3-bar-item w3-button">구이</a> <a href="#"
									class="w3-bar-item w3-button">국물요리</a> <a href="#"
									class="w3-bar-item w3-button">찜요리</a>
									 <a href="#" class="w3-bar-item w3-button">기타</a>
							</div>
						</div>
					</div>
				</div>
			</div>
</div>
			<footer>
				<c:import url="../default/footer.jsp" />
			</footer>
			</div>
		
		<script>
			function myAccFunc() {
				var x = document.getElementById("demoAcc");
				if (x.className.indexOf("w3-show") == -1) {
					x.className += " w3-show";
					x.previousElementSibling.className += "";
				} else {
					x.className = x.className.replace(" w3-show", "");
					x.previousElementSibling.className = x.previousElementSibling.className
							.replace(" w3-green", "");
				}
			}
			function myAccFunc2() {
				var x = document.getElementById("demoAcc2");
				if (x.className.indexOf("w3-show") == -1) {
					x.className += " w3-show";
					x.previousElementSibling.className += "";
				} else {
					x.className = x.className.replace(" w3-show", "");
					x.previousElementSibling.className = x.previousElementSibling.className
							.replace(" w3-green", "");
				}
			}

			function myAccFunc3() {
				var x = document.getElementById("demoAcc3");
				if (x.className.indexOf("w3-show") == -1) {
					x.className += " w3-show";
					x.previousElementSibling.className += "";
				} else {
					x.className = x.className.replace(" w3-show", "");
					x.previousElementSibling.className = x.previousElementSibling.className
							.replace(" w3-green", "");
				}
			}
		</script>
</body>
</html>