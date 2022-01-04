<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Montserrat&family=Outfit:wght@100&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="${contextPath }/resources/css/form/form.css"></style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script>
function frmCheck()
{  
         var form = document.form;
         form.submit();
 }
</script>

<title>Insert title here</title>
</head>
<body>
	
	<header>
		<c:import url="../default/header.jsp"></c:import>
	</header>
	
		<main id="LoginWrap">
		<form name="form" method="post"  id="form"  action="foodReg" enctype="multipart/form-data">
			<!--  <input type="text" placeholder="아이디" name="id"> -->
			<table width="400" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="10" style="font-size: 24px;">음식 이름
					</td>
				</tr>
				<tr>
					<td height="10"><input type="text" placeholder="음식 이름"
						name="foodName" style="width: 100%;"
						> <br></td>
				</tr>
				<tr>
			</table>
			
			<table width="400" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="10" style="font-size: 24px;">국가별로 부르는 음식 이름
					</td>
				</tr>
				<tr>
					<td height="10"><input type="text" placeholder="국가별 음식 이름"
						name="foodComment" style="width: 100%;"
						> <br></td>
				</tr>
				<tr>
			</table>
			
			<table width="400" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="10" style="font-size: 24px;">나라 이름
					</td>
				</tr>
				<tr>
					<td height="10"><input type="text" placeholder="나라 이름"
						name="nation" style="width: 100%;"
						> <br></td>
				</tr>
				<tr>
			</table>

			<table width="400" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="10" style="font-size: 24px;">음식 메인 사진</td>
				</tr>
				<tr>
					<td height="10"><input type="file" placeholder="음식 메인 사진" name="mainPic" id= "mainPic" style="width: 100%; "></td>
				</tr>
			</table>
			
			<table width="400" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="10" style="font-size: 24px;">음식 소개
					</td>
				</tr>
				<tr>
					<td>
						<textarea name="intro" style="width: 100%; height: 250px; margin: 10px 0px;"></textarea>
					</td>
				</tr>
				<tr>
			</table>
			
			<table width="400" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="10" style="font-size: 24px;">카테고리 1 (각 나라별 지역 선택)
					</td>
				</tr>
				<tr>
					<td height="10"><input type="text" placeholder="각 나라별 지역 선택"
						name="category1" style="width: 100%;"
						> <br></td>
				</tr>
				<tr>
			</table>
			
			<!-- 
			<table width="400" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="10" style="font-size: 24px;">카테고리 1 (지역 선택)</td>
				</tr>
				<tr>
					<td>
						<select id="category1"  name="category1" >
							<option value="서울">서울</option>
							<option value="대전">대전</option>
							<option value="대구">대구</option>
							<option value="부산">부산</option>
							<option value="광주">광주</option>
							<option value="울산">울산</option>
							<option value="기타">기타</option>
						</select>
					</td>
				</tr>
			</table>
			 -->
			
			<table width="400" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="10" style="font-size: 24px;">카테고리 2 (음식 종류 선택)</td>
				</tr>
				<tr>
					<td>
						<select id="category2"  name="category2">
							<option value="밥 요리">밥 요리</option>
							<option value="면 요리">면 요리</option>
							<option value="음료 및 디저트">음료 및 디저트</option>
							<option value="구이 요리">구이 요리</option>
							<option value="국물 요리">국물 요리</option>
							<option value="기타 요리">기타 요리</option>
						</select>
					</td>
				</tr>
			</table>
			
			<table width="400" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="10" style="font-size: 24px;">국기 사진</td>
				</tr>
				<tr>
					<td height="10"><input type="file" placeholder="국기 사진" name="subPic" id= "subPic" style="width: 100%; "></td>
				</tr>
			</table>
			
			<table width="400" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="10" style="font-size: 24px;">국가 지도 사진</td>
				</tr>
				<tr>
					<td height="10"><input type="file" placeholder="국가 지도 사진" name="mapPic" id= "mapPic" style="width: 100%; "></td>
				</tr>
			</table>
			
			<table width="400" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="10"></td>
				</tr>
				<tr>
						<td align="center"><input type="button" name="button"
						id="button" value="확인" onClick="frmCheck();"></td>
				</tr>
			</table>
		</form>
	</main>
	
	<footer>
		<c:import url="../default/footer.jsp"></c:import>
	</footer>
	
</body>
</html>
