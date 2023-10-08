package com.ssafy.comment.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ssafy.comment.model.Comment;
import com.ssafy.util.DBUtil;

public class CommentDaoImpl implements CommentDao {
	private static CommentDao commentDao = new CommentDaoImpl();
	private static DBUtil dbUtil;
	
	private CommentDaoImpl() {
		dbUtil = DBUtil.getInstance();
		
	}

	public static CommentDao getCommentDao() {
		return commentDao;
	}

	@Override
	public boolean wrtie(Comment comment) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into comment (article_no, user_id, comment) \n");
			sql.append("values(?, ?, ?) ");
			pstmt = conn.prepareStatement(sql.toString());
			
			int index = 1;
			pstmt.setInt(index++, comment.getArticleNo());
			pstmt.setString(index++, comment.getUserId());
			pstmt.setString(index++, comment.getComment());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			dbUtil.close(pstmt, conn);
		}
		return true;
	}

	@Override
	public List<Comment> list(int articleNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Comment> commentList = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select user_id, comment, like_count, register_time \n ");
			sql.append(" from comment \n");
			sql.append(" where article_no = ? \n");
			pstmt = conn.prepareStatement(sql.toString());
			
			int index = 1;
			pstmt.setInt(index++, articleNo);
			
			rs = pstmt.executeQuery();
			commentList = new ArrayList<>();
			while(rs.next()) {
				Comment comment = new Comment();
				comment.setComment(rs.getString("comment"));
				comment.setLikeCount(rs.getInt("like_count"));
				comment.setRegisterTime(rs.getString("register_time"));
				comment.setUserId(rs.getString("user_id"));
				commentList.add(comment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		return commentList;
	}
	
}
