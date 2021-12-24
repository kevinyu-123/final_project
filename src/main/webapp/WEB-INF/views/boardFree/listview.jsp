<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>


<style type="text/css">
#bigbox {
	height: 100%;
	display: flex;
}
#left_box{
	width: 20%;
}
#mid_box {
	width: 60%;
	padding-top: 10px;
}

#right_box {
	width: 20%;
}
#t_btn{
	width:90px;
	height: 40px;
}
#txt_area{
	height: 800px;
	border: 1px solid gray;
	border-radius: 2px;
	width: 100%;
	border-radius:10px;
	margin-top: 10px;
}
a{
text-decoration: none;
}
#user_img{
	height: 40px;
	width: 30px;
	border-radius: 60%;
	background-color: gray;
}

</style>
</head>
<body>
<div class="w3-animate-opacity">
	<c:set var="info" value="${form}"/>
		<header>
			<c:import url="../default/header.jsp" />
		</header>
				<div id="bigbox">
				<div id="left_box"></div>
				<div id="mid_box">
				<div align="right" style="margin-top: 20px;">
					<button id="t_btn" onclick="#">△이전글</button>
					<button id="t_btn" onclick="#">▽다음글</button>
					<button id="t_btn" onclick="location.href='${contextPath}/boardAllList'">목록</button>
				</div>
				<div id="txt_area">
					<div style="margin-top: 30px; margin-left: 15px;">
						<span><a href="${contextPath}/boardAllList">자유게시판 ></a></span>
						<hr>
						<h2 style="margin: 0px;">${info.title}</h2>
						<h4 style="padding-left: 30px;">
						<img id="user_img" src="${contextPath}/resources/img/imgMain/user.png">&nbsp; ${info.writer }</h4>
						<h4>${info.reg_time }</h4>
					</div>
					<hr>
					<div>
						<textarea id="board_content" rows="19" cols="111" style="border:0; resize: none;" >${info.content}</textarea>
					</div>
				</div>
				</div>
				
		
				<div id="right_box"></div>		
			</div>
		
		<footer>
			<c:import url="../default/footer.jsp" />
		</footer>
</div>
</body>
</html>