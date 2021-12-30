<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html style="font-size: 16px;">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="돈사돈 신설동점, 흑돼지 3인세트 (800g), 백돼지 3인세트 (800g), 된장뽀글이, Restaurant&nbsp;reviews">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>reviews</title>
    <link rel="stylesheet" href="resources/rest_detail/bootstrap/css/nicepage2.css" media="screen">
<link rel="stylesheet" href="resources/rest_detail/bootstrap/css/reviews.css" media="screen">
    <script class="u-script" type="text/javascript" src="resources/rest_detail/bootstrap/js/jquery2.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="resources/rest_detail/bootstrap/js/nicepage2.js" defer=""></script>
    <meta name="generator" content="Nicepage 4.2.6, nicepage.com">
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
    
    
    <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": ""
}</script>
    <meta name="theme-color" content="#478ac9">
    <meta property="og:title" content="reviews">
    <meta property="og:type" content="website">
  </head>
  <body class="u-body">
    <section class="u-align-center u-clearfix u-section-3" id="carousel_dc53">
      <div class="u-clearfix u-sheet u-valign-middle-md u-valign-middle-sm u-valign-middle-xs u-sheet-1">
        <h6 class="u-text u-text-1"> ${restDTO.name }</h6>
        <h2 class="u-text u-text-default u-text-2">Restaurant&nbsp;<b style="">reviews</b>
        </h2>
       		<c:if test="${reviews_size eq 0 }">
				<h1>리뷰 작성 부탁드려요 ㅠ.ㅠ</h1>
			</c:if>
       <c:if test="${reviews_size ne 0 }">
        <div class="u-expanded-width-md u-expanded-width-sm u-expanded-width-xs u-list u-list-1">
        
        
        <c:forEach items="${reviewsDTO }" var="rev" varStatus="status">
          <c:if test="${status.count < 3 }">
          <div class="u-repeater u-repeater-1" id="reviewCnt${status.count }">
            <div class="u-container-style u-list-item u-repeater-item u-shape-rectangle">
              <div class="u-container-layout u-similar-container u-container-layout-1">
                <img class="u-image u-image-default u-preserve-proportions u-image-1" src="resources/rest_detail/bootstrap/images/commonImg/star.png" alt="" data-image-width="512" data-image-height="512">
                <p class="u-text u-text-default u-text-palette-5-dark-1 u-text-3">${rev.rate }.0 / 5.0</p>
                <div alt="" class="u-image u-image-circle u-image-2" data-image-width="1056" data-image-height="1500"></div>
                <h6 class="u-text u-text-default u-text-4">${restId }</h6>
                <p class="u-text u-text-5">"${rev.review}"</p>
                <c:if test="${rev.imgs ne 'non' }">
                <c:set var="imgCntt" value="${fn:split(rev.imgs,'&')}" />
				<c:forEach var="img" items="${imgCntt }" varStatus="status">
                <img class="u-image u-image-default u-image-${status.count+2 }" src="${contextPath }/resources/rest_reviews_img/${restId}/${rev.memId}/${rev.revDate}/${img}" alt="" data-image-width="750" data-image-height="1000">
            	</c:forEach>
            	</c:if>
            	<c:if test="${rev.imgs eq 'non' }">
            	</c:if>
              </div>
            </div>
          </div>
          </c:if>
          <c:if test="${status.count>=3 }">
            <div class="u-repeater u-repeater-1" id="reviewCnt${status.count }" style="display:none">
            <div class="u-container-style u-list-item u-repeater-item u-shape-rectangle">
              <div class="u-container-layout u-similar-container u-container-layout-1">
                <img class="u-image u-image-default u-preserve-proportions u-image-1" src="resources/rest_detail/bootstrap/images/commonImg/star.png" alt="" data-image-width="512" data-image-height="512">
                <p class="u-text u-text-default u-text-palette-5-dark-1 u-text-3">${rev.rate }.0 / 5.0</p>
                <div alt="" class="u-image u-image-circle u-image-2" data-image-width="1056" data-image-height="1500"></div>
                <h6 class="u-text u-text-default u-text-4">${restId }</h6>
                <p class="u-text u-text-5">"${rev.review}"</p>
                <c:if test="${rev.imgs ne 'non' }">
                <c:set var="imgCntt" value="${fn:split(rev.imgs,'&')}" />
				<c:forEach var="img" items="${imgCntt }" varStatus="status">
                <img class="u-image u-image-default u-image-${status.count+2 }" src="${contextPath }/resources/rest_reviews_img/${restId}/${rev.memId}/${rev.revDate}/${img}" alt="" data-image-width="750" data-image-height="1000">
            	</c:forEach>
            	</c:if>
            	<c:if test="${rev.imgs eq 'non' }">
            	</c:if>
              </div>
            </div>
          </div>
          
          </c:if>
          
          </c:forEach>
        </div>
        </c:if>
        <a id="more_reviews" class="u-border-active-black u-border-hover-black u-btn u-btn-round u-button-style u-btn-1">more</a>
     <script type="text/javascript">
		var CCCCCcnt = 1;
		var listViewCount = 3;
      	$('#more_reviews').on('click',function(event){
      		for(var i=0; i<listViewCount; i++){
          		console.log((i+(listViewCount*CCCCCcnt)))
          		console.log($('#reviewCnt'+(i+(listViewCount*CCCCCcnt))))
 			$('#reviewCnt'+(i+(listViewCount*CCCCCcnt))).css({
			 'display':'block'
				 })
      		}
      		CCCCCcnt = CCCCCcnt+1;
      	});
      </script>
      </div>
    </section>
  </body>
</html>