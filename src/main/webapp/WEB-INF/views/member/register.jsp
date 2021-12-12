<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Outfit:wght@100&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


<style>
* {
	font-family: 'Outfit', sans-serif;
	margin: auto;
}

#LoginWrap {
	padding: 30px;
	text-align: center;
}

h1 {
	font-family: 'Outfit', sans-serif;
}

input {
	text-align: center;
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	box-sizing: border-box;
	border: 2px solid #ccc;
	border-radius: 20px;
	-webkit-transition: 0.5s;
	transition: 0.5s;
	outline: none;
}

input:focus {
	border: 3px solid #555;
}
</style>
</head>
<body>
	<div class="w3-container w3-center w3-animate-opacity">

		<div id="LoginWrap">

			<h1>Sign up</h1>
			<span>Already a member?<a href="${contextPath}/mem/login">LogIn</a><br></span>
			<table>
				<tr>
					<td><input type="text" name="id" placeholder="id"></td>
				</tr>
				<tr>
					<td><input type="password" name="pwd" placeholder="password"><br></td>
				</tr>
				<tr>
					<td><input type="text" name="name" placeholder="name"><br></td>
				</tr>
				<tr>
					<td><input type="text" name="email" placeholder="email"><br></td>
				</tr>
				<tr>
					<td>
						<div>
							<input type="button" value="인증코드 전송" onclick="emailCertify()">
						</div>
					</td>
				</tr>

				<tr>
					<td><input type="text" name="emailCode" placeholder="코드 입력"><br></td>
				</tr>
				<tr>
					<td><input type="submit" value="가입하기"></td>
				</tr>
			</table>

		</div>
	</div>
</body>
</html>