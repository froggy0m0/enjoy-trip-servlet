package com.ssafy.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ssafy.board.model.Board;
import com.ssafy.board.model.Page;
import com.ssafy.board.model.PageResult;
import com.ssafy.board.model.dao.BoardDao;
import com.ssafy.board.model.dao.BoardDaoImpl;

public class BoardServiceImpl implements BoardService {
	private static BoardService boardService = new BoardServiceImpl();
	private BoardDao boardDao;
	private BoardServiceImpl() {
		boardDao = BoardDaoImpl.getBoardDao();
	}
	
	public static BoardService getBoardService() {
		return boardService;
	}

	@Override
	public void write(Board board) {
		boardDao.write(board);
	}

	@Override
	public Board view(int articleNo) {
		return boardDao.view(articleNo);
	}

	@Override
	public void modify(Board board) {
		boardDao.modify(board);
	}

	@Override
	public void delete(int articleNo) {
		boardDao.delete(articleNo);
		
	}

	@Override
	public Map<String, Object> list(HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> params = new HashMap<>();
		String key = (String) map.get("key");
		String word = (String) map.get("word");
		params.put("key", key == null ? "" : key);
		params.put("word", word == null ? "" : word);
		Page page = (Page) map.get("page");
		params.put("page", page);
		
		List<Board> list = boardDao.list(params);
		int count = boardDao.selectBoardCount(params);
		PageResult pg = new PageResult(page.getPageNo(), count);
		
		Map<String, Object> result = new HashMap<>();
		result.put("list", list);
		result.put("pg", pg);
		result.put("key", key);
		result.put("word", word);
		return result;
	}
	
}
