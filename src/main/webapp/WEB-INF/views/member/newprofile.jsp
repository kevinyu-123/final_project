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
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@100&family=Outfit:wght@100&display=swap"
	rel="stylesheet">
<style>


#bigbox {
height: 100%;
}

#profile {
	text-align: center;
	padding: 20px;
	margin: auto;
}

#profile img {
	width: 50px;
	height: 50px;
}

#navdiv {
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
	font-size: 40px;
	padding: 15px;
}

#flex {
	margin-top: 50px;
margin-left:450px;
	position: relative;
}

#flex span {
	
	font-size: 18px;
}

#flex table tr td {
	text-align: left;
	width: 300px;
	height: 50px;
	padding: 5px;
}



#flex input,button {
	font-size: 15px;
	width: 100%;
	padding: 8px 10px;
	margin:  0 ;
	box-sizing: border-box;
	border: 2px solid #ccc;
	border-radius: 20px;
	-webkit-transition: 0.3s;
	transition: 0.2s;
	outline: none;
}

#flex input:focus {
	border: 3px solid #555;
}
#flex button:focus {
	border: 3px solid #555;
}


</style>
<script>

	function update() {
		let name = $("#userName").val()
		let pwd = $("#userPwd").val()
		
		let form = {
			name : name,
			pwd : pwd
		}

		$.ajax({
			url : "memberUpdate",
			type : "put",
			dataType : "json",
			data : JSON.stringify(form),
			contentType : "application/JSON; charset=utf-8",
			success : function(dto) {
				alert("저장되었습니다.")
			},
			
			error : function(){
				alert("저장에 실패했습니다.")
			}

		})
	}
</script>
</head>
<body>
	
		<header>
			<c:import url="../default/header.jsp" />
		</header>
		<div class="w3-animate-opacity" >
		<div id="bigbox">
			<div class="w3-center w3-animate-top" style="margin-bottom: 20px;">
				<span class="pagetitle"> <b>My Profile</b>
				</span>
			</div>
			<div id="profile">
				<img src="${contextPath }/resources/img/imgMain/user.png"><br>
				<span><b>${session_user }</b></span>
			</div>
			<div>
				<div>
					<ul id="navdiv">
						<li><a href="mypage"><strong style="font-size: 25px;">My
									Page</strong></a></li>

						<li><a href="mylikes">My Likes</a></li>
						<li><a href="myboard">My Board</a></li>
						<li><a href="myreply">My Reply</a></li>
						<li></li>
						<li><a href="newprofile"><b>> Account Settings</b></a></li>

					</ul>

				</div>

				<div id="flex">
				
					<table>
						<tr>
							<td><span>New name</span></td>
						</tr>
						<tr>
							<td>
							<input type="text" id="userName" name="userName"
								placeholder="New name"></td>
						</tr>

						<tr>
							<td><span>New password</span></td>
						</tr>
						<tr>
							<td><input type="text" name="userPwd" id="userPwd"
								placeholder="New password"></td>
						</tr>
						<tr>
							<td style="padding: 10px;"></td>
						</tr>
						<tr>
							<td>
								<button type="button" onclick="update()">수정</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<c:import url="../default/footer.jsp" />
	</footer>
</body>
</html>