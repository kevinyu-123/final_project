<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html style="font-size: 16px;">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="biography, ​making beauty, 01, 02, gallery">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>Home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/nicepage.css" media="screen">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/Home3.css" media="screen">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/event.css">
    <script class="u-script" type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="${pageContext.request.contextPath }/resources/js/nicepage.js" defer=""></script>
    <meta name="generator" content="Nicepage 4.2.6, nicepage.com">
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
    <link id="u-page-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Merriweather:300,300i,400,400i,700,700i,900,900i|Ubuntu:300,300i,400,400i,500,500i,700,700i">
   	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Montserrat&family=Outfit:wght@100&family=Playfair+Display+SC&display=swap"
	rel="stylesheet">
	
	<style type="text/css">
		.foodListName {
			font-size: 20px;
			text-align: center;
			text-transform: capitalize;
		}
	</style>
	
	
    
    <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": ""
}</script>
    <meta name="theme-color" content="#89b2d8">
    <meta property="og:title" content="Home">
    <meta property="og:type" content="website">
  </head>
	<a href="${pageContext.request.contextPath }/nationEditForm?nation=${nation.nation}">수정</a>
	<a href="${pageContext.request.contextPath }/nationDelete?nation=${nation.nation}&nationPicture=${nation.nationPicture}">삭제</a>
	
	<header>
		<c:import url="../default/header.jsp"></c:import>
	</header>
	
  <body  class="u-body"><header class="u-align-center-xs u-clearfix u-header u-header" id="sec-5ba5"><div class="u-align-left u-clearfix u-sheet u-sheet-1"></div></header>
    <section class="u-align-center u-clearfix u-section-1" id="carousel_8920">
      <div class="u-clearfix u-sheet u-sheet-1">
        <h2 class="u-custom-font u-font-merriweather u-text u-text-default u-text-1" data-animation-name="slideIn" data-animation-duration="2000" data-animation-direction="Left" style="text-transform: capitalize;">${nation.nation }</h2>
       <!--  <div class="u-image u-image-circle u-image-1" alt="" data-image-width="721" data-image-height="1080" data-animation-name="rollIn" data-animation-duration="2000" data-animation-direction="" id="nationPic"></div> -->
        <div class="u-image u-image-circle " alt="" data-image-width="721" data-image-height="1080" data-animation-name="rollIn" data-animation-duration="2000" data-animation-direction="" id="nationPic"><img src="${pageContext.request.contextPath }/resources/food2/${nation.nationPicture }" style=" width: 386px;
  height: 386px; margin-top: 20px;"></div>
        <h5 class="u-custom-font u-font-ubuntu u-text u-text-2">${nation.address }</h5>
        <p class="u-align-justify-lg u-align-justify-md u-align-justify-xl u-text u-text-grey-40 u-text-3" data-animation-name="slideIn" data-animation-duration="2000" data-animation-direction="Right"> ${nation.infomation }</p>
      </div>
    </section>
    

		<div class=" w3-animate-left" style="margin-top:20px;margin-bottom: 20px;margin-left:30px;">
			<span class="pagetitle"> <b >추천 음식</b>
			</span>
		</div>
		
		<div style="display: flex; overflow-x: auto;">
			<c:forEach var="food" items="${foodList}">
			<div>	
				<div class="foodListName">
					<span>${food.foodName }</span>
				</div>
				<div id="poster">
					<a href="${pageContext.request.contextPath }/food2?foodName=${food.foodName }"><img
						src="${pageContext.request.contextPath }/resources/food2/${food.mainPic}"
						style="width: 350px; height: 500px"> </a>
				</div>
			</div>
			</c:forEach>

		</div>


	<footer>
		<c:import url="../default/footer.jsp"></c:import>
	</footer>
    	
    <!-- 
    </section>
    
    <footer class="u-align-center u-clearfix u-footer u-white u-footer" id="sec-90e0"><div class="u-align-left u-clearfix u-sheet u-sheet-1"></div></footer>
    <section class="u-backlink u-clearfix u-grey-80">
      <a class="u-link" href="https://nicepage.com/website-templates" target="_blank">
        <span>Free Website Templates</span>
      </a>
      <p class="u-text">
        <span>created with</span>
      </p>
      <a class="u-link" href="https://nicepage.com/website-builder" target="_blank">
        <span>Free Website Builder</span>
      </a>. 
    </section>\
     -->
  </body>
</html>