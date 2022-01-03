<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findId</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Montserrat&family=Outfit:wght@100&display=swap" rel="stylesheet">

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>


<style>
* {
	font-family: 'Gothic A1', sans-serif;
}


span {
	text-align: center;
	font-size: 20pt;
}

#div1 {
	margin-top: 40px;
}
</style>
</head>
<body>
	<div class="w3-container w3-center w3-animate-opacity">

		<h1>
			<b>아이디 찾기</b>
		</h1>
		<c:forEach items="${member}" var="member">


			<div id="div1">
				<span>회원님의 아이디는 </span> <span><b> ${member.id} </b></span> <span>입니다.</span>
			</div>
		</c:forEach>


	</div>

</body>
</html>