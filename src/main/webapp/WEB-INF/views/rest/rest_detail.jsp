<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${contextPath.request.pageContext }" />
<!DOCTYPE html>
<html style="font-size: 16px;">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta name="description" content="">
<meta name="page_type" content="np-template-header-footer-from-plugin">
<title>rest_detail_page</title>
<link rel="stylesheet"
	href="resources/rest_detail/bootstrap/css/nicepage.css" media="screen">
<link rel="stylesheet"
	href="resources/rest_detail/bootstrap/css/val2.css" media="screen">
<script class="u-script" type="text/javascript"
	src="resources/rest_detail/bootstrap/js/jquery.js" defer=""></script>
<script class="u-script" type="text/javascript"
	src="resources/rest_detail/bootstrap/js/nicepage.js" defer=""></script>
<meta name="generator" content="Nicepage 4.2.6, nicepage.com">
<link id="u-theme-google-font" rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": ""
}</script>
<meta name="theme-color" content="#478ac9">
<meta property="og:title" content="val2">
<meta property="og:type" content="website">
<style type="text/css">


.container {
	max-width: 103%;
	max-height: 505px;
	position: absolute;
	left: -15px;

}
.carousel-inner img {
	width: 100%;
	max-height: 505px;
	min-height: 504px;
}

