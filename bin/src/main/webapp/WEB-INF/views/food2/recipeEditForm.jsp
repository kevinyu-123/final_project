<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>무야호</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Montserrat&family=Outfit:wght@100&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="${contextPath }/resources/css/form/form.css"></style>

<script language="javascript">
var oTbl;
//Row 추가
function insRow() {
  oTbl = document.getElementById("addTable");
  var oRow = oTbl.insertRow();
  oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
  var oCell = oRow.insertCell();

  //삽입될 Form Tag
  var frmTag = "<input type=text name=addText style='width:100%; height:35px;'> ";
  frmTag += "<input type=button value='삭제' onClick='removeRow()' style='cursor:hand'>";
  oCell.innerHTML = frmTag;
}
//Row 삭제
function removeRow() {
  oTbl.deleteRow(oTbl.clickedRowIndex);
}

var oTbl2;
//Row 추가
function insRow2() {
  oTbl2 = document.getElementById("addTable2");
  var oRow2 = oTbl2.insertRow();
  oRow2.onmouseover=function(){oTbl2.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
  var oCell2 = oRow2.insertCell();

  //삽입될 Form Tag
  var frmTag2 = "<input type=text name=addText2 style='width:100%; height:35px;'> ";
  frmTag2 += "<input type=button value='삭제' onClick='removeRow2()' style='cursor:hand'>";
  oCell2.innerHTML = frmTag2;
}
//Row 삭제
function removeRow2() {
  oTbl2.deleteRow(oTbl2.clickedRowIndex);
}

function frmCheck()
{
  var frm = document.form;
  
  var recipe = "";
  var ingredients = "";
  
  for( var i = 0; i <= frm.elements.length - 1; i++ ){
     if( frm.elements[i].name == "addText")
     {
         if( !frm.elements[i].value ){
             alert("텍스트박스에 값을 입력하세요!");
             frm.elements[i].focus();
	 		return;
          }
          recipe += frm.elements[i].value + "/";	<!-- + "\n" -->
      }
   }
         document.getElementById("recipe").value = recipe;
         
  for( var i = 0; i <= frm.elements.length - 1; i++ ){
     if( frm.elements[i].name == "addText2")
     {
         if( !frm.elements[i].value ){
             alert("텍스트박스에 값을 입력하세요!");
             frm.elements[i].focus();
	 		return;
          }
         ingredients += frm.elements[i].value + "/";	<!-- + "\n" -->
      }
   }
         document.getElementById("ingredients").value = ingredients;
         
        var form = document.form;
        form.submit();
 }
 
 function cookTime() {
	 var cookTime = document.getElementsByName('cookTime');
	 var cookTimeChoice; // 여기에 선택된 radio 버튼의 값이 담기게 된다.
	 for(var i=0; i<cookTime.length; i++) {
	     if(cookTime[i].checked) {
	    	 cookTimeChoice = cookTime[i].value;
	     }
	 }
 }

</script>
</head>
<body>

	<header>
		<c:import url="../default/header.jsp"></c:import>
	</header>

	<main id="LoginWrap">
		<form name="form" method="post" action="recipeEdit" id="form" enctype="multipart/form-data" >
			<!--  <input type="text" placeholder="아이디" name="id"> -->
			<table width="400" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="10" style="font-size: 24px;">음식이름
						<p style="font-size: 12px;">* 이미 등록된 음식의 레시피만 저장이 가능합니다.</p>
					</td>
				</tr>
				<tr>
					<td height="10"><input type="text" placeholder="음식이름"
						name="foodName" style="width: 100%; height: 35px;"  value="${recipe.foodName }"
						> <br></td>
				</tr>
				<tr>
			</table>

			<table width="400" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="10" style="font-size: 24px;">유튜브 주소
						<p style="font-size: 12px;">* 유튜브의 고유주소를 입력해 주세요.</p>
					</td>
				</tr>
				<tr>
					<td height="10"><input type="text" placeholder="유튜브 주소"
						id="youtubeAddr" name="youtubeAddr" value="${recipe.youtubeAddr }"
						style="width: 100%; height: 35px;"> <br></td> 
				</tr>
				<tr>
			</table>

			<table width="400" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="10" style="font-size: 24px;">조리시간</td>
				</tr>
				<tr>
					<td height="10"><label><input type="radio"
							name="cookTime" id="cookTime" value="1인분 기준 30분 이내" checked="checked"
							onclick="cookTime()"> 1인분 기준 30분 이내</label></td>
				</tr>
				<tr>
					<td height="10"><label><input type="radio"
							name="cookTime" id="cookTime" value="1인분 기준 60분 이내"
							onclick="cookTime()"> 1인분 기준 60분 이내</label> <br></td>
				</tr>
				<tr>
					<td height="10"><label><input type="radio"
							name="cookTime" id="cookTime" value="1인분 기준 90분 이내"
							onclick="cookTime()"> 1인분 기준 90분 이내</label> <br></td>
				</tr>
			</table>

			<table width="400" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td colspan="2" align="left" bgcolor="#FFFFFF">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td colspan="5" bgcolor="#FFFFFF" height="25" align="left">
									<span style="font-size: 24px;">재료</span> <br> <input
									name="addButton2" type="button" style="cursor: hand"
									onClick="insRow2()" value="추가"> <font color="#FF0000">*</font>재료를
									추가하려면 추가버튼을 클릭하세요.
								</td>
							</tr>
							<tr>
								<td height="25">
									<table id="addTable2" width="400" cellspacing="0"
										cellpadding="0" bgcolor="#FFFFFF" border="0">
										<tr>
											<td><input type="text" name="addText2"
												style="width: 100%; height: 35px;"></td>
											<td align="left"></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table width="400" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="10"></td>
				</tr>
				<tr>
					<td align="center"></td>
				</tr>
			</table>


			<!-- <input type="text" placeholder="재료" name="ingredients">	<br><br><br> -->


			<table width="400" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td colspan="2" align="left" bgcolor="#FFFFFF">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td colspan="5" bgcolor="#FFFFFF" height="25" align="left">
									<span style="font-size: 24px;">레시피</span> <br> <input
									name="addButton" type="button" style="cursor: hand"
									onClick="insRow()" value="추가"> <font color="#FF0000">*</font>레시피를
									추가하려면 추가버튼을 클릭하세요.
								</td>
							</tr>
							<tr>
								<td height="25">
									<table id="addTable" width="400" cellspacing="0"
										cellpadding="0" bgcolor="#FFFFFF" border="0">
										<tr>
											<td><input type="text" name="addText"
												style="width: 100%; height: 35px;" ></td>
											<td align="left"></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
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
			<input type="hidden" name="ingredients" id="ingredients" value="">
			<input type="hidden" name="recipe" id="recipe" value="">
		</form>
	</main>

	<footer>
		<c:import url="../default/footer.jsp"></c:import>
	</footer>

</body>
</html>