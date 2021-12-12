<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

</head>
<body>
<form name="userRegisterForm" id="userRegisterForm" method="POST" action="memKakaoRegitser">
	<input type="hidden"  id="email" name="email" value="${email}"/>
	<input type="hidden"  id="pwd" name="pwd"  value="${password}">
	<input type="hidden"  id="id" name="id" value="${password}">
	<input type="hidden" id="name" name="name" value="${name}">
	<input type="hidden" id="kakaologin" name="kakaologin" value="${password}">
	<table border="1">
			<tr>
				<th colspan="3">신규 가입 추가 정보 설정</th>
			</tr>
			<tr>
				<td class="text">이메일 인증</td>
				<td><input type="text" value="${email}" readonly="readonly"></td>
				<td><button type="button" onclick="auth()">메일 보내기</button></td>
				</tr>
				<tr>
				<td><input type="text" id="email_auth" name="email_auth" placeholder="인증번호를 입력해 주세요"></td>
				<td><button id="dupliButton" type="button" onclick="email_chk()">인증체크</button></td>
				<td><label id="email_chk"></label></td>
			</tr>
			<tr>
				<td>
				<input type="submit" value="회원가입" />
				</td>
				
			</tr>
	</table>
</form>

<script>
function auth(){
	var name = $("#name").val()
	var email = $("#email").val()
	var form ={ name : name, email : email}
	$.ajax({
		url : "auth",
		type : "post",
		dataType :"json",
		data : JSON.stringify(form),
		contentType : "application/json; charset=utf-8",
		success : function(msg){
			console.log(msg)
			if(msg == true){
			console.log("sent");
			console.log(id)
			console.log(email)
			}
		},error : function(){
			console.log("error");
		}
	})
}

	function email_chk(){
		var email_val = $("#email_auth").val()
	$.ajax({
		type : 'POST',
		url : 'email_auth/'+email_val,
		dataType : 'json',
		contentType : "application/json; charset = utf-8",
		success : function(data){
			if(data == 1){
				$("#email_chk").html("인증되었습니다.")	
			}
		},
		error: function(){
			$("#email_chk").html("다시 시도해 주세요.")	
		}
	});
}
</script>
</body>
</html>