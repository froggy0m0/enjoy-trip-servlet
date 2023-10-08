<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
  <c:choose>
    <c:when test="${empty memberInfo}">
    	<script>
			alert("로그인을 먼저 해주세요 Ꙭ̮");
			history.back();
		</script>
    </c:when>
  </c:choose>
  
<!DOCTYPE html>

<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;500;700&display=swap"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@40,500,0,0">

    <style>
        html,
        body {
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 20px;
            font-family: 'Jua', sans-serif;
            /* font-weight: bolder; */
        }

        .box1 {
            margin: 2em 2em;
            padding: 2em;
            border-radius: 40px;
            background-color: rgb(162, 196, 197);
            border-radius: 30px 60px/60px 30px;
            border: solid 8px #ccc7be;
            text-align: center;
            font-weight: bolder;
            width: 800px;
            margin: auto;
        }

        .button {
            text-align: center;
            font-size: 17px;
            margin: 1em 1em;
            background-color: rgb(150, 247, 214);
            font-weight: bolder;
            /* background-color:#fff; */
            box-shadow: 0 0 6px 1px rgb(150, 247, 214), 0 0 6px 1px rgb(150, 247, 214) inset;
            border-radius: 30px;
        }

        .buttom_box {
            margin-top: 15px;
        }

        .box2 {
            /* margin: 2em 2em; */
            padding: 2em;
            border-radius: 30px 60px/60px 30px;
            /* border: solid 8px #ccc7be; */
            background-color: rgb(162, 196, 197);
            width: 800px;
            margin: auto;
            margin-top: 20px;
        }

        #mypagefooter {
            text-align: center;
            color: rgb(162, 196, 197);
            ;

        }

        #headBag {
            /* margin-left: 100px; */
            width: 80px;
            /* position: fixed; */
        }

        #headBag:hover {
            transform: scale(1.2);
            -webkit-transform: scale(1.2);
            /* 크롬 */
            -moz-transform: scale(1.7);
            /* 파이어폭스 */
            -o-transform: scale(1.7);
            /* 오페라 */
            z-index: 1;
            align-items: center;
        }
  

        #mypageText {
            font-size: 45px;
        }
    </style>
</head>
<header>
<span>${memberInfo.userName}님 환영합니다.</span>
<a href="${root}/member?action=logout">로그아웃</a>
    <nav class="header-nav">

        <div class="box1">
            <span>
                <a href="#"><img id="headBag" src="../assets/img/head1.png" onclick="location.href='../index.jsp'" /></a>
            </span>
            <span id="mypageText" style="color: #145366;">마이페이지</span>
            <!-- <input type="hidden" name="msg" value="html"> -->
            <div class="buttom_box">
                <span class="button">
                    <a target="blank">여행을 떠나요 Ꙭ̮</a>
                </span>
            </div>
        </div>

    </nav>
</header>

<body>
    <c:choose>
        <c:when test="${not empty memberInfo}">
    <form>
        <div class="box2">
        	<tr>
	            <ul>아이디 : ${memberInfo.userId}</ul>
	            <ul>이메일 : ${memberInfo.userEmail}</ul>
	            <ul>이름 : ${memberInfo.userName}</ul>
	            <ul>나이 : ${memberInfo.userAge}</ul>
            </tr>
        </div>
       
    </form>
        </c:when>
        </c:choose>
    <div id="mypagefooter">
        <h3>즐거운 여행 되시길 바랍니다 Ꙭ̮</h3>
    </div>
    <script src="../assets/js/hmouse.js"></script>
    
</body>

</html>