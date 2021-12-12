<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:set var="contextPath" value="${pageContext.request.contextPath }" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="${contextPath}/resources/js/kakao_api.js"> </script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
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
    		url : 'kakaoLoginChk',
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
<style>
* {
	font-family: 'Outfit', sans-serif;
	margin: auto;
}

#LoginWrap {
	padding: 30px;
	text-align: center;
}
h1{
font-family: 'Outfit', sans-serif;
}

#test2 input {
	width: 100%;
}

input {

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

#check {
	color: red;
	display: none;
}


</style>
</head>
<body>

 
	<div id="LoginWrap">

		<div class="w3-container w3-animate-opacity">
			<h1>Log In</h1>
		<span>Don't you have ID?</span> <a href="${contextPath}/mem/register"> Sign Up</a>
	<form>
			<table>
				<tr>
					<td><input type="text" name="id" placeholder="id"></td>
				</tr>
				<tr>
					<td><input type="password" name="pwd" placeholder="password"><br></td>
				</tr>
				<tr>
					<td><input type="checkbox"> 아이디 저장
					<input
						type="checkbox" name="autoLogin"> 로그인 유지</td>
				</tr>					
				<tr>
					<td><div id="test2">
							<input type="submit" value="로그인">
						</div></td>
				</tr>
				<tr>
					<td>
						<a href="javascript:kakaoLogin()"><img src="${contextPath}/resources/img/imgMain/kakao_login_medium_narrow.png"></a>
					</td>
				</tr>

				<tr>
					<td><label id="check">아이디 또는 비밀번호가 틀렸습니다.</label></td>
				</tr>
			</table>
			</form>
			
			<form name="kakaoForm" id="kakaoForm" method ="post" action="/mem/setKakaoInfo">
				<input type="hidden" name="email" id="kakaoEmail" />
				<input type="hidden" name="id" id="kakaoId" />
				<input type="hidden" name="name" id="kakaoNickname" />
				
			</form>
			
		</div>
	</div>

</body>
</html>