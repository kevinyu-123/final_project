<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${contextPath }/resources/css/styles.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Montserrat&family=Outfit:wght@100&display=swap"
   rel="stylesheet">
<style type="text/css">
.main__screen {
<<<<<<< HEAD
	padding: 0px 100px 0px 100px;
}

.main__screen__recipe-title {
	padding-top: 40px;
	text-align: center;
}
.main__screen__recipe__left  {
	margin-left: 170px;
=======
   padding: 0px 100px 0px 100px;
}

.main__screen__recipe-title {
   padding-top: 40px;
   text-align: center;
}
.main__screen__recipe__left  {
   margin-left: 170px;
>>>>>>> 44320c7b2d4d096001ef56b9af69910695b14a36
}

.main__screen__recipe__left-content {
   margin-top: 25px;
}
.main__screen__recipe__left-content ul {
   list-style: circle;
}
.main__screen__recipe__left-content ul li {
   margin-bottom: 5px;
}

.main__screen__recipe__left-content {
   border-bottom: none;
}


</style>
<script src="https://kit.fontawesome.com/44d4c23d3e.js" crossorigin="anonymous"></script>
<title>Document</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/nicepage.css" media="screen">
<<<<<<< HEAD
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/Home3.css" media="screen">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/event.css">
=======
   <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/Home3.css" media="screen">
   <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/event.css">
>>>>>>> 44320c7b2d4d096001ef56b9af69910695b14a36
    <script class="u-script" type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="${pageContext.request.contextPath }/resources/js/nicepage.js" defer=""></script>
    <meta name="generator" content="Nicepage 4.2.6, nicepage.com">
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
    <link id="u-page-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Merriweather:300,300i,400,400i,700,700i,900,900i|Ubuntu:300,300i,400,400i,500,500i,700,700i">
<<<<<<< HEAD
   	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Montserrat&family=Outfit:wght@100&family=Playfair+Display+SC&display=swap"
	rel="stylesheet">
