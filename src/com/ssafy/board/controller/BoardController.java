package com.ssafy.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.border.Border;

import com.ssafy.board.model.Board;
import com.ssafy.board.model.Page;
import com.ssafy.board.model.dao.BoardDao;
import com.ssafy.board.service.BoardService;
import com.ssafy.board.service.BoardServiceImpl;
import com.ssafy.member.model.Member;

@WebServlet("/board")
public class BoardController extends HttpServlet {
	private static BoardService boardSerivce;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		boardSerivce = BoardServiceImpl.getBoardService();
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if("list".equals(action)) {
			list(request, response);
		}else if ("mvwrite".equals(action)) {
			forward(request, response, "/board/write.jsp");
		}else if("write".equals(action)) {
			write(request, response);
		}else if("view".equals(action)) {
			view(request, response);
		}else if("mvmodify".equals(action)) {
			forward(request, response, "/board/modify.jsp");
		}else if("modify".equals(action)) {
			modify(request, response);
		}else if("delete".equals(action)) {
			delete(request, response);
		}
	}
	


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

	private void forward(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	}
	
	private void redirect(HttpServletRequest request, HttpServletResponse response, String path) throws IOException {
		response.sendRedirect(request.getContextPath() + path);
	}
	
	private void list(HttpServletRequest request, HttpServletResponse response)  {
		try {
			HashMap<String, Object> params = new HashMap<>();
			Page page = new Page(
					request.getParameter("pageNo") == null
					? 1
							: Integer.parseInt(request.getParameter("pageNo"))
					);
			params.put("page", page);
			params.put("key", request.getParameter("key"));
			params.put("word", request.getParameter("word"));
			
			
			request.setAttribute("result", boardSerivce.list(params));;
			forward(request, response, "/board/list.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	private void write(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Member memberInfo = (Member)session.getAttribute("memberInfo");
		try { 
			if(memberInfo != null) {
				Board board = new Board();
				board.setUserId(memberInfo.getUserId());
				board.setSubject(request.getParameter("subject"));
				board.setContent(request.getParameter("content"));
				boardSerivce.write(board);
				redirect(request, response, "/board?action=list");
			} else {
				redirect(request, response, "/member/login.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void view(HttpServletRequest request, HttpServletResponse response) {
		try {
			int articleNo = Integer.parseInt(request.getParameter("articleno"));
			Board board = new Board();
			board = boardSerivce.view(articleNo);
			request.setAttribute("article", board);
			request.getSession().setAttribute("article", board);
			forward(request, response, "/board/view.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
	}
	
	private void modify(HttpServletRequest request, HttpServletResponse response) {
		try {
			Board board = new Board();
			board.setArticleNo(Integer.parseInt(request.getParameter("articleno")));
			board.setSubject(request.getParameter("subject"));
			board.setContent(request.getParameter("content"));
			boardSerivce.modify(board);
			forward(request, response, "/board?action=view&articleno=" + board.getArticleNo());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	private void delete(HttpServletRequest request, HttpServletResponse response) {
		try {
			boardSerivce.delete(Integer.parseInt(request.getParameter("articleno")));
			redirect(request, response, "/board?action=list");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}

