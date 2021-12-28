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
      text-align: left;
      font: bold;
      margin-bottom: 0px;
      }
   #tag_div{
   }
   #table_div{
      margin-top: 30px;
   }
   a{
   text-decoration: none;
   }

</style>
</head>
<body>
      <div class="w3-animate-opacity">
      <header>
         <c:import url="../default/header.jsp" />
      </header>
            <div id="bigbox">
            <div id="left_box"></div>
            <div id="mid_box">
               <div id="tag_div"><h2>공지사항<br></h2>
               </div>
               <div id="table_div">
               <table border="1">
                  <tr>
                     <th>공지 번호</th><th width="60%;">제목</th><th>작성자</th><th>작성일</th><th>조회</th>
                  </tr>
                  <c:choose>
                     <c:when test="${list.size() != 0 }">
                        <c:forEach var="list" items="${list}">
                        <tr>
                            <td>${list.board_no}</td>
                            <td width="60%;"><a href="${contextPath}/viewContent?board_no=${list.board_no}">${list.title}</a></td>
                            <td>${list.writer}</td>
                            <td>${list.reg_time}</td>
                            <td>${list.views}</td>
                        </tr>
                        </c:forEach>
                     </c:when>
                     <c:otherwise>
                        <tr>
                           <td colspan="6" align="center">게시글이 없습니다.</td>
                        </tr>
                     </c:otherwise>
                  </c:choose>
               </table>
               <div align="center" style="margin-top: 10px;">
                  <c:forEach var="num" begin="1" end="${repeat}">
                  <a href="boardAllList?num=${num}">[${num}]</a>
               </c:forEach>
               </div>
                  <c:if test="${session_user == '운영진' }">
               <div style="margin-top: 20px;" align="right">
                     <button id="write_btn" onclick="location.href='${contextPath}/writeform'">글쓰기</button>
               </div>
                  </c:if>
               </div>
            </div>
            <div id="right_box"></div>      
         </div>
      
      <footer>
         <c:import url="../default/footer.jsp" />
      </footer>
</div>
   
</body>
</html>