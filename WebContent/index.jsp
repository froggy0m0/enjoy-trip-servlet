<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">

<head>
    <script type="text/javascript"
                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6c19302fd8634ec8527c3e7ec2145b2b"></script>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>오목조목여행사이트</title>
    <link rel="stylesheet" href="./assets/css/musicBtn.css">
    <link rel="stylesheet" href="./assets/css/hmain.css" />
    <link rel="stylesheet" href="./assets/css/main.css" />
    <link rel="stylesheet" href="./assets/css/footer.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@40,500,0,0">

</head>
<body>
    <!--상단바-->
    <div>
    
        <div id="head">
            <div id="audio">
                <h4>Happy Travel with music</h4>
            </div>
            <div id="musicPlayer">
                <audio controls>
                    <source src="Bedtime - Reed Mathis.mp3" type="audio/mp3">
                </audio>
            </div>
            

            <button id="btn">☰</button>
            <nav id="nav" class="">
            
                <ul>
                    <li><a href="#1" onclick="location.href='./member/login.jsp'">로그인</a></li>
                    <li><a href="#1" onclick="location.href='./member/register.jsp'">회원가입</a></li>
                 	<li><a href="#1" onclick="location.href='./member/mypage.jsp'">마이페이지</a></li>

                </ul>
            </nav>
            </button>
            <div class="box1">
                <h1><img id="headBag" src="./img/head1.png" alt="" onclick="window.location.reload()"><span
                        style="color: #142c66;">
                        Ꙭ̮</span></h1>
                <!-- <input type="hidden" name="msg" value="html"> -->
                <div class="buttom_box">
                    <span class="button"> <!--누르면 이동-->
                        <a href="" target="blank">지역별여행지</a>
                    </span>
                    <span class="button">
                        <a href="" target="blank">지역별맛집</a>
                    </span>
                      <span class="button">
                        <a href="${root}/board?action=list" >공유게시판</a>
                    </span>
                    
                    <span class="button">
                        <a href="" target="blank">❤마이버킷❤</a>
                    </span>
                </div>
            </div>

            <!--중간-->
            <img src="./assets/img/tasty.png">
            <h1>식도락 여행지 선택하기</h1>
         <div class="select">
                <form id="cityForm" action="${root}/food">
                    <input type="hidden" name="action" value="list"/>
                        <select id='city' name='city' >
                        <option disabled selected>시도선택</option>
                    </select>
                    <select id='district' name='district'>
                        <option disabled selected>구군선택</option>
                    </select>
                </form>
            </div>
            <div>
                <div class="filterBox">
                    <ul class="wrapper">
                        <li class="slide" data-food-type="01">
                            <a href="#">
                                <img src="./assets/img/filter01.png">
                                <div>전체</div>
                            </a>
                        </li>
                        <li class="slide" data-food-type="02">
                            <a href="#">
                                <img src="./assets/img/filter02.png">
                                <div>한식</div>
                            </a>
                        </li>
                        <li class="slide" data-food-type="03">
                            <a href="#">
                                <img src="./assets/img/filter03.png">
                                <div>양식/레스토랑</div>
                            </a>
                        </li>
                        <li class="slide" data-food-type="04">
                            <a href="#">
                                <img src="./assets/img/filter04.png">
                                <div>고기/구이류</div>
                            </a>
                        </li>
                        <li class="slide" data-food-type="05">
                            <a href="#">
                                <img src="./assets/img/filter05.png">
                                <div>씨푸드</div>
                            </a>
                        </li>
                        <li class="slide" data-food-type="06">
                            <a href="#">
                                <img src="./assets/img/filter06.png">
                                <div>일/중/세계음식</div>
                            </a>
                        </li>
                        <li class="slide" data-food-type="07">
                            <a href="#">
                                <img src="./assets/img/filter07.png">
                                <div>카페/디저트</div>
                            </a>
                        </li>
                        <li class="slide" data-food-type="08">
                            <a href="#">
                                <img src="./assets/img/filte
                                r08.png">
                                <div>나이트라이프</div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

			<body>
			<div id="map" style="width:1000px;height:400px;"></div>
			<div class="container-main">
			    <div class="side" id="side">
			    </div>
			    </article>
			</div>

            <!-- 지도 출력 -->
			<%@ include file="/food/list.jsp" %>
            

            <!--하단-->


            <div class="container-main">
                <div class="side" id="side">
                </div>
                </article>
            </div>
        </div>

        <!-- 하단 시작 -->
        <div class="footer">
            <ul>
                <img src="./assets/img/tasty.png" alt="ssafy_logo" />
                <li><span class="material-symbols-outlined"> home </span><a href="">사이트소개</a></li>
                <!-- <li><a href="">개인정보처리방침</a></li> -->
                <li><span class="material-symbols-outlined"> inventory </span><a href="">이용약관</a></li>
                <li><span class="material-symbols-outlined"> location_on </span><a href="">오시는길</a></li>
            </ul>
        </div>
        <!-- 하단 끝 -->

        <script src="./assets/js/hmain.js"></script>
        <script src="./assets/js/hmouse.js"></script>
        <script src="./assets/js/slide.js"></script>
        <script src="./assets/js/main.js?v=1.000000000029"></script>
</body>


<div class="menu">
    <input type="checkbox" href="#" class="menu-open" name="menu-open" id="menu-open" />
    <label class="menu-open-button" for="menu-open">
        <span class="lines line-1"></span>
        <span class="lines line-2"></span>		
        <span class="lines line-3"></span>
    </label>

    <a href="#" class="menu-item blue"> <i class="fa fa-anchor"></i> </a>
    <a href="#" class="menu-item green"> <i class="fa fa-coffee"></i> </a>
    <a href="#" class="menu-item red">
        <h3>♥</h3><i class="fa fa-heart"></i>
    </a>
    <a href="#" class="menu-item purple" onclick='musicPurpleBtn()'>
        <h2>♪</h2><i class="fa fa-microphone"></i>
    </a>
    <a href="#" class="menu-item orange"> <i class="fa fa-star"></i> </a>
    <a href="#" class="menu-item lightblue"> <i class="fa fa-diamond"></i> </a>
</div>

</html>