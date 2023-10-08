<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원가입</title>
    <link rel="stylesheet" href="../assets/css/loginRegister.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
  </head>
  <body>
    <header>
      <nav class="header-nav">
        <div>
          <a href="#"
            ><img id="headBag" src="../assets/img/head1.png" onclick="location.href='../index.jsp'"
          /></a>
        </div>
      </nav>
    </header>
    <main class="container">
      <div class="login-page">
        <h2 class="h2">즐거운 여행 되세요Ꙭ̮</h2>
        <div class="form">
          <form action="${root}/member?action=regist" method="post" name="register-form" class="register-form">
          <input type="hidden" name="action" value="regist"/>
            <input id="id" name="id" type="text" placeholder="id" required />
            <input id="password" name="password" type="password" placeholder="password" required/>
            <input id="email" name="email" type="email" placeholder="email address" required/>
            <input id="name" name="name" type="text" placeholder="name" required/>
            <input id="age" name="age" type="number" placeholder="age" required/>
            <button>회원등록</button>
           <!--  <button onclick="register()" type="button">회원 등록</button> -->
          </form>
        </div>
      </div>
    </main>
    <footer>
      <ul class="footer-list">
        <li><a href="#">Enjoy your Trip❤</a></li>
        <li>&copy; Enjoy</li>
      </ul>
    </footer>
    <script src="../assets/js/loginRegister.js"></script>
    <script src="../assets/js/hmouse.js"></script>
  </body>
</html>
