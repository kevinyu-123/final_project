<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<title>nav_bar</title>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style type="text/css">
a{
margin-top: 20px;
text-align: center;
}
</style>
</head>
<body>
<!-- Sidebar -->
<div class="w3-sidebar w3-bar-block" style="display:none;z-index:5" id="mySidebar">
  <button id="butt" class="w3-bar-item w3-button w3-xxlarge" onclick="w3_close()" style="text-align: center;">목 록</button>
  <a href="${contextPath}/boardAllList" class="w3-bar-item w3-button">자유게시판</a>
  <a href="${contextPath}/news" class="w3-bar-item w3-button">공지사항</a>
  <a href="${contextPath}/event" class="w3-bar-item w3-button">이벤트</a>
  <a href="${contextPath}/map/mapmain" class="w3-bar-item w3-button">지도 보기</a>
</div>

<!-- Page Content -->
<div class="w3-overlay" onclick="w3_close()" style="cursor:pointer" id="myOverlay"></div>

<div>
  <button class="w3-button w3-white w3-xxlarge" onclick="w3_open()">&#9776;</button>
</div>
     
<script>
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("myOverlay").style.display = "block";
}

function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("myOverlay").style.display = "none";
}
</script>
          
</body>
</html>