</head>
<body>
	<!-- 
	<header>
		<div class="screen__header">
			<div class="screen__header-column">
				<i class="fas fa-search fa-xl"></i> <input type="text"
					placeholder="Search Food" />
			</div>
			<div class="screen__header-column">Dining Lab</div>
			<div class="screen__header-column">
				<div class="screen__header-login-text">
					<a href="#">Log In</a>
				</div>
				<div class="screen__header-login-icon">
					<i class="far fa-user"></i>
				</div>
			</div>
		</div>
	</header>
	
	<div class="tab__bar">
		<ul>
			<li><a href="#">INFOMATION</a></li>
			<li><a href="#">RECIPE</a></li>
			<li><a href="#">WHERE TO EAT</a></li>
			<li><a href="#">COMMENT</a></li>
		</ul>
	</div>
	-->
		 	 
	 <header>
		<c:import url="../default/header2.jsp"></c:import>
	</header>
	<c:if test="${session_user eq '운영진' }">
	<a href="${pageContext.request.contextPath }/foodEditForm?foodName=${detail.foodName}">음식 테이블 수정</a>
	<a href="${pageContext.request.contextPath }/foodDelete?foodName=${detail.foodName}&mainPic=${detail.mainPic}&subPic=${detail.subPic}&mapPic=${detail.mapPic}">음식 테이블 삭제</a>
	</c:if>	
	<main class="main__screen">
		<div class="main__screen-content">
			<div class="main__screen-picture">
				<img src="${contextPath }/resources/food2/${detail.mainPic}" />
			</div>
			<div class="main__screen-column">
				<div class="main__screen-left">
					<div class="main__screen-left-menu" style="margin-bottom: 10px;">
						<span>${detail.category1 } | </span>
						<span>${detail.category2 }</span>
					</div>
					<div class="main__screen-left-title">
						<span style="text-transform: uppercase;">${detail.foodName }</span>
					</div>
					<div class="main__screen-left-equalTitle">
						<span style="text-transform: capitalize;">${detail.foodComment }</span>
					</div>
					<div class="main__screen-left-content">
						<p style="text-transform: capitalize; line-height: 30px;">${detail.intro }</p>
					</div>
				</div>

				<div class="main__screen-right">
					<div class="main__screen-right-contry">
						<span style="text-transform: uppercase;">${detail.nation }</span> <img
							src="${contextPath }/resources/food2/${detail.subPic}" />
					</div>
					<div class="main__screen-right-location">
						<div>
							<img src="${contextPath }/resources/food2/${detail.mapPic}" />
						</div>
						<div class="main__screen__recipe-rating">
							<div class=>
								<i class="fas fa-star"></i> <span>4.7</span>
							</div>
							<div class="divider"></div>
							<div class="divider-right-span">
								<span>평점</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		
		
		<div class="main__screen__recipe">
			<c:if test="${session_user eq '운영진' }">
			<a href="${pageContext.request.contextPath }/recipeEditForm?foodName=${recipe.foodName}">레시피 테이블 수정</a>
			<a href="${pageContext.request.contextPath }/foodDelete?foodName=${detail.foodName}&mainPic=${detail.mainPic}&subPic=${detail.subPic}&mapPic=${detail.mapPic}">레시피 테이블 삭제</a>
			</c:if>
			<div class="main__screen__recipe-title">
				<div>
					<span><b> 조리법 </b></span>
					<div class="main__screen__recipe-cookTime" style="font-size: 18px; margin: 30px 0px 40px 10px;">
						${recipe.cookTime }
					</div>	
				</div>
				<div>
					<iframe width="1000" height="600" src="https://www.youtube.com/embed/${recipe.youtubeAddr }" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen ></iframe>
				</div>
			</div>
			
			<div class="abc">
				<div class="main__screen__recipe__left">
					<div class="main__screen__recipe__left-title">
						<span>재료</span>
					</div>
					<div class="main__screen__recipe__left-content">
						<c:forEach var="ingre" items="${ingredients }">
							<ul>
								<li>${ingre }</li>
							</ul>
						</c:forEach>
					</div>
				</div>
				<div class="main__screen__recipe__right">
					<div class="main__screen__recipe__right-title">
						<span>레시피</span>
					</div>
					<c:forEach var="rec" items="${list }" varStatus="loop">
						<div class="main__screen__recipe__right-step">
								<div class="main__screen__recipe__right-step__number">
               					 	<span>${loop.index + 1}</span>
              					</div>
              					 <div class="main__screen__recipe__right-content">
									<span> ${rec }</span>
             					 </div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		 
		 
	<div class="main__screen-content" style="margin-top: 50px;">
		<div class=" w3-animate-left" style="margin-top:-20px;margin-bottom: 20px;margin-left:-100px;">
			<span class="pagetitle" style="margin-bottom: 100px; font-size: 34px;"> <b >추천 레스토랑</b></span>
		</div>
		<div style="display: flex; overflow-x: auto;">
		<c:forEach items="${restList }" var="rest">
			<div>
				<div class="foodListName" style="text-align: center;">
					<span>${rest.name}</span>
				</div>
				<div id="poster">
				<a href="${contextPath }/v?id=${rest.id}"><img
					src="#"
					style="width: 350px; height: 500px"> </a>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>
</main>
	
	<footer>
		<c:import url="../default/footer.jsp"></c:import>
	</footer>
=======
      <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link
   href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Montserrat&family=Outfit:wght@100&family=Playfair+Display+SC&display=swap"
   rel="stylesheet">
