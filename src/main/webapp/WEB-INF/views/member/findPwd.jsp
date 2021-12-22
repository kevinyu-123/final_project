<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findPwd</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Montserrat&family=Outfit:wght@100&display=swap"
	rel="stylesheet">

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<style>
* {
	font-family: 'Gothic A1', sans-serif;
}

#divv {
	padding: 30px;
}

#divv input {
	padding: 12px 20px;
	margin: 8px 0;
	box-sizing: border-box;
	border: 2px solid #ccc;
	border-radius: 20px;
	-webkit-transition: 0.1s;
	transition: 0.2s;
	outline: none;
	width: 240px;
}

#divv input:focus {
	border: 2px solid #555;
}

span {
	text-align: center;
}

#div1 {
	margin-top: 40px;
}
</style>
<script>
	var email_auth = $('#email_auth').val();
	var id = $('#id').val();

	function updatePwd() {
		console.log(email_auth,id);
		fo.submit();
		
		
	alert('새로운 비밀번호를 설정하세요:)')
	}
	
</script>
</head>
<body>
	<div id="divv">
		<div class="w3-container w3-center w3-animate-opacity">
			<h1>
				<b>비밀번호 찾기</b>
			</h1>

			<form id="fo" action="updatePassword" method="post">
				<div id="div1">
					<c:forEach items="${member}" var="member">
						<input type="text" value="${member.id }" style="display: none;"
							id="id" name="id">
						<input type="text" value="${member.email_auth }"
							style="display: none;" id="email_auth" name="email_auth">
						<span><b>${member.id } </b> 회원님의 임시비밀번호는 </span>
						<br>

						<label><b>${member.email_auth}</b> </label>
					</c:forEach>
					<span>입니다.</span>
				</div>
				<input type="submit" value="확인" onclick="updatePwd()"> <br>
			</form>
		</div>
	</div>
</body>

</html>