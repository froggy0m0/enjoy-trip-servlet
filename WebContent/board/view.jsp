<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
<%@ include file="/common/header.jsp" %>
--%>

<%@ include file="../common/init.jsp" %>
 <div>
 <a href="./index.jsp" >
 <img id="headBag" src="./assets/img/head1.png" alt="" onclick="window.location.reload()"/>
 </a>
</div>

	<c:if test="${article eq null}">
		<script>
		alert("글이 삭제되었거나 부적절한 URL 접근입니다.");
		location.href = "${root}/article?action=list";
		</script>
	</c:if>
	<%-- 
      <%@ include file="/common/confirm.jsp" %>
     --%>
      <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10 col-sm-12">
          <h2 class="my-3 py-3 shadow-sm bg-light text-center">
            <mark class="sky">글보기</mark>
          </h2>
        </div>
        <div class="col-lg-8 col-md-10 col-sm-12">
          <div class="row my-2">
            <h2 class="text-secondary px-5">${article.articleNo}. ${article.subject}</h2>
          </div>
          <div class="row">
            <div class="col-md-8">
              <div class="clearfix align-content-center">
                <img
                  class="avatar me-2 float-md-start bg-light p-2"
                  src="https://raw.githubusercontent.com/twbs/icons/main/icons/person-fill.svg"
                />
                <p>
                  <span class="fw-bold">${article.userId}</span> <br />
                  <span class="text-secondary fw-light"> ${article.registerTime} 조회 : ${article.hit} </span>
                </p>
              </div>
            </div>
            <div class="col-md-4 align-self-center text-end">댓글 : 17</div>
            <div class="divider mb-3"></div>
            <div class="text-secondary">
              ${article.content}
            </div>
            <div class="divider mt-3 mb-3"></div>
            <div class="d-flex justify-content-end">
              <button type="button" id="btn-list" class="btn btn-outline-primary mb-3">
                글목록
              </button>
              <%-- <c:if test="${userinfo.userId eq article.userId}"> --%>
              <button type="button" id="btn-mv-modify" class="btn btn-outline-success mb-3 ms-1">
                글수정
              </button>
              <button type="button" id="btn-delete" class="btn btn-outline-danger mb-3 ms-1">
                글삭제
              </button>
              <%-- ></c:if> --%>
            </div>
          </div>
        </div>

        <div class="container">
          <div class="row justify-content-center"> <!-- 가운데 정렬 -->
            <div class="col-md-8">
              <!-- 입력창 -->
              <div class="form-group">
                <div class="input-group">
                  <textarea id="commentInput" class="form-control" placeholder="댓글을 입력하세요" rows="3"></textarea>
                  <span class="input-group-btn">
                    <button id="btn-comment-write" class="btn btn-primary" type="button">댓글 작성</button>
                  </span>
                </div>
              </div>
            </div>
          </div>
          <div class="row justify-content-center"> <!-- 가운데 정렬 --> 
            <div class="col-md-8">
              <!-- 댓글 목록 -->
              <div class="panel panel-default mt-4">
                <div class="panel-heading">댓글 목록</div>
                <div class="panel-body" id="commentList">
                </div>
              </div>
            </div>
          </div>
        </div>
        
      </div>

    
    </div>
    <script src="../assets/js/hmouse.js"></script>
    <script>
      document.querySelector("#btn-list").addEventListener("click", function () {
        location.href = "${root}/board?action=list";
      });
      document.querySelector("#btn-mv-modify").addEventListener("click", function () {
        alert("글수정하자!!!");
        location.href = "${root}/board?action=mvmodify&articleno=${article.articleNo}";
      });
      document.querySelector("#btn-delete").addEventListener("click", function () {
        alert("글삭제하자!!!");
        location.href = "${root}/board?action=delete&articleno=${article.articleNo}";
      });
    </script>
    

    </script>
    <script>
      document.querySelector("#btn-comment-write").addEventListener("click", function() {
      var commentData = {
          articleNo: "${article.articleNo}",
          userId: "${memberInfo.userId}",
          comment : document.getElementById("commentInput").value.trim()
      };
      if(commentData.userId == "") {
        alert("로그인후 이용하세요!")
        return;
      }
      if(commentData.comment == '') {
    	  alert("댓글을 입력하세요! (※공백불가)")
    	  return
      }
      document.getElementById("commentInput").value = ''
      fetch("${root}/comment?action=write", {
          method: "POST",
          headers: {
            "Content-Type": "application/json"
          },
          body: JSON.stringify(commentData)
      })
      .then(response => response.json())
      .then(commentList => {
        updateCommentList(commentList)

      }) 
})
function updateCommentList(commentList) {
  var commentListDiv = document.getElementById("commentList");
  // 댓글 목록을 초기화합니다.
  commentListDiv.innerHTML = "";

  // 배열에 있는 각 댓글을 댓글 목록에 추가합니다.
  commentList.forEach(function(comment) {
    var commentDiv = document.createElement("div");
    commentDiv.classList.add("comment");

    var userInfo = document.createElement("span");
    userInfo.className = "user-info";
    userInfo.textContent = comment.userId;

    var registerTime = document.createElement("small");
    registerTime.className = "register-time";
    registerTime.textContent = "등록시간: " + comment.registerTime;

    var likeCount = document.createElement("span");
    likeCount.className = "like-count";
    likeCount.textContent = "좋아요: " + comment.likeCount;

    var commentPara = document.createElement("p");
    commentPara.classList.add("comment-text");
    commentPara.textContent = comment.comment;

    commentDiv.appendChild(userInfo);
    commentDiv.appendChild(registerTime);
    commentDiv.appendChild(likeCount);
    commentDiv.appendChild(commentPara);

    commentListDiv.appendChild(commentDiv);
  });
}

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
        
        .comment {
    border: 1px solid #ccc;
    padding: 10px;
    margin-bottom: 10px;
    background-color: #f5f5f5;
}
  
	/* 유저 정보 스타일 */
	.user-info {
	    font-weight: bold;
	    margin-right: 10px;
	    color: #333;
	}
	
	/* 등록시간 스타일 */
	.register-time {
	    color: #777;
      margin-right: 35px;
	    font-size: 0.8em;
	}
	
	/* 좋아요 수 스타일 */
	.like-count {
	    color: #ff5733;
	    font-weight: bold;
	}
	
	/* 댓글 내용 스타일 */
	.comment-text {
	    margin-top: 5px;
	    color: #333;
      margin: 15px 25px 15px 25px;
	}
  
        </style>
    
 <script>
   window.onload = function() {
     fetch("${root}/comment?action=list&articleno=${article.articleNo}", {
          method: "GET"
      })
      .then(response => response.json())
      .then(commentList => {
        updateCommentList(commentList)
      }) 
 };
 </script>