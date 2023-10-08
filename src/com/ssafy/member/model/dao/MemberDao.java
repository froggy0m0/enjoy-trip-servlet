package com.ssafy.member.model.dao;

import java.sql.SQLException;

import com.ssafy.member.model.Member;

public interface MemberDao {
	
	int idCheck(String userId) throws SQLException;
	void regist(Member memberDto) throws SQLException; //회원가입 
	Member loginMember(Member member) throws SQLException; //로그인 
}