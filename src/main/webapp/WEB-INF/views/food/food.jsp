<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body, html {
height: 100%;
scroll-behavior: smooth;
overflow-anchor: none;
}
body {
	font-family: muli;
	font-size: 16px;
	color: #292929;
}
.header, .food-detail, .wrap-nav, .food-recipe{
	background-color: #ffffff;
}

.wrap {
	margin: 0;
	padding: 10px;
	background-color: #f9f9f9;
	width: 100%;
}

.header {
	width: 100%;
	height: 150px;
	position: fixed;
	z-index: 30;
	top: 0;
}

.wrap-header-table {
	width: 90%;
	margin: auto;
	table-layout: fixed;
	margin-top: 20px;
}

.wrap-header-table tr td {
	width: 33%;
}

.title {
	text-align: center;
	font-size: 40px;
}

.login {
	text-align: right;
}

.wrap-nav {
	width: 100%;
	height: 50px;
	text-align: center;
	padding-top: 20px;
	border-bottom: 2px solid gray;
}

.wrap-nav a {
	padding: 15px;
	text-decoration: none;
	color: black;
}

.wrap .food-detail, .food-recipe {
	width: 70%;
	margin: auto;
	box-shadow: 5px 5px 5px gray;;
	z-index: 3;
	margin-bottom:300px;
}
.wrap .food-detail {
	position: relative;
	top: 180px;
}
.wrap .food-recipe{
}
.wrap .food-detail .container, .food-detail-foodContent {
	width: 80%;
	margin: auto;
}

.food-detail-foodContent-table {
	margin-top: 30px;
}

.food-detail-foodContent-table-ex {
	margin-top: 30px;
}

.searchbar {
	margin-bottom: auto;
	margin-top: auto;
	height: 60px;
	background-color: #353b48;
	border-radius: 30px;
	padding: 10px;
}

.search_input {
	color: white;
	border: 0; outline : 0;
	background: none;
	width: 0;
	caret-color: transparent;
	line-height: 40px;
	transition: width 0.4s linear;
	outline: 0;
}

.searchbar:hover>.search_input {
	padding: 0 10px;
	width: 250px;
	caret-color: red;
	transition: width 0.8s linear;
}

.searchbar:hover>.search_icon {
	background: white;
	color: #e74c3c;
}

.search_icon {
	height: 40px;
	width: 40px;
	float: right;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 50%;
	color: white;
	text-decoration: none;
}
.food-detail-foodContent-table .nation{
text-align: center;
}
</style>
</head>
<body>
	<div class="wrap">
		<div class="header">
			<table class="wrap-header-table">
				<tr>
					<td>
						<div class="container h-100">
							<div class="d-flex h-100">
								<div class="searchbar">
									<input class="search_input" type="text" name=""
										placeholder="Search..."> <a href="#"
										class="search_icon"><i class="fas fa-search"></i></a>
								</div>
							</div>
						</div>
					</td>
					<td><h3 class="title">DINING LAB</h3></td>
					<td class="login"><span>LogIn</span></td>
				</tr>
			</table>
			<div class="wrap-nav">
				<a href="">INFOMATION</a> <a href="">RECIPE</a> <a href="">WHERE
					TO EAT</a> <a href="">COMMENT</a>
			</div>
		</div>
		
		<div class="food-detail">
			<div class="container">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
						<li data-target="#myCarousel" data-slide-to="3"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner"
						style="max-height: 600px; margin-top: 50px;">
						<div class="item active">
							<img src="resources/detail_img/food2.jpg"
								style="width: 100%; height: 600px;">
						</div>
						<div class="item">
							<img src="resources/detail_img/food3.jpg"
								style="width: 100%; height: 600px;">
						</div>

						<div class="item">
							<img src="resources/detail_img/food4.jpg"
								style="width: 100%; height: 600px;">
						</div>
						<div class="item">
							<img src="resources/detail_img/Gui img.jpg"
								style="width: 100%; height: 600px;">
						</div>
					</div>
					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div class="food-detail-foodContent">
				<table class="food-detail-foodContent-table">
					<tr>
						<td><h1>GUI</h1>
							<br>
						<p>(구이, Guee, Korean Grilling Technique, Korean BBQ, Korean
								Barbecue)</p></td>
						<td style="width: 30%"><div class="nation"><img src="resources/detail_img/국기.png"> <h3>SOUTH KOREA</h3>
						</div></td>
					</tr>
					<tr>
						<td style="width: 70%">
							<p class="food-detail-foodContent-table-ex">
								구이는 한국 요리에서 볼 수 있는 모든 구이 요리를 지칭하는 이름입니다. 구이는 한국의 주요 구성 요소이자 요리
								방법 중 하나이며 전통적인 서양식과 달리 따라야 할 일련의 규칙과 관습을 따릅니다.<br> <br>
								전통적으로 정통 한식당의 모든 테이블에는 테이블 중앙에 구멍이 있어 숯이나 가스 위에 그릴을 올려 놓습니다.
								처음에는 모든 재료가 생으로 테이블에 나오지만 얇게 썰어 준비됩니다. 그런 다음 고객은 개인 취향에 따라 요리를
								조립하고 요리합니다.<br> <br> 쇠고기, 닭고기, 돼지고기는 굽는 데 사용되는 가장 유명한
								세 가지 고기 품종입니다. 고기는 이미 유명한 불고기 와 갈비살 처럼 양념에 재워 두거나, 삼겹살 로 널리 알려진
								얇게 썬 삼겹살처럼 양념을 하지 않은 상태로 만들 수 있습니다 .<br> <br> 생선 및 기타
								해산물 재료는 때때로 버섯과 양파 또는 고추와 같은 야채와 함께 굽습니다. 주요 구성 요소 외에도 모든 구이에
								기본적으로 추가되는 것은 김치, 파, 절인 야채 및 다른 재료의 포장지로 사용되는 신선한 전체 상추 잎과 같은 반찬
								세트입니다.<br> <br> 간단한 간장 소스 또는 칠리 페퍼로 준비한 매운 품종은 일반적으로
								돼지 고기 요리와 함께 제공되는 반면 유명한 브라운 소스 (된장과 칠리로 만든)는 쇠고기와 완벽하게 어울립니다.
								전통적으로 구운 재료를 소스에 담그고 양상추 잎에 싸서 반찬으로 먹습니다.<br> <br> 한국의
								구이는 공동 및 축제 행사, 문화적 개념 및 전 세계적으로 대중화된 확립된 전통을 나타냅니다.
							</p>
						</td>
						<td><img src="resources/detail_img/지도.png" style="width:100%;"></td>
					</tr>
				</table>
				<br><br><br>
			</div>
		</div>
		<div class="food-recipe">
