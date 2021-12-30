<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>setNaverInfo</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Montserrat&family=Outfit:wght@100&display=swap" rel="stylesheet">
 

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script type="text/javascript">

	function auth() {
		var name = $("#nickname").val()
		var email = $('#email').val()
		var form = {
			name : name,
			email : email
		}

		$.ajax({
			url : "auth",
			type : "post",
			dataType : "json",
			data : JSON.stringify(form),
			contentType : "application/json; charset=utf-8",
			success : function(msg) {
				console.log(msg)
				if (msg == true) {
					alert("이메일 인증코드를 발송하였습니다.")
				}
			},
			error : function() {
				alert('이메일 인증코드발송에 실패하였습니다.')
			}

		})
	}

	function checkCode() {
		var email_auth = $("#email_auth").val()

		$.ajax({
			url : "checkVal/" + email_auth,
			type : "post",
			dataType : "json",
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				if (data == 1) {
					$("#authCheck").html("인증되었습니다.")
					
		
				}
			},
			error : function() {
				$("#authCheck").html("다시 진행해주세요.")
			}
		})
		
	}
	
</script>

<style>
* {
	font-family: 'Outfit', sans-serif;
	margin: auto;
}

#LoginWrap {
	padding: 30px;
}

h1 {
	font-family: 'Outfit', sans-serif;
}

input, button {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	box-sizing: border-box;
	border: 2px solid #ccc;
	border-radius: 20px;
	-webkit-transition: 0.3s;
	transition: 0.2s;
	outline: none;
}

input:focus {
	border: 3px solid #555;
}

#authChk {
	color: red;
}



.email_chk {
	color: #6A82FB;
	display: none;
}
</style>


</head>
<body>
<div class="w3-container w3-center w3-animate-opacity">

	<form name="userRegisterForm" id="userRegisterForm" method="POST" action="naverRegister">

		<input type="hidden" id="email" name="email" value="${email}" /> 
		<input type="hidden" id="nickname" name="name" value="${nickname}" /> 
		<input type="hidden" id="pwd" name="pwd" value="${id}">
		<input type="hidden" id="id" name="id" value="${id }">
		<input type="hidden" id="naverlogin" name="naverlogin" value="${id}">
		
		<div id="LoginWrap">

			<h1>Sign up</h1>
		<table>
		
				<tr>
					<th colspan="3">신규 가입 추가 정보 설정</th>
				</tr>

			<tbody>
				<tr>
					<td class="text">이메일 인증하기</td>
				</tr>
				<tr>
					<td><input type="text" value="${email }" readonly></td>
				</tr>
				<tr>
					<td><input type="button" value="인증코드보내기" onclick="auth()"></td>
				</tr>
				<tr>
					<td><input type="text"id="email_auth" name="email_auth"
						placeholder="코드 입력"></td>
				</tr>
				<tr>
					<td><input type="button" value="인증하기" onclick="checkCode()"></td>
				</tr> 
				<tr>
					<td><label id="authCheck"></label><br></td>
				</tr>
				<tr>
					<td><input type="submit" value="가입">
						</td>
				</tr>
			</tbody>
		</table>
		</div>
	</form>
	
	
	</div>
	
</body>
</html>