<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>likes</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Montserrat&family=Outfit:wght@100&display=swap" rel="stylesheet">
 
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<style>
* {
	
}


#bigbox{
height:100%;}

#profile {
	text-align: center;
	padding: 20px;
	margin: auto;
}

#profile img {
	width: 50px;
	height: 50px;
}

span {
	text-align: center;
	margin: auto;
	font-size: 30px;
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

#flex {
	margin-left: 300px;
	margin-top: 50px;
	display: flex;
	position: relative;
}

.pagetitle {
	font-size: 40px;
	padding: 15px;
}

#bigbox {
   height: 650px;
   display: flex;
}
#left_box{
   width: 20%;
}
#mid_box {
   
   width: 60%;
   padding-top: 10px;
}

</style>
</head>

			
<body>
      <div class="w3-animate-opacity">
      <header>
         <c:import url="../default/header.jsp" />
      </header>
         <div id="div">
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
               <div class=" w3-animate-left" style="margin-bottom: 20px;">
                  <span class="pagetitle"> <b>MY LIKES</b>
                  </span>
               </div>
            <div style="height: 300px; background-color: yellow; width: 70%;">
               <p>haha</p>
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