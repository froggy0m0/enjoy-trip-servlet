package com.ssafy.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.ssafy.board.model.Board;
import com.ssafy.board.model.Page;
import com.ssafy.util.DBUtil;

public class BoardDaoImpl implements BoardDao {
	private static BoardDao boardDao = new BoardDaoImpl();
	private static DBUtil dbUtil;
	private BoardDaoImpl() {
		dbUtil = DBUtil.getInstance();
	}

	public static BoardDao getBoardDao() {
		return boardDao;
	}

	@Override
	public List<Board> list(HashMap<String, Object> params) {
		List<Board> articleList = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Page page = (Page)params.get("page");
		String key = (String)params.get("key");
		String word = (String)params.get("word");
		
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
 			sql.append("select article_no, user_id, subject, content, hit, register_time \n");
			sql.append(" from board \n ");

			
			if(!key.isEmpty() && ! word.isEmpty()) { // 검색조건
				sql.append("where ").append(key);
				if(key.equals("subject")) sql.append(" like concat('%', ?, '%') \n"); 
				else sql.append(" = ? \n");
			}
			
			sql.append(" order by article_no desc");
			sql.append(" limit ?, ? \n");
				
			pstmt = conn.prepareStatement(sql.toString());
			
			int index = 1; 
			if(!key.isEmpty() && ! word.isEmpty()) { //검색조건 설정
				pstmt.setString(index++, word);
			}
			
			pstmt.setInt(index++, page.getBegin());
			pstmt.setInt(index++, page.getListSize());
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setArticleNo(rs.getInt("article_no"));
				board.setUserId(rs.getString("user_id"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setHit(rs.getInt("hit"));
				board.setRegisterTime(rs.getString("register_time"));
				articleList.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		
		return articleList;
	}
	
	@Override
	public int selectBoardCount(HashMap<String, Object> params) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = - 1;
		String key = (String)params.get("key");
		String word = (String)params.get("word");
		
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append(" select count(*) as count from board \n");
			
			if(!key.isEmpty() && ! word.isEmpty()) { // 검색조건
				sql.append("where ").append(key);
				if(key.equals("subject")) sql.append(" like concat('%', ?, '%') \n"); 
				else sql.append(" = ? \n");
			}
			pstmt = conn.prepareStatement(sql.toString());
			
			int index = 1; 
			if(!key.isEmpty() && ! word.isEmpty()) { //검색조건 설정
				pstmt.setString(index++, word);
			}
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = Integer.parseInt(rs.getString("count"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		return count;
	}

	@Override
	public void write(Board board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into board(user_id, subject, content) \n");
			sql.append(" values(?, ?, ?); ");
			pstmt = conn.prepareStatement(sql.toString());
			int index = 1;
			pstmt.setString(index++, board.getUserId());
			pstmt.setString(index++, board.getSubject());
			pstmt.setString(index++, board.getContent());
			pstmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbUtil.close(pstmt, conn);
		}
		
		
	}

	@Override
	public Board view(int articleNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board board = new Board();
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select article_no, user_id, subject, content, hit, register_time \n");
			sql.append(" from board \n");
			sql.append(" where article_no = ? ");
			pstmt = conn.prepareStatement(sql.toString());
			int index = 1;
			pstmt.setInt(index++, articleNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				board.setArticleNo(Integer.parseInt(rs.getString("article_no")));
				board.setUserId(rs.getString("user_id"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
//				board.setHit(rs.getInt("hit"));
				board.setHit(Integer.parseInt(rs.getString("hit")));
				board.setRegisterTime(rs.getString("register_time"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		return board;
	}

	@Override
	public void modify(Board board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("update board \n");
			sql.append(" set subject = ? , \n");
			sql.append(" content = ? \n");
			sql.append(" where article_no = ? ");
			
			pstmt = conn.prepareStatement(sql.toString());
					
			int index = 1;
			pstmt.setString(index++, board.getSubject());
			pstmt.setString(index++, board.getContent());
			pstmt.setInt(index++, board.getArticleNo());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbUtil.close(pstmt, conn);
		}
	}

	@Override
	public void delete(int articleNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("delete from board \n");
			sql.append(" where article_no = ?;");
			
			pstmt = conn.prepareStatement(sql.toString());
			int index = 1;
			pstmt.setInt(index, articleNo);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbUtil.close(pstmt, conn);
		}
		
	}

	

}
