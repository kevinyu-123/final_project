<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>
상세찾기</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Montserrat&family=Outfit:wght@100&display=swap"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<style type="text/css">


body {
font-family: 'Gothic A1', sans-serif;
	height: 100%;
}
.wrap2 {
	display: flex;
	height: 60vh;
	width: 940px;
	margin: 0 auto;
	
	justify-content: center;
}
.country, .addr, .food {
	display: flex;
	width: 100%;
	height: 25%;
	margin-top: 30px;
}

.title {
	margin-right: 50px;
}

label {
	display: inline;
	width: 45px;
	line-height: 14px;
	margin-right: 10px;
}

.content {
	margin-top: 15px;
}

.btn {
	width: 90px;
	display: block;
	margin: auto;
}

</style>
</head>
<body>
<script type="text/javascript">

</script>

	<header>
		<c:import url="../default/header.jsp" />
	</header>

	<div class="wrap">
		<form action="search_result" method="get">
			<div class="country">
				<div class="title">
					<h4>나라</h4>
				</div>
				<div class="content">
					<input type="radio" id="c1" name="country" value="kor"/>
					<label for="c1">한국</label>
					
					<input type="radio" id="c2" name="country" value="jpn"/>
					<label for="c2">일본</label>
					
					<input type="radio" id="c3" name="country" value="chn"/>
					<label for="c3">중국</label>
	
					<input type="radio" id="c4" name="country" value="tha"/>
					<label for="c4">태국</label>
					
					<input type="radio" id="c5" name="country" value="lao"/>
					<label for="c5">라오스</label>
					
					<input type="radio" id="c6" name="country" value="ind"/>
					<label for="c6">인도</label>
					
					<input type="radio" id="c7" name="country" value="phl"/>
					<label for="c7">필리핀</label>
					
					<input type="radio" id="c8" name="country" value="vnm"/>
					<label for="c8">베트남</label>
					
					<input type="radio" id="c9" name="country" value="sgp"/>
					<label for="c9">싱가폴</label>
					
					<input type="radio" id="c10" name="country" value="hkg"/>
					<label for="c10">홍콩</label>
				</div>
			</div>
			<div class="addr">
				<div class="title">
					<h4>지역</h4>
				</div>
				<div class="content">
					<input type="radio" id="c1" name="addr" value="seo"/>
					<label for="c1">서울</label>
					
					<input type="radio" id="c2" name="addr" value="gye"/>
					<label for="c2">경기</label>
					
					<input type="radio" id="c3" name="addr" value="inc"/>
					<label for="c3">인천</label>
					
					<input type="radio" id="c4" name="addr" value="bus"/>
					<label for="c4">부산</label>
					
					<input type="radio" id="c5" name="addr" value="dae"/>
					<label for="c5">대구</label>
					
					<input type="radio" id="c6" name="addr" value="gan"/>
					<label for="c6">강원도</label>
					
					<input type="radio" id="c7" name="addr" value="jeo"/>
					<label for="c7">전라도</label>
					
					<input type="radio" id="c8" name="addr" value="chu"/>
					<label for="c8">충청도</label>
					
					<input type="radio" id="c9" name="addr" value="uls"/>
					<label for="c9">울산</label>
					
					<input type="radio" id="c10" name="addr" value="jej"/>
					<label for="c10">제주</label>
				</div>
			</div>
			<div class="food">
				<div class="title">
					<h4>음식</h4>
				</div>
				
				<div class="content">
					<input type="radio" id="c1" name="food" value="rice"/>
					<label for="c1">밥류</label>
					
					<input type="radio" id="c2" name="food" value="noodle"/>
					<label for="c2">면류</label>
					
					<input type="radio" id="c3" name="food" value="meet"/>
					<label for="c3">육류</label>
					
					<input type="radio" id="c4" name="food" value="seafood"/>
					<label for="c4">해산물</label>
					
					<input type="radio" id="c5" name="food" value="dessert"/>
					<label for="c5">디저트</label>
					
					<input type="radio" id="c6" name="food" value="drinks"/>
					<label for="c6">음료</label>
				</div>
			</div>
			<button class="btn" type="submit">검색하기</button>
		</form>
	</div>
	<footer>
		<c:import url="../default/footer.jsp" />
	</footer>
</body>
</html>























































