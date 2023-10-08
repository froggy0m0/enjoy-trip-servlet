package com.ssafy.board.model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.ssafy.board.model.Board;
import com.ssafy.board.model.Page;

public interface BoardDao {

	void write(Board board);

	Board view(int articleNo);

	void modify(Board board);

	void delete(int articleNo);

	List<Board> list(HashMap<String, Object> params) throws SQLException;
	
	public int selectBoardCount(HashMap<String, Object> params) throws SQLException;
}
