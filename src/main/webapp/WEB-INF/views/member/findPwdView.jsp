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
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@100;200&family=Montserrat:wght@300&family=Outfit:wght@100&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


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

.email_ok {
	font-family: 'Gothic A1', sans-serif;
	color: #6A82FB;
	display: none;
}

.email_chk {
	font-family: 'Gothic A1', sans-serif;
	color: #6A82FB;
	display: none;
}
.id_ok {
	font-family: 'Gothic A1', sans-serif;
	color: #6A82FB;
	display: none;
}

</style>

<script type="text/javascript">
	var msg = "${msg}";

	if (msg != "") {
		alert(msg);
	}

	function checkEmail() { // 이메일형식 검사
		var email = $('#email').val();
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

		if (exptext.test(email) == false) {
			$('.email_chk').css("display", "inline-block");
			userinput.email.focus();

		} else {
			$('.email_chk').css("display", "none");
			return true;
		}
		return false;
	}

	function auth() {
		var name = $("#name").val()
		var email = $('#email').val()
		var form = {
			name : name,
			email : email
		}
		emailCheck()

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
				} else {
					alert('이메일 인증코드발송에 실패하였습니다.')
				}
			},
			error : function() {
				alert('이메일 인증코드발송에 실패하였습니다.')
			}

		})
	}

	function checkCode() {
		var emailCode = $("#email_auth").val()
	
		$.ajax({
			url : "checkVal/" + emailCode,
			type : "post",
			dataType : "json",
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				if (data == 1) {
					$("#authCheck").html("인증되었습니다.")
					$('#authCheck').css("color", " #6A82FB");
					$("#submit").prop("disabled", false);
					updateEmail_auth()
				} else {
					alert('다시 진행해주세요.')
				}
			},
			error : function() {
				$("#authCheck").html("다시 진행해주세요.")
			}
		})
	}
	
	function idCheck() {
		var id = $('#name').val();
		$.ajax({
			url : 'idCheck',
			type : 'post',
			data : {
				id : id
			},
			success : function(cnt) {
				if (cnt != 1) {
					$('.id_ok').css("display", "inline-block");
				
				} else {
					$('.id_ok').css("display", "none");
				}
			},

			error : function() {
				alert("에러입니다");
			}
		})
	}
	
	function emailCheck() {
		var email = $('#email').val();

		$.ajax({
			url : 'emailCheck',
			type : 'post',
			data : {
				email : email
			},
			success : function(cnt) {
				if (cnt != 1) {
					$('.email_ok').css("display", "inline-block");
				
				} else {
					$('.email_ok').css("display", "none");
				}
			},
			error : function() {
				alert("에러입니다");
			}
		});
	};
	
</script>
</head>
<body>

	<div id="divv">
		<div class="w3-container w3-center w3-animate-opacity">
			<h1>
				<b>비밀번호 찾기</b>
			</h1>

			<form class="user" action="findPwd" method="POST">
				<table style="margin-top: 30px;">
					<tr>
						<td>아이디를 입력하세요.<br> 
						<input type="text" id="name" name="name" placeholder="id"oninput="idCheck()"><br>
						<span class="id_ok">존재하지 않는 아이디 입니다.</span>
						</td>
					</tr>

					<tr>
						<td>가입하신 이메일을 입력하세요.<br> 
						<input type="text" id="email" name="email" placeholder="email"><br>
						<span class="email_ok">가입되지 않은 이메일입니다.</span>
						<span class="email_chk">이메일 형식이 올바르지 않습니다.</span>
						</td>
					</tr>
					<tr>
						<td><input type="button" value="인증코드보내기" onclick="auth()"></td>
					</tr>
					<tr>
						<td><input type="text" id="email_auth" name="email_auth"
							placeholder="코드 입력"></td>
					</tr>

					<tr>
						<td><input type="button" value="인증하기" onclick="checkCode()"
							class="btn"><br> <span id="authCheck"
							style="font-family: 'Gothic A1', sans-serif;"></span></td>

					</tr>
					<tr>
						<td><input type="submit" value="확인" id="submit"
							disabled="disabled"></td>
					</tr>
				</table>
			</form>

		</div>

	</div>

</body>

</html>