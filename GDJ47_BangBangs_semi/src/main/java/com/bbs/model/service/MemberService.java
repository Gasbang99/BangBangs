package com.bbs.model.service;

import static com.bbs.common.JDBCTemplate.*;
import static com.bbs.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.bbs.model.dao.MemberDao;
import com.bbs.model.vo.Member;

public class MemberService {
	private MemberDao dao = new MemberDao();
	
	public Member searchMember(String memberId, String oriPw) {
		Connection conn = getConnection();
		Member m = dao.searchMember(conn, memberId, oriPw);
		close(conn);
		return m;
	}
	
	public Member selectMemberById(String userId) {
		Connection conn = getConnection();
		Member m = dao.selectMemberById(conn, userId);
		close(conn);
		return m;
	}
	
	public int insertMember(Member m) {
		Connection conn = getConnection();
		int result = dao.insertMember(conn, m);
		close(conn);
		return result;
	}

	public int updateMember(Member m) {
		Connection conn=getConnection();
		int result=dao.updateMember(conn, m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int deleteMember(String memberId) {
		Connection conn=getConnection();
		int result=dao.deleteMember(conn, memberId);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int updatePassword(String memberId, String newPw) {
		Connection conn=getConnection();
		int result=dao.updatePassword(conn, memberId, newPw);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	
}
