package com.ssafy.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.member.model.Member;
import com.ssafy.member.model.service.MemberService;
import com.ssafy.member.model.service.MemberServiceImpl;

@WebServlet("/member") 
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L; 
	
	private MemberService memberService;
	
	public void init() {
		memberService = MemberServiceImpl.getMemberService();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		doGet(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		String path="";
		if("mvjoin".equals(action)) {
			path = "/login.jsp";
			redirect(req, resp, path);
		} else if("login".equals(action)) {
			String checkid = req.getParameter("checkid");
			int cnt = 1;
			try { 
				path = login(req, resp);
				redirect(req, resp, path);
				cnt = memberService.idCheck(checkid);
			} catch (Exception e) {
				e.printStackTrace();
				cnt = 1;
			}
			resp.setContentType("text/plain;charset=utf-8");
			resp.getWriter().print(checkid + "," + cnt);
		} else if("regist".equals(action)) {
			path = regist(req, resp);
			redirect(req, resp, path);
		} else if("mvregist".equals(action)) {
			mvregist(req, resp);
		}  else if("logout".equals(action)) {
			logout(req, resp);
		} else {
			redirect(req, resp, path);
		}
		
	}

	private void mvregist(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		req.getRequestDispatcher("/member/regist.jsp").forward(req, resp);
	}

	private void logout(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		req.getSession().invalidate();
		resp.sendRedirect(req.getContextPath() + "/index.jsp");
	}

	private void forward(HttpServletRequest req, HttpServletResponse resp, String path) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher(path);
		dispatcher.forward(req, resp);	
	}

	private String regist(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		try {
			Member member = new Member();
			member.setUserId(req.getParameter("id"));
			member.setUserPwd(req.getParameter("password"));
			member.setUserName(req.getParameter("name"));
			member.setUserEmail(req.getParameter("email"));
			member.setUserAge(Integer.parseInt(req.getParameter("age")));
			memberService.regist(member);
			
			req.getRequestDispatcher("/member/regist.jsp");
			return "/member/login.jsp";
		} catch(Exception e) {
			e.printStackTrace();
			req.setAttribute("msg", "회원가입 중 에러가 발생했습니다");
			return "/index.jsp";
		}
	}

	private String login(HttpServletRequest req, HttpServletResponse resp) {
		try {
			String userId = req.getParameter("id");
			String userPwd = req.getParameter("password");
			Member member = new Member();
			member.setUserId(userId);
			member.setUserPwd(userPwd);
			
			Member memberInfo = memberService.loginMember(member);
			if(memberInfo != null) {
				
				HttpSession session = req.getSession();
				session.setAttribute("memberInfo", memberInfo);
				return "/index.jsp";
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		req.setAttribute("msg", "아이디 또는 비밀번호 확인 후 다시 로그인하세요.");
		return "/member/login.jsp";
	}
	
	private void redirect(HttpServletRequest req, HttpServletResponse resp, String path) throws IOException {
		resp.sendRedirect(req.getContextPath() + path);
	}


	
}
