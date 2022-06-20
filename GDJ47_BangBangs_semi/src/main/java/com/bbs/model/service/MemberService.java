package com.bbs.model.service;

import java.sql.Connection;

import com.bbs.model.dao.MemberDao;
import com.bbs.model.vo.Member;

import static com.bbs.common.JDBCTemplate.*;

public class MemberService {
	private MemberDao dao = new MemberDao();
	
	public Member searchMember(String userId, String password) {
		Connection conn = getConnection();
		Member m = dao.searchMember(conn, userId, password);
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
	
}
