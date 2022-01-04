<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Untitled</title>
    <link rel="stylesheet" href="${contextPath }/resources/css/default/footer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<Style>
</Style>
<body>

<div id="footer">
    <div class="footer-basic">
        <footer>
            <div class="social"><a href="#"><i class="icon ion-social-instagram"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-facebook"></i></a></div>

            <ul class="list-inline" style="	margin-left:650px;">
                <li class="list-inline-item"><a href="${contextPath }/main">Home</a></li>
                <li class="list-inline-item"><a href="${contextPath }/event">Event</a></li>
                <li class="list-inline-item"><a href="${contextPath }/aboutus">About</a></li>
                <li class="list-inline-item"><a href="${contextPath}/news">News</a></li>
                <li class="list-inline-item"><a href="${contextPath}/sitemap">SiteMap</a></li>
            </ul>

            <p class="copyright">Dining Lab.Inc © 2021</p>
        </footer>
    </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
</body>

</html>