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
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Montserrat&family=Outfit:wght@100&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="${contextPath }/resources/css/register.css">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


<script>
	function register() {
		var inval_Arr = new Array(5).fill(false);

		var id = $("#id").val()
		var email = $("#email").val()
		var pwd = $("#pwd").val()
		var name = $("#name").val()
		var emailCode = $("#emailCode").val()

		if (id == "") {
			inval_Arr[0] = false
		} else {
			inval_Arr[0] = true;
		}

		if (pwd == "") {
			inval_Arr[1] = false
		} else {
			inval_Arr[1] = true;
		}

		if (name == "") {
			inval_Arr[2] = false
		} else {
			inval_Arr[2] = true;
		}

		if (email == "") {
			inval_Arr[3] = false
		} else {
			inval_Arr[3] = true;
		}

		if (emailCode == "") {
			inval_Arr[4] = false
		} else {
			inval_Arr[4] = true;
		}

		var validAll = true;

		for (var i = 0; i < inval_Arr.length; i++) {
			if (inval_Arr[i] == false) {
				validAll = false;
			}
		}
		if (validAll) { // 유효성 모두 통과
			alert('회원가입을 축하합니다 ;)');
			fo.submit()

		} else {
			alert('빈칸을 모두 입력해주세요! :)')

		}

	}

	function auth() {
		var name = $("#name").val()
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
				checkEmail()
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
		var emailCode = $("#emailCode").val()

		$.ajax({
			url : "checkVal/" + emailCode,
			type : "post",
			dataType : "json",
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				if (data == 1) {
					$("#authCheck").html("인증되었습니다.")
					$('#authCheck').css("color", " #6A82FB");
					$("#reg_submit").prop("disabled", false);
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
		var id = $('#id').val();
		$.ajax({
			url : 'idCheck',
			type : 'post',
			data : {
				id : id
			},
			success : function(cnt) {
				if (cnt != 1) {
					$('.id_ok').css("display", "inline-block");
					$('.id_already').css("display", "none");
				} else {
					$('.id_already').css("display", "inline-block");
					$('.id_ok').css("display", "none");
				}
			},

			error : function() {
				alert("에러입니다");
			}
		});
	};
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
					$("#auth_button").prop("disabled", false);
					$('.email_already').css("display", "none");
				} else {
					$('.email_already').css("display", "inline-block");
					$("#auth_button").prop("disabled", true);
					$('.email_ok').css("display", "none");
				}
			},
			error : function() {
				alert("에러입니다");
			}
		});
	};

	function checkEmail() {
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
	function nameCheck(){
		var name= $('#name').val();
		
		$.ajax({
			url : 'nameCheck',
			type : 'post',
			data : {name:name},
			success : function(cnt) {
				if (cnt != 1) {
					$('.name_ok').css("display", "inline-block");
					$('.name_already').css("display", "none");
				} else {
					$('.name_already').css("display", "inline-block");
					$('.name_ok').css("display", "none");
				}
			},

			error : function() {
				alert("에러입니다");
			}
		})
	}
		
	
</script>

</head>
<body>
	<div class="w3-container w3-center w3-animate-opacity">

		<div id="LoginWrap">

			<h1>Sign up</h1>
			<span style="font-family: 'Outfit', sans-serif;">Already a
				member?<a href="${contextPath}/naverlogin"
				style="font-family: 'Outfit', sans-serif;">Log In</a><br>
			</span>

			<form id="fo" action="register" method="post">
				<table>
					<tr>
						<td><input type="text" id="id" name="id" placeholder="ID"
							oninput="idCheck()"><br> 
							<span class="id_ok">사용
								가능한 아이디입니다.</span> 
								<span class="id_already">이미 존재하는 아이디입니다.</span></td>
					</tr>
					<tr>
						<td><input type="password" id="pwd " name="pwd"
							placeholder="Password"></td>
					</tr>

					<tr>
						<td><input type="text" name="name" id="name"
							placeholder="Name" oninput="nameCheck()"><br>
							<span class="name_ok">사용 가능한 닉네임입니다.</span> 
							<span class="name_already">이미 존재하는 닉네임 입니다.</span></td>

					</tr>
					<tr>
						<td><input type="text" name="email" id="email"
							placeholder="e-mail" oninput="emailCheck()"><br> <span
							class="email_chk">이메일 형식이 올바르지 않습니다.</span></td>
					</tr>
					<tr>
						<td><span class="email_already">이미 존재하는 이메일 입니다.</span></td>
					</tr>

					<tr>
						<td><input type="button" id="auth_button" value="인증코드보내기"
							onclick="auth()" class="btn" disabled="disabled"></td>
					</tr>

					<tr>
						<td><input type="text" name="email_auth" id="emailCode"
							placeholder="Enter code"></td>
					</tr>
					<tr>
						<td><input type="button" value="인증하기" onclick="checkCode()"
							class="btn"><br> <span id="authCheck"
							style="font-family: 'Gothic A1', sans-serif;"></span></td>

					</tr>

					<tr>
						<td><input type="button" id="reg_submit" onclick="register()"
							value="가입" class="btn" disabled="disabled"></td>

					</tr>
				</table>
			</form>
		</div>
	</div>

</body>
</html>