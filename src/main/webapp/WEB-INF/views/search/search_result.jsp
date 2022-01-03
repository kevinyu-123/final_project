<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>search</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Montserrat&family=Outfit:wght@100&display=swap"
	rel="stylesheet">

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<style type="text/css">

body {
	font-family: 'Gothic A1', sans-serif;
}


html, body {
	height: 100%;
}

.wrap {
	display: flex;
	flex-direction: column;
	height: 100%;
}


.main {
	display: flex;
	min-height: 100%;
}

/* 결과창 */
.center {
	display: flex;
	flex: 1;
	margin-left: 280px;
	margin-right: 450px;
	width: 600px;
	flex-direction: column;
	height: auto;
}

.search {
	text-align: center;

	display: flex;
	width:800px;
	margin-left: 60px;
	
}

.results {
	display: flex;
	margin: 0 auto;
	width: 75%;
	margin-top: 10%;
	flex-direction: column;
}

.result {
	display: flex;
	margin-left: 10px;
	margin-right: 10px;
	margin-top: 15px;
}

.rest_pic {
	margin-right: auto;
	margin-bottom: auto;
	margin-top: auto;
}

#pic {
	border-radius: 8px;
	margin-left: auto;
	margin-right: auto;

	width: 350px;
	height: 250px;

}

.rest_info {
	flex-direction: column;
	margin-right: 200px;
	height: 150px;
}

.conn {
	height: 40px;
	width: 400px;
	border-radius: 10px;
	background: #ffffff;

	margin: 20px 0 20px;

	background: #ffffff;
}

.input {
	font-size: 16px;
	width: 600px;
	padding: 7px;
	border: 0px;
	outline: none;
	float: left;
	font-size: 16px;
	padding: 10px;
	outline: none;
	border: 2px solid #ccc;
	border-radius: 30px;
	text-align: center;

	margin-left:200px;
}

.button {

	width: 70px;
	height: 100%;
	font-size: 14px;
	font-family: 'Gothic A1', sans-serif;

	border: 2px solid #ddd; border-radius : 25px;

	padding: 10px;
	-webkit-transition: 0.3s;
	transition: 0.3s;
	outline: none;

	border-radius: 25px;
	margin-left:10px;

}

a {
	text-decoration-line: none;
}

li {
	margin: 30px 0;
}

footer {
	margin-top: 350px;
}
input:hover {
	font-weight: bold;
}
</style>

<script type="text/javascript">

</script>
</head>
<body>

	<header>
		<c:import url="../default/header.jsp" />
	</header>

	<div class="wrap">
		<div class="tab"></div>
		<div class="main">
			<div class="center">
				<div>

					<form class="conn" action="./search_result">
						<div class="search">
							<input type="text" name="keyword" style="float: left;"
								class="input" placeholder="나라 이름, 음식 또는 지역 검색"
								value="${keyword }">
							<input type="submit" onclick="./search_result.jsp"
								class="button" value="검색">
						</div>
					</form>


				</div>

				<!-- 검색 결과창 -->
				<div class="results">
					<c:choose>
						<c:when test="${map.kCount > 0 }">
                     ${map.kCount } 개의 검색 결과가 있습니다.
                  </c:when>
						<c:when test="${map.dCount > 0 }">
                     ${map.dCount } 개의 검색 결과가 있습니다.
                     <hr>
						</c:when>
						<c:otherwise>
                     관련된 결과가 없습니다.
                     <hr>
						</c:otherwise>
					</c:choose>

					<!-- 키워드 검색 결과 -->
					<c:forEach var="row" items="${map.kList }">
						<div class="result">
							<div class="rest_pic">
								<a href="${contextPath}/food2?foodName=${row.foodName }">
									<img id="pic"src="${contextPath}/resources/food2/${row.main_pic}">
								</a>
							</div>
							<div class="rest_info">
								
									<h4>${row.foodName }</h4>
									<h4>${row.nation }</h4>				
									<h5>${row.category_2 }</h5>
									<p>${row.category_1 }</p>
								
							</div>
							<hr>
						</div>
					</c:forEach>

					<!-- 세부검색 결과 -->
					<c:forEach var="row" items="${map.dList }">
						<div class="result">
							<div class="rest_pic">
							<a href="${contextPath}/food2?foodName=${row.foodName}">
									<img id="pic"src="${contextPath}/resources/food2/${row.main_pic}">
								</a>
							</div>
							<div class="rest_info">
								
									<h4>${row.foodName }</h4>
									<h4>${row.nation }</h4>
									<h5>${row.category_2 }</h5>						
	 								<p>${row.category_1 }</p>
								
							</div>
							<hr>
						</div>
					</c:forEach>

				</div>

			</div>
		</div>

	</div>
</body>

</html>