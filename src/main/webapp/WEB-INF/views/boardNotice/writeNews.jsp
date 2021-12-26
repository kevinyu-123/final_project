<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자가 글 쓰는 페이지</title>

</head>
<body>
	냥냥

	<form action="saveNotice" method="post">
	
		<input type="text" id="title" name="title">
		<textarea id="content" name="content"></textarea>
		<input type="text" id="id" name="id" value="${session_user }" readonly /> 
		<input type="submit" value="저장">
		
		
	</form>
</body>
</html>