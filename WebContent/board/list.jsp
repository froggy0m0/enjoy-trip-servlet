<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="pg" value="${result.pg}" />
<c:set var="articles" value="${result.list}" />
<c:set var="key" value="${result.key}" />
<c:set var="word" value="${result.word}" />

<%-- <%@ include file="/common/header.jsp" %>
		<%@ include file="/common/confirm.jsp" %> --%>
		
<%@ include file="../common/init.jsp" %>
 <div>
 <a href="./index.jsp" >
 <img id="headBag" src="./assets/img/head1.png" alt="" onclick="window.location.reload()"/>
 </a>
</div>

<div class="row justify-content-center">
	<div class="col-lg-8 col-md-10 col-sm-12">
		<h2 class="my-3 py-3 shadow-sm bg-light text-center">
			<mark class="sky">글목록</mark>
		</h2>
	</div>
	<div class="col-lg-8 col-md-10 col-sm-12">
		<div class="row align-self-center mb-2">
			<div class="col-md-2 text-start">
				<button type="button" id="btn-mv-register"
					class="btn btn-outline-primary btn-sm">글쓰기</button>
			</div>
			<div class="col-md-7 offset-3">
				<form class="d-flex" id="form-search" action="">
					<input type="hidden" name="action" value="list" /> <input
						type="hidden" name="pgNo" value="1" /> <select name="key"
						id="key" class="form-select form-select-sm ms-5 me-1 w-50"
						aria-label="검색조건">
						<option value="" selected>검색조건</option>
						<option value="article_no">글번호</option>
						<option value="subject">제목</option>
						<option value="user_id">작성자</option>
					</select>
					<div class="input-group input-group-sm">
						<input type="text" name="word" id="word" class="form-control"
							placeholder="검색어..." />
						<button id="btn-search" class="btn btn-dark" type="button">검색</button>
					</div>
				</form>
			</div>
		</div>
		<table class="table table-hover">
			<thead>
				<tr class="text-center">
					<th scope="col">글번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">조회수</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="article" items="${articles}">
					<tr class="text-center">
						<th scope="row">${article.articleNo}</th>
						<td class="text-start"><a href="#"
							class="article-title link-dark" data-no="${article.articleNo}"
							style="text-decoration: none"> ${article.subject} </a></td>
						<td>${article.userId}</td>
						<td>${article.hit}</td>
						<td>${article.registerTime}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	
		<c:if test="${pg.count != 0}">
			<nav class="d-flex">
			  <ul class="pagination ms-auto me-auto">
			  	<c:if test="${pg.prev}">
				    <li>
				      <a href="board?action=list&&pageNo=${pg.beginPage - 1}&key=${key}&word=${word}">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
			    </c:if>

				<c:forEach var="i" begin="${pg.beginPage}" end="${pg.endPage}">
				    <c:choose>
				    	<c:when test="${i eq pg.pageNo}">
						    <li class="active"><a href="#${i}">${i}</a></li>
				    	</c:when>
				    	<c:otherwise>
						    <li><a href="board?action=list&&pageNo=${i}&key=${key}&word=${word}">${i}</a></li>
				    	</c:otherwise>
				    </c:choose>
				</c:forEach>
				
				<c:if test="${pg.next}">
				    <li>
				      <a href="board?action=list&&pageNo=${pg.endPage + 1}&key=${key}&word=${word}">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>	
			    </c:if>	    
			  </ul>
			</nav>
		</c:if>

		
		
	</div>
	<div class="row">${navigation.navigator}</div>
</div>
</div>
<form id="form-param" method="get" action="">
	<input type="hidden" id="p-action" name="action" value=""> <input
		type="hidden" id="p-pgno" name="pgno" value=""> <input
		type="hidden" id="p-key" name="key" value=""> <input
		type="hidden" id="p-word" name="word" value="">
</form>

<style>
	*{
	 cursor: url("https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcIwR9P%2FbtraRjIi6El%2FofkcHd4wk3BWMKZorWGH0k%2Fimg.png"), auto;
    cursor: url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg'  width='40' height='48' viewport='0 0 100 100' style='fill:black;font-size:24px;'><text y='50%'>🍔</text></svg>") 16 0, auto;
	}
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

<script>
	let titles = document.querySelectorAll(".article-title");
	titles.forEach(function(title) {
		title.addEventListener("click", function() {
			location.href = "${root}/board?action=view&articleno="
					+ this.getAttribute("data-no");
		});
	});

	document.querySelector("#btn-mv-register").addEventListener("click",
			function() {
				location.href = "${pageContext.request.contextPath}/board?action=mvwrite";
			});

	document.querySelector("#btn-search").addEventListener("click", function() {
		let form = document.querySelector("#form-search");
		form.setAttribute("action", "${root}/board");
		form.submit();
	});

	let pages = document.querySelectorAll(".page-link");
	pages.forEach(function(page) {
		page.addEventListener("click", function() {
			document.querySelector("#p-action").value = "list";
			document.querySelector("#p-pgno").value = this.parentNode
					.getAttribute("data-pg");
			document.querySelector("#p-key").value = "${param.key}";
			document.querySelector("#p-word").value = "${param.word}";
			document.querySelector("#form-param").submit();
		});
	});
</script>
<script src="./assets/js/hmouse.js"></script>
<%-- <%@ include file="/common/footer.jsp" %> --%>
