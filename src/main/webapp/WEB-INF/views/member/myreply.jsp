<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 조회</title>
<style>
* {
	font-family: 'Outfit', sans-serif;
}

span {
	text-align: center;
	margin: auto;
	font-size: 30px;
}



button {
	background-color: rgba(223, 209, 204);
	border: none;
	padding: 30px 30px;
	display: inline-block;
	opacity: 70%;
	margin: 4px 2px;
	cursor: pointer;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
}

button:hover {
	box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0
		rgba(0, 0, 0, 0.19);
}

.likes, .board, .reply, .account {
	font-size: 25px;
	width: 300px;
	height: 200px;
}

#navdiv {
	position: fixed;
	text-align: center;
	list-style-type: none;

}

#navdiv ul {
	margin: 0;
	padding: 0;
	width: 200px;
}

#navdiv ul li {
	list-style-type: none;
}

#navdiv li a {
	font-size: 20px;
	display: block;
	padding: 8px 10px;
	text-decoration: none;
}

#navdiv li:hover {
	background-color: rgba(223, 209, 204);
}

#bigbox {
	height: 650px;
	display: flex;
}
#left_box{
	width: 20%;
}
#mid_box {
	
	width: 60%;
	padding-top: 10px;
}

#right_box {
	width: 20%;
}
 		table {
	    font-family: arial, sans-serif;
	    border-collapse: collapse;
	    width: 100%;
		}
	td, th {
	    border: 1px solid #dddddd;
	    text-align: center;
	    padding: 8px;
		}
	
	tr:nth-child(even) {
	    background-color: #dddddd;
		}
	h2 {
		text-align: center;
		}
	#rowsPerPage, #pageCount {
		float: right;
	}
	
	#textbox {
		width:100px;
		height:20px;
		letter-spacing: -5px"
	
	}
	h2 {
		text-align: center;
		}
</style>
<script type="text/javascript">
	

</script>
</head>
<body>

	<div class="w3-animate-opacity">
		<header>
			<c:import url="../default/header.jsp" />
		</header>
			<div id="div">
				<div id="navdiv">
					<ul>
						<li><a href="mypage"><strong style="font-size: 25px;">My Page</strong></a></li>
						<li><a href="${contextPath}/mylikes">My Likes</a></li>
						<li><a href="${contextPath}/myboard">My Board</a></li>
						<li><a href="${contextPath}/myreply">> My Reply</a></li>
						<li><a href="${contextPath}/newprofile">Account Settings</a></li>
					</ul>
				</div>
				</div>
				<div id="bigbox">
				<div id="left_box"></div>
				<div id="mid_box">
				
					<h6>총 ${fn:length(replyInfo)} 개의 댓글이 조회되었습니다.</h6>
					<table border="1">
						<tr>
							<th>제목</th><th>댓글 내용</th><th>작성일</th><th>조회</th>
						</tr>
						<c:choose>
							<c:when test="${fn:length(replyInfo) != 0}">
								<tr>
									<td>${replyInfo.comment_no }</td>
									<td><a href="#">${replyInfo.content}</a></td>
									<td>${replyInfo.reg_time}</td>
									<td>${replyInfo.views}</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4" align="center">
										조회된 댓글이 없습니다.
									</td>
								</tr>
							</c:otherwise>
						</c:choose>	
					</table>
				</div>
				<div id="right_box"></div>		
			</div>
		
		<footer>
			<c:import url="../default/footer.jsp" />
		</footer>
</div>

</body>
</html>