<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 쓰기</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="${contextPath}/resources/editor/lang/summernote-ko-KR.js"></script>
<style type="text/css">
#title_box{
	width: 100%;
	height: 50px;
	border: 2px solid black;
	font-size: large;
}
#subBtn{
	margin-top: 20px;
	height: 40px;
	width: 80px;
}
</style>
<script type="text/javascript">
	function mod_form(){
		var text = $("#summernote").val()
		var newText = text.replace(/(<([^>]+)>)/ig,"");
		$("#content").attr('value',newText)
		console.log(newText)

		fo.submit()
	}
</script>
</head>

<body>

<div class="w3-animate-opacity">
	<c:set var="info" value="${form}"/>
	<h2 style="text-align: center; margin-top: 40px;">공지사항</h2><br><br>
	
	<div style="width: 60%; margin: auto;">
		<form id="fo" method="post" action="saveModNotice">
			<input type="hidden" name="writer"value="${session_user}"/>
			<input type="hidden" name="content"id="content">
			<input id="title_box" type="text" name="title" value="${info.title }"/>
			<input type="hidden" name="board_no" value="${info.board_no }">
			<input type="hidden" name="reg_ime" value="${info.reg_time}">
			<br><br> 
			<textarea id="summernote">${info.content }</textarea>
			<div align="center">
			<input id="subBtn" type="button" value="수정하기" onclick="mod_form()"/>
			</div>
		</form>
	</div>
</div>
<script>
$(document).ready(function() {
		 
	  $('#summernote').summernote({
	        height: 400,
	        tabsize: 5,
	        focus: true,
	        disableResizeEditor: true,
	        lang : 'ko-KR',
	        callbacks : { 
            	onImageUpload : function(files, editor, welEditable) {
            // 파일 업로드(다중업로드를 위해 반복문 사용)
            for (var i = files.length - 1; i >= 0; i--) {
            uploadSummernoteImageFile(files[i], this);
            	}
            }
         }      
	  });
	});
	
</script>

</body>
</html>