@media ( max-width : 1199px) {
	.container {
		max-width: 103%;
		max-height: 416px;
		min-height: 416px;
		position: absolute;
		left: -15px;
		object-fit: contain;
	}
	.carousel-inner img {
		width: 100%;
		max-height: 416px;
		min-height: 416px;
	}

}
	.restReviewImg {
		left: 5px;
	}
	.radius_border {
		border: 1px solid #919191;
		border-radius: 5px;
	}
	.custom_typecontrol {
		position: absolute;
		top: 10px;
		right: 10px;
		overflow: hidden;
		width: 130px;
		height: 30px;
		margin: 0;
		padding: 0;
		z-index: 1;
		font-size: 12px;
		font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
	}
	.custom_typecontrol span {
		display: block;
		width: 65px;
		height: 30px;
		float: left;
		text-align: center;
		line-height: 30px;
		cursor: pointer;
	}
	.custom_typecontrol .btn {
		background: #fff;
		background: linear-gradient(#fff, #e6e6e6);
	}
	.custom_typecontrol .btn:hover {
		background: #f5f5f5;
		background: linear-gradient(#f5f5f5, #e3e3e3);
	}
	.custom_typecontrol .btn:active {
		background: #e6e6e6;
		background: linear-gradient(#e6e6e6, #fff);
	}
	.custom_typecontrol .selected_btn {
		color: #fff;
		background: #425470;
		background: linear-gradient(#425470, #5b6d8a);
	}
	.custom_typecontrol .selected_btn:hover {
		color: #fff;
	}
	.custom_zoomcontrol {
		position: absolute;
		top: 50px;
		right: 10px;
		width: 36px;
		height: 80px;
		overflow: hidden;
		z-index: 1;
		background-color: #f5f5f5;
	}
	.custom_zoomcontrol span {
		display: block;
		width: 36px;
		height: 40px;
		text-align: center;
		cursor: pointer;
	}
	.custom_zoomcontrol span img {
		width: 15px;
		height: 15px;
		padding: 12px 0;
		border: none;
	}
	.custom_zoomcontrol span:first-child {
		border-bottom: 1px solid #bfbfbf;
	}
	.u-layout-wrap-2 .u-text-4 {
		font-size: 20px;
		width: 400px;
	}
	.u-text-10 button {
		margin-left: 20px;
		width: 200px;
	}
	.u-text-10 button p {
		margin: auto;
	}
	.u-shape-rectangle {
		margin-top: 10px;
	}
}
</style>
</head>
<body class="u-body">
	<c:import url="../default/header2.jsp"></c:import>

		<c:import url="../search/nav_bar.jsp"/>

	<section class="u-align-center u-clearfix u-section-1" id="sec-4136">
		<div class="u-clearfix u-sheet u-valign-middle-xl u-sheet-1">
			<div
				class="u-clearfix u-expanded-width u-layout-wrap u-layout-wrap-1">
				<div class="u-layout">
					<div class="u-layout-row">
						<div
							class="u-size-31-sm u-size-31-xs u-size-43-lg u-size-43-xl u-size-60-md">
							<div class="u-layout-col">
								<div
									class="u-container-style u-image u-layout-cell u-size-60 u-image-1"
									data-image-width="750" data-image-height="1000">
									<div class="u-container-layout u-container-layout-1">
									<c:set var="cc" value="non.png"/>
									
									<c:if test="${restPic[0] != cc}">
										<div class="container">
											<div id="myCarousel" class="carousel slide"
												data-ride="carousel">
												<!-- Indicators -->
												<c:set var="cnt" value="${fn:length(restPic) }" />
												<ol class="carousel-indicators">
													<li data-target="#myCarousel" data-slide-to="0"
														class="active"></li>
													<c:if test="${cnt == 1 }">
													<li data-target="#myCarousel" data-slide-to="1"></li>
													</c:if>
													<c:if test="${cnt > 1 }">
													<c:forEach var="num" begin="1" end="${cnt-1 }">
														<li data-target="#myCarousel" data-slide-to="${num }"></li>
													</c:forEach>
													</c:if>
												</ol>
												
												<!-- Wrapper for slides -->
												<div class="carousel-inner" style="">
													<div class="item active mainPic">
														<img
															src="resources/rest_detail/bootstrap/images/${restDTO.id }/${restPic[0] }">
													</div>

													<c:if test="${cnt > 1 }">
													<c:forEach var="num" begin="1" end="${cnt-1 }">
														<div class="item mainPic">
															<img
																src="resources/rest_detail/bootstrap/images/${restDTO.id }/${restPic[num] }">
														</div>
													</c:forEach>
													</c:if>
												</div>
												<!-- Left and right controls -->
												<a class="left carousel-control" href="#myCarousel"
													data-slide="prev"> <span
													class="glyphicon glyphicon-chevron-left"></span> <span
													class="sr-only">Previous</span>
												</a> <a class="right carousel-control" href="#myCarousel"
													data-slide="next"> <span
													class="glyphicon glyphicon-chevron-right"></span> <span
													class="sr-only">Next</span>
												</a>
											</div>
										</div>
										</c:if>
										<c:if test="${restPic[0] == cc }">
													<div class="carousel-inner" style="">
													<div class="item active mainPic">
														<img
															src="resources/rest_detail/bootstrap/images/commonImg/${restPic[0] }"
															id="nonPic"
															>
													</div>
													</div>
										</c:if>
									</div>
								</div>
							</div>
						</div>
						<div
							class="u-size-17-lg u-size-17-xl u-size-29-sm u-size-29-xs u-size-60-md">
							<div class="u-layout-col">
								<div class="u-size-30">
									<div class="u-layout-row">
										<div
											class="u-container-style u-image u-layout-cell u-size-30 u-image-2"
											data-image-width="750" data-image-height="1000"
											style="background-image: url('${contextPath }/resources/rest_detail/bootstrap/images/${restDTO.id }/${restPic[0] }');">
											<div class="u-container-layout u-container-layout-2"></div>
										</div>
										<div
											class="u-container-style u-image u-layout-cell u-size-30 u-image-3 restReviewImg"
											data-image-width="750" data-image-height="1000"
											style="background-image: url('${contextPath }/resources/rest_detail/bootstrap/images/${restDTO.id }/${restPic[1] }');">
											<div class="u-container-layout u-container-layout-3"></div>
										</div>
									</div>
								</div>
								<div class="u-size-30">
									<div class="u-layout-row">
										<div
											class="u-container-style u-image u-layout-cell u-size-30 u-image-4 "
											data-image-width="750" data-image-height="1000"
											style="background-image: url('${contextPath }/resources/rest_detail/bootstrap/images/${restDTO.id }/${restPic[2] }');">
											<div class="u-container-layout u-container-layout-4"></div>
										</div>
										<div
											class="u-container-style u-image u-layout-cell u-size-30 u-image-5 restReviewImg"
											data-image-width="750" data-image-height="1000"
											style="background-image: url('${contextPath }/resources/rest_detail/bootstrap/images/${restDTO.id }/${restPic[3] }');">
											<div class="u-container-layout u-container-layout-5"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div
				class="u-clearfix u-expanded-width u-gutter-0 u-layout-wrap u-layout-wrap-2">
				<div class="u-layout">
					<div class="u-layout-row">
						<div
							class="u-container-style u-layout-cell u-size-30 u-layout-cell-6">
							<div class="u-container-layout u-container-layout-6">
								<h1 class="u-text u-text-default u-text-1">${restDTO.name }</h1>
								<img
									class="u-image u-image-default u-preserve-proportions u-image-6"
									src="resources/rest_detail/bootstrap/images/commonImg/star.png"
									alt="" data-image-width="512" data-image-height="512">
								<p
									class="u-text u-text-default u-text-palette-5-dark-1 u-text-2">${avr }
									/ 5.0</p>
								<p
									class="u-text u-text-default u-text-palette-5-dark-1 u-text-3">${restDTO.subEx }</p>
								<div
									class="u-border-2 u-border-palette-5-base u-expanded-width-md u-expanded-width-sm u-expanded-width-xs u-hidden-lg u-hidden-md u-hidden-sm u-hidden-xs u-line u-line-horizontal u-line-1"></div>
								<div
									class="u-border-2 u-border-palette-5-base u-hidden-lg u-hidden-md u-hidden-sm u-hidden-xs u-line u-line-horizontal u-line-2"></div>
								<p class="u-text u-text-4">"${restDTO.mainEx }"</p>
								<p class="u-text u-text-5">
									<span class="u-icon u-icon-1"><svg class="u-svg-content"
											viewBox="0 0 8.4666665 8.4666669"
											style="width: 1em; height: 1em;">
											<defs id="defs2"></defs>
											<g id="layer1" transform="translate(0,-288.53332)">
											<path
												d="m 15.996094,0.99609375 c -6.0632836,0 -10.9980445,4.93673065 -10.9980471,11.00000025 -3.8e-6,10.668737 10.3789061,18.779297 10.3789061,18.779297 0.364612,0.290384 0.881482,0.290384 1.246094,0 0,0 10.380882,-8.11056 10.380859,-18.779297 C 27.003893,5.9328244 22.059377,0.99609375 15.996094,0.99609375 Z m 0,6.00195315 c 2.749573,0 5.00585,2.2484784 5.005859,4.9980471 C 21.001971,14.7457 18.745685,17 15.996094,17 c -2.749591,0 -4.998064,-2.2543 -4.998047,-5.003906 9e-6,-2.7495687 2.248474,-4.9980471 4.998047,-4.9980471 z"
												id="path929"
												style="color:#000000;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:medium;line-height:normal;font-family:sans-serif;font-variant-ligatures:normal;font-variant-position:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-alternates:normal;font-feature-settings:normal;text-indent:0;text-align:start;text-decoration:none;text-decoration-line:none;text-decoration-style:solid;text-decoration-color:#000000;letter-spacing:normal;word-spacing:normal;text-transform:none;writing-mode:lr-tb;direction:ltr;text-orientation:mixed;dominant-baseline:auto;baseline-shift:baseline;text-anchor:start;white-space:normal;shape-padding:0;clip-rule:nonzero;display:inline;overflow:visible;visibility:visible;opacity:1;isolation:auto;mix-blend-mode:normal;color-interpolation:sRGB;color-interpolation-filters:linearRGB;solid-color:#000000;solid-opacity:1;vector-effect:none;fill:currentColor;fill-opacity:1;fill-rule:nonzero;stroke:none;stroke-width:1.99999988;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;paint-order:stroke fill markers;color-rendering:auto;image-rendering:auto;shape-rendering:auto;text-rendering:auto;enable-background:accumulate"
												transform="matrix(0.26458333,0,0,0.26458333,0,288.53332)"></path>
</g></svg><img></span>&nbsp; ${restDTO.addr }
								</p>
								<p class="u-text u-text-6">
									<span class="u-icon u-icon-2"><svg class="u-svg-content"
											viewBox="0 0 405.333 405.333" x="0px" y="0px">
											<path
												d="M373.333,266.88c-25.003,0-49.493-3.904-72.704-11.563c-11.328-3.904-24.192-0.896-31.637,6.699l-46.016,34.752    c-52.8-28.181-86.592-61.952-114.389-114.368l33.813-44.928c8.512-8.512,11.563-20.971,7.915-32.64    C142.592,81.472,138.667,56.96,138.667,32c0-17.643-14.357-32-32-32H32C14.357,0,0,14.357,0,32    c0,205.845,167.488,373.333,373.333,373.333c17.643,0,32-14.357,32-32V298.88C405.333,281.237,390.976,266.88,373.333,266.88z"></path></svg><img></span>
									&nbsp; 전화번호 : ${restDTO.tel }
								</p>
								<p class="u-text u-text-7">
									<span class="u-icon u-text-black u-icon-3"><svg
											class="u-svg-content" viewBox="0 0 32 32">
											<g id="_34-Time">
											<path
												d="M16,0A16,16,0,1,0,32,16,16,16,0,0,0,16,0Zm1,29.95V26H15v3.95A14,14,0,0,1,2.05,17H6V15H2.05A14,14,0,0,1,15,2.05V6h2V2.05A14,14,0,0,1,29.95,15H26v2h3.95A14,14,0,0,1,17,29.95Z"></path>
											<path d="M17,9H15v7a1,1,0,0,0,.29.71l5,5,1.41-1.41L17,15.59Z"></path>
</g></svg><img></span> &nbsp; 영업시간 : ${restDTO.hours }
								</p>
								<p class="u-text u-text-8">&nbsp;</p>
								<p class="u-text u-text-9">&nbsp;</p>
								<div class="u-text u-text-10">
									<button type="button" class="btn btn-primary" id="fav_button"
										onclick="fav('${session_user }',${restDTO.id})">
										<c:if test="${liked ne true }">
											<p id="rest_fav">찜하기</p>
										</c:if>
										<c:if test="${liked eq true }">
											<p id="rest_fav">찜 취소하기</p>
										</c:if>
										
									</button>
									<c:if test="${session_user != null }">
									<button type="button" class="btn btn-primary" id="rest_reviews"
										onclick="location.href='rest_reviews_form?rest=${restDTO.id}'">
										<p>리뷰쓰기</p>
									</button>
									</c:if>

									<script type="text/javascript">
									function fav(memId,restId){
										var sendData = { "memId":memId , "rest":restId };
										console.log("보내는 데이터"+sendData)
										if($("#rest_fav").text()=="찜하기"){
											$.ajax({
										 	      type: "POST",
										 	      dataType:"json",
										 	      url: "liked_click",
										     	  processData: false,
										 	      contentType: "application/json; charset=utf-8",
										 	   	  data:  JSON.stringify(sendData),
										 	      success: function (data) {
										 	    	  if(data.result == "ok"){
										 	    		  console.log("좋아요 진입")
										 	    		 swal({
										 	    			  icon: "success",
										 	    			});
										 	    		  rest_fav.innerText="찜 취소하기"
										 	    	  }else
										 	    		  alert("로그인 먼저 해 주세요!");
										 	    	  console.log(data);
										 	      },
										 	      error: function (request, status, error) {
										 	    	alert("문제가 생겼습니다.");
										 	     return false;
										 	      }
										 	    });
										
										}else{
											$.ajax({
										 	      type: "POST",
										 	      dataType:"json",
										 	      url: "dliked_click",
										     	  processData: false,
										     	  contentType: "application/json; charset=utf-8",
										     	  data:  JSON.stringify(sendData),
										 	      success: function (data) {
										 	    	 console.log("안좋아요 진입")
										 	    	  if(data.result == "no"){
										 	    		 swal ( "${restDTO.name}" ,  "찜 등록 취소!" ,  "error" )
										 	    		  rest_fav.innerText="찜하기"
										 	    	  }else
										 	    		  alert("오류임");
										 	    	  console.log(data);
										 	      },
										 	      error: function (request, status, error) {
										 	    	alert("문제가 생겼습니다.");
										 	     return false;
										 	      }
										 	    });
										
										}
									}
									</script>
								</div>
							</div>
						</div>
						<div
							class="u-container-style u-image u-layout-cell u-size-30 u-image-7"
							data-image-width="750" data-image-height="1000">
							<div class="u-container-layout u-container-layout-7">
								<div class="map_wrap">
									<div id="map" style="width: 560px; height: 550px;"></div>
								</div>
								<script type="text/javascript"
									src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1b98926a604353b43e636cb141e9ef77"></script>
								<script>
									var mapContainer = document
											.getElementById('map'), // 지도를 표시할 div 
									mapOption = {
										center : new kakao.maps.LatLng(
												${restDTO.lat},
												${restDTO.lng}), // 지도의 중심좌표
										level : 3
									// 지도의 확대 레벨
									};

									var map = new kakao.maps.Map(mapContainer,
											mapOption); // 지도를 생성합니다

									// 마커가 표시될 위치입니다 
									var markerPosition = new kakao.maps.LatLng(
											${restDTO.lat},
											${restDTO.lng});

									// 마커를 생성합니다
									var marker = new kakao.maps.Marker({
										position : markerPosition
									});

									// 마커가 지도 위에 표시되도록 설정합니다
									marker.setMap(map);
								</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="u-align-center u-clearfix u-section-2"
		id="carousel_f7e5">
		<div
			class="u-clearfix u-sheet u-valign-middle-lg u-valign-middle-xl u-sheet-1">
			<div
				class="u-border-2 u-border-palette-5-base u-expanded-width u-hidden-md u-hidden-xs u-line u-line-horizontal u-line-1"></div>
			<span class="u-icon u-icon-circle u-text-grey-40 u-icon-1"><svg
					class="u-svg-link" preserveAspectRatio="xMidYMin slice"
					viewBox="0 0 512.00003 512.00003">
					<use xmlns:xlink="http://www.w3.org/1999/xlink"
						xlink:href="#svg-4855"></use></svg> <svg
					xmlns="http://www.w3.org/2000/svg"
					viewBox="0 0 512.00003 512.00003" id="svg-4855"
					class="u-svg-content">
					<path
						d="m42.667969 512h290.132812c14.136719 0 25.597657-11.460938 25.597657-25.601562v-426.664063c0-14.140625-11.460938-25.601563-25.597657-25.601563h-290.132812c-23.554688.027344-42.6406252 19.113282-42.667969 42.667969v392.53125c.0273438 23.554688 19.113281 42.640625 42.667969 42.667969zm298.664062-452.265625v426.664063c0 4.714843-3.820312 8.535156-8.53125 8.535156h-247.46875v-25.601563h8.535157c4.710937 0 8.53125-3.820312 8.53125-8.53125 0-4.714843-3.820313-8.535156-8.53125-8.535156h-8.535157v-17.066406h8.535157c4.710937 0 8.53125-3.820313 8.53125-8.53125 0-4.714844-3.820313-8.535157-8.53125-8.535157h-8.535157v-17.066406h8.535157c4.710937 0 8.53125-3.820312 8.53125-8.53125 0-4.714844-3.820313-8.535156-8.53125-8.535156h-8.535157v-17.066406h8.535157c4.710937 0 8.53125-3.820313 8.53125-8.535156 0-4.710938-3.820313-8.53125-8.53125-8.53125h-8.535157v-17.066407h8.535157c4.710937 0 8.53125-3.820312 8.53125-8.535156 0-4.710937-3.820313-8.53125-8.53125-8.53125h-8.535157v-17.066406h8.535157c4.710937 0 8.53125-3.820313 8.53125-8.535157 0-4.710937-3.820313-8.53125-8.53125-8.53125h-8.535157v-17.066406h8.535157c4.710937 0 8.53125-3.824218 8.53125-8.535156s-3.820313-8.535156-8.53125-8.535156h-8.535157v-17.066406h8.535157c4.710937 0 8.53125-3.820313 8.53125-8.53125 0-4.714844-3.820313-8.535157-8.53125-8.535157h-8.535157v-17.066406h8.535157c4.710937 0 8.53125-3.820313 8.53125-8.53125 0-4.714844-3.820313-8.535156-8.53125-8.535156h-8.535157v-17.066407h8.535157c4.710937 0 8.53125-3.820312 8.53125-8.53125 0-4.714843-3.820313-8.535156-8.53125-8.535156h-8.535157v-17.066406h8.535157c4.710937 0 8.53125-3.820312 8.53125-8.535156 0-4.710938-3.820313-8.53125-8.53125-8.53125h-8.535157v-17.066406h8.535157c4.710937 0 8.53125-3.820313 8.53125-8.535157 0-4.710937-3.820313-8.53125-8.53125-8.53125h-8.535157v-25.601562h247.46875c4.710938 0 8.53125 3.820312 8.53125 8.535156zm-324.265625 17.066406c0-14.140625 11.460938-25.601562 25.601563-25.601562h25.597656v25.601562h-8.53125c-4.714844 0-8.535156 3.820313-8.535156 8.53125 0 4.714844 3.820312 8.535157 8.535156 8.535157h8.53125v17.066406h-8.53125c-4.714844 0-8.535156 3.820312-8.535156 8.53125 0 4.714844 3.820312 8.535156 8.535156 8.535156h8.53125v17.066406h-8.53125c-4.714844 0-8.535156 3.820313-8.535156 8.535156 0 4.710938 3.820312 8.53125 8.535156 8.53125h8.53125v17.066407h-8.53125c-4.714844 0-8.535156 3.820312-8.535156 8.535156 0 4.710937 3.820312 8.53125 8.535156 8.53125h8.53125v17.066406h-8.53125c-4.714844 0-8.535156 3.820313-8.535156 8.535157 0 4.710937 3.820312 8.53125 8.535156 8.53125h8.53125v17.066406h-8.53125c-4.714844 0-8.535156 3.824218-8.535156 8.535156s3.820312 8.535156 8.535156 8.535156h8.53125v17.066406h-8.53125c-4.714844 0-8.535156 3.820313-8.535156 8.53125 0 4.714844 3.820312 8.535157 8.535156 8.535157h8.53125v17.066406h-8.53125c-4.714844 0-8.535156 3.820313-8.535156 8.53125 0 4.714844 3.820312 8.535156 8.535156 8.535156h8.53125v17.066407h-8.53125c-4.714844 0-8.535156 3.820312-8.535156 8.53125 0 4.714843 3.820312 8.535156 8.535156 8.535156h8.53125v17.066406h-8.53125c-4.714844 0-8.535156 3.820312-8.535156 8.535156 0 4.710938 3.820312 8.53125 8.535156 8.53125h8.53125v17.066406h-8.53125c-4.714844 0-8.535156 3.820313-8.535156 8.535157 0 4.710937 3.820312 8.53125 8.535156 8.53125h8.53125v17.066406h-8.53125c-4.714844 0-8.535156 3.820313-8.535156 8.535156 0 4.710938 3.820312 8.53125 8.535156 8.53125h8.53125v25.601563h-25.597656c-14.140625 0-25.601563-11.460938-25.601563-25.601563zm0 0"></path>
					<path
						d="m154.503906 229.65625 3.414063 27.402344 4.265625 34.132812c.535156 4.277344 4.171875 7.484375 8.484375 7.476563h102.398437c4.304688-.003907 7.933594-3.207031 8.464844-7.476563l4.265625-34.132812 3.414063-27.402344c20.25-3.644531 35.003906-21.234375 35.0625-41.808594.058593-20.578125-14.59375-38.253906-34.824219-42.011718 3.71875-26.417969-8.292969-52.578126-30.75-66.976563-22.457031-14.402344-51.242188-14.402344-73.699219 0-22.457031 14.398437-34.46875 40.558594-30.75 66.976563-20.246094 3.738281-34.921875 21.421874-34.863281 42.011718.058593 20.585938 14.835937 38.1875 35.101562 41.808594zm67.363282 51.945312h-43.664063l-2.136719-17.066406h91.597656l-2.132812 17.066406zm-77.832032-111.976562c4.789063-4.8125 11.304688-7.511719 18.097656-7.492188h.972657l.855469.050782c6.425781.476562 12.4375 3.359375 16.835937 8.074218 3.246094 3.300782 8.53125 3.410157 11.914063.25 3.382812-3.164062 3.621093-8.449218.542968-11.90625-5.804687-6.1875-13.324218-10.492187-21.597656-12.367187-.632812-3.195313-.964844-6.441406-.988281-9.699219 0-28.277344 22.921875-51.203125 51.199219-51.203125 28.277343 0 51.199218 22.925781 51.199218 51.203125-.035156 3.261719-.378906 6.515625-1.023437 9.71875-8.273438 1.867188-15.796875 6.171875-21.597657 12.355469-2.171874 2.210937-2.976562 5.421875-2.101562 8.394531.878906 2.972656 3.296875 5.238282 6.320312 5.914063 3.023438.675781 6.179688-.335938 8.238282-2.652344 4.398437-4.714844 10.410156-7.597656 16.835937-8.074219l.855469-.050781h1.007812c9.144532 0 17.59375 4.878906 22.167969 12.800781s4.574219 17.679688 0 25.601563c-4.574219 7.917969-13.023437 12.800781-22.167969 12.800781-.363281.046875-.722656.117188-1.078124.210938-.605469.058593-1.203126.179687-1.78125.367187-.457032.183594-.898438.40625-1.316407.664063-.511719.273437-.996093.601562-1.441406.972656-.371094.359375-.710937.746094-1.015625 1.164062-.796875 1.273438-1.414062 2.652344-1.832031 4.09375l-3.339844 26.648438h-95.863281l-3.335938-26.65625c-.097656-.371094-.21875-.730469-.367187-1.082032-.199219-1.089843-.6875-2.105468-1.414063-2.9375-.332031-.460937-.703125-.886718-1.121094-1.269531-.410156-.339843-.855468-.640625-1.320312-.898437-.9375-.628906-2.027344-1-3.15625-1.066406-.355469-.097657-.71875-.171876-1.085938-.222657-10.355468.003907-19.691406-6.234375-23.65625-15.804687-3.960937-9.566406-1.769531-20.582032 5.558594-27.902344zm0 0"></path>
					<path
						d="m136.535156 358.398438h17.066406c4.710938 0 8.53125-3.820313 8.53125-8.53125 0-4.714844-3.820312-8.535157-8.53125-8.535157h-17.066406c-4.714844 0-8.535156 3.820313-8.535156 8.535157 0 4.710937 3.820312 8.53125 8.535156 8.53125zm0 0"></path>
					<path
						d="m307.199219 341.332031h-119.464844c-4.714844 0-8.535156 3.820313-8.535156 8.535157 0 4.710937 3.820312 8.53125 8.535156 8.53125h119.464844c4.714843 0 8.535156-3.820313 8.535156-8.53125 0-4.714844-3.820313-8.535157-8.535156-8.535157zm0 0"></path>
					<path
						d="m153.601562 409.601562h-17.066406c-4.714844 0-8.535156 3.820313-8.535156 8.53125 0 4.714844 3.820312 8.535157 8.535156 8.535157h17.066406c4.710938 0 8.53125-3.820313 8.53125-8.535157 0-4.710937-3.820312-8.53125-8.53125-8.53125zm0 0"></path>
					<path
						d="m307.199219 409.601562h-119.464844c-4.714844 0-8.535156 3.820313-8.535156 8.53125 0 4.714844 3.820312 8.535157 8.535156 8.535157h119.464844c4.714843 0 8.535156-3.820313 8.535156-8.535157 0-4.710937-3.820313-8.53125-8.535156-8.53125zm0 0"></path>
					<path
						d="m136.535156 392.535156h85.332032c4.710937 0 8.53125-3.824218 8.53125-8.535156s-3.820313-8.535156-8.53125-8.535156h-85.332032c-4.714844 0-8.535156 3.824218-8.535156 8.535156s3.820312 8.535156 8.535156 8.535156zm0 0"></path>
					<path
						d="m307.199219 375.464844h-51.199219c-4.710938 0-8.535156 3.824218-8.535156 8.535156s3.824218 8.535156 8.535156 8.535156h51.199219c4.714843 0 8.535156-3.824218 8.535156-8.535156s-3.820313-8.535156-8.535156-8.535156zm0 0"></path>
					<path
						d="m443.734375 0c-37.640625 0-68.269531 42.113281-68.269531 93.867188 0 39.304687 17.683594 72.992187 42.667968 86.953124v305.578126c0 14.140624 11.460938 25.601562 25.601563 25.601562 14.136719 0 25.597656-11.460938 25.597656-25.601562v-305.578126c24.988281-13.960937 42.667969-47.648437 42.667969-86.953124 0-51.753907-30.625-93.867188-68.265625-93.867188zm8.53125 486.398438c0 4.714843-3.820313 8.535156-8.53125 8.535156-4.714844 0-8.535156-3.820313-8.535156-8.535156v-299.476563c5.636719 1.082031 11.429687 1.082031 17.066406 0zm5.316406-318.667969-.179687.070312c-8.703125 3.8125-18.601563 3.8125-27.304688 0l-.179687-.070312c-21.554688-9.097657-37.382813-38.722657-37.382813-73.863281 0-42.34375 22.960938-76.800782 51.199219-76.800782 28.234375 0 51.199219 34.457032 51.199219 76.800782 0 35.140624-15.828125 64.765624-37.351563 73.863281zm0 0"></path></svg></span>
			<h3 class="u-text u-text-1">Dining Menu</h3>
			<div class="u-expanded-width u-list u-list-1">
				<div class="u-repeater u-repeater-1">
				<c:forEach var="menu" items="${menuDTO }" varStatus="status">
					<div class="u-container-style u-list-item u-repeater-item">
					<div
							class="u-container-layout u-similar-container u-container-layout-${status.count }">
							<h2 class="u-align-center u-text u-text-grey-70 u-text-2">${menu.name }</h2>
							<p class="u-align-center u-text u-text-grey-50 u-text-3">
								price : ${menu.price } won<br> <br>
							</p>

							<img
								src="resources/rest_detail/bootstrap/images/${restDTO.id }/${menu.pic }"
								alt=""
								class="u-expanded-width u-image u-image-default u-image-1">
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
			<div
				class="u-border-2 u-border-palette-5-base u-expanded-width u-hidden-md u-hidden-xs u-line u-line-horizontal u-line-2"></div>
		</div>
	</section>
	<c:import url="reviews.jsp"/>
	<footer>
		<c:import url="../default/footer.jsp"></c:import>
	</footer>
</body>
</html>