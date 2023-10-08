document.querySelector("#btn-comment-write").addEventListener("click", function() {
var commentData = {
    articleNo: "${article.articleNo}",
    userId: "${memberInfo.userId}",
    comment : document.getElementById("commentInput").value
};
document.getElementById("commentInput").value = ''

fetch(contextPath+"/comment?action=write", {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify(commentData)
})
.then(response => console.log(response))
.then(response => response.json())
.then(data => {
    console.log("댓글 기능 어느정도? 성공")
    console.log(data)
    console.log(response)
}) 
})
