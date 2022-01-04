<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Montserrat&family=Outfit:wght@100&display=swap"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
#body {
	font-family: 'Gothic A1', sans-serif;
}
#write_btn {
	font-family: 'Gothic A1', sans-serif;
	width: 100%;
	margin: 8px 0;
	box-sizing: border-box;
	border: 2px solid #ccc;
	border-radius: 10px;
	-webkit-transition: 0.1s;
	transition: 0.2s;
	outline: none;
	width: 100px;
	padding: 10px;
}
input:hover {
	font-weight: bold;
}
input {
	padding: 12px 20px;
	box-sizing: border-box;
	border: 2px solid #ccc;
	border-radius: 20px;
	-webkit-transition: 0.1s;
	transition: 0.2s;
	outline: none;
	width: 500px;
	margin: auto;
}
textarea {
	padding: 12px 20px;
	box-sizing: border-box;
	border: 2px solid #ccc;
	border-radius: 20px;
	-webkit-transition: 0.1s;
	transition: 0.2s;
	outline: none;
	width: 500px;
	margin: auto;
}
</style>
<script type="text/javascript">
function readURL(input) {
	var file = input.files[0]
	console.log(file)
	if (file != '') {
		var reader = new FileReader();
		reader.readAsDataURL(file); 
		reader.onload = function(e) { 
			$('#preview').attr('src', e.target.result);
		}
	}
}
</script>
</head>
<body>
	<div class="w3-animate-opacity">
		<div id="body">

			<div style="text-align: center; margin-top:35px;">
				<form name="form" action="writeSave" method="post" enctype="multipart/form-data">
					<span> 작성자 : ${session_user} <br>
					</span> <input type="hidden" id="writer" name="writer"
						value="${session_user }"> <br> <input type="text"
						id="title" name="title" placeholder="event title을 입력하세요.">
					<br> <br> <b>이미지파일 첨부</b> <br> 
					<input type="file" name="img_url"
				onchange="readURL(this);" /> <br>
				
				<img id="preview" src="#" width=100
				height=100 alt="선택된 이미지가 없습니다" /><br>
					<br>

					<textarea name="content" rows="20" cols="50" id="content"
						placeholder="업로드할 이벤트 내용을 입력하세요." style="resize: none;"></textarea>


					<br> <br>
					<br> <input type="submit" value="글쓰기" id="write_btn"/> 
					<input
						type=button value="목록보기" id="write_btn"
						onClick="location.href='${contextPath}/event'">
				</form>
			</div>

		</div>
	</div>
</body>
</html>