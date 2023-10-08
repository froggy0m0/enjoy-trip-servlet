<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<%@ include file="../common/init.jsp" %>
 <div>
 <a href="./index.jsp" >
 <img id="headBag" src="./assets/img/head1.png" alt="" onclick="window.location.reload()"/>
 </a>
</div>
	<%--
<%@ include file="/common/header.jsp" %>
      <%@ include file="/common/confirm.jsp" %>
      
 --%>
      <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10 col-sm-12">
          <h2 class="my-3 py-3 shadow-sm bg-light text-center">
            <mark class="sky">글수정</mark>
          </h2>
        </div>
        <div class="col-lg-8 col-md-10 col-sm-12">
          <form id="form-modify" method="POST" action="">
          	<input type="hidden" name="action" value="modify">
          	<input type="hidden" name="articleno" value="${article.articleNo}">
            <div class="mb-3">
              <label for="subject" class="form-label">제목 : </label>
              <input type="text" class="form-control" id="subject" name="subject" value="${article.subject}" />
            </div>
            <div class="mb-3">
              <label for="content" class="form-label">내용 : </label>
              <textarea class="form-control" id="content" name="content" rows="7">${article.content}</textarea>
            </div>
            <div class="col-auto text-center">
              <button type="button" id="btn-modify" class="btn btn-outline-primary mb-3">
                글수정
              </button>
              <button type="button" id="btn-list" class="btn btn-outline-danger mb-3">
                목록으로이동...
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
    <script src="../assets/js/hmouse.js"></script>
    <script>
      document.querySelector("#btn-modify").addEventListener("click", function () {
        if (!document.querySelector("#subject").value) {
          alert("제목 입력!!");
          return;
        } else if (!document.querySelector("#content").value) {
          alert("내용 입력!!");
          return;
        } else {
          let form = document.querySelector("#form-modify");
          form.setAttribute("action", "${root}/board");
          form.submit();
        }
      });
      document.querySelector("#btn-list").addEventListener("click", function () {
        location.href = "${root}/board?action=list&pgno=1&key=&word=";
      });
    </script>
    <script src="./assets/js/hmouse.js"></script>
    
    
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
<%--
<%@ include file="/common/footer.jsp" %>
 --%>
