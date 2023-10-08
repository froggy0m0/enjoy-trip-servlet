<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String msg = (String) request.getAttribute("msg"); %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>사용자 정보 관리 사이트</title>
    <link rel="stylesheet" href="../assets/css/loginRegister.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
  </head>
  <body>
    <header>
      <nav class="header-nav">
        <div>
          <a href="../index.jsp"
            ><img id="headBag" src="../assets/img/head1.png" alt="" onclick="window.location.reload()"
          /></a>
        </div>
      </nav>
    </header>
    <main class="container">
      <div class="login-page">
        <h2 class="h2">즐거운 여행을 떠나볼까요?Ꙭ̮</h2>
        <c:choose>
	        <c:when test="${empty memberInfo}">
	        <div class="form">
	          <form name="login-form" class="login-form" action="${root}/member?action=login">
	         	<input type="hidden" name="action" value="login" required/>
	            <input id="id" name="id" type="text" placeholder="ID" required/>
	            <input id="password" name="password" type="password" placeholder="password" />
	         
	            <button>로그인</button>
	         <%--     <% if (msg != null) { %>
       			 <p><%= msg %></p>
    				<% } %> --%>
	            <!-- <button class="login-btn" onclick="login()" type="button">로그인</button> -->
	            <button onclick="location.href='register.jsp'" type="button">회원가입</button>
	          </form>
	        </div>
	        </c:when>
	        <c:otherwise>
				<%-- <span>${memberInfo.userName}님 환영합니다.</span>
				<a href="${root}/member?action=logout">로그아웃</a> --%>
	        	<script type="text/javascript">location.href="mypage.jsp"</script>
			</c:otherwise>
       </c:choose>
      </div>
    </main>
    <footer>
      <ul class="footer-list">
        <li><a href="#">Enjoy your Trip❤</a></li>
        <li>&copy; Enjoy</li>
      </ul>
    </footer>

  	<!--  <script src="../assets/js/loginRegister.js"></script> -->
    <script src="../assets/js/hmouse.js"></script>
  </body>
</html>
