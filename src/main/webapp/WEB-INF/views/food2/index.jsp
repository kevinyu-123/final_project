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
* {
	font-family: 'Gothic A1', sans-serif;
}
.main__screen-left-title {
	color: orange;
}
.main__screen__recipe-title {
	display: flex;
	justify-content: space-between;
	align-items: center;
}


.main__screen__recipe-title {
	padding-top: 40px;
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
		<c:import url="../default/header.jsp"></c:import>
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
					<div class="main__screen-left-menu">
						<span>${detail.category1 } | </span>
						<span>${detail.category2 }</span>
					</div>
					<div class="main__screen-left-title">
						<span>${detail.foodName }</span>
					</div>
					<div class="main__screen-left-equalTitle">
						<span>${detail.foodComment }</span>
					</div>
					<div class="main__screen-left-content">
						<p>${detail.intro }</p>
					</div>
				</div>

				<div class="main__screen-right">
					<div class="main__screen-right-contry">
						<span>${detail.nation }</span> <img
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
				<div style="padding-bottom: 240px;">
					<span>${recipe.foodName } 조리법</span>
				</div>
				<div>
					<iframe width="770" height="400" src="https://www.youtube.com/embed/${recipe.youtubeAddr }" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="margin-right: 100px"></iframe>
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

		<!-- 

		<div class="main__screen__wheretoeat">
			<div class="main__screen__wheretoeat-main">
				<div class="main__screen__wheretoeat-main-left">
					<img
						src="https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=https%3A%2F%2Fmyplace-phinf.pstatic.net%2F20210924_23%2F1632458229423m08yi_JPEG%2Fupload_e2f7b742a783166bb0ff4d44607fb4fe.jpeg" />
					<img
						src="https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=https%3A%2F%2Fmyplace-phinf.pstatic.net%2F20210926_56%2F1632646250662R7tIs_JPEG%2Fupload_2a77fbee03154a562ffb47c75c6067c3.jpeg" />
				</div>
				<div class="main__screen__wheretoeat-main-right">
					<div class="main__screen__wheretoeat-main-right__column">
						<span>오레노 라멘</span>
						<div class="main__screen__wheretoeat-main-right__column-location">
							<p>서울 마포구 독막로6길 14</p>
							<p>합정역 7번 출구에서426m</p>
						</div>
					</div>
					<div class="main__screen__wheretoeat-main-right__column">
						<div class="worktime-title">
							<span>영업 시간</span>
						</div>
						<div class="worktime">
							<span>점심 11:30 - 15:00 (L.o 14:40)</span> <span>저녁 17:00 -
								21:00 (L.o 20:30)</span>
						</div>
						<div class="info">
							<p>'연중무휴' 휴무시 인스타 공지 예정 인근 유료주차장(당인노상공영주차장)을 이용해주세요 노키즈 존입니다.
								중학생부터 입장 가능합니다.</p>
						</div>
					</div>
					<div class="main__screen__wheretoeat-main-right__column">
						<div class="michelin__guide">
							<span class="michelin__guide-title">미쉐린 가이드 서울 2022</span> <span>국내에서
								외국 음식의 대중화는 곧 현지화의 성공을 의미한다. 진입 장벽이 낮은 대중음식의 경우 더욱더 그러하다. 신동우
								셰프는 오랜 시간에 걸쳐 축적한 라멘 비즈니스 노하우로 정통성과 대중성이라는 두 마리 토끼를 모두 잡았다. 진한 닭
								육수가 매력적인 토리파이탄과 깔끔하면서도 깊은 맛을 자랑하는 쇼유 라멘에서 그가 추구하는 색깔이 뚜렷이 드러난다.
								신 셰프는 라멘의 생명인 육수와 면을 매일매일 만들어내며 끊임없는 테스팅으로 품질 유지에 심혈을 기울인다.
								"스스로에게 떳떳한 라멘을 만들고 싶다"는 그의 말에서 자부심이 엿보인다.</span>
						</div>
					</div>
					<div class="main__screen__wheretoeat-main-right__column">
						<div>
							<div class="menu-title">
								<span>메뉴 9</span>
							</div>
							<div class="menu-kinds">
								<div>
									<span>토리빠이탄 라멘</span> <span>9,000원</span>
								</div>
								<div>
									<span>카라빠이탄 라멘</span> <span>9,000원</span>
								</div>
								<div>
									<span>쇼유라멘</span> <span>9,000원</span>
								</div>
								<div>
									<span>시오라멘</span> <span>9,000원</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="main__screen__comment">
			<div class="main__screen__comment__left">
				<div class="main__screen__comment-title">
					<span>최신순</span>
				</div>
				<div class="main__screen__comment-info">
					<div class="main__screen__comment-pic">
						<img
							src="https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA0MjBfMTYg%2FMDAxNjE4ODQ3Mjc2MDUw.XW7a4r-PmgYEo_fW0YljRkS3fKGhSnTFVIhbVaaFrMQg.PW4-s-zdmeZdyUqV9E6syyd2c7CtWpRzxfuFSBnYNi0g.JPEG.imsodal%2FDSCF3762.JPG" />
						<div class="main__screen__comment-userInfo">
							<div class="main__screen__comment-userInfo-id">
								<span>탱크</span>
							</div>
							<span>리뷰 339 사진 25</span>
						</div>
					</div>
					<div class="main__screen__comment-follow">
						<a href="#">팔로우</a>
					</div>
				</div>
				<div class="main__screen__comment-content">
					<span>맛있어요 !</span>
				</div>
				<div class="main__screen__comment-icon">😁😁음식이 맛있어요, 양이 많아요</div>
				<div class="main__screen__comment-date">
					<span>11.28일</span> <span>1번째 방문</span> <span>영수증</span>
				</div>
			</div>
			<div class="main__screen__comment__right">
				<div class="main__screen__comment-title">
					<span>최신순</span>
				</div>
				<div class="main__screen__comment-info">
					<div class="main__screen__comment-pic">
						<img
							src="https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA0MjBfMTYg%2FMDAxNjE4ODQ3Mjc2MDUw.XW7a4r-PmgYEo_fW0YljRkS3fKGhSnTFVIhbVaaFrMQg.PW4-s-zdmeZdyUqV9E6syyd2c7CtWpRzxfuFSBnYNi0g.JPEG.imsodal%2FDSCF3762.JPG" />
						<div class="main__screen__comment-userInfo">
							<div class="main__screen__comment-userInfo-id">
								<span>탱크</span>
							</div>
							<span>리뷰 339 사진 25</span>
						</div>
					</div>
					<div class="main__screen__comment-follow">
						<a href="#">팔로우</a>
					</div>
				</div>
				<div class="main__screen__comment-content">
					<span>맛있어요 !맛있어요 !맛있어요 !맛있어요 !맛있어요 !맛있어요 !맛있어요 !맛있어요 !맛있어요
						!맛있어요 !맛있어요 !맛있어요 !맛있어요 !맛있어요 !맛있어요 !맛있어요 !맛있어요 !맛있어요 !맛있어요 !맛있어요
						!맛있어요 !맛있어요 !맛있어요 !</span>
				</div>
				<div class="main__screen__comment-icon">😁😁음식이 맛있어요, 양이 많아요</div>
				<div class="main__screen__comment-date">
					<span>11.28일</span> <span>1번째 방문</span> <span>영수증</span>
				</div>
			</div>
		</div>
		
		 -->
	</main>

	<footer>
		<c:import url="../default/footer.jsp"></c:import>
	</footer>

</body>
</html>
