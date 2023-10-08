package com.ssafy.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ssafy.board.model.Board;
import com.ssafy.board.model.Page;

public interface BoardService {

	void write(Board board);

	Board view(int articleNo);

	void modify(Board board);

	void delete(int articleNo);
	
	Map<String, Object> list(HashMap<String, Object> map) throws Exception;
}