<<<<<<< HEAD
						<div class="container">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
						<li data-target="#myCarousel" data-slide-to="3"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner"
						style="max-height: 600px; margin-top: 50px;">
						<div class="item active">
							<img src="resources/detail_img/food2.jpg"
								style="width: 100%; height: 600px;">
						</div>
						<div class="item">
							<img src="resources/detail_img/food3.jpg"
								style="width: 100%; height: 600px;">
						</div>

						<div class="item">
							<img src="resources/detail_img/food4.jpg"
								style="width: 100%; height: 600px;">
						</div>
						<div class="item">
							<img src="resources/detail_img/Gui img.jpg"
								style="width: 100%; height: 600px;">
						</div>
					</div>
					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div class="food-detail-foodContent">
				<table class="food-detail-foodContent-table">
					<tr>
						<td><h1>GUI</h1>
							<br>
						<p>(구이, Guee, Korean Grilling Technique, Korean BBQ, Korean
								Barbecue)</p></td>
						<td style="width: 30%"><div class="nation"><img src="resources/detail_img/국기.png"> <h3>KOREA</h3>
						</div></td>
					</tr>
					<tr>
						<td style="width: 70%">
							<p class="food-detail-foodContent-table-ex">
								구이는 한국 요리에서 볼 수 있는 모든 구이 요리를 지칭하는 이름입니다. 구이는 한국의 주요 구성 요소이자 요리
								방법 중 하나이며 전통적인 서양식과 달리 따라야 할 일련의 규칙과 관습을 따릅니다.<br> <br>
								전통적으로 정통 한식당의 모든 테이블에는 테이블 중앙에 구멍이 있어 숯이나 가스 위에 그릴을 올려 놓습니다.
								처음에는 모든 재료가 생으로 테이블에 나오지만 얇게 썰어 준비됩니다. 그런 다음 고객은 개인 취향에 따라 요리를
								조립하고 요리합니다.<br> <br> 쇠고기, 닭고기, 돼지고기는 굽는 데 사용되는 가장 유명한
								세 가지 고기 품종입니다. 고기는 이미 유명한 불고기 와 갈비살 처럼 양념에 재워 두거나, 삼겹살 로 널리 알려진
								얇게 썬 삼겹살처럼 양념을 하지 않은 상태로 만들 수 있습니다 .<br> <br> 생선 및 기타
								해산물 재료는 때때로 버섯과 양파 또는 고추와 같은 야채와 함께 굽습니다. 주요 구성 요소 외에도 모든 구이에
								기본적으로 추가되는 것은 김치, 파, 절인 야채 및 다른 재료의 포장지로 사용되는 신선한 전체 상추 잎과 같은 반찬
								세트입니다.<br> <br> 간단한 간장 소스 또는 칠리 페퍼로 준비한 매운 품종은 일반적으로
								돼지 고기 요리와 함께 제공되는 반면 유명한 브라운 소스 (된장과 칠리로 만든)는 쇠고기와 완벽하게 어울립니다.
								전통적으로 구운 재료를 소스에 담그고 양상추 잎에 싸서 반찬으로 먹습니다.<br> <br> 한국의
								구이는 공동 및 축제 행사, 문화적 개념 및 전 세계적으로 대중화된 확립된 전통을 나타냅니다.
							</p>
						</td>
						<td><img src="resources/detail_img/지도.png" style="width:100%;"></td>
					</tr>
				</table>
				<br><br><br>
		</div>
	</div>
</body>
</html>