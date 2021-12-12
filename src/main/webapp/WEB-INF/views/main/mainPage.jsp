<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>DiningLab</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>

.container {
	width: 100%;
	position: relative;
	justify-content: center;
}
#tabbox{
display:flex;
margin: 0;
    padding: 0;
    border: 0;
    outline: 0;
  
}
.container img {
	width: 100%;
		height: 500px;
	opacity: 70%;
}

.container .btn {
	opacity: 70%;
	background-color: white;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	padding: 16px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	transition-duration: 0.4s;
	cursor: pointer;
	color: black;
	border: 1px solid #e7e7e7;
	border-radius: 25px;
}

.container .btn:hover {
	background-color: #e7e7e7;
}

ul, li {
list-style: none;
}

#slide{
width:100%;
height:500px;
overflow:hidden;
}

 #slide ul{
 width:calc(100% * 4);
 display:flex;
 animation:slide 20s infinite;
 } /* slide를 8초동안 진행하며 무한반복 함 */
 
 #slide li{
 list-style:none;
 width:calc(100% / 4);
 height:300px;
 }
    
    @keyframes slide {
      0% {margin-left:0;} 
      10% {margin-left:0;} 
      25% {margin-left:-100%;}
      35% {margin-left:-100%;} 
      50% {margin-left:-200%;}
      60% {margin-left:-200%;}
      75% {margin-left:-300%;}
      85% {margin-left:-300%;}
      100% {margin-left:0;}
    }
    
    .ulbox{ 
    margin:0;
    padding:0;  
    }
  </style>




</head>

<body>
	<div class="w3-animate-opacity">
		<c:import url="../default/header.jsp" />

		<div id="tabbox">
			<div style="width:50%;">
					<div class="container">

						<div id="slide">
							<ul class="ulbox">
								<li><img src="${contextPath}/resources/img/imgMain/1.png"></li>
								<li><img src="${contextPath}/resources/img/imgMain/2.png"></li>
								<li><img src="${contextPath}/resources/img/imgMain/3.png"></li>
								<li><img src="${contextPath}/resources/img/imgMain/4.png"></li> 
							</ul>
						</div>
						<button class="btn" onclick="">CATEGORY_SEARCH</button>
					</div>
					</div>

				<div style="width:50%;">
					<div class="container">
						<img src="${contextPath}/resources/img/imgMain/map.jpg">
						<button class="btn" onclick="location.href='${contextPath}/map/mapmain'">MAP_SEARCH</button>
					</div>
				
		</div>
</div>
		<c:import url="../default/footer.jsp" />
	</div>
</body>
</html>