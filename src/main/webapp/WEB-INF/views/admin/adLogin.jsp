<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${cotextPath }/resources/css/register.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Montserrat&family=Outfit:wght@100&display=swap"
	rel="stylesheet">

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>



</head>
<body>
	<div id="LoginWrap" style="margin-top: 50px;">

		<div class="w3-container w3-center w3-animate-opacity">
			<h1>Log In</h1>


			<form action="adloginChk" method="post">
				<table>

					<tr>
						<td><input type="text" name="id" placeholder="id"></td>
					</tr>
					<tr>
						<td><input type="password" name="pwd" placeholder="password"><br></td>
					</tr>
					<tr>
						<td><div id="test2">
								<input type="submit"
									style="font-family: 'Gothic A1', sans-serif; width: 240px;"
									value="관리자 로그인">
							</div></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>