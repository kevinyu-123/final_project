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
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>


<style type="text/css">
#bigbox {
	height: 100%;
	display: flex;
}
#left_box{
	width: 20%;
}
#mid_box {
	width: 60%;
	padding-top: 10px;
	height: 100%;
}

#right_box {
	width: 20%;
}
#t_btn{
	width:90px;
	height: 40px;
}
#txt_area{
	height: 100%;
	border: 1px solid gray;

	border-radius:10px;
	width: 100%;
	margin-top: 10px;
}
a{
text-decoration: none;
}
#user_img{
	height: 40px;
	width: 30px;
	border-radius: 80%;
	background-color: gray;
}
img{
	width: 230px;
	height: 350px;
	
}
#comment_area{
	margin-top: 20px;
	

}
#comment_area span{
	font-size: medium;
	font-weight: bold;
	
}

</style>
<script type="text/javascript">
	function saveReply(){
		let form = {};
		let arr = $("#cfo").serializeArray()
		for (i = 0; i < arr.length; i++) {
			form[arr[i].name] = arr[i].value;
		}
		$.ajax({
			url: "saveRep",
			type: "post",
			dataType : "json",
			data : JSON.stringify(form),
			contentType : "application/json;charset=utf-8",
			success : function(data){
				alert('댓글이 성공적으로 등록되었습니다.');
				$("#content").val("")
				comment_list()
			},
			error: function(){
				alert('error');
			}
		})
	}
	
	function comment_list(){
		var post_group = $("#post_group").val()
		$.ajax({
			  url:"replyData/"+post_group,
			  type:"GET", 
			  dataType:"json",
			  success: function(rep){
			  let html = ""
			  rep.forEach(function(data){
				  
			  	var date = new Date(data.reg_time)
			  	let writeDate = date.getFullYear()+"년"+(date.getMonth()+1)+"월"
			  	writeDate += date.getDate()+"일"+date.getHours()+"시"
			  	writeDate += date.getMinutes()+"분"
			  	
				html += "<b><small>작성일</small></b> :<small> "+writeDate+"</small><br>"
			  	html += "<div align='left'><b>닉네임 : </b>"+data.writer+"<br>";
			  	html += data.content+"<hr></div>"
			  	html += "<hr>"
			  })
			  
			  $("#c_box").html(html)
			  },error:function(){
			  alert('데이터를 가져올 수 없습니다')
			 }
			})
	}
</script>
</head>
<body onload="comment_list()">
<div class="w3-animate-opacity">
	<c:set var="info" value="${form}"/>
		<header>
			<c:import url="../default/header.jsp" />
		</header>
				<div id="bigbox">
				<div id="left_box"></div>
				<div id="mid_box">
				<div align="right" style="margin-top: 20px;">
				<c:if test="${session_user == info.writer }">
					<button id="t_btn" onclick="#">수정</button>
					<button id="t_btn" onclick="location.href='${contextPath}/deleteCont'">삭제</button>
				</c:if>
					<button id="t_btn" onclick="location.href='${contextPath}/boardAllList'">목록</button>
				</div>
				<div id="txt_area">
					<div style="margin-top: 30px; margin-left: 15px;">
						<span><a href="${contextPath}/boardAllList">자유게시판 ></a></span>
						<hr>
						<h2 style="margin: 0px;">${info.title}</h2>
						<h4 style="padding-left: 30px;">
						<img id="user_img" src="${contextPath}/resources/img/imgMain/user.png">&nbsp; ${info.writer }</h4>
						<h4>${info.reg_time }</h4>
					</div>
					<hr>
					<div style="margin-left: 30px;">
						<p>${info.content}</p>
						<c:if test="${fn:length(url) != 0}">
						<c:forEach var="img" items="${url}">
							<img src="load/${img}"><br>
						</c:forEach>
						</c:if>
					</div>
				</div>
				<div id="comment_area">
					<span>댓글( )</span>
					<small><a href="javascript:void(0)" onclick="sort_by_reg()">등록순</a> &nbsp;</small>
					<small>&nbsp;<a href="javascript:void(0)" onclick="sort_by_date()">최신순</a></small>
					<hr>
				</div>
				<div id="c_box">
					
				</div>
				<div id="rp_box">
					<span>댓글 달기</span>
					<form id="cfo" >
						<c:choose>
							<c:when test="${session_user != null }">
						<textarea rows="6" cols="111" name="content" id="content" style="resize: none" placeholder="댓글을 등록해 주세요"></textarea>
						<input type="hidden" name="writer" value="${session_user}">
						<input type="hidden" id="post_group" name="post_group"  value="${info.board_no}">
						<input type="button" onclick="saveReply()" value="등록">
							</c:when>
							<c:otherwise>
								<a href="/naverlogin">
								<textarea rows="6" cols="111" style="resize: none" placeholder="로그인 후 이용할 수 있습니다."></textarea>
								</a>
							</c:otherwise>
						</c:choose>
						
					</form>
				</div>
					<hr>
				</div>
				
				<div id="right_box"></div>		
			</div>
		
		<footer>
			<c:import url="../default/footer.jsp" />
		</footer>
</div>
</body>
</html>