package com.ssafy.comment.service;

import java.util.List;

import com.ssafy.comment.model.Comment;

public interface CommentService {

	List<Comment> list(int articleNo);
	boolean write(Comment comment);
}
