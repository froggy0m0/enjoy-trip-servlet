package com.ssafy.comment.model.dao;

import java.util.List;

import com.ssafy.comment.model.Comment;

public interface CommentDao {

	List<Comment> list(int articleNo);
	boolean wrtie(Comment comment);

}
