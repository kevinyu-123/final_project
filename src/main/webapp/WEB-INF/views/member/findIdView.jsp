<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 / 비밀번호찾기</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Montserrat&family=Outfit:wght@100&display=swap" rel="stylesheet">
 

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>


<style type="text/css">
* {
	font-family: 'Gothic A1', sans-serif;
	margin: auto;
}

#LoginWrap {
	padding: 30px;
	text-align: center;
}

h1 {
	font-family: 'Gothic A1', sans-serif;
}

input {
	font-family: 'Gothic A1', sans-serif;
	padding: 12px 20px;
	margin: 8px 0;
	box-sizing: border-box;
	border: 2px solid #ccc;
	border-radius: 20px;
	-webkit-transition: 0.1s;
	transition: 0.2s;
	outline: none;
	width: 200px;
}

input:focus {
	border: 2px solid #555;
}

#check {
	display: none;
	color: red;
}
</style>
<script>
var msg = "${msg}";

if (msg != "") {
	alert(msg);
}

</script>
</head>
<body>

	<div class="w3-container w3-center w3-animate-opacity">

		<h1>
			<b>아이디 찾기</b>
		</h1>
		<!-- 이메일로찾기 -->

<form class="user" action="findId" method="POST">
			<table style="margin-top: 30px;">
				<tr>
					<td>이메일을 입력하세요.<br> <input type="text" id="email"
						name="email" placeholder="email">
					</td>
				</tr>
				<tr>
					<td><input type="submit"value="아이디 찾기"></td>
				</tr>
			</table>
		</form>

	</div>
</body>

</html>