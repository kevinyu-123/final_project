<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile_update</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Montserrat&family=Outfit:wght@100&display=swap"
	rel="stylesheet">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<style>
#bigbox {
	height: 100%;
}

#profile {
	font-family: 'Gothic A1', sans-serif;
	text-align: center;
	padding: 20px;
}

#profile img {
	width: 50px;
	height: 50px;
}

#navdiv {
	font-family: 'Montserrat', sans-serif;
	position: fixed;
	text-align: center;
	list-style-type: none;
}

#navdiv ul {
	margin: 0;
	padding: 0;
	width: 200px;
}

#navdiv ul li {
	list-style-type: none;
}

#navdiv li a {
	font-size: 20px;
	display: block;
	padding: 8px 10px;
	text-decoration: none;
}

#navdiv li:hover {
	background-color: rgba(223, 209, 204);
}

.pagetitle {
	font-size: 30px;
	padding: 15px;
}

#bigbox {
	height: 650px;
	display: flex;
}

#left_box {
	width: 20%;
}

#mid_box {
	width: 60%;
	padding-top: 10px;
}

#fo {
	font-family: 'Gothic A1', sans-serif;
	margin-left: 30px;
}

input {
	font-family: 'Outfit', sans-serif;
	padding: 12px 20px;
	margin: 8px 0;
	box-sizing: border-box;
	border: 2px solid #ccc;
	border-radius: 20px;
	-webkit-transition: 0.1s;
	transition: 0.2s;
	outline: none;
	width: 300px;
}

.btn {
	font-family: 'Gothic A1', sans-serif;
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	box-sizing: border-box;
	border: 2px solid #ccc;
	border-radius: 20px;
	-webkit-transition: 0.1s;
	transition: 0.2s;
	outline: none;
	width: 70px;
	margin-left: 10px;
}

#delBtn {
	display: none;
}
</style>

<script>
	function updateName() {

		var name = $("#name").val();

		$.ajax({
			url : "updateName/" + name,
			type : "post",
			dataType : "json",
			contentType : "application/JSON; charset=utf-8",
			success : function(result) {
				if (result == 1) {
					alert("저장되었습니다.")
					console.log(name)
					location.href = "main"
				}
			},
			error : function() {
				alert("저장에 실패했습니다.")
			}

		});

	};
	function updatePwd() {
		var pwd = $("#pwd").val();

		$.ajax({
			url : "updatePwd/" + pwd,
			type : "post",
			dataType : "json",
			contentType : "application/JSON; charset=utf-8",
			success : function(result) {
				if (result == 1) {
					alert("저장되었습니다. ")
					console.log(name)
					location.href = "main"
				}
			},
			error : function() {
				alert("저장에 실패했습니다.")
			}

		});
	};

	function deleteBtn() {
		$('#deleteDiv').css("display", " inline-block");
	}

	function delete1() {
		var pwd = $('#userPwd').val()

		alert("정말 회원탈퇴 하시겠습니까?")

		$.ajax({
			url : "deleteMember/" + pwd,
			type : "post",
			dataType : "json",

			contentType : "application/JSON; charset=utf-8",
			success : function(result) {
				if (result == 1) {
					alert('회원탈퇴가 완료되었습니다.')
					location.href="main"
				}
			},
			error : function() {
				alert("탈퇴에 실패했습니다.")
			}

		})
	}
</script>
</head>
<body>

	<header>
		<c:import url="../default/header.jsp" />
	</header>
	<div class="w3-animate-opacity">

		<div id="divv">
			<div id="navdiv">
				<ul>
					<li><a href="mypage"><strong style="font-size: 25px;">
								MY PAGE</strong></a></li>

					<li><a href="mylikes">MY LIKES</a></li>
					<li><a href="myboard">MY BOARD</a></li>
					<li><a href="myreply">MY REPLY</a></li>
					<li></li>
					<li><a href="newprofile">ACCOUNT SETTINGS</a></li>

				</ul>

			</div>
			<div id="bigbox">
				<div id="left_box"></div>
				<div id="mid_box">
					${session_user}
					<div class=" w3-animate-left" style="margin-bottom: 15px;">
						<span class="pagetitle"> <b>ACCOUNT SETTING </b>
						</span>
					</div>
					<input type="text" value="${session_user}" id="sessionId"
						name="sessionId" style="display: none;">
					<table>
						<tr>
							<td><span>수정할 닉네임</span><br> <input type="text"
								id="name" name="name" placeholder="New name"> <input
								type="button" class="btn" onclick="updateName()" value="수정">
							</td>
						</tr>
						<tr>
							<td><span>수정할 비밀번호</span><br> <input type="password"
								id="pwd" name="pwd" placeholder="New pwd"> <input
								type="button" class="btn" onclick="updatePwd()" value="수정"></td>
						</tr>
						<tr>
							<td><input type="button" value="회원탈퇴하기"
								onclick="deleteBtn()"
								style="width: 150px; margin-top: 40px; margin-left: 100px; margin-bottom: 10px;"></td>

						</tr>
						<tr>
							<td>
								<div id="deleteDiv" style="display: none;">
									<input type="text" id="sessionId" name="sessionId"
										value="${session_user}" style="display: none;" /><br> <input
										type="password" id="userPwd" name="userPwd"
										placeholder="password"> <input type="button"
										class="btn" value="확인" onclick="delete1()">

								</div>
							</td>
						</tr>
					</table>

				</div>
			</div>
		</div>
	</div>
	<div id="right_box"></div>

	<footer>
		<c:import url="../default/footer.jsp" />
	</footer>
</body>
</html>