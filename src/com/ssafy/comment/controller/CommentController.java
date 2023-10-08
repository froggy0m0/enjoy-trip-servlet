package com.ssafy.comment.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ssafy.board.model.Board;
import com.ssafy.comment.model.Comment;
import com.ssafy.comment.service.CommentService;
import com.ssafy.comment.service.CommentServiceImpl;
import com.ssafy.member.model.Member;

@WebServlet("/comment")
public class CommentController extends HttpServlet {

	private CommentService commentService;
	@Override
	public void init(ServletConfig config) throws ServletException {
		commentService = CommentServiceImpl.getCommentSerivce();
	}

	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if("list".equals(action)) {
			list(request, response);
		}else if("write".equals(action)) {
			write(request, response);
		}else if("modify".equals(action)) {
			
		}else if("delete".equals(action)) {
			
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
	private void forward(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	}
	
	private void redirect(HttpServletRequest request, HttpServletResponse response, String path) throws IOException {
		response.sendRedirect(request.getContextPath() + path);
	}

	private void write(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
					
			BufferedReader br = request.getReader();
			StringBuilder jsonRequest = new StringBuilder();
			String line;
			while((line = br.readLine()) != null) {
				jsonRequest.append(line);
			}
			ObjectMapper objectMapper = new ObjectMapper();
			Comment comment = objectMapper.readValue(jsonRequest.toString(), Comment.class);
			boolean isRegist = commentService.write(comment);
			
	        // JSON 데이터 전송
			forward(request, response, "/comment?action=list&articleno="+comment.getArticleNo());
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void list(HttpServletRequest request, HttpServletResponse response) {
		try {
			int articleNo = Integer.parseInt(request.getParameter("articleno"));
			
	        // JSON 데이터 전송
			List<Comment> commentList = commentService.list(articleNo);
			response.setContentType("application/json;charset=utf-8");
			ObjectMapper objectMapper = new ObjectMapper();
			
	        response.getWriter().write(objectMapper.writeValueAsString(commentList));
		}catch (Exception e) {
			e.printStackTrace();
		}
	}


}
