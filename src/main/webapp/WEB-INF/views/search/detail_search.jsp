<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
body {
   height: 100%;
}
.wrap {
   display: flex;
   height: 60vh;
   width: 940px;
   margin: 0 auto;
   border: 1px solid;
   justify-content: center;
}
.country, .addr, .food {
   display: flex;
   width: 100%;
   height: 25%;
   margin-top: 30px;
}

.title {
   margin-right: 50px;
}

label {
   display: inline;
   width: 45px;
   line-height: 14px;
   margin-right: 10px;
}

.content {
   margin-top: 15px;
}

.btn {
   width: 90px;
   display: block;
   margin: auto;
}

</style>
</head>
<body>

   <header>
      <c:import url="../default/header.jsp" />
   </header>
	  <c:import url="../search/nav_bar.jsp"/>

   <div class="wrap">
      <form action="./search_result_detail" method="get">
         <div class="country">
            <div class="title">
               <h4>나라</h4>
            </div>
            <div class="content">
               <input type="radio" id="c1" name="country" value="대한민국" checked/>
               <label for="c1">한국</label>
               
               <input type="radio" id="c2" name="country" value="일본"/>
               <label for="c2">일본</label>
               
               <input type="radio" id="c3" name="country" value="홍콩"/>
               <label for="c3">홍콩</label>
               
               <input type="radio" id="c4" name="country" value="대만"/>
               <label for="c4">대만</label>
               
               <input type="radio" id="c3" name="country" value="태국"/>
               <label for="c3">태국</label>
               
               <input type="radio" id="c5" name="country" value="라오스"/>
               <label for="c5">라오스</label>
               
               <input type="radio" id="c6" name="country" value="몽골"/>
               <label for="c6">몽골</label>
               
               <input type="radio" id="c7" name="country" value="필리핀"/>
               <label for="c7">필리핀</label>
               
               <input type="radio" id="c8" name="country" value="베트남"/>
               <label for="c8">베트남</label>
               
               <input type="radio" id="c9" name="country" value="싱가폴"/>
               <label for="c9">싱가폴</label>
                
            </div>
         </div>
         <div class="addr">
            <div class="title">
               <h4>지역</h4>
            </div>
            <div class="content">
               <input type="radio" id="c1" name="addr" value="서울" checked/>
               <label for="c1">서울</label>
               
               <input type="radio" id="c2" name="addr" value="도쿄"/>
               <label for="c2">경기도</label>
               
               <input type="radio" id="c3" name="addr" value="전주"/>
               <label for="c3">전주</label>
               
               <input type="radio" id="c4" name="addr" value="부산"/>
               <label for="c4">부산</label>
               
               <input type="radio" id="c5" name="addr" value="광주"/>
               <label for="c5">광주</label>
               
               <input type="radio" id="c6" name="addr" value="홍콩"/>
               <label for="c6">대구</label>
               
               <input type="radio" id="c7" name="addr" value="강원도"/>
               <label for="c7">강원도</label>
               
               <input type="radio" id="c8" name="addr" value="충청도"/>
               <label for="c8">충청도</label>
               
               <input type="radio" id="c9" name="addr" value="울산"/>
               <label for="c9">울산</label>
               
               <input type="radio" id="c10" name="addr" value="제주"/>
               <label for="c10">제주</label>
               
            </div>
         </div>
         <div class="food">
            <div class="title">
               <h4>음식</h4>
            </div>
            
            <div class="content">
               <input type="radio" id="c1" name="food" value="밥요리" checked/>
               <label for="c1">밥류</label>
               
               <input type="radio" id="c2" name="food" value="면요리"/>
               <label for="c2">면류</label>
               
               <input type="radio" id="c3" name="food" value="구이"/>
               <label for="c3">구이</label>
               
               <input type="radio" id="c4" name="food" value="국물요리"/>
               <label for="c4">국물요리</label>
               
               <input type="radio" id="c5" name="food" value="음료 및 디저트"/>
               <label for="c5">디저트 및 음료</label>
               
               <input type="radio" id="c6" name="food" value="볶음요리"/>
               <label for="c6">볶음요리</label>
               
               <input type="radio" id="c7" name="food" value="쌈요리"/>
               <label for="c7">쌈류</label>
               
               <input type="radio" id="c8" name="food" value="튀김요리"/>
               <label for="c7">튀김류</label>
               
               <input type="radio" id="c9" name="food" value="기타"/>
               <label for="c7">기타</label>
            </div>
         </div>
         <button class="btn" type="submit">검색하기</button>
      </form>
   </div>
   <footer>
      <c:import url="../default/footer.jsp" />
   </footer>

</body>
</html>