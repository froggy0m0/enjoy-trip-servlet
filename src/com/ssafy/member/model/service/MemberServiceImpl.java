package com.ssafy.member.model.service;

import java.sql.SQLException;

import org.mindrot.jbcrypt.BCrypt;

import com.ssafy.member.model.Member;
import com.ssafy.member.model.dao.MemberDao;
import com.ssafy.member.model.dao.MemberDaoImpl;

public class MemberServiceImpl implements MemberService {
    private static MemberService memberService = new MemberServiceImpl();
    private MemberDao memberDao;
    
    private MemberServiceImpl() {
        memberDao = MemberDaoImpl.getInstance();
    }
    
    public static MemberService getMemberService() {
        return memberService;
    }
    
    @Override
    public int idCheck(String userId) throws SQLException {
        return 0;
    }
    @Override
    public void regist(Member member) throws SQLException {
        member.setUserPwd(BCrypt.hashpw(member.getUserPwd(), BCrypt.gensalt()));
        memberDao.regist(member);
    }
    @Override
    public Member loginMember(Member member) throws SQLException {
        return memberDao.loginMember(member);
    }

}