package com.ssafy.member.model.service;

import java.sql.SQLException;

import com.ssafy.member.model.Member;

public interface MemberService{
	
	int idCheck(String userId) throws SQLException;
	void regist(Member member) throws SQLException; //회원가입 
	Member loginMember(Member member) throws SQLException; //로그인 

}