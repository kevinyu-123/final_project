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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script language="javascript">

function frmCheck()
{
         var form = document.form;
         form.submit();
 }
 
function readURL(input) {
	var file = input.files[0] //파일에 대한 정보
	console.log(file)
	if (file != '') {
		var reader = new FileReader();
		reader.readAsDataURL(file); //파일의 정보를 토대로 파일을 읽고 
		reader.onload = function(e) { // 파일 로드한 값을 표현한다
			//e : 이벤트 안에 result값이 파일의 정보를 가지고 있다.
			$('#preview').attr('src', e.target.result);
		}
	}
}
 

</script>

<title>Insert title here</title>
</head>
<body>
	
	<header>
		<c:import url="../default/header.jsp"></c:import>
	</header>
	
		<main id="LoginWrap">
		<form name="form" method="post"  id="form"  action="nationEdit" enctype="multipart/form-data">
			<!--  <input type="text" placeholder="아이디" name="id"> -->
			<table width="400" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="10" style="font-size: 24px;">나라 이름
					</td>
				</tr>
				<tr>
					<td height="10"><input type="text" placeholder="나라 이름"
						name="nation" style="width: 100%; " value="${nation.nation }" readonly
						> <br></td>
				</tr>
				<tr>
			</table>

			<table width="400" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="10" style="font-size: 24px;">나라 국기 사진</td>
				</tr>
				<tr>
					<td height="10">
					<input type="hidden" name="originFileName" value="${nation.nationPicture}"> 
									<c:if test="${ nation.nationPicture != 'nan' }">
									<p>현재 사진 </p>
									<img width="200px" height="100px" id="preview"
									src="${contextPath}/resources/food2/${nation.nationPicture }">
									</c:if>
									<input type="file" name="imageFileName" onchange="readURL(this)" style="width: 100%;">
						
						<!-- <input type="file" 
						name="nationPicture2" id= "nationPicture" style="width: 100%; height: 35px;"> <br>
						현재 파일 : <img src="${contextPath }/resources/food2/${nation.nationPicture}" style="width: 100px;">
						 -->
					</td>
				</tr>
			</table>
			
			<table width="400" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="10" style="font-size: 24px;">나라 위치
					</td>
				</tr>
				<tr>
					<td height="10"><input type="text" placeholder="나라 위치"
						name="address" style="width: 100%;" value="${nation.address }"
						> <br></td>
				</tr>
				<tr>
			</table>
			
			<table width="400" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="10" style="font-size: 24px;">나라 소개
					</td>
				</tr>
				<tr>
					<td>
						<textarea name="infomation" style="width: 100%; height: 250px; margin: 10px 0px;" >${nation.infomation }</textarea>
					</td>
				</tr>
				<tr>
			</table>

			<table width="400" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="10"></td>
				</tr>
				<tr>
					<td align="center"><input type="submit" name="button"
						id="button" value="수정" onClick="frmCheck();"></td>
				</tr>
				<tr>
					<!-- 
						<label class="input-file-btn" for="nationPicture" style="width: 100%; height: 35px;">
							<span>나라 국기 사진 업로드</span>
						</label>
					 -->
				</tr>
			</table>
		</form>
	</main>
	<footer>
		<c:import url="../default/footer.jsp"></c:import>
	</footer>
	
</body>
</html>