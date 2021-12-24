
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<title>W3.CSS</title>
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
	height: 650px;
	display: flex;
	overflow: auto;
}

#left_box {
	width: 20%;
}

#mid_box {
	display:flex;	
	padding-top: 10px;
}


#left {
width:300px;
	height: 250px;
	padding:20px;
}

#right {
width:300px;
	height: 250px;
	padding:20px;
}

#mid {
width:300px;
	height: 250px;
	padding:20px;
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
						<a href="#" class="w3-bar-item w3-button" style="font-size:20pt;"><b>Country</b></a>
						<div class="w3-bar-item w3-button" onclick="myAccFunc()">
							countries<i class="fa fa-caret-down"></i>
						</div>
						<div id="demoAcc" class="w3-hide w3-white w3-card-4">
							<a href="#" class="w3-bar-item w3-button">Korea</a> 
							<a href="#"
								class="w3-bar-item w3-button">Link</a> <a href="#"
								class="w3-bar-item w3-button">Link</a> <a href="#"
								class="w3-bar-item w3-button">Link</a> <a href="#"
								class="w3-bar-item w3-button">Link</a> <a href="#"
								class="w3-bar-item w3-button">Link</a> <a href="#"
								class="w3-bar-item w3-button">Link</a> <a href="#"
								class="w3-bar-item w3-button">Link</a>
						</div>
					</div>
				</div>
				</div>
				<div id ="mid">
				<div>
					<div class=" w3-bar-block w3-center">
						<a href="#" class="w3-bar-item w3-button" style="font-size:20pt;"><b>Ingredient</b></a>
						<div class="w3-bar-item w3-button" onclick="myAccFunc2()">
							재료1번 <i class="fa fa-caret-down"></i>
						</div>
						<div id="demoAcc2" class="w3-hide w3-white w3-card-4">
							<a href="#" class="w3-bar-item w3-button">Link</a> 
							<a href="#"
								class="w3-bar-item w3-button">Link</a> 
							<a href="#"
								class="w3-bar-item w3-button">Link</a> 
							<a href="#"
								class="w3-bar-item w3-button">Link</a> 
							<a href="#"
								class="w3-bar-item w3-button">Link</a> 
							<a href="#"
								class="w3-bar-item w3-button">Link</a> 
							<a href="#"
								class="w3-bar-item w3-button">Link</a> 
							<a href="#"
								class="w3-bar-item w3-button">Link</a>
						</div>
						<div class="w3-bar-item w3-button" onclick="myAccFunc2_1()">
							재료2번 <i class="fa fa-caret-down"></i>
						</div>
							<div id="demoAcc2_1" class="w3-hide w3-white w3-card-4">
							<a href="#" class="w3-bar-item w3-button">Link</a> <a href="#"
								class="w3-bar-item w3-button">Link</a> <a href="#"
								class="w3-bar-item w3-button">Link</a> <a href="#"
								class="w3-bar-item w3-button">Link</a> <a href="#"
								class="w3-bar-item w3-button">Link</a> <a href="#"
								class="w3-bar-item w3-button">Link</a> <a href="#"
								class="w3-bar-item w3-button">Link</a> <a href="#"
								class="w3-bar-item w3-button">Link</a>
						</div>
					</div>
				</div>
				</div>
				<div id="right">
				<div >
					<div class=" w3-bar-block w3-center">
						<a href="#" class="w3-bar-item  w3-button" style="font-size:20pt;"><b>Category</b></a>
						
						<div class="w3-bar-item w3-button " onclick="myAccFunc3()">
							카테고리1번 
							<i class="fa fa-caret-down"></i>
						</div>
						<div id="demoAcc3" class="w3-hide w3-white w3-card-4">
							<a href="#" class="w3-bar-item w3-button">Link</a> <a href="#"
								class="w3-bar-item w3-button">Link</a> <a href="#"
								class="w3-bar-item w3-button">Link</a> <a href="#"
								class="w3-bar-item w3-button">Link</a> <a href="#"
								class="w3-bar-item w3-button">Link</a> <a href="#"
								class="w3-bar-item w3-button">Link</a> <a href="#"
								class="w3-bar-item w3-button">Link</a> <a href="#"
								class="w3-bar-item w3-button">Link</a>
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
			function myAccFunc2_1() {
				var x = document.getElementById("demoAcc2_1");
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
