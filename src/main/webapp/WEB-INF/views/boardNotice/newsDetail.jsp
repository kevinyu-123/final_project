<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Montserrat&family=Outfit:wght@100&family=Playfair+Display+SC&display=swap"
	rel="stylesheet">
</head>
<style>
.pagetitle {
	font-size: 30px;
	padding: 15px;
}

table {
		font-family: 'Gothic A1', sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	
	border: 1px solid #dddddd;
	text-align: center;
	padding: 8px;
}

tr:nth-child(even) {
	
}

#bigbox {
	height: 650px;
	display: flex;
	overflow: auto;
	
}

#left_box {
	width: 20%;
}

#mid_box {
	width: 60%;
	padding-top: 10px;
}

#right_box {
	width: 20%;
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
					<div class=" w3-animate-left" style="margin-bottom: 20px;">
						<span class="pagetitle"> <b>공지사항</b>
						</span>

					</div>
					<div>
						<table border="1">
							<tr>
							<!-- board.title -->
							<th colspan="2"> 공지사항 제목 </th>
							</tr>

							<tr>
							<!-- board.date -->
								<td style="width:20%;">
								작성일자 
								</td>
								<td>
							<!-- board.writer -->
								작성자</td>
							</tr>
							<tr>
							<td colspan="2"style="width:100%; height:700px; overflow:auto;">
							</td>
							</tr>
							<Tr><td colspan="2">
								<div style="margin-top: 50px;">
							<a href="news"
								style="text-decoration: none; font-size: 15pt; color: gray;">
								목록으로 가기 </a>
						</div>
							
							</Tr>

						</table>
					
					</div>


				</div>
				<div id="right_box"></div>
			</div>

		<footer>
			<c:import url="../default/footer.jsp"></c:import>

		</footer>
	</div>





</body>
</html>