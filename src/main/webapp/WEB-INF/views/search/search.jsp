<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.wrap {
	position: relative;
	justify-content: center;
	text-align: center;
	width: 940px;
	margin: 0 auto;
	height: 55vh;
	flex-direction: column;
}

.search {
	height: 40px;
	width: 400px;
	border: 1px solid #1b5ac2;
	background: #ffffff;
	margin: 10px auto 10px;
}

input {
	font-size: 16px;
	width: 325px;
	padding: 7px;
	border: 0px;
	outline: none;
	float: left;
}

button {
	width: 50px;
	height: 100%;
	border: 0px;
	background: #1b5ac2;
	outline: none;
	float: right;
	color: #ffffff;
}

.detail {
	display: flex;
}


#detail-btn {
	margin: 10px auto 10px;
	width: 90px;
	height: 30px;
}

</style>
</head>
<body>
	<header>
		<c:import url="../default/header.jsp" />
	</header>

	<div class="wrap">
		<h1>아시아의 음식을 한눈에</h1>
		<h3>코시국에 여행을 할 수 없다면 먹기라도 하자!</h3>
		<form class="search" action="./search_result" method="get">
			<input type="text" name="keyword" placeholder="나라 이름, 음식 또는 식당 검색"
				value="${keyword }">
			<button type="submit" onclick="./search_result.jsp">검색</button>
		</form>

		<div class="detail">
			<button id="detail-btn" onclick="location.href='detail_search'">상세 검색</button>
		</div>
	</div>

	<footer>
		<c:import url="../default/footer.jsp" />
	</footer>
</body>
</html>














