package com.ssafy.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.mindrot.jbcrypt.BCrypt;

import com.ssafy.member.model.Member;
import com.ssafy.util.DBUtil;

public class MemberDaoImpl implements MemberDao {
	
	private static MemberDao instance = new MemberDaoImpl();
	private DBUtil db;
	private MemberDaoImpl() {
		db = DBUtil.getInstance();
	}
	
	public static MemberDao getInstance() {
		return instance;
	}
	
	@Override
	public int idCheck(String userId) throws SQLException {
		int cnt = 1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = db.getConnection();
			StringBuilder loginMember = new StringBuilder();
			loginMember.append("select count(user_id) \n");
			loginMember.append("from members \n");
			loginMember.append("where user_id = ? \n");
			pstmt = conn.prepareStatement(loginMember.toString());
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
		} finally {
			db.close(rs, pstmt, conn);
		}
		return cnt;
	}

	@Override
	public void regist(Member member) throws SQLException {
		try (
			Connection con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(
				" insert into members(user_id, user_password, user_email, user_name, user_age) "
			+ 	" values(?, ?, ?, ?, ?) "
			);
		) {
			int index = 1;
			stmt.setString(index++, member.getUserId());
			stmt.setString(index++, member.getUserPwd());
			stmt.setString(index++, member.getUserEmail());
			stmt.setString(index++, member.getUserName());
			stmt.setInt(index++, member.getUserAge());
			stmt.executeUpdate();
		}
	}
	
	
	@Override
	public Member loginMember(Member member) throws SQLException {
		try(
			Connection con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(
				" select user_id, user_password, user_email, user_name, user_age "
			+	" from members "
			+	" where user_id = ? "
			);
		) {
			int index = 1;
			stmt.setString(index++, member.getUserId());
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				Member memberInfo = null;
				if(BCrypt.checkpw(member.getUserPwd(), rs.getString("user_password"))) {
					memberInfo = new Member();
					memberInfo.setUserId(rs.getString("user_id"));
					memberInfo.setUserEmail(rs.getString("user_email"));
					memberInfo.setUserName(rs.getString("user_name"));
					memberInfo.setUserAge(rs.getInt("user_age"));
				}
				return memberInfo;
			}
		}
		
		return null;
	}

	

//	@Override
//	public MemberDto loginMember(String userId, String userPwd) throws SQLException {
//		MemberDto memberDto = null;
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		try {
//			conn = dbUtil.getConnection();
//			StringBuilder loginMember = new StringBuilder();
//			loginMember.append("select user_id, user_name \n");
//			loginMember.append("from members \n");
//			loginMember.append("where user_id = ? and user_password = ? \n");
//			pstmt = conn.prepareStatement(loginMember.toString());
//			pstmt.setString(1, userId);
//			pstmt.setString(2, userPwd);
//			rs = pstmt.executeQuery();
//			if(rs.next()) {
//				memberDto = new MemberDto();
//				memberDto.setUserId(rs.getString("user_id"));
//				memberDto.setUserName(rs.getString("user_name"));
//			}
//			
//		} finally {
//			dbUtil.close(rs, pstmt, conn);
//		}
//		return memberDto;
//	}
	
	
}