</head>
<body>
   <!-- 
   <header>
      <div class="screen__header">
         <div class="screen__header-column">
            <i class="fas fa-search fa-xl"></i> <input type="text"
               placeholder="Search Food" />
         </div>
         <div class="screen__header-column">Dining Lab</div>
         <div class="screen__header-column">
            <div class="screen__header-login-text">
               <a href="#">Log In</a>
            </div>
            <div class="screen__header-login-icon">
               <i class="far fa-user"></i>
            </div>
         </div>
      </div>
   </header>
   
   <div class="tab__bar">
      <ul>
         <li><a href="#">INFOMATION</a></li>
         <li><a href="#">RECIPE</a></li>
         <li><a href="#">WHERE TO EAT</a></li>
         <li><a href="#">COMMENT</a></li>
      </ul>
   </div>
   -->
           
    <header>
      <c:import url="../default/header2.jsp"></c:import>
   </header>
   <c:if test="${session_user eq '운영진' }">
   <a href="${pageContext.request.contextPath }/foodEditForm?foodName=${detail.foodName}">음식 테이블 수정</a>
   <a href="${pageContext.request.contextPath }/foodDelete?foodName=${detail.foodName}&mainPic=${detail.mainPic}&subPic=${detail.subPic}&mapPic=${detail.mapPic}">음식 테이블 삭제</a>
   </c:if>   
   				<c:import url="../search/nav_bar.jsp"/>
   <main class="main__screen">
   
      <div class="main__screen-content">
         <div class="main__screen-picture">
            <img src="${contextPath }/resources/food2/${detail.mainPic}" />
         </div>
         <div class="main__screen-column">
            <div class="main__screen-left">
               <div class="main__screen-left-menu" style="margin-bottom: 10px;">
                  <span>${detail.category1 } | </span>
                  <span>${detail.category2 }</span>
               </div>
               <div class="main__screen-left-title">
                  <span style="text-transform: uppercase;">${detail.foodName }</span>
               </div>
               <div class="main__screen-left-equalTitle">
                  <span style="text-transform: capitalize;">${detail.foodComment }</span>
               </div>
               <div class="main__screen-left-content">
                  <p style="text-transform: capitalize; line-height: 30px;">${detail.intro }</p>
               </div>
            </div>

            <div class="main__screen-right">
               <div class="main__screen-right-contry">
                  <span style="text-transform: uppercase;">${detail.nation }</span> <img
                     src="${contextPath }/resources/food2/${detail.subPic}" />
               </div>
               <div class="main__screen-right-location">
                  <div>
                     <img src="${contextPath }/resources/food2/${detail.mapPic}" />
                  </div>
                  <div class="main__screen__recipe-rating">
                     <div class=>
                        <i class="fas fa-star"></i> <span>4.7</span>
                     </div>
                     <div class="divider"></div>
                     <div class="divider-right-span">
                        <span>평점</span>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>

      
      
      <div class="main__screen__recipe">
         <c:if test="${session_user eq '운영진' }">
         <a href="${pageContext.request.contextPath }/recipeEditForm?foodName=${recipe.foodName}">레시피 테이블 수정</a>
         <a href="${pageContext.request.contextPath }/foodDelete?foodName=${detail.foodName}&mainPic=${detail.mainPic}&subPic=${detail.subPic}&mapPic=${detail.mapPic}">레시피 테이블 삭제</a>
         </c:if>
         <div class="main__screen__recipe-title">
            <div>
               <span><b> 조리법 </b></span>
               <div class="main__screen__recipe-cookTime" style="font-size: 18px; margin: 30px 0px 40px 10px;">
                  ${recipe.cookTime }
               </div>   
            </div>
            <div>
               <iframe width="1000" height="600" src="https://www.youtube.com/embed/${recipe.youtubeAddr }" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen ></iframe>
            </div>
         </div>
         
         <div class="abc">
            <div class="main__screen__recipe__left">
               <div class="main__screen__recipe__left-title">
                  <span>재료</span>
               </div>
               <div class="main__screen__recipe__left-content">
                  <c:forEach var="ingre" items="${ingredients }">
                     <ul>
                        <li>${ingre }</li>
                     </ul>
                  </c:forEach>
               </div>
            </div>
            <div class="main__screen__recipe__right">
               <div class="main__screen__recipe__right-title">
                  <span>레시피</span>
               </div>
               <c:forEach var="rec" items="${list }" varStatus="loop">
                  <div class="main__screen__recipe__right-step">
                        <div class="main__screen__recipe__right-step__number">
                                  <span>${loop.index + 1}</span>
                             </div>
                              <div class="main__screen__recipe__right-content">
                           <span> ${rec }</span>
                             </div>
                     </div>
                  </c:forEach>
               </div>
            </div>
         </div>
       
       
   <div class="main__screen-content" style="margin-top: 50px;">
      <div class=" w3-animate-left" style="margin-top:-20px;margin-bottom: 20px;margin-left:-100px;">
         <span class="pagetitle" style="margin-bottom: 100px; font-size: 34px;"> <b >추천 레스토랑</b></span>
      </div>
      <div style="display: flex; overflow-x: auto;">
      <c:forEach items="${restList }" var="rest">
         <div>
            <div class="foodListName" style="text-align: center;">
               <span>${rest.name}</span>
            </div>
            <div id="poster">
            <a href="${contextPath }/v?id=${rest.id}"><img
               src="#"
               style="width: 350px; height: 500px"> </a>
            </div>
         </div>
      </c:forEach>
      </div>
   </div>
</main>
   
   <footer>
      <c:import url="../default/footer.jsp"></c:import>
   </footer>
>>>>>>> 44320c7b2d4d096001ef56b9af69910695b14a36

</body>
</html>