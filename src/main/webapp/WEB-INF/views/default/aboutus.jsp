<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About us</title>
<style>
	#main{
		height: 600px;
	}
	#sub_top{
		height: 20%;
		background-color:ivory;
	}
	#body{
		height: 80%;
		display: flex;
	}
	#left_body{
		background-color: lime;
		width: 40%;
	}
	#right_body{
		background-color: blue;
		width: 60%;
	}
</style>
</head>
<body>
	<div class="w3-animate-opacity">
	<header>
		<c:import url="../default/header.jsp" />
	</header>
	<div id="main">
	<div id="sub_top">
		<span> About Dining Lab </span>
	</div>
	<div id="body">
	
		<div id="left_body">	
			
		</div>
		<div id="right_body">
			
		</div>
		
	</div>
	</div>	
	<footer>
		<c:import url="../default/footer.jsp" />
	</footer>
	</div>
	
</body>
</html>