<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
font-size:14px;
	font-family: 'Gothic A1', sans-serif;
	box-sizing: border-box;
	border: 1px solid #ccc;


	-webkit-transition: 0.1s;
	transition: 0.2s;
	outline: none;
	width: 100px;
	margin-left: 10px;
	padding:10px;

   margin-top: 20px;
   height: 50px;

}
</style>
<script type="text/javascript">
	function mod_form(){
		var text = $("#summernote").val()
		var newText = text.replace(/(<([^>]+)>)/ig,"");
		$("#content").attr('value',newText)
		console.log(newText)
		var dummy = document.createElement("div");
		dummy.innerHTML = $("#summernote").val()
		var images = Array.from(dummy.querySelectorAll("img[src]"));
		
		var sources = images.map(function (item) {
		  return item.src.split("/").pop();
		});
		console.log(sources)
		$("#img_url").attr('value',sources.join(','))
			fo.submit()
	}
</script>
</head>

<body>

<div class="w3-animate-opacity">
	<c:set var="cont" value="${form}"/>

	<h2 style="text-align: center; margin-top: 40px;">글 수정</h2><br><br>

	<div style="width: 60%; margin: auto;">
		<form id="fo" method="post" action="modifyForm">
			<input type="hidden" name="writer"value="${session_user}"/>
			<input type="hidden" name="board_category" value="자유게시판"> 
			<input type="hidden" name="content"id="content">
			<input type="hidden" id="img_url" name="img_url">
			<input type="hidden" name="board_no" value="${cont.board_no }">
			<input id="title_box" type="text" name="title" value="${cont.title}"/>
			<br><br> 
			<textarea id="summernote">
			${cont.content}
			<c:if test="${fn:length(url) != 0}">
            	<c:forEach var="img" items="${url}">
            		<img src="load/${img}"><br>
                  </c:forEach>
             </c:if>
			</textarea>
			<div align="center">
			<input id="subBtn" type="button" value="등록하기" onclick="mod_form()"/>
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
	
function uploadSummernoteImageFile(file, el) {
	var data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "/uploadSummernoteImageFile",
		contentType : false,
		processData : false,
		cache: false,
		enctype : 'multipart/form-data',
		success : function(data) {
			$(el).summernote('editor.insertImage', data.url);
			console.log(data.url)
			console.log(data)
		}
	});
}
</script>

</body>
</html>



