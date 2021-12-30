<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
html, body {
	height: 100%;
}

.wrap {
	display: flex;
	flex-direction: column;
	height: 100%;
}

.tab {
	height: 70px;
}

.main {
	display: flex;
	min-height: 100%;
}

/* side 탭 메뉴*/
.side {
	position: fixed;
	display: flex;
	width: 250px;
	height: 300px;
	margin-top: 50px;
	margin-left: 250px;
	margin-right: 15px;
}

ul {
	border: 1px solid black;
	list-style-type: none;
	text-align: center;
	height: 130px;
	width: 120px;
	margin-left: 100px;
}

#link {
	font-size: large;
	width:100px;
	text-decoration: none;
}

/* 결과창 */
.center {
	display: flex;
	flex: 1;
	margin-left: 450px;
	margin-right: 450px;
	width: 600px;
	flex-direction: column;
	height: auto;
}

.search {
	text-align: center;
	height: 10%;
	width: 600px;
	margin: 0 auto;
	flex-grow: 0.1;
}

.results {
	display: flex;
	margin: 0 auto;
	width: 70%;
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
  	width: 250px;
  	height: 100%;
}

.rest_info {
	flex-direction: column;
	margin-right: 200px;
	height: 150px;
}

.conn {
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

a {
	text-decoration-line: none;
}

li {
	margin: 30px 0;
}
footer {
	margin-top: 350px;
}
</style>

<script type="text/javascript">

</script>
</head>
<body>
	<header>
		<c:import url="../default/header.jsp" />
	</header>
	<!-- 
	<c:forEach var="row" items="${map.list }">
		<p>${row.foodName }</p>
		<p>${row.foodComment }</p> 
		<p>${row.nation }</p> 
		<p>${row.intro }</p> 
		<p>${row.category_1 }</p> 
		<p>${row.category_2 }</p> 
		<p>${row.rate }</p> 
		<hr>
	</c:forEach>
	 
	${map.country }<br>
	${map.addr }<br>
	${map.food }<br>
	-->
	<div class="wrap">
		<div class="tab"></div>
		<div class="main">
			<div class="side">
				<ul>
					<li><a href="#main_page">Dining Lab</a></li>
					<li><a href="detail_search">세부검색</a></li>
					<li><a href="#map">지도로 보기</a></li>
				</ul>
			</div>
			<div class="center">
				<div class="search">
					<h2>Dining Lab</h2>
					<form class="conn" action="./search_result">
						<input type="text" name="keyword" placeholder="나라 이름, 음식 또는 식당 검색" value="${keyword }">
						<button type="submit" onclick="./search_result.jsp">검색</button>
					</form>
				</div>
				
				<!-- 검색 결과창 -->
				<div class="results">
					<c:choose>
						<c:when test="${map.dCount > 0 }">
							${map.dCount } 개의 결과가 있습니다.
							<hr>
						</c:when>
						<c:when test="${map.kCount > 0 }">
							${map.kCount } 개의 결과가 있습니다.
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
								<img id="pic" src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Shoyu_ramen%2C_at_Kasukabe_Station_%282014.05.05%29_1.jpg/1200px-Shoyu_ramen%2C_at_Kasukabe_Station_%282014.05.05%29_1.jpg">
							</div>
							<div class="rest_info">
								<div class="rest_title">
									<h4>${row.foodName }</h4> <h4>${row.nation }</h4>
								</div>
								<div class="rest_comment">
									<h5>${row.category_2 }</h5>
								</div>
								<div class="rest_addr">
									<p>${row.category_1 }</p>
								</div>
							</div>
							<hr>
						</div>
					</c:forEach>
					
					<!-- 세부검색 결과 -->
					<c:forEach var="row" items="${map.dList }">
						<div class="result">
							<div class="rest_pic">
								<img id="pic" src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Shoyu_ramen%2C_at_Kasukabe_Station_%282014.05.05%29_1.jpg/1200px-Shoyu_ramen%2C_at_Kasukabe_Station_%282014.05.05%29_1.jpg">
							</div>
							<div class="rest_info">
								<div class="rest_title">
									<h4>${row.foodName }</h4> <h4>${row.nation }</h4>
								</div>
								<div class="rest_comment">
									<h5>${row.category_2 }</h5>
								</div>
								<div class="rest_addr">
									<p>${row.category_1 }</p>
								</div>
							</div>
							<hr>
						</div>
					</c:forEach>

				</div>
				
			</div>
		</div>
	</div>
	<footer>
		<c:import url="../default/footer.jsp" />
	</footer>
</body>
</html>





































