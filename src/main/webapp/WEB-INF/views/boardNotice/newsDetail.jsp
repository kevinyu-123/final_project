<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Montserrat&family=Outfit:wght@100&family=Playfair+Display+SC&display=swap"
   rel="stylesheet">
<<<<<<< HEAD
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


#comment_area{
   margin-top: 20px;
   

}
#comment_area span{
   font-size: medium;
   font-weight: bold;
   
}

</style>
</head>
<body>
   <div class="w3-animate-opacity">
   <c:set var="info" value="${form}"/>
      <header>
         <c:import url="../default/header.jsp" />
      </header>
            <div id="bigbox">
            <div id="left_box"></div>
            <div id="mid_box">
            <div align="right" style="margin-top: 20px;">
            <c:if test="${session_user == '운영진'}">
               <button id="t_btn" onclick="location.href='${contextPath}/modifyNotice?board_no=${info.board_no}'">수정</button>
            </c:if>
               <button id="t_btn" onclick="location.href='${contextPath}/news'">목록</button>
            </div>
            <div id="txt_area">
               <div style="margin-top: 30px; margin-left: 15px;">
                  <hr>
                  <h2 style="margin: 0px;">${info.title}</h2>
                  <h4>${info.reg_time }</h4>
               </div>
               <hr>
               <div style="margin-left: 30px;">
                  <p>${info.content}</p>
                  
               </div>
            </div>
        </div>
    </div>
    <footer>
         <c:import url="../default/footer.jsp" />
      </footer>
</div>
            
</body>
</html>