<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Login</title>

<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@100&family=Outfit:wght@100&display=swap"
	rel="stylesheet">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
   Kakao.init('0b87610e695d8bef6993ac70b8fefc32');
    console.log(Kakao.isInitialized());

    function kakaoLogin() {
       window.Kakao.Auth.login({
            scope: 'account_email,profile_nickname', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
          success: function (response) {
          window.Kakao.API.request({
             url: '/v2/user/me',
             success: function (response) {
                const kakao_account = response.kakao_account;
                    console.log(kakao_account)
                    console.log(response.id)          
                kakaoLoginPro(response)
             },
             fail: function (error) {
                console.log(error)
             },
          })
       },
          fail: function (error) {
             console.log(error)
          },
       })
    }
    function kakaoLoginPro(response){
       var data = { id:response.id, 
                email:response.kakao_account.email,
                name:response.kakao_account.profile.nickname
                }
       $.ajax({
          type : 'POST',
          url : '/kakaoLoginChk',
          data : data,
          dataType : 'json',
          success : function(data){
             console.log(data)
             if(data.JavaData == "success"){
                alert("로그인되었습니다.");
                location.href = '${contextPath}/main'
             }else if(data.JavaData == "register"){
                $("#kakaoEmail").val(response.kakao_account.email);
                $("#kakaoId").val(response.id);
                $("#kakaoNickname").val(response.kakao_account.profile.nickname);
                $("#kakaoForm").submit();
             }else{
                alert("로그인에 실패했습니다");
             }
          },
          error: function(xhr, status, error){
             alert("로그인에 실패했습니다."+error);
          }
       });   
    }
    
</script>
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
	font-family: 'Outfit', sans-serif;
}

#test2 input {
	width: 100%;
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
}

input:focus {
	border: 2px solid #555;
}

a:hover {
	font-weight: bold;
}

#check {
	display: none;
	color: red;
}

#or {
	padding: 15px;
}
</style>
</head>
<body>


	<div id="LoginWrap" style="margin-top: 50px;">

		<div class="w3-container w3-animate-opacity">
			<h1>Log In</h1>
			<span style="font-family: 'Outfit', sans-serif;">Don't you
				have ID?</span> <a href="${contextPath}/register_form"
				style="font-family: 'Outfit', sans-serif;">Sign Up</a>

			<form action="/loginChk" method="post">

				<table>

					<tr>
						<td><input type="text" name="id" placeholder="ID"></td>
					</tr>
					<tr>
						<td><input type="password" name="pwd" placeholder="Password"><br></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="saveId"
							style="font-family: 'Gothic A1', sans-serif;"> 아이디 저장 <input
							type="checkbox" name="autoLogin"
							style="font-family: 'Gothic A1', sans-serif;"> 로그인 유지</td>
					</tr>
					<tr>
						<td><div id="test2">
								<input type="submit"
									style="font-family: 'Gothic A1', sans-serif; width: 240px;"
									value="로그인">
							</div></td>
					</tr>
					<tr>
						<td><label id="check"
							style="font-family: 'Gothic A1', sans-serif;">아이디 또는
								비밀번호가 틀렸습니다.</label></td>
					</tr>
					<tr>
						<td><a href="searchId" style="text-decoration: none">아이디찾기</a>
							/ <a href="searchPwd" style="text-decoration: none">비밀번호찾기</a></td>
					</tr>
					<tr>
						<td><div id="or">
								<label>--------------or-------------</label>
							</div></td>
					</tr>
					<tr>
						<td><a href="javascript:kakaoLogin()"><img
								src="${contextPath}/resources/img/imgMain/kakao_login_medium_narrow.png"></a>
						</td>
					</tr>
					<tr>
						<td>
							<div id="naver_id_login" style="text-align: center">
								<a href="${url}"><img width="180px"
									src="${contextPath}/resources/img/imgMain/btnG_완성형.png" />
								</a>
							</div>
						</td>
					</tr>
				</table>
			</form>
			
			<form name="kakaoForm" id="kakaoForm" method="post" action="/setKakaoInfo">
				<input type="hidden" name="email" id="kakaoEmail" /> 
				<input type="hidden" name="id" id="kakaoId" />
				<input type="hidden" name="name" id="kakaoNickname" />
			</form>

		</div>
	</div>
</body>


</html>