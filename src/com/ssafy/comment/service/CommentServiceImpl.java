package com.ssafy.comment.service;

import java.util.List;

import com.ssafy.comment.model.Comment;
import com.ssafy.comment.model.dao.CommentDao;
import com.ssafy.comment.model.dao.CommentDaoImpl;

public class CommentServiceImpl implements CommentService {
	private static CommentService commentSerivce = new CommentServiceImpl();
	private CommentDao commentDao;
	
	private CommentServiceImpl() {
		commentDao = CommentDaoImpl.getCommentDao();
	}
	public static CommentService getCommentSerivce() {
		return commentSerivce;
	}
	
	@Override
	public List<Comment> list(int articleNo) {
		return commentDao.list(articleNo);
	}
	
	@Override
	public boolean write(Comment comment) {
		return commentDao.wrtie(comment);
	}
	
	
}
