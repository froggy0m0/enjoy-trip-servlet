package com.ssafy.comment.model;

public class Comment {
	private int articleNo;
	private int commentNo;
	private String userId;
	private String comment;
	private int likeCount;
	private String registerTime;
	
	public Comment() {
	}

	public int getArticleNo() {
		return articleNo;
	}

	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public String getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(String registerTime) {
		this.registerTime = registerTime;
	}
	@Override
	public String toString() {
		return "Comment [articleNo=" + articleNo + ", commentNo=" + commentNo + ", userId=" + userId + ", comment="
				+ comment + ", likeCount=" + likeCount + ", registerTime=" + registerTime + "]";
	}
}